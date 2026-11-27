#!/usr/bin/env python3
"""Extract per-section visible strings, structure, and navigation edges from _spec_export."""
import argparse
import csv
import json
import os
import re
from html.parser import HTMLParser
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
HTML_DIR = ROOT / "_spec_export" / "SettleApp_Screens"
CSV_EDGES = ROOT / "docs" / "spec" / "navigation_edges.csv"
CSV_SCREENS = ROOT / "docs" / "spec" / "navigation_screens.csv"


class TextExtractor(HTMLParser):
    def __init__(self):
        super().__init__()
        self.skip = False
        self.texts = []

    def handle_starttag(self, tag, attrs):
        if tag in ("script", "style", "svg"):
            self.skip = True

    def handle_endtag(self, tag):
        if tag in ("script", "style", "svg"):
            self.skip = False

    def handle_data(self, data):
        if not self.skip:
            t = re.sub(r"\s+", " ", data).strip()
            if t:
                self.texts.append(t)


def extract_section(section: str):
    sec_num = str(int(section.lstrip("sS")))
    out_dir = ROOT / "test" / "fixtures" / section.lower()
    out_dir.mkdir(parents=True, exist_ok=True)

    edges = []
    if CSV_EDGES.exists():
        with open(CSV_EDGES, newline="", encoding="utf-8") as f:
            for row in csv.DictReader(f):
                if row.get("from_section", "").strip() == sec_num:
                    edges.append(row)

    screens = []
    if CSV_SCREENS.exists():
        with open(CSV_SCREENS, newline="", encoding="utf-8") as f:
            for row in csv.DictReader(f):
                if row.get("section", "").strip() == sec_num:
                    screens.append(row)

    strings_by_file = {}
    for scr in screens:
        fname = scr.get("file", "")
        html_path = HTML_DIR / fname
        if html_path.exists():
            parser = TextExtractor()
            parser.feed(html_path.read_text(encoding="utf-8", errors="ignore"))
            strings_by_file[fname] = list(dict.fromkeys(parser.texts))

    (out_dir / "edges.json").write_text(json.dumps(edges, indent=2), encoding="utf-8")
    (out_dir / "screens.json").write_text(json.dumps(screens, indent=2), encoding="utf-8")
    (out_dir / "strings.json").write_text(json.dumps(strings_by_file, indent=2), encoding="utf-8")
    print(f"{section}: {len(screens)} screens, {len(edges)} edges, {len(strings_by_file)} HTML files extracted to {out_dir}")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--section", required=True, help="e.g. s08")
    args = ap.parse_args()
    extract_section(args.section)

