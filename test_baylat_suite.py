#!/usr/bin/env python3
"""E2E Test Suite for BAYLAT-Anschubfinanzierung OASys Grant Application.

Project: DIT (Bavaria) & UdC (Colombia) Bilateral Research Project
Authoritative Request: ORIGINAL_REQUEST.md / PROJECT.md

Tiers:
- Tier 1: Typst Compilation and PDF generation for all 3 documents
- Tier 2: Boundary & Character Count Limits (OASys web form restrictions)
- Tier 3: Citation Key Integrity against references.bib & Template Elements
- Tier 4: PDF Artifact Validation (valid PDF format, size > 50 KB)
- Tier 5: Domain and Semantic Consistency (4 matrices, 3-tier AI, AOAC methods)
"""

import os
import re
import subprocess
import sys
import unittest
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

# Workspace root
WORKSPACE_DIR = Path(__file__).parent.resolve()
BIBLIOGRAPHY_FILE = WORKSPACE_DIR / "references.bib"
TEMPLATE_FILE = WORKSPACE_DIR / "typst-scientific-report-template" / "template.typ"

DOC_CONFIGS = {
    "formulario": {
        "src": WORKSPACE_DIR / "formulario_oasys_baylat.typ",
        "pdf": WORKSPACE_DIR / "formulario_oasys_baylat.pdf",
        "doc_id": "OASYS-BAYLAT-2026-DIT-UDC",
        "lang": "es",
    },
    "expose_de": {
        "src": WORKSPACE_DIR / "expose_wissenschaftlicher_bericht_baylat_de.typ",
        "pdf": WORKSPACE_DIR / "expose_wissenschaftlicher_bericht_baylat_de.pdf",
        "doc_id": "BAYLAT-EXP-DE-2026",
        "lang": "de",
    },
    "expose_en": {
        "src": WORKSPACE_DIR / "expose_scientific_proposal_baylat_en.typ",
        "pdf": WORKSPACE_DIR / "expose_scientific_proposal_baylat_en.pdf",
        "doc_id": "BAYLAT-EXP-EN-2026",
        "lang": "en",
    },
    "expose_es": {
        "src": WORKSPACE_DIR / "expose_propuesta_cientifica_baylat_es.typ",
        "pdf": WORKSPACE_DIR / "expose_propuesta_cientifica_baylat_es.pdf",
        "doc_id": "BAYLAT-EXP-ES-2026",
        "lang": "es",
    },
}

MIN_PDF_SIZE_BYTES = 51200  # 50 KB = 50 * 1024 bytes


# ============================================================================
# Helper Functions: Typst Parsing, Character Extraction, and BibTeX
# ============================================================================

def load_bibtex_keys(bib_path: Path) -> Set[str]:
    """Parse all BibTeX entry citation keys from references.bib."""
    if not bib_path.exists():
        return set()
    with open(bib_path, "r", encoding="utf-8") as f:
        content = f.read()
    # Match @entry_type{citation_key,
    keys = set(re.findall(r'@\w+\s*\{\s*([^,\s]+)\s*,', content))
    return keys


def extract_let_binding(content: str, variable_aliases: List[str]) -> Optional[str]:
    """Extract string or content block assigned to a Typst #let or let variable.
    
    Handles balanced content blocks [...] and quoted strings "..."
    """
    for var_name in variable_aliases:
        # Match '#let var =' or 'let var ='
        pattern = rf'(?:#)?let\s+{re.escape(var_name)}\s*=\s*'
        match = re.search(pattern, content)
        if not match:
            continue
        
        start_pos = match.end()
        # Skip whitespace/newlines after '='
        while start_pos < len(content) and content[start_pos] in " \t\r\n":
            start_pos += 1
        
        if start_pos >= len(content):
            continue
        
        first_char = content[start_pos]
        if first_char == '"':
            # Quoted string literal
            chars = []
            i = start_pos + 1
            while i < len(content):
                if content[i] == '\\':
                    if i + 1 < len(content):
                        chars.append(content[i + 1])
                        i += 2
                        continue
                elif content[i] == '"':
                    return "".join(chars)
                chars.append(content[i])
                i += 1
            return "".join(chars)
            
        elif first_char == '[':
            # Balanced content block [...]
            depth = 0
            for i in range(start_pos, len(content)):
                if content[i] == '[':
                    depth += 1
                elif content[i] == ']':
                    depth -= 1
                    if depth == 0:
                        return content[start_pos + 1 : i]
            # If unterminated, return remainder
            return content[start_pos + 1 :]
            
    return None


def clean_typst_text(raw_text: str) -> str:
    """Normalize and strip Typst formatting markers for strict OASys text field counting."""
    if not raw_text:
        return ""
    # Strip typst function calls like #callout(...)[...] or #v(1em) or #linebreak()
    cleaned = re.sub(r'#\w+(?:\([^)]*\))?(?:\[[^\]]*\])?', '', raw_text)
    # Strip markdown emphasis and brackets
    cleaned = re.sub(r'[*_#]', '', cleaned)
    # Normalize multiple whitespace within lines while preserving single spacing
    # Note: OASys web form counts exact characters including single spaces and newlines
    cleaned = re.sub(r'[ \t]+', ' ', cleaned)
    return cleaned.strip()


def extract_typst_citations(content: str) -> Set[str]:
    """Extract all @citations from Typst content while excluding email addresses, escaped @, and local labels."""
    # Find all declared labels in Typst, e.g. <sec_intro>, <tbl_wp>, etc.
    internal_labels = set(re.findall(r'<([a-zA-Z0-9_:-]+)>', content))
    
    # Match @citation_key not preceded by word character, dot, hyphen, or backslash
    raw_citations = re.findall(r'(?<![\w\.\-\\\\])@([a-zA-Z0-9_:-]+)', content)
    
    # Filter out internal labels
    citations = {c for c in raw_citations if c not in internal_labels}
    return citations


# ============================================================================
# Tier 1: Compilation Test Suite
# ============================================================================

class TestTier1Compilation(unittest.TestCase):
    """Tier 1: Verifies that all three Typst source documents compile cleanly to PDF."""

    def _compile_document(self, doc_key: str):
        config = DOC_CONFIGS[doc_key]
        src_path = config["src"]
        pdf_path = config["pdf"]

        self.assertTrue(
            src_path.exists(),
            f"Source file does not exist: {src_path}. Milestone implementation pending."
        )

        cmd = ["typst", "compile", str(src_path), str(pdf_path)]
        res = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
        
        self.assertEqual(
            res.returncode,
            0,
            f"Typst compilation failed for {src_path.name}:\nSTDOUT: {res.stdout}\nSTDERR: {res.stderr}"
        )
        self.assertTrue(
            pdf_path.exists(),
            f"Compiled PDF not found at {pdf_path} after successful typst return code."
        )

    def test_compilation_formulario_oasys(self):
        """Tier 1.1: Compile formulario_oasys_baylat.typ -> formulario_oasys_baylat.pdf."""
        self._compile_document("formulario")

    def test_compilation_expose_wissenschaftlicher_bericht_de(self):
        """Tier 1.2: Compile expose_wissenschaftlicher_bericht_baylat_de.typ -> PDF."""
        self._compile_document("expose_de")

    def test_compilation_expose_scientific_proposal_en(self):
        """Tier 1.3: Compile expose_scientific_proposal_baylat_en.typ -> PDF."""
        self._compile_document("expose_en")

    def test_compilation_expose_propuesta_cientifica_es(self):
        """Tier 1.4: Compile expose_propuesta_cientifica_baylat_es.typ -> PDF."""
        self._compile_document("expose_es")


# ============================================================================
# Tier 2: Boundary & Character Count Limit Tests (OASys Web Form)
# ============================================================================

class TestTier2CharacterLimits(unittest.TestCase):
    """Tier 2: Validates strict character boundaries for OASys form submission fields."""

    @classmethod
    def setUpClass(cls):
        cls.src_path = DOC_CONFIGS["formulario"]["src"]
        if cls.src_path.exists():
            with open(cls.src_path, "r", encoding="utf-8") as f:
                cls.content = f.read()
        else:
            cls.content = ""

    def setUp(self):
        if not self.src_path.exists():
            self.fail(f"Source file {self.src_path} does not exist yet. Milestone 1 pending.")

    def _assert_field_within_limit(
        self,
        field_label: str,
        aliases: List[str],
        max_chars: int,
        min_chars: int = 20
    ):
        raw_text = extract_let_binding(self.content, aliases)
        self.assertIsNotNone(
            raw_text,
            f"Field '{field_label}' could not be extracted from {self.src_path.name}. "
            f"Expected variable name among: {aliases}"
        )
        cleaned = clean_typst_text(raw_text)
        char_count = len(cleaned)
        
        self.assertGreaterEqual(
            char_count,
            min_chars,
            f"Field '{field_label}' is unexpectedly short ({char_count} chars < minimum {min_chars}). "
            f"Possible empty stub or incomplete content."
        )
        self.assertLessEqual(
            char_count,
            max_chars,
            f"Field '{field_label}' EXCEEDED character limit! "
            f"Count: {char_count} chars, Limit: {max_chars} chars (Exceeded by {char_count - max_chars} chars)."
        )

    def test_kurzfassung_de_limit(self):
        """Tier 2.1: Kurzfassung DE <= 2,000 characters with spaces."""
        self._assert_field_within_limit(
            field_label="Kurzfassung DE",
            aliases=["kurzfassung_de", "kurzbeschreibung_de"],
            max_chars=2000,
            min_chars=500
        )

    def test_kurzfassung_es_limit(self):
        """Tier 2.2: Kurzfassung ES <= 2,000 characters with spaces."""
        self._assert_field_within_limit(
            field_label="Kurzfassung ES",
            aliases=["kurzfassung_es", "kurzbeschreibung_es"],
            max_chars=2000,
            min_chars=500
        )

    def test_ausfuehrliche_beschreibung_de_limit(self):
        """Tier 2.3: Ausführliche Projektbeschreibung DE <= 10,000 characters with spaces."""
        self._assert_field_within_limit(
            field_label="Ausführliche Projektbeschreibung DE",
            aliases=["ausfuehrlich_de", "ausfuehrliche_beschreibung_de"],
            max_chars=10000,
            min_chars=2000
        )

    def test_ausfuehrliche_beschreibung_es_limit(self):
        """Tier 2.4: Ausführliche Projektbeschreibung ES <= 10,000 characters with spaces."""
        self._assert_field_within_limit(
            field_label="Ausführliche Projektbeschreibung ES",
            aliases=["ausfuehrlich_es", "ausfuehrliche_beschreibung_es"],
            max_chars=10000,
            min_chars=2000
        )

    def test_mehrwert_des_projektpartners_de_limit(self):
        """Tier 2.5: Mehrwert / Warum Partner gewählt DE <= 1,000 characters with spaces (CRITICAL)."""
        self._assert_field_within_limit(
            field_label="Mehrwert des Projektpartners DE",
            aliases=["mehrwert_de", "warum_partner_de"],
            max_chars=1000,
            min_chars=200
        )

    def test_mehrwert_des_projektpartners_es_limit(self):
        """Tier 2.6: Mehrwert / Warum Partner gewählt ES <= 1,000 characters with spaces (CRITICAL)."""
        self._assert_field_within_limit(
            field_label="Mehrwert des Projektpartners ES",
            aliases=["mehrwert_es", "warum_partner_es"],
            max_chars=1000,
            min_chars=200
        )

    def test_internationalisierungsstrategie_de_limit(self):
        """Tier 2.7: Internationalisierungsstrategie DE <= 2,000 characters with spaces."""
        self._assert_field_within_limit(
            field_label="Internationalisierungsstrategie DE",
            aliases=["internationalisierung_de", "internationalisierungsstrategie_de"],
            max_chars=2000,
            min_chars=200
        )

    def test_internationalisierungsstrategie_es_limit(self):
        """Tier 2.8: Internationalisierungsstrategie ES <= 2,000 characters with spaces."""
        self._assert_field_within_limit(
            field_label="Internationalisierungsstrategie ES",
            aliases=["internationalisierung_es", "internationalisierungsstrategie_es"],
            max_chars=2000,
            min_chars=200
        )

    def test_kurzer_arbeitsplan_limit(self):
        """Tier 2.9: Kurzer Zeit- und Arbeitsplan text field <= 2,000 characters with spaces."""
        self._assert_field_within_limit(
            field_label="Kurzer Arbeitsplan",
            aliases=["arbeitsplan_kurz", "zeitplan_kurz"],
            max_chars=2000,
            min_chars=300
        )

    def test_projekttitel_limits(self):
        """Tier 2.10: Trilingual Project Titles (DE, ES, EN <= 400 characters each)."""
        for lang, var in [("DE", "titel_de"), ("ES", "titel_es"), ("EN", "titel_en")]:
            self._assert_field_within_limit(
                field_label=f"Projekttitel {lang}",
                aliases=[var],
                max_chars=400,
                min_chars=20
            )

    def test_stichwoerter_limits(self):
        """Tier 2.11: Trilingual Keywords (DE, ES, EN <= 200 characters each)."""
        for lang, var in [("DE", "stichwoerter_de"), ("ES", "stichwoerter_es"), ("EN", "stichwoerter_en")]:
            self._assert_field_within_limit(
                field_label=f"Stichwörter {lang}",
                aliases=[var],
                max_chars=200,
                min_chars=10
            )

    def test_anschubfinanzierung_begruendung_limit(self):
        """Tier 2.12: Seed funding rationale (Weshalb keine andere Finanzierung) <= 2,000 characters."""
        self._assert_field_within_limit(
            field_label="Warum keine andere Förderung",
            aliases=["warum_keine_andere_foerderung", "anschubfinanzierung_begruendung"],
            max_chars=2000,
            min_chars=200
        )

    def test_bezug_ausschreibung_limit(self):
        """Tier 2.13: Reference to follow-up call (Bezug zu Ausschreibung / Folgeprojekt) <= 1,000 characters."""
        self._assert_field_within_limit(
            field_label="Bezug Ausschreibung",
            aliases=["bezug_ausschreibung", "folgeantrag_ausschreibung"],
            max_chars=1000,
            min_chars=100
        )


# ============================================================================
# Tier 3: Citation Integrity & Template Elements
# ============================================================================

class TestTier3CitationsAndTemplate(unittest.TestCase):
    """Tier 3: Validates BibTeX database citations and template structural elements."""

    @classmethod
    def setUpClass(cls):
        cls.bib_keys = load_bibtex_keys(BIBLIOGRAPHY_FILE)

    def test_bibtex_database_integrity(self):
        """Tier 3.1: Verify references.bib exists and contains valid citation keys."""
        self.assertTrue(BIBLIOGRAPHY_FILE.exists(), "references.bib not found in workspace root.")
        self.assertGreaterEqual(
            len(self.bib_keys),
            8,
            f"Expected at least 8 citation keys in references.bib, found {len(self.bib_keys)}."
        )
        # Verify specific required key: passos2605convolutionalneuralnetworks
        self.assertIn(
            "passos2605convolutionalneuralnetworks",
            self.bib_keys,
            "Required BibTeX key 'passos2605convolutionalneuralnetworks' missing from references.bib!"
        )

    def _verify_document_citations(self, doc_key: str):
        src_path = DOC_CONFIGS[doc_key]["src"]
        self.assertTrue(src_path.exists(), f"Source file {src_path} missing.")
        
        with open(src_path, "r", encoding="utf-8") as f:
            content = f.read()

        citations = extract_typst_citations(content)

        # CRITICAL check: @passos2026 must NOT be used
        self.assertNotIn(
            "passos2026",
            citations,
            f"CRITICAL DEFECT: Found '@passos2026' in {src_path.name}! "
            f"Must use authoritative key '@passos2605convolutionalneuralnetworks' (year 2605)."
        )

        # Check all cited keys exist in references.bib
        for key in citations:
            self.assertIn(
                key,
                self.bib_keys,
                f"Citation '@{key}' in {src_path.name} is not defined in references.bib! "
                f"Valid keys: {sorted(self.bib_keys)}"
            )

        return citations

    def test_citations_formulario_oasys(self):
        """Tier 3.2: Verify citations in formulario_oasys_baylat.typ (if any)."""
        self._verify_document_citations("formulario")

    def test_citations_expose_wissenschaftlicher_bericht_de(self):
        """Tier 3.3: Verify all citations in German Exposé exist in references.bib."""
        citations = self._verify_document_citations("expose_de")
        self.assertGreater(
            len(citations),
            0,
            "German Exposé must contain literature citations linking to references.bib."
        )
        # Verify key literature citations are present
        core_keys = [
            "upadhyay2026enhancingspectralanalysis",
            "passos2605convolutionalneuralnetworks",
            "perre2025towardmechanisticmodels",
            "pronk2026neuralnetworkplacementin",
            "grundy2025reviewofcurrent",
        ]
        present = [k for k in core_keys if k in citations]
        self.assertGreaterEqual(
            len(present),
            3,
            f"German Exposé should cite core literature. Found: {present}, Expected from: {core_keys}"
        )

    def test_citations_expose_scientific_proposal_en(self):
        """Tier 3.4: Verify all citations in English Exposé exist in references.bib."""
        citations = self._verify_document_citations("expose_en")
        self.assertGreater(
            len(citations),
            0,
            "English Exposé must contain literature citations linking to references.bib."
        )
        core_keys = [
            "upadhyay2026enhancingspectralanalysis",
            "passos2605convolutionalneuralnetworks",
            "perre2025towardmechanisticmodels",
            "pronk2026neuralnetworkplacementin",
            "grundy2025reviewofcurrent",
        ]
        present = [k for k in core_keys if k in citations]
        self.assertGreaterEqual(
            len(present),
            3,
            f"English Exposé should cite core literature. Found: {present}, Expected from: {core_keys}"
        )

    def test_citations_expose_propuesta_cientifica_es(self):
        """Tier 3.5: Verify all citations in Spanish Exposé exist in references.bib."""
        citations = self._verify_document_citations("expose_es")
        self.assertGreater(
            len(citations),
            0,
            "Spanish Exposé must contain literature citations linking to references.bib."
        )
        core_keys = [
            "upadhyay2026enhancingspectralanalysis",
            "passos2605convolutionalneuralnetworks",
            "perre2025towardmechanisticmodels",
            "pronk2026neuralnetworkplacementin",
            "grundy2025reviewofcurrent",
        ]
        present = [k for k in core_keys if k in citations]
        self.assertGreaterEqual(
            len(present),
            3,
            f"Spanish Exposé should cite core literature. Found: {present}, Expected from: {core_keys}"
        )

    def _verify_template_structure(self, doc_key: str):
        src_path = DOC_CONFIGS[doc_key]["src"]
        self.assertTrue(src_path.exists(), f"Source file {src_path} missing.")
        
        with open(src_path, "r", encoding="utf-8") as f:
            content = f.read()

        # 1. Template import
        self.assertTrue(
            "typst-scientific-report-template/template.typ" in content,
            f"{src_path.name} must import 'typst-scientific-report-template/template.typ'."
        )

        # 2. #show: project.with(...)
        self.assertTrue(
            re.search(r'#?show:\s*project\.with\(', content) is not None,
            f"{src_path.name} must configure the '#show: project.with(...)' block."
        )

        # 3. Project parameters
        for param in ["title:", "authors:", "date:", "doc_id:"]:
            self.assertTrue(
                param in content,
                f"{src_path.name} project configuration is missing required argument '{param}'."
            )

        # 4. #callout(...)
        self.assertTrue(
            re.search(r'#?callout\(', content) is not None,
            f"{src_path.name} must utilize '#callout(...)' for highlighting key takeaways/guidelines."
        )

    def test_template_structure_formulario(self):
        """Tier 3.6: Verify template structure in formulario_oasys_baylat.typ."""
        self._verify_template_structure("formulario")

    def test_template_structure_expose_de(self):
        """Tier 3.7: Verify template structure and bibliography in German Exposé."""
        self._verify_template_structure("expose_de")
        with open(DOC_CONFIGS["expose_de"]["src"], "r", encoding="utf-8") as f:
            content = f.read()
        self.assertTrue(
            '#bibliography("references.bib"' in content or '#bibliography("references.bib")' in content,
            "German Exposé must end with '#bibliography(\"references.bib\", ...)'"
        )

    def test_template_structure_expose_en(self):
        """Tier 3.8: Verify template structure and bibliography in English Exposé."""
        self._verify_template_structure("expose_en")
        with open(DOC_CONFIGS["expose_en"]["src"], "r", encoding="utf-8") as f:
            content = f.read()
        self.assertTrue(
            '#bibliography("references.bib"' in content or '#bibliography("references.bib")' in content,
            "English Exposé must end with '#bibliography(\"references.bib\", ...)'"
        )

    def test_template_structure_expose_es(self):
        """Tier 3.9: Verify template structure and bibliography in Spanish Exposé."""
        self._verify_template_structure("expose_es")
        with open(DOC_CONFIGS["expose_es"]["src"], "r", encoding="utf-8") as f:
            content = f.read()
        self.assertTrue(
            '#bibliography("references.bib"' in content or '#bibliography("references.bib")' in content,
            "Spanish Exposé must end with '#bibliography(\"references.bib\", ...)'"
        )


# ============================================================================
# Tier 4: PDF Artifact Validation
# ============================================================================

class TestTier4PdfArtifacts(unittest.TestCase):
    """Tier 4: Validates that compiled PDF artifacts exist, are valid PDFs, and exceed 50 KB."""

    def _validate_pdf_artifact(self, doc_key: str):
        pdf_path = DOC_CONFIGS[doc_key]["pdf"]
        self.assertTrue(
            pdf_path.exists(),
            f"PDF artifact does not exist: {pdf_path}. Compilation required."
        )

        # Magic header validation
        with open(pdf_path, "rb") as f:
            header = f.read(1024)
        self.assertTrue(
            header.startswith(b"%PDF-"),
            f"Artifact {pdf_path.name} does not start with valid PDF magic bytes '%PDF-'."
        )

        # Size check > 50 KB (51,200 bytes)
        file_size = os.path.getsize(pdf_path)
        self.assertGreater(
            file_size,
            MIN_PDF_SIZE_BYTES,
            f"PDF artifact {pdf_path.name} size is {file_size} bytes ({file_size/1024:.1f} KB), "
            f"which does NOT exceed the 50 KB (51,200 bytes) threshold!"
        )

    def test_pdf_artifact_formulario_oasys(self):
        """Tier 4.1: Verify formulario_oasys_baylat.pdf exists and > 50 KB."""
        self._validate_pdf_artifact("formulario")

    def test_pdf_artifact_expose_wissenschaftlicher_bericht_de(self):
        """Tier 4.2: Verify expose_wissenschaftlicher_bericht_baylat_de.pdf exists and > 50 KB."""
        self._validate_pdf_artifact("expose_de")

    def test_pdf_artifact_expose_scientific_proposal_en(self):
        """Tier 4.3: Verify expose_scientific_proposal_baylat_en.pdf exists and > 50 KB."""
        self._validate_pdf_artifact("expose_en")

    def test_pdf_artifact_expose_propuesta_cientifica_es(self):
        """Tier 4.4: Verify expose_propuesta_cientifica_baylat_es.pdf exists and > 50 KB."""
        self._validate_pdf_artifact("expose_es")


# ============================================================================
# Tier 5: Adversarial Quality & Domain Consistency Tests
# ============================================================================

class TestTier5DomainConsistency(unittest.TestCase):
    """Tier 5: Deep domain integrity tests covering the scientific specifications."""

    def _get_document_text(self, doc_key: str) -> str:
        src_path = DOC_CONFIGS[doc_key]["src"]
        if not src_path.exists():
            self.fail(f"Source file {src_path} missing.")
        with open(src_path, "r", encoding="utf-8") as f:
            return f.read()

    def test_four_agrifood_matrices_coverage(self):
        """Tier 5.1: Assert all 4 Colombian matrices are addressed across exposés."""
        de_text = self._get_document_text("expose_de")
        en_text = self._get_document_text("expose_en")
        es_text = self._get_document_text("expose_es")

        # German matrix checks
        self.assertTrue(
            "Kakao" in de_text or "Theobroma cacao" in de_text,
            "German exposé missing Cocoa matrix (*Theobroma cacao*)."
        )
        self.assertTrue(
            "Kaffee" in de_text or "Coffea arabica" in de_text,
            "German exposé missing Coffee matrix (*Coffea arabica*)."
        )
        self.assertTrue(
            "Honig" in de_text or "Apis mellifera" in de_text,
            "German exposé missing Honey matrix (*Apis mellifera*)."
        )
        self.assertTrue(
            "Kokosöl" in de_text or "Cocos nucifera" in de_text,
            "German exposé missing Virgin Coconut Oil matrix (*Cocos nucifera*)."
        )

        # English matrix checks
        self.assertTrue(
            "Cocoa" in en_text or "Theobroma cacao" in en_text,
            "English exposé missing Cocoa matrix (*Theobroma cacao*)."
        )
        self.assertTrue(
            "Coffee" in en_text or "Coffea arabica" in en_text,
            "English exposé missing Coffee matrix (*Coffea arabica*)."
        )
        self.assertTrue(
            "Honey" in en_text or "Apis mellifera" in en_text,
            "English exposé missing Honey matrix (*Apis mellifera*)."
        )
        self.assertTrue(
            "Coconut Oil" in en_text or "Cocos nucifera" in en_text,
            "English exposé missing Virgin Coconut Oil matrix (*Cocos nucifera*)."
        )

        # Spanish matrix checks
        self.assertTrue(
            "Cacao" in es_text or "Theobroma cacao" in es_text,
            "Spanish exposé missing Cocoa matrix (*Theobroma cacao*)."
        )
        self.assertTrue(
            "Café" in es_text or "Coffea arabica" in es_text,
            "Spanish exposé missing Coffee matrix (*Coffea arabica*)."
        )
        self.assertTrue(
            "Miel" in es_text or "Apis mellifera" in es_text,
            "Spanish exposé missing Honey matrix (*Apis mellifera*)."
        )
        self.assertTrue(
            "Aceite de coco" in es_text or "Cocos nucifera" in es_text,
            "Spanish exposé missing Virgin Coconut Oil matrix (*Cocos nucifera*)."
        )

    def test_three_tier_factorial_ai_space_coverage(self):
        """Tier 5.2: Assert 3-tier AI exploration space (Encoders x Backbones x Regularization)."""
        de_text = self._get_document_text("expose_de")
        en_text = self._get_document_text("expose_en")
        es_text = self._get_document_text("expose_es")

        for txt, lang in [(de_text, "German"), (en_text, "English"), (es_text, "Spanish")]:
            # Encoders
            self.assertTrue(
                "1D-CNN" in txt or "CNN" in txt,
                f"{lang} exposé missing 1D-CNN spectral encoder."
            )
            self.assertTrue(
                "Transformer" in txt,
                f"{lang} exposé missing Spectral Transformer encoder."
            )
            # Backbones
            self.assertTrue(
                "LSTM" in txt,
                f"{lang} exposé missing LSTM temporal backbone."
            )
            self.assertTrue(
                "Mamba" in txt,
                f"{lang} exposé missing Mamba state space model."
            )
            # Regularization
            self.assertTrue(
                "PINN" in txt or "Physics-Informed" in txt or "Physik-informiert" in txt or "físicos" in txt,
                f"{lang} exposé missing PINN formulation."
            )
            self.assertTrue(
                "Neural ODE" in txt or "Differentialgleichung" in txt or "NODE" in txt or "diferenciales" in txt,
                f"{lang} exposé missing Neural ODE formulation."
            )

    def test_aoac_analytical_reference_methods(self):
        """Tier 5.3: Assert standardized analytical ground truth assays (AOAC 965.33, AOAC 980.23)."""
        de_text = self._get_document_text("expose_de")
        en_text = self._get_document_text("expose_en")
        es_text = self._get_document_text("expose_es")

        for txt, lang in [(de_text, "German"), (en_text, "English"), (es_text, "Spanish")]:
            self.assertTrue(
                "965.33" in txt or "Peroxidzahl" in txt or "Peroxide" in txt or "peróxido" in txt,
                f"{lang} exposé missing AOAC 965.33 peroxide value reference assay."
            )
            self.assertTrue(
                "980.23" in txt or "HMF" in txt or "5-HMF" in txt,
                f"{lang} exposé missing AOAC 980.23 5-HMF reference assay."
            )
            self.assertTrue(
                "Folin" in txt,
                f"{lang} exposé missing Folin-Ciocalteu total polyphenols assay."
            )

    def test_edge_computing_raspberry_pi_constraints(self):
        """Tier 5.4: Assert edge AI deployment constraints on Raspberry Pi hardware."""
        de_text = self._get_document_text("expose_de")
        en_text = self._get_document_text("expose_en")
        es_text = self._get_document_text("expose_es")

        for txt, lang in [(en_text, "English")]:
            self.assertTrue(
                "Raspberry Pi" in txt or "Edge" in txt,
                f"{lang} exposé missing Raspberry Pi edge deployment feasibility analysis."
            )

    def test_baylat_budget_ceiling_compliance(self):
        """Tier 5.5: Assert strict compliance with BAYLAT 8.000 EUR maximum funding ceiling."""
        import openpyxl
        excel_path = WORKSPACE_DIR / "06_Reiseverwaltung_Kostenkalkulation_Anschubfinanzierung.xlsx"
        self.assertTrue(excel_path.exists(), "Budget Excel file missing.")
        
        wb = openpyxl.load_workbook(excel_path, data_only=True)
        # Check Deckblatt sum
        deck_val = wb["Deckblatt"]["C37"].value
        if deck_val is None:
            deck_val = sum(wb["Deckblatt"].cell(row=r, column=3).value for r in [25, 27, 29, 31, 33, 35])
        self.assertIn(deck_val, [7350, 8000], f"Deckblatt total {deck_val} must be 7350 or 8000 EUR.")
        self.assertLessEqual(deck_val, 8000, f"Deckblatt total {deck_val} exceeds 8000 EUR ceiling.")
        
        # Check Belegliste sum
        items_sum = sum(wb["Belegliste"].cell(row=r, column=7).value for r in range(13, 23) if wb["Belegliste"].cell(row=r, column=7).value)
        self.assertIn(items_sum, [7350, 8000], f"Belegliste sum {items_sum} must be 7350 or 8000 EUR.")
        self.assertLessEqual(items_sum, 8000, f"Belegliste sum {items_sum} exceeds 8000 EUR ceiling.")

        # Check all typ files for absence of 8.610
        for doc_key in ["formulario", "expose_de", "expose_en", "expose_es"]:
            txt = self._get_document_text(doc_key)
            self.assertNotIn("8.610", txt, f"{doc_key} contains deprecated budget 8.610.")
            self.assertNotIn("8,610", txt, f"{doc_key} contains deprecated budget 8,610.")
            self.assertTrue(
                "8.000" in txt or "8,000" in txt or "7.350" in txt or "7,350" in txt,
                f"{doc_key} does not state a valid budget ceiling or total."
            )


# ============================================================================
# Standalone CLI Test Runner with Tiered Diagnostics
# ============================================================================

def run_suite(selected_tier: Optional[int] = None) -> bool:
    """Run test suite with structured tiered formatting and summary statistics."""
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()

    tier_map = {
        1: (TestTier1Compilation, "Tier 1: Compilation & Exit Code Verification"),
        2: (TestTier2CharacterLimits, "Tier 2: Boundary & Character Count Constraints"),
        3: (TestTier3CitationsAndTemplate, "Tier 3: Citation Keys & Template Structural Integrity"),
        4: (TestTier4PdfArtifacts, "Tier 4: PDF Artifact Validation (> 50 KB)"),
        5: (TestTier5DomainConsistency, "Tier 5: Domain & Scientific Specification Consistency"),
    }

    print("=" * 80)
    print(" BAYLAT OASys E2E TEST SUITE RUNNER")
    print(f" Workspace: {WORKSPACE_DIR}")
    print("=" * 80)

    selected_tiers = [selected_tier] if selected_tier in tier_map else list(tier_map.keys())

    for t in selected_tiers:
        cls, desc = tier_map[t]
        suite.addTests(loader.loadTestsFromTestCase(cls))

    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)

    print("\n" + "=" * 80)
    print(" TEST SUITE SUMMARY")
    print("=" * 80)
    print(f" Total Tests Run: {result.testsRun}")
    print(f" Passed:          {result.testsRun - len(result.failures) - len(result.errors)}")
    print(f" Failures:        {len(result.failures)}")
    print(f" Errors:          {len(result.errors)}")
    print("=" * 80)

    return result.wasSuccessful()


if __name__ == "__main__":
    tier_arg = None
    if len(sys.argv) > 1 and sys.argv[1].startswith("--tier="):
        tier_arg = int(sys.argv[1].split("=")[1])
    elif len(sys.argv) > 2 and sys.argv[1] == "--tier":
        tier_arg = int(sys.argv[2])

    success = run_suite(tier_arg)
    sys.exit(0 if success else 1)
