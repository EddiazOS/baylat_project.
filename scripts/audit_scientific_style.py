#!/usr/bin/env python3
"""
Scientific Style & Academic Lexicon Auditor (Linter)
---------------------------------------------------
A two-tier modular linter for scientific and academic documents (.typ, .md, .tex, .txt):
  - Tier 1 (Universal Academic Core): Always active. Enforces academic sobriety, removes LLM clichés,
    hyperbole, marketing buzzwords, and melodramatic phrasing. Agnostic to scientific discipline.
  - Tier 2 (Project Scope Manifest): Optional. Loads project-specific scope constraints from a local
    `.scope_rules.json` file or via `--scope-config` to verify hardware, objective counts, and methodologies.

Exit code:
  0: Clean (no violations detected)
  1: Style or scope violations found
"""

import sys
import re
import json
import argparse
from pathlib import Path
from typing import List, Dict, Optional

# ==============================================================================
# TIER 1: UNIVERSAL ACADEMIC CORE RULES (100% Domain-Agnostic)
# ==============================================================================
UNIVERSAL_STYLE_RULES: List[Dict] = [
    # ---------------------------------------------------------
    # 1. AGENT-SPEAK & LLM CLICHÉS
    # ---------------------------------------------------------
    {
        "category": "Agent Cliché / Buzzword",
        "pattern": r"\b(cuello[s]?\s+de\s+botella|bottleneck[s]?|flaschenh[aä]ls(?:e)?)\b",
        "replacement": "limitación metodológica / restricción analítica (ES) | analytical limitation (EN) | analytische Grenze (DE)",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Buzzword",
        "pattern": r"\b(disruptiv[oa]s?|disruptive|disruptiven?)\b",
        "replacement": "no destructivo / alternativo (ES) | non-destructive / alternative (EN) | neuartig / methodisch innovativ (DE)",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Buzzword",
        "pattern": r"\b(paradigma[s]?|paradigm[s]?)\b",
        "replacement": "enfoque / arquitectura / marco metodológico",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Buzzword",
        "pattern": r"\b(de\s+vanguardia|cutting-edge|state-of-the-art|spitzenforschung|hochmodern(?:e[rs]?)?)\b",
        "replacement": "avanzado / especializado (ES) | advanced / specialized (EN) | fortgeschritten / spezialisiert (DE)",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Buzzword",
        "pattern": r"\b(caja\s+negra|black\s*box|black-box)\b",
        "replacement": "modelo puramente empírico / sin guía física explícita",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Buzzword",
        "pattern": r"\b(espuri[oa]s?|spurious|spurios|scheinkorrelation(?:en)?)\b",
        "replacement": "correlación no causal / sobreajuste al ruido",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Buzzword",
        "pattern": r"\b(innegociable[s]?|non-negotiable|nicht\s+verhandelbar(?:e[rs]?)?)\b",
        "replacement": "criterio de diseño indispensable / condición operativa necesaria",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / LLM Metaphor",
        "pattern": r"\b(desentrañar\s+(?:los\s+)?mecanismos|unravel\s+(?:deep\s+)?molecular\s+mechanisms|tiefe\s+molekulare\s+mechanismen\s+aufdecken)\b",
        "replacement": "identificar y cuantificar productos intermedios / caracterizar cinéticas",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Affective Adverb",
        "pattern": r"\b(meticulosamente|meticulously|akribisch|penibel)\b",
        "replacement": "sistemáticamente / según el protocolo estándar",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Empty Affirmation",
        "pattern": r"\b(reproduc(?:e|en|ir|iendo)\s+fielmente|faithfully\s+reproduce|getreu\s+nachbilden)\b",
        "replacement": "simular con precisión / representar con exactitud",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Agent Cliché / Marketing Claim",
        "pattern": r"\b(revolucionari[oa]s?|revolutionary|sin\s+precedentes|unprecedented|beispiellos(?:e[rs]?)?)\b",
        "replacement": "novedoso / escasamente explorado en la literatura",
        "languages": ["es", "en", "de"]
    },

    # ---------------------------------------------------------
    # 2. HYPERBOLE, DRAMA & INFLATED LANGUAGE
    # ---------------------------------------------------------
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(extrema\s+vulnerabilidad\s+intr[ií]nseca|extreme\s+intrinsic\s+vulnerability|extreme\s+intrinsische\s+verwundbarkeit)\b",
        "replacement": "susceptibilidad al deterioro por humedad y temperatura / factores ambientales",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(degrad(?:an|en|a|e|aron)?\s+irreversiblemente|degrade[s]?\s+irreversibly|degradieren\s+irreversibel)\b",
        "replacement": "experimentan procesos de degradación / disminución de estabilidad",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(costo\s+prohibitivo|prohibitive\s+cost|unerschwingliche\s+kosten)\b",
        "replacement": "altos requerimientos instrumentales / costo operativo elevado",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(inherentemente\s+subjetiv[ao]s?|inherently\s+subjective|inhärent\s+subjektiv)\b",
        "replacement": "evaluación cualitativa sin modelado cuantitativo / limitaciones predictivas",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(ostenta\s+(?:una\s+posici[oó]n\s+de\s+)?liderazgo\s+indiscutible|holds\s+indisputable\s+leadership|unbestrittene\s+f[uü]hrungsrolle)\b",
        "replacement": "figura entre los principales referentes / productores",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Polemic Tone",
        "pattern": r"\b(descart(?:an|en|a|ó)?\s+categ[oó]ricamente|categorically\s+reject(?:ed)?|kategorisch\s+ausschlie(?:ßen|ßt))\b",
        "replacement": "se desestiman debido a / no se emplean por inducir artefactos no representativos",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(aberrante[s]?|aberrant|aberration(?:en)?)\b",
        "replacement": "artefactos analíticos no representativos / sesgos sistemáticos",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(perturb(?:a|an|en|ó)?\s+profundamente|deeply\s+disrupts?|st[oö]rt\s+zutiefst)\b",
        "replacement": "modifica sustancialmente / altera significativamente",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(agrav(?:a|an|en|ó)?\s+exponencialmente|worsens?\s+exponentially|verschl[iä]mmert\s+sich\s+exponentiell)\b",
        "replacement": "aumenta de forma marcada / se intensifica (evitar 'exponencial' sin base matemática)",
        "languages": ["es", "en", "de"]
    }
]

class Violation:
    def __init__(self, file_path: str, line_no: int, text: str, match_text: str, category: str, replacement: str):
        self.file_path = file_path
        self.line_no = line_no
        self.text = text
        self.match_text = match_text
        self.category = category
        self.replacement = replacement

    def __str__(self):
        return (
            f"  [L{self.line_no}] [{self.category}]\n"
            f"    Found:       \"{self.match_text}\"\n"
            f"    Snippet:     {self.text.strip()[:100]}...\n"
            f"    Recommended: {self.replacement}\n"
        )

def load_scope_rules(config_path: Optional[Path] = None) -> List[Dict]:
    """Load project-specific scope rules if a manifest exists."""
    rules = []
    candidates = []
    if config_path:
        candidates.append(config_path)
    else:
        # Auto-discover .scope_rules.json in current directory or workspace root
        candidates.append(Path(".scope_rules.json"))
        candidates.append(Path(__file__).parent.parent / ".scope_rules.json")

    for p in candidates:
        if p and p.is_file():
            try:
                data = json.loads(p.read_text(encoding="utf-8"))
                rules = data.get("scope_rules", [])
                break
            except Exception as e:
                print(f"Warning: Failed to parse scope config from {p}: {e}", file=sys.stderr)
    return rules

def audit_file(file_path: Path, scope_rules: Optional[List[Dict]] = None) -> List[Violation]:
    """Audit a file against universal style rules and optional project scope rules."""
    violations = []
    try:
        content = file_path.read_text(encoding="utf-8")
    except Exception as e:
        print(f"Error reading {file_path}: {e}", file=sys.stderr)
        return violations

    active_rules = list(UNIVERSAL_STYLE_RULES)
    if scope_rules:
        active_rules.extend(scope_rules)

    lines = content.splitlines()
    for line_idx, line in enumerate(lines, 1):
        stripped = line.strip()
        # Skip comment lines
        if stripped.startswith("//") or stripped.startswith("# ") or stripped.startswith("<!--"):
            pass

        for rule in active_rules:
            matches = list(re.finditer(rule["pattern"], line, re.IGNORECASE))
            for m in matches:
                violations.append(
                    Violation(
                        file_path=str(file_path),
                        line_no=line_idx,
                        text=line,
                        match_text=m.group(0),
                        category=rule["category"],
                        replacement=rule["replacement"]
                    )
                )
    return violations

def main():
    parser = argparse.ArgumentParser(
        description="Audit scientific documents for LLM clichés, hyperbole, and optional scope rules."
    )
    parser.add_argument("files", nargs="+", help="Files to audit (.typ, .md, .tex, .txt)")
    parser.add_argument("--scope-config", type=str, default=None, help="Path to project scope config (.scope_rules.json)")
    parser.add_argument("--universal-only", action="store_true", help="Force pure universal style rules (ignore project scope)")
    args = parser.parse_args()

    scope_rules = []
    if not args.universal_only:
        cfg_path = Path(args.scope_config) if args.scope_config else None
        scope_rules = load_scope_rules(cfg_path)

    total_violations = 0
    files_checked = 0

    print("=" * 80)
    print(" SCIENTIFIC STYLE & ACADEMIC RIGOR AUDITOR")
    mode_str = f"Universal Academic Core + {len(scope_rules)} Project Scope Rules" if scope_rules else "Universal Academic Core (Agnostic Mode)"
    print(f" Mode: {mode_str}")
    print("=" * 80)

    for file_str in args.files:
        p = Path(file_str)
        if not p.exists() or p.is_dir():
            continue

        if "lexicon_blacklist" in p.name or "anti_patterns" in p.name or p.name == "audit_scientific_style.py":
            continue

        files_checked += 1
        violations = audit_file(p, scope_rules=scope_rules)
        if violations:
            total_violations += len(violations)
            print(f"\n❌ {p.name} ({len(violations)} violation{'s' if len(violations) > 1 else ''}):")
            for v in violations:
                print(v)
        else:
            print(f"✅ {p.name}: CLEAN (0 violations)")

    print("-" * 80)
    print(f"Summary: {files_checked} files inspected, {total_violations} stylistic violations found.")
    print("=" * 80)

    if total_violations > 0:
        sys.exit(1)
    else:
        print("Verdict: APPROVE - All documents comply with academic rigor standards.")
        sys.exit(0)

if __name__ == "__main__":
    main()
