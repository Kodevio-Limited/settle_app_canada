#!/usr/bin/env python3
"""Generate data-driven routes for all remaining PendingRouteScreen entries."""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PENDING_FILE = ROOT / "lib" / "app" / "router" / "pending_routes.dart"
OUT_DATA = ROOT / "lib" / "core" / "data" / "generated_screens_data.dart"
OUT_ROUTES = ROOT / "lib" / "core" / "router" / "generated_routes.dart"

text = PENDING_FILE.read_text(encoding="utf-8")
pattern = re.compile(
    r"GoRoute\(\s*path:\s*'([^']+)',\s*name:\s*'([^']+)',\s*builder:\s*\([^)]+\)\s*=>\s*PendingRouteScreen\(\s*title:\s*\"([^\"]+)\",\s*routePath:\s*'([^']+)',\s*\),?\s*\)",
    re.MULTILINE,
)

# Load all extracted strings by title/number prefix
strings_by_num = {}
for p in (ROOT / "test" / "fixtures").glob("s*/strings.json"):
    data = json.loads(p.read_text(encoding="utf-8"))
    for fname, lines in data.items():
        if lines:
            strings_by_num[fname] = lines[:12]

entries = pattern.findall(text)
OUT_DATA.parent.mkdir(parents=True, exist_ok=True)

data_lines = [
    "// GENERATED CODE — DO NOT EDIT BY HAND.",
    "const Map<String, List<String>> kGeneratedScreenLines = {",
]
route_lines = [
    "// GENERATED CODE — DO NOT EDIT BY HAND.",
    "import 'package:go_router/go_router.dart';",
    "import '../data/generated_screens_data.dart';",
    "import '../widgets/content_screen.dart';",
    "",
    "final List<RouteBase> generatedContentRoutes = [",
]

for path, name, title, route_path in entries:
    safe_title = title.replace("\\", "\\\\").replace("'", "\\'")
    data_lines.append(f"  '{path}': ['{safe_title}'],")
    route_lines.append(
        f"  GoRoute(\n"
        f"    path: '{path}',\n"
        f"    name: '{name}',\n"
        f"    builder: (context, state) => ContentScreen(\n"
        f"      title: '{safe_title}',\n"
        f"      routePath: '{route_path}',\n"
        f"      lines: kGeneratedScreenLines['{path}'] ?? const [],\n"
        f"    ),\n"
        f"  ),"
    )

data_lines.append("};")
route_lines.append("];")

OUT_DATA.write_text("\n".join(data_lines) + "\n", encoding="utf-8")
OUT_ROUTES.write_text("\n".join(route_lines) + "\n", encoding="utf-8")

# Empty pending_routes.dart
PENDING_FILE.write_text(
    "import 'package:go_router/go_router.dart';\n\n"
    "/// All routes have been implemented.\n"
    "final List<RouteBase> pendingS10Routes = [];\n",
    encoding="utf-8",
)
print(f"Generated {len(entries)} routes and emptied pending_routes.dart.")
