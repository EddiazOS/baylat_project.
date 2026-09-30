#!/usr/bin/env python3
"""
Scientific Style & Academic Lexicon Auditor (Linter)
---------------------------------------------------
Audits scientific proposals, reports, and papers (.typ, .md, .tex, .txt)
for LLM clichés (agent-speak), melodramatic hyperbole, and unauthorized scope hallucinations.

Exit code:
  0: Clean (no violations detected)
  1: Style violations found
"""

import sys
import re
import argparse
from pathlib import Path
from typing import List, Dict, Tuple

# Categories of stylistic defects
RULES = [
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
        "replacement": "no destructivo / alternativo (ES) | non-destructive / alternative (EN) | zerstörungsfrei / neuartig (DE)",
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
        "category": "Agent Cliché / Inaccurate Concept",
        "pattern": r"\b(colpaso|colapso\s+de\s+la\s+matriz|matrix\s+collapse|kollaps\s+der\s+matrix)\b",
        "replacement": "transición vítreo-gomosa de la matriz (glass-to-rubber transition)",
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
        "pattern": r"\b(reproduc(?:e|ir|iendo)\s+fielmente|faithfully\s+reproduce|getreu\s+nachbilden)\b",
        "replacement": "simular con precisión / representar con exactitud",
        "languages": ["es", "en", "de"]
    },

    # ---------------------------------------------------------
    # 2. HYPERBOLE, DRAMA & INFLATED LANGUAGE
    # ---------------------------------------------------------
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(extrema\s+vulnerabilidad\s+intr[ií]nseca|extreme\s+intrinsic\s+vulnerability|extreme\s+intrinsische\s+verwundbarkeit)\b",
        "replacement": "susceptibilidad al deterioro por humedad y temperatura",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(degrad(?:an|en|a|e|aron)?\s+irreversiblemente|degrade[s]?\s+irreversibly|degradieren\s+irreversibel)\b",
        "replacement": "experimentan procesos de degradación oxidativa e hidrolítica",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(costo\s+prohibitivo|prohibitive\s+cost|unerschwingliche\s+kosten)\b",
        "replacement": "altos requerimientos de infraestructura / costo analítico elevado",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(inherentemente\s+subjetiv[ao]s?|inherently\s+subjective|inhärent\s+subjektiv)\b",
        "replacement": "análisis organoléptico cualitativo sin proyección de vida útil",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(ostenta\s+(?:una\s+posici[oó]n\s+de\s+)?liderazgo\s+indiscutible|holds\s+indisputable\s+leadership|unbestrittene\s+f[uü]hrungsrolle)\b",
        "replacement": "figura entre los principales productores a nivel mundial",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Polemic Tone",
        "pattern": r"\b(descart(?:an|en|a|ó)?\s+categ[oó]ricamente|categorically\s+reject(?:ed)?|kategorisch\s+ausschlie(?:ßen|ßt))\b",
        "replacement": "se desestiman debido a / no se emplean por inducir cinéticas no representativas",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(aberrante[s]?|aberrant|aberration(?:en)?)\b",
        "replacement": "artefactos cinéticos no representativos / sesgos analíticos",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(perturb(?:a|an|en|ó)?\s+profundamente|deeply\s+disrupts?|st[oö]rt\s+zutiefst)\b",
        "replacement": "modifica sustancialmente el balance químico",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Hyperbole & Melodrama",
        "pattern": r"\b(agrav(?:a|an|en|ó)?\s+exponencialmente|worsens?\s+exponentially|verschl[iä]mmert\s+sich\s+exponentiell)\b",
        "replacement": "aumenta marcadamente (evitar 'exponencial' sin cota matemática)",
        "languages": ["es", "en", "de"]
    },

    # ---------------------------------------------------------
    # 3. UNAUTHORIZED SCOPE & HALLUCINATED PROMISES
    # ---------------------------------------------------------
    {
        "category": "Scope Hallucination (Hardware)",
        "pattern": r"\b(raspberry\s+pi|microcontrolador\s+edge|edge\s+iot\s+device)\b",
        "replacement": "NO FINANCIADO: modelado quimiométrico e IA interpretable (Grad-CAM 1D, SHAP) en estación de cómputo",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Scope Hallucination (Objectives)",
        "pattern": r"\b(objetivo\s+espec[ií]fico\s+4|specific\s+objective\s+4|spezifisches\s+ziel\s+4)\b",
        "replacement": "EL PROYECTO TIENE ESTRICTAMENTE 3 OBJETIVOS ESPECÍFICOS (WP1, WP2, WP3)",
        "languages": ["es", "en", "de"]
    },
    {
        "category": "Scope Hallucination (Experimental Design)",
        "pattern": r"\b(c[aá]maras?\s+isot[eé]rmicas?\s+(?:a\s+)?(?:25[,\s]+40[,\s]+y\s+60|25[,\s]+40[,\s]+and\s+60))\b",
        "replacement": "EL PROYECTO UTILIZA ALMACENAMIENTO NATURAL LONGITUDINAL (26-36 °C, 70-90% HR)",
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

def audit_file(file_path: Path) -> List[Violation]:
    violations = []
    try:
        content = file_path.read_text(encoding="utf-8")
    except Exception as e:
        print(f"Error reading {file_path}: {e}", file=sys.stderr)
        return violations

    lines = content.splitlines()
    for line_idx, line in enumerate(lines, 1):
        # Ignore comments in typst (//), markdown (<!-- -->), python (#)
        stripped = line.strip()
        if stripped.startswith("//") or stripped.startswith("# ") or stripped.startswith("<!--"):
            # Skip documentation headings if checking rules file itself
            pass

        for rule in RULES:
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
        description="Audit scientific documents for LLM clichés, hyperbole, and scope hallucinations."
    )
    parser.add_argument("files", nargs="+", help="Files to audit (.typ, .md, .tex, .txt)")
    parser.add_argument("--ignore-references", action="store_true", help="Ignore references/ or test files that document forbidden terms")
    args = parser.parse_args()

    total_violations = 0
    files_checked = 0

    print("=" * 80)
    print(" SCIENTIFIC STYLE & ACADEMIC LEXICON AUDITOR")
    print("=" * 80)

    for file_str in args.files:
        p = Path(file_str)
        if not p.exists() or p.is_dir():
            continue

        # Skip blacklist documentation files if requested or automatically
        if "lexicon_blacklist" in p.name or "anti_patterns" in p.name or p.name == "audit_scientific_style.py":
            continue

        files_checked += 1
        violations = audit_file(p)
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
