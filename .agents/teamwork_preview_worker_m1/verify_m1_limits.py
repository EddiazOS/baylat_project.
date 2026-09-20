#!/usr/bin/env python3
import re
import sys
import os

def verify(typ_path):
    print(f"=== Verifying OASys Form Character Limits on {typ_path} ===")
    if not os.path.exists(typ_path):
        print(f"Error: {typ_path} does not exist!")
        return False

    with open(typ_path, "r", encoding="utf-8") as f:
        content = f.read()

    checks = [
        ("Titel DE", r'#let\s+titel_de\s*=\s*"([^"]+)"', 400),
        ("Titel ES", r'#let\s+titel_es\s*=\s*"([^"]+)"', 400),
        ("Titel EN", r'#let\s+titel_en\s*=\s*"([^"]+)"', 400),
        ("Stichwörter DE", r'#let\s+stichwoerter_de\s*=\s*"([^"]+)"', 200),
        ("Stichwörter ES", r'#let\s+stichwoerter_es\s*=\s*"([^"]+)"', 200),
        ("Stichwörter EN", r'#let\s+stichwoerter_en\s*=\s*"([^"]+)"', 200),
        ("Mehrwert DE (Warum Partner)", r'#let\s+mehrwert_de\s*=\s*\[(.*?)\]\s*\n\s*#let', 1000),
        ("Mehrwert ES (Warum Partner)", r'#let\s+mehrwert_es\s*=\s*\[(.*?)\]\s*\n\s*#let', 1000),
        ("Internationalisierung DE", r'#let\s+internationalisierung_de\s*=\s*\[(.*?)\]\s*\n\s*#let', 2000),
        ("Internationalisierung ES", r'#let\s+internationalisierung_es\s*=\s*\[(.*?)\]\s*\n\s*#let', 2000),
        ("Kurzfassung DE", r'#let\s+kurzfassung_de\s*=\s*\[(.*?)\]\s*\n\s*#let', 2000),
        ("Kurzfassung ES", r'#let\s+kurzfassung_es\s*=\s*\[(.*?)\]\s*\n\s*#let', 2000),
        ("Ausführliche Beschreibung DE", r'#let\s+ausfuehrlich_de\s*=\s*\[(.*?)\]\s*\n\s*#let', 10000),
        ("Ausführliche Beschreibung ES", r'#let\s+ausfuehrlich_es\s*=\s*\[(.*?)\]\s*\n\s*#let', 10000),
        ("Kurzer Arbeitsplan", r'#let\s+arbeitsplan_kurz\s*=\s*\[(.*?)\]\s*\n\s*#let', 2000),
        ("Warum keine andere Förderung", r'#let\s+warum_keine_andere_foerderung\s*=\s*\[(.*?)\]\s*\n\s*#let', 2000),
        ("Bezug Ausschreibung", r'#let\s+bezug_ausschreibung\s*=\s*\[(.*?)\]\s*\n\s*#let', 1000),
    ]

    all_pass = True
    for label, pattern, limit in checks:
        m = re.search(pattern, content, re.DOTALL)
        if not m:
            print(f"[-] MISSING: {label} (pattern: {pattern[:40]}...)")
            all_pass = False
            continue
        text = m.group(1).strip()
        clean = re.sub(r'#\w+\[|\]|\*|_', '', text).strip()
        count = len(clean)
        pct = (count / limit) * 100
        if count <= limit:
            print(f"[+] PASS: {label:32} | {count:5d} / {limit:5d} chars ({pct:5.1f}%)")
        else:
            diff = count - limit
            print(f"[!] FAIL: {label:32} | {count:5d} / {limit:5d} chars (EXCEEDED BY {diff})")
            all_pass = False

    return all_pass

if __name__ == "__main__":
    typ_file = sys.argv[1] if len(sys.argv) > 1 else "/home/echoes/projects/AI_project/proyecto-babiera/formulario_oasys_baylat.typ"
    ok = verify(typ_file)
    sys.exit(0 if ok else 1)
