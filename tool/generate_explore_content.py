#!/usr/bin/env python3
"""Generate verbatim Explore content from test/fixtures/s20 and s23 strings.json."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
s20 = json.loads((ROOT / "test" / "fixtures" / "s20" / "strings.json").read_text())
s23 = json.loads((ROOT / "test" / "fixtures" / "s23" / "strings.json").read_text())
all_strings = {**s20, **s23}

# Map Explore route slug -> HTML filename in s20/s23
ROUTE_TO_HTML = {
    "canoo": "ExploreCanoo.dc.html",
    "free-passes": "ExploreFreePasses.dc.html",
    "places": "ExplorePlaces.dc.html",
    "events": "ExploreEvents.dc.html",
    "offers": "ExploreOffers.dc.html",
    "your-first-winter": "ExploreWinter.dc.html",
    "partner-winter-coats": "ExploreOffer.dc.html",
    "fun-skate": "EventSkate.dc.html",
    "welcome-coffee": "EventWelcome.dc.html",
    "winter-walk": "EventWinterWalk.dc.html",
    "family-storytime": "ExploreEvent.dc.html",
    "rattray-marsh": "PlaceRattray.dc.html",
    "port-credit": "PlacePortCredit.dc.html",
    "kariya": "PlaceKariya.dc.html",
    "riverwood": "PlaceRiverwood.dc.html",
    "pama": "PlacePAMA.dc.html",
    "niagara": "PlaceNiagara.dc.html",
    "ontario-parks": "PassOntarioParks.dc.html",
    "conservation": "PassConservation.dc.html",
    "pama-pass": "PassPAMA.dc.html",
    "rom-pass": "ExplorePass.dc.html",
    "swim-skate": "PassSwimSkate.dc.html",
    "bank": "OfferBank.dc.html",
    "telecom": "OfferTelecom.dc.html",
    "furniture": "OfferFurniture.dc.html",
}

lines = [
    "// GENERATED VERBATIM FROM HTML FIXTURES — DO NOT EDIT BY HAND.",
    "const Map<String, List<String>> kExploreVerbatimStrings = {",
]
for slug, fname in ROUTE_TO_HTML.items():
    raw = all_strings.get(fname, [])
    cleaned = [s.replace("\\", "\\\\").replace("'", "\\'") for s in raw[:30]]
    items = ", ".join(f"'{c}'" for c in cleaned)
    lines.append(f"  '{slug}': [{items}],")
lines.append("};")

out = ROOT / "lib" / "core" / "data" / "explore_verbatim_data.dart"
out.write_text("\n".join(lines) + "\n", encoding="utf-8")
print(f"Generated verbatim Explore strings for {len(ROUTE_TO_HTML)} routes.")
