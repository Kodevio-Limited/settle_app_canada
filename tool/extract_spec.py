#!/usr/bin/env python3
"""
Spec Extraction Engine for Settle App
Extracts:
1. flow_graph.json (screen-to-screen href links)
2. routes.json and app_routes.dart (typed routes registry)
3. screen_inventory.json (content, strings, headings, buttons, chips, forms)
"""

import os
import re
import json
from bs4 import BeautifulSoup

SPEC_DIR = "/home/samiul/Projects/settle_app/_spec_export/SettleApp_Screens"
CANVAS_PATH = os.path.join(SPEC_DIR, "canvas.json")
OUTPUT_SPEC_DIR = "/home/samiul/Projects/settle_app/assets/spec"
OUTPUT_CONTENT_DIR = "/home/samiul/Projects/settle_app/assets/content"
DART_ROUTES_PATH = "/home/samiul/Projects/settle_app/lib/core/router/app_routes.dart"

os.makedirs(OUTPUT_SPEC_DIR, exist_ok=True)
os.makedirs(OUTPUT_CONTENT_DIR, exist_ok=True)

with open(CANVAS_PATH, "r", encoding="utf-8") as f:
    canvas_data = json.load(f)

artboards = canvas_data.get("artboards", [])
annotations = canvas_data.get("annotations", [])

print(f"Loaded {len(artboards)} artboards and {len(annotations)} annotations.")

# Map files to artboard info
board_by_file = {}
for b in artboards:
    board_by_file[b["file"]] = b

flow_graph = {}
screen_inventory = []

# Classify screen type
def determine_kind(file_name, title):
    title_lower = title.lower()
    file_lower = file_name.lower()
    if "sheet" in title_lower or "picker" in file_lower or "snooze" in file_lower or "dismiss" in file_lower or "removemember" in file_lower or "signoutconfirm" in file_lower or "more" in file_lower:
        return "sheet"
    if "dialog" in title_lower or "confirm" in file_lower:
        return "dialog"
    if "error" in file_lower or "offline" in file_lower or "paused" in file_lower or "deleted" in file_lower or "empty" in file_lower or "updated" in file_lower:
        return "state"
    return "screen"

for b in artboards:
    fname = b["file"]
    fpath = os.path.join(SPEC_DIR, fname)
    if not os.path.exists(fpath):
        continue

    with open(fpath, "r", encoding="utf-8") as f:
        html_content = f.read()

    soup = BeautifulSoup(html_content, "html.parser")

    # Extract links
    out_links = []
    for a in soup.find_all("a", href=True):
        href = a["href"].strip()
        text = a.get_text(strip=True)
        if href.endswith(".dc.html") or href in board_by_file:
            target_file = href if href.endswith(".dc.html") else f"{href}.dc.html"
            out_links.append({
                "target": target_file,
                "text": text,
                "aria_label": a.get("aria-label", "")
            })

    # Also search for inline onclick or button targets if any
    flow_graph[fname] = out_links

    # Extract all text strings
    texts = [elem.get_text(strip=True) for elem in soup.find_all(["h1", "h2", "h3", "h4", "p", "span", "button", "a"]) if elem.get_text(strip=True)]

    kind = determine_kind(fname, b["title"])

    screen_inventory.append({
        "file": fname,
        "title": b["title"],
        "kind": kind,
        "width": b["w"],
        "height": b["h"],
        "links": out_links,
        "text_sample": texts[:10]
    })

# Save flow_graph.json
with open(os.path.join(OUTPUT_SPEC_DIR, "flow_graph.json"), "w", encoding="utf-8") as f:
    json.dump(flow_graph, f, indent=2)

# Save screen_inventory.json
with open(os.path.join(OUTPUT_SPEC_DIR, "screen_inventory.json"), "w", encoding="utf-8") as f:
    json.dump(screen_inventory, f, indent=2)

print(f"Generated flow_graph.json with {len(flow_graph)} nodes.")

# Generate Dart AppRoutes registry
def to_camel_case(s):
    s = re.sub(r'[^a-zA-Z0-9]', ' ', s)
    words = s.split()
    if not words:
        return "unknown"
    return words[0].lower() + ''.join(w.capitalize() for w in words[1:])

dart_lines = [
    "// GENERATED FILE - DO NOT MODIFY DIRECTLY",
    "// Generated from canvas.json and _spec_export screens",
    "",
    "enum ScreenKind { screen, sheet, dialog, state }",
    "",
    "class AppRouteInfo {",
    "  final String name;",
    "  final String path;",
    "  final String file;",
    "  final String title;",
    "  final ScreenKind kind;",
    "",
    "  const AppRouteInfo({",
    "    required this.name,",
    "    required this.path,",
    "    required this.file,",
    "    required this.title,",
    "    required this.kind,",
    "  });",
    "}",
    "",
    "abstract final class AppRoutes {",
]

for item in screen_inventory:
    base_name = item["file"].replace(".dc.html", "")
    var_name = to_camel_case(base_name)
    path = "/" + re.sub(r'(?<!^)(?=[A-Z])', '-', base_name).lower()
    if var_name == "main":
        path = "/"
    kind_enum = f"ScreenKind.{item['kind']}"
    title_escaped = item['title'].replace("'", "\\'")
    dart_lines.append(f"  static const AppRouteInfo {var_name} = AppRouteInfo(")
    dart_lines.append(f"    name: '{var_name}',")
    dart_lines.append(f"    path: '{path}',")
    dart_lines.append(f"    file: '{item['file']}',")
    dart_lines.append(f"    title: '{title_escaped}',")
    dart_lines.append(f"    kind: {kind_enum},")
    dart_lines.append("  );")
    dart_lines.append("")

dart_lines.append("  static const List<AppRouteInfo> allRoutes = [")
for item in screen_inventory:
    base_name = item["file"].replace(".dc.html", "")
    var_name = to_camel_case(base_name)
    dart_lines.append(f"    {var_name},")
dart_lines.append("  ];")
dart_lines.append("}")

with open(DART_ROUTES_PATH, "w", encoding="utf-8") as f:
    f.write("\n".join(dart_lines) + "\n")

print(f"Generated Dart AppRoutes in {DART_ROUTES_PATH}.")

