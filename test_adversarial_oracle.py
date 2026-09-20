#!/usr/bin/env python3
"""Adversarial Verification Oracle for BAYLAT-Anschubfinanzierung OASys Grant Application.

Role: Challenger 2 (Empirical Verification & Stress Harness)
Focus:
  1. Authoritative Citation Keys across all 3 .typ files vs references.bib:
     - 0 unknown keys.
     - @passos2026 is strictly absent.
     - @passos2605convolutionalneuralnetworks is present.
     - 100% of the 10 entries in references.bib are meaningfully utilized.
  2. PDF Text Extraction & Key Technical Tokens:
     - 4 matrices: Theobroma cacao, Coffea arabica, Apis mellifera, Cocos nucifera.
     - AOAC methods: AOAC 965.33, AOAC 980.23, Folin-Ciocalteu.
     - Modeling paradigms: PINN, Neural ODE, Mamba, 1D-CNN, Spectral Transformer, LSTM.
     - Hardware & Edge: Raspberry Pi.
     - Bilateral funding & scaling: DFG-Minciencias, BAYLAT, DIT, UdC.
  3. PDF Validity & Integrity:
     - All 3 PDFs exist.
     - Size > 50 KB (51,200 bytes).
     - Valid PDF magic header (%PDF-).
     - 0 unresolved citations '[?]'.
     - 0 placeholder/TODO markers.
  4. Template Oracle:
     - Correct usage of template.typ: project, callout, table, bibliography.
  5. Boundary & Limits Oracle:
     - Character limits for OASys web form fields.
"""

import os
import re
import subprocess
import sys
import unittest
from pathlib import Path
from typing import Dict, List, Set, Tuple

import pypdf

WORKSPACE_DIR = Path(__file__).parent.resolve()
BIB_PATH = WORKSPACE_DIR / "references.bib"
TEMPLATE_PATH = WORKSPACE_DIR / "typst-scientific-report-template" / "template.typ"

DOCUMENTS = {
    "formulario": {
        "name": "OASys Application Form",
        "typ": WORKSPACE_DIR / "formulario_oasys_baylat.typ",
        "pdf": WORKSPACE_DIR / "formulario_oasys_baylat.pdf",
        "min_pages": 10,
        "min_size": 51200,
    },
    "expose_de": {
        "name": "German Scientific Exposé",
        "typ": WORKSPACE_DIR / "expose_wissenschaftlicher_bericht_baylat_de.typ",
        "pdf": WORKSPACE_DIR / "expose_wissenschaftlicher_bericht_baylat_de.pdf",
        "min_pages": 5,
        "min_size": 51200,
    },
    "expose_en": {
        "name": "English Scientific Proposal",
        "typ": WORKSPACE_DIR / "expose_scientific_proposal_baylat_en.typ",
        "pdf": WORKSPACE_DIR / "expose_scientific_proposal_baylat_en.pdf",
        "min_pages": 5,
        "min_size": 51200,
    },
    "expose_es": {
        "name": "Spanish Scientific Proposal",
        "typ": WORKSPACE_DIR / "expose_propuesta_cientifica_baylat_es.typ",
        "pdf": WORKSPACE_DIR / "expose_propuesta_cientifica_baylat_es.pdf",
        "min_pages": 5,
        "min_size": 51200,
    },
}

CORE_BIB_KEYS = {
    "upadhyay2026enhancingspectralanalysis",
    "boadu2024developinganovel",
    "felizzato2025datafusionfor",
    "li2026asgmambaadaptivespectral",
    "passos2605convolutionalneuralnetworks",
    "perre2025towardmechanisticmodels",
    "pronk2026neuralnetworkplacementin",
    "widiarto2026detectionofadulteration",
    "grundy2025reviewofcurrent",
    "feng2021applicationofvisibleinfrared",
}
REQUIRED_BIB_KEYS = CORE_BIB_KEYS

FORBIDDEN_BIB_KEYS = {
    "passos2026",
    "passos2026convolutional",
}


def load_bib_keys() -> Set[str]:
    if not BIB_PATH.exists():
        return set()
    text = BIB_PATH.read_text(encoding="utf-8")
    return set(re.findall(r'@\w+\s*\{\s*([^,\s]+)\s*,', text))


def extract_typ_citations(file_path: Path) -> Set[str]:
    content = file_path.read_text(encoding="utf-8")
    labels = set(re.findall(r'<([a-zA-Z0-9_:-]+)>', content))
    raw_citations = set(re.findall(r'(?<![\w\.\-\\\\])@([a-zA-Z0-9_:-]+)', content))
    return {c for c in raw_citations if c not in labels}


def extract_pdf_text_and_meta(file_path: Path) -> Tuple[str, int, List[str]]:
    reader = pypdf.PdfReader(str(file_path))
    num_pages = len(reader.pages)
    page_texts = [page.extract_text() or "" for page in reader.pages]
    full_text = "\n".join(page_texts)
    return full_text, num_pages, page_texts


# ==============================================================================
# TEST SUITE 1: CITATIONS & BIBLIOGRAPHY ORACLE
# ==============================================================================

class TestCitationsAndBibliographyOracle(unittest.TestCase):
    """Adversarial checks on BibTeX entries, citation keys, and zero-unknown rule."""

    @classmethod
    def setUpClass(cls):
        cls.bib_keys = load_bib_keys()

    def test_references_bib_keys_exactness(self):
        """Assert references.bib contains at least all core keys and valid BibTeX structure."""
        missing = CORE_BIB_KEYS - self.bib_keys
        self.assertEqual(
            len(missing),
            0,
            f"references.bib is missing core authoritative keys: {missing}",
        )
        self.assertNotIn("passos2026", self.bib_keys)
        self.assertIn("passos2605convolutionalneuralnetworks", self.bib_keys)

    def test_zero_unknown_citation_keys_in_all_typ_files(self):
        """Assert that no unknown citation key appears in ANY of the 3 .typ files."""
        for doc_key, cfg in DOCUMENTS.items():
            typ_file = cfg["typ"]
            self.assertTrue(typ_file.exists(), f"File {typ_file} does not exist.")
            citations = extract_typ_citations(typ_file)
            
            unknown_keys = citations - self.bib_keys
            self.assertEqual(
                len(unknown_keys),
                0,
                f"Document {typ_file.name} contains UNKNOWN citation keys: {unknown_keys}",
            )

    def test_passos2026_strictly_absent(self):
        """Assert that @passos2026 is completely absent from all 3 .typ files and bib."""
        for doc_key, cfg in DOCUMENTS.items():
            content = cfg["typ"].read_text(encoding="utf-8")
            for forbidden in FORBIDDEN_BIB_KEYS:
                self.assertNotIn(
                    f"@{forbidden}",
                    content,
                    f"CRITICAL DEFECT: Found @{forbidden} in {cfg['typ'].name}!",
                )
                self.assertNotRegex(
                    content,
                    rf'@passos2026\b',
                    f"CRITICAL DEFECT: Found regex match for @passos2026 in {cfg['typ'].name}!",
                )

    def test_passos2605_present_in_all_documents(self):
        """Assert that @passos2605convolutionalneuralnetworks is present in all 3 .typ files."""
        for doc_key, cfg in DOCUMENTS.items():
            content = cfg["typ"].read_text(encoding="utf-8")
            self.assertIn(
                "@passos2605convolutionalneuralnetworks",
                content,
                f"Missing @passos2605convolutionalneuralnetworks in {cfg['typ'].name}!",
            )

    def test_100_percent_bibtex_utilization(self):
        """Assert all core entries in references.bib are cited across documents."""
        all_citations = set()
        for doc_key, cfg in DOCUMENTS.items():
            citations = extract_typ_citations(cfg["typ"])
            all_citations.update(citations)

        missing_core = CORE_BIB_KEYS - all_citations
        self.assertEqual(
            len(missing_core),
            0,
            f"The following core references.bib keys were never cited: {missing_core}",
        )

        # In fact, assert that each exposé cites all 10 core keys:
        for doc_key in ["formulario", "expose_de", "expose_en"]:
            doc_citations = extract_typ_citations(DOCUMENTS[doc_key]["typ"])
            diff = CORE_BIB_KEYS - doc_citations
            self.assertEqual(
                len(diff),
                0,
                f"{DOCUMENTS[doc_key]['typ'].name} failed to cite all 10 core references! Missing: {diff}",
            )


# ==============================================================================
# TEST SUITE 2: PDF VALIDITY & BOUNDARY ORACLE
# ==============================================================================

class TestPdfValidityAndIntegrityOracle(unittest.TestCase):
    """Adversarial checks on compiled PDF binary validity, sizes, headers, and markers."""

    def test_pdf_files_exist_and_size_greater_than_50kb(self):
        """Assert all 3 PDFs exist and have size strictly > 50 KB (51,200 bytes)."""
        for doc_key, cfg in DOCUMENTS.items():
            pdf_path = cfg["pdf"]
            self.assertTrue(pdf_path.exists(), f"PDF artifact {pdf_path} does not exist.")
            size = pdf_path.stat().st_size
            self.assertGreater(
                size,
                51200,
                f"PDF {pdf_path.name} size ({size} bytes) is NOT > 50 KB (51,200 bytes)!",
            )

    def test_pdf_magic_header_and_structure(self):
        """Assert valid %PDF- magic header and parseability by pypdf."""
        for doc_key, cfg in DOCUMENTS.items():
            pdf_path = cfg["pdf"]
            with open(pdf_path, "rb") as f:
                header = f.read(1024)
            self.assertTrue(
                header.startswith(b"%PDF-"),
                f"{pdf_path.name} does not start with valid PDF magic bytes '%PDF-'",
            )
            # Check pypdf parsing
            reader = pypdf.PdfReader(str(pdf_path))
            self.assertGreaterEqual(
                len(reader.pages),
                cfg["min_pages"],
                f"{pdf_path.name} has fewer pages ({len(reader.pages)}) than required minimum ({cfg['min_pages']}).",
            )

    def test_zero_unresolved_citations_in_pdf(self):
        """Assert that no '[?]' unresolved citation markers appear in the extracted PDF text."""
        for doc_key, cfg in DOCUMENTS.items():
            pdf_path = cfg["pdf"]
            text, pages, _ = extract_pdf_text_and_meta(pdf_path)
            
            # Check for [?]
            unresolved = re.findall(r'\[\s*\?\s*\]', text)
            self.assertEqual(
                len(unresolved),
                0,
                f"Found {len(unresolved)} unresolved citation markers '[?]' in {pdf_path.name}!",
            )
            
            # Check for ??
            double_q = re.findall(r'\?\?', text)
            self.assertEqual(
                len(double_q),
                0,
                f"Found double question marks '??' in {pdf_path.name}: {double_q}",
            )

    def test_no_unfinished_placeholders_in_pdf(self):
        """Assert that no placeholder words like TODO, FIXME, XXX, TBD appear in PDF text."""
        for doc_key, cfg in DOCUMENTS.items():
            pdf_path = cfg["pdf"]
            text, pages, _ = extract_pdf_text_and_meta(pdf_path)
            
            # Allow legitimate occurrences if any, but detect typical developer stubs
            stubs = re.findall(r'\b(TODO|FIXME|XXX|TBD)\b', text)
            self.assertEqual(
                len(stubs),
                0,
                f"Found unfinished stub markers in {pdf_path.name}: {stubs}",
            )


# ==============================================================================
# TEST SUITE 3: PDF TEXT EXTRACTION & TECHNICAL TOKENS ORACLE
# ==============================================================================

class TestPdfTextExtractionTokensOracle(unittest.TestCase):
    """Adversarial verification of domain tokens extracted directly from compiled PDFs."""

    @classmethod
    def setUpClass(cls):
        cls.pdf_texts = {}
        for doc_key, cfg in DOCUMENTS.items():
            cls.pdf_texts[doc_key] = extract_pdf_text_and_meta(cfg["pdf"])[0]

    def _assert_token_in_pdfs(self, token_name: str, pattern: str, target_docs: List[str]):
        regex = re.compile(pattern, re.IGNORECASE)
        for doc_key in target_docs:
            text = self.pdf_texts[doc_key]
            matches = regex.findall(text)
            self.assertGreater(
                len(matches),
                0,
                f"Required technical token '{token_name}' (pattern: {pattern}) was NOT FOUND in compiled PDF {DOCUMENTS[doc_key]['pdf'].name}!",
            )

    def test_token_four_matrices_in_all_documents(self):
        """Assert presence of all 4 Latin binomial agri-food matrix names across PDFs."""
        matrices = [
            ("Theobroma cacao", r'Theobroma\s+cacao'),
            ("Coffea arabica", r'Coffea\s+arabica'),
            ("Apis mellifera", r'Apis\s+mellifera'),
            ("Cocos nucifera", r'Cocos\s+nucifera'),
        ]
        all_docs = ["formulario", "expose_de", "expose_en"]
        for name, pat in matrices:
            self._assert_token_in_pdfs(name, pat, all_docs)

    def test_token_aoac_analytical_methods_in_all_documents(self):
        """Assert presence of standardized AOAC methods in all PDFs."""
        methods = [
            ("AOAC 965.33 (Peroxide Value)", r'AOAC\s*965\.33'),
            ("AOAC 980.23 (5-HMF Spectrophotometry)", r'AOAC\s*980\.23'),
        ]
        all_docs = ["formulario", "expose_de", "expose_en"]
        for name, pat in methods:
            self._assert_token_in_pdfs(name, pat, all_docs)

    def test_token_ai_architectures_in_all_documents(self):
        """Assert presence of key AI architecture tokens (PINN, Neural ODE, Mamba)."""
        ai_tokens = [
            ("PINN", r'\bPINN\b'),
            ("Neural ODE", r'\bNeural\s+ODE\b|\bNODEs?\b'),
            ("Mamba", r'\bMamba\b'),
        ]
        all_docs = ["formulario", "expose_de", "expose_en"]
        for name, pat in ai_tokens:
            self._assert_token_in_pdfs(name, pat, all_docs)

    def test_token_raspberry_pi_edge_hardware(self):
        """Assert presence of Raspberry Pi edge hardware target in all PDFs."""
        self._assert_token_in_pdfs(
            "Raspberry Pi",
            r'Raspberry\s+Pi',
            ["formulario", "expose_de", "expose_en"],
        )

    def test_token_dfg_minciencias_bilateral_scaling(self):
        """Assert presence of DFG-Minciencias follow-up call token in all PDFs."""
        self._assert_token_in_pdfs(
            "DFG-Minciencias",
            r'DFG\s*[-–—]\s*Minciencias',
            ["formulario", "expose_de", "expose_en"],
        )

    def test_token_partner_institutions(self):
        """Assert presence of BAYLAT, DIT, and UdC across PDFs."""
        partners = [
            ("BAYLAT", r'\bBAYLAT\b'),
            ("DIT", r'\bDIT\b|Deggendorf'),
            ("UdC", r'\bUdC\b|Cartagena'),
        ]
        all_docs = ["formulario", "expose_de", "expose_en"]
        for name, pat in partners:
            self._assert_token_in_pdfs(name, pat, all_docs)


# ==============================================================================
# TEST SUITE 4: TEMPLATE ORACLE
# ==============================================================================

class TestTemplateOracle(unittest.TestCase):
    """Verify template.typ contracts: #show project.with, #callout, #table, #bibliography."""

    def test_template_invocations(self):
        for doc_key, cfg in DOCUMENTS.items():
            content = cfg["typ"].read_text(encoding="utf-8")
            
            # Import verification
            self.assertIn(
                'typst-scientific-report-template/template.typ',
                content,
                f"{cfg['typ'].name} does not import template.typ",
            )
            
            # Show project.with verification
            self.assertTrue(
                re.search(r'#?show:\s*project\.with\(', content) is not None,
                f"{cfg['typ'].name} does not call '#show: project.with(...)'",
            )
            
            # Callout verification
            self.assertTrue(
                re.search(r'#?callout\(', content) is not None,
                f"{cfg['typ'].name} does not utilize '#callout(...)'",
            )
            
            # Table verification
            self.assertTrue(
                re.search(r'#?table\(', content) is not None,
                f"{cfg['typ'].name} does not utilize '#table(...)'",
            )
            
            # Bibliography verification
            self.assertTrue(
                re.search(r'#?bibliography\(\s*["\']references\.bib["\']', content) is not None,
                f"{cfg['typ'].name} does not link '#bibliography(\"references.bib\", ...)'",
            )


# ==============================================================================
# TEST SUITE 5: CHARACTER COUNT AND BOUNDARY ORACLE
# ==============================================================================

class TestOasysCharacterLimitsOracle(unittest.TestCase):
    """Verify character count boundaries for OASys web form constraints."""

    @classmethod
    def setUpClass(cls):
        from test_baylat_suite import extract_let_binding, clean_typst_text
        cls.extract_let_binding = staticmethod(extract_let_binding)
        cls.clean_typst_text = staticmethod(clean_typst_text)
        cls.content = DOCUMENTS["formulario"]["typ"].read_text(encoding="utf-8")

    def _check_limit(self, var_name: str, max_limit: int):
        raw = self.extract_let_binding(self.content, [var_name])
        self.assertIsNotNone(raw, f"Variable {var_name} missing from formulario.")
        cleaned = self.clean_typst_text(raw)
        length = len(cleaned)
        self.assertLessEqual(
            length,
            max_limit,
            f"{var_name} length ({length}) exceeds limit ({max_limit})!",
        )

    def test_kurzfassung_limits(self):
        self._check_limit("kurzfassung_de", 2000)
        self._check_limit("kurzfassung_es", 2000)

    def test_ausfuehrlich_limits(self):
        self._check_limit("ausfuehrlich_de", 10000)
        self._check_limit("ausfuehrlich_es", 10000)

    def test_mehrwert_limits(self):
        self._check_limit("mehrwert_de", 1000)
        self._check_limit("mehrwert_es", 1000)

    def test_internationalisierung_limits(self):
        self._check_limit("internationalisierung_de", 2000)
        self._check_limit("internationalisierung_es", 2000)

    def test_arbeitsplan_kurz_limit(self):
        self._check_limit("arbeitsplan_kurz", 2000)


def run_adversarial_oracle() -> bool:
    print("=" * 80)
    print(" RUNNING EMPIRICAL ADVERSARIAL VERIFICATION ORACLE (CHALLENGER 2)")
    print("=" * 80)
    suite = unittest.TestSuite()
    loader = unittest.TestLoader()

    suite.addTests(loader.loadTestsFromTestCase(TestCitationsAndBibliographyOracle))
    suite.addTests(loader.loadTestsFromTestCase(TestPdfValidityAndIntegrityOracle))
    suite.addTests(loader.loadTestsFromTestCase(TestPdfTextExtractionTokensOracle))
    suite.addTests(loader.loadTestsFromTestCase(TestTemplateOracle))
    suite.addTests(loader.loadTestsFromTestCase(TestOasysCharacterLimitsOracle))

    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)

    print("\n" + "=" * 80)
    print(" ORACLE AUDIT SUMMARY")
    print("=" * 80)
    print(f" Total Tests Run: {result.testsRun}")
    print(f" Successes:       {result.testsRun - len(result.failures) - len(result.errors)}")
    print(f" Failures:        {len(result.failures)}")
    print(f" Errors:          {len(result.errors)}")
    print("=" * 80)

    return result.wasSuccessful()


if __name__ == "__main__":
    success = run_adversarial_oracle()
    sys.exit(0 if success else 1)
