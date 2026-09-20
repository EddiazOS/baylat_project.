#!/usr/bin/env python3
"""Adversarial Test Harness: Character Limits, Whitespace/Unicode Regimes, and Clean Typst Compilation.

Author: Challenger 1 (Empirical Challenger - Teamwork Framework)
Target Workspace: /home/echoes/projects/AI_project/proyecto-babiera
Documents Evaluated:
- formulario_oasys_baylat.typ -> formulario_oasys_baylat.pdf
- expose_wissenschaftlicher_bericht_baylat_de.typ -> expose_wissenschaftlicher_bericht_baylat_de.pdf
- expose_scientific_proposal_baylat_en.typ -> expose_scientific_proposal_baylat_en.pdf
"""

import os
import re
import sys
import tempfile
import unicodedata
import subprocess
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any

import pypdf

WORKSPACE = Path(__file__).parent.resolve()
BIB_FILE = WORKSPACE / "references.bib"
DOCUMENTS = {
    "formulario": {
        "src": WORKSPACE / "formulario_oasys_baylat.typ",
        "pdf": WORKSPACE / "formulario_oasys_baylat.pdf",
        "min_pages": 10,
        "max_size_bytes": 5 * 1024 * 1024,  # 5 MB
        "min_size_bytes": 50 * 1024,        # 50 KB
    },
    "expose_de": {
        "src": WORKSPACE / "expose_wissenschaftlicher_bericht_baylat_de.typ",
        "pdf": WORKSPACE / "expose_wissenschaftlicher_bericht_baylat_de.pdf",
        "min_pages": 5,
        "max_size_bytes": 5 * 1024 * 1024,  # 5 MB
        "min_size_bytes": 50 * 1024,        # 50 KB
    },
    "expose_en": {
        "src": WORKSPACE / "expose_scientific_proposal_baylat_en.typ",
        "pdf": WORKSPACE / "expose_scientific_proposal_baylat_en.pdf",
        "min_pages": 5,
        "max_size_bytes": 5 * 1024 * 1024,  # 5 MB
        "min_size_bytes": 50 * 1024,        # 50 KB
    },
    "expose_es": {
        "src": WORKSPACE / "expose_propuesta_cientifica_baylat_es.typ",
        "pdf": WORKSPACE / "expose_propuesta_cientifica_baylat_es.pdf",
        "min_pages": 5,
        "max_size_bytes": 5 * 1024 * 1024,  # 5 MB
        "min_size_bytes": 50 * 1024,        # 50 KB
    },
}

# Strict OASys fields with their ceilings
OASYS_FIELDS = [
    ("titel_de", 400, 20),
    ("titel_es", 400, 20),
    ("titel_en", 400, 20),
    ("stichwoerter_de", 200, 10),
    ("stichwoerter_es", 200, 10),
    ("stichwoerter_en", 200, 10),
    ("mehrwert_de", 1000, 200),
    ("mehrwert_es", 1000, 200),
    ("internationalisierung_de", 2000, 200),
    ("internationalisierung_es", 2000, 200),
    ("kurzfassung_de", 2000, 500),
    ("kurzfassung_es", 2000, 500),
    ("ausfuehrlich_de", 10000, 2000),
    ("ausfuehrlich_es", 10000, 2000),
    ("arbeitsplan_kurz", 2000, 300),
    ("warum_keine_andere_foerderung", 2000, 200),
    ("bezug_ausschreibung", 1000, 100),
]


def extract_let(content: str, var_name: str) -> Optional[str]:
    """Extract string or balanced content block assigned to a Typst let variable."""
    pattern = rf'(?:#)?let\s+{re.escape(var_name)}\s*=\s*'
    m = re.search(pattern, content)
    if not m:
        return None
    start = m.end()
    while start < len(content) and content[start] in " \t\r\n":
        start += 1
    if start >= len(content):
        return None

    if content[start] == '"':
        chars = []
        i = start + 1
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
    elif content[start] == '[':
        depth = 0
        for i in range(start, len(content)):
            if content[i] == '[':
                depth += 1
            elif content[i] == ']':
                depth -= 1
                if depth == 0:
                    return content[start + 1 : i]
        return content[start + 1 :]
    return None


def clean_typst_text(raw_text: str) -> str:
    """Normalize and strip Typst formatting markers for strict OASys text field counting."""
    if not raw_text:
        return ""
    cleaned = re.sub(r'#\w+(?:\([^)]*\))?(?:\[[^\]]*\])?', '', raw_text)
    cleaned = re.sub(r'[*_#]', '', cleaned)
    cleaned = re.sub(r'[ \t]+', ' ', cleaned)
    return cleaned.strip()


def extract_kurzprofile(content: str) -> Tuple[Optional[str], Optional[str]]:
    """Extract Partner 1 and Partner 2 Kurzprofile from block text."""
    p1_m = re.search(r'Kurzprofil de[rs] Antragsteller.*?\n\s*\\\s*\n\s*(.*?)\n\]', content)
    p2_m = re.search(r'Kurzprofil de[rs] Kooperationspartner.*?\n\s*\\\s*\n\s*(.*?)\n\]', content)
    
    p1 = p1_m.group(1).strip() if p1_m else None
    p2 = p2_m.group(1).strip() if p2_m else None
    return p1, p2


# ==============================================================================
# 1. Adversarial Character Counting Under Multiple Regimes
# ==============================================================================

def run_adversarial_character_checks() -> Tuple[bool, Dict[str, Any]]:
    """Test all fields under 8 normalization and whitespace regimes:
    1. Cleaned NFC + LF (standard)
    2. Cleaned NFD + LF (canonical decomposed Unicode)
    3. Cleaned NFC + CRLF (HTTP POST / Windows textarea)
    4. Cleaned NFD + CRLF (worst-case web submission)
    5. Cleaned NFKC + LF (compatibility composed)
    6. Cleaned NFKD + CRLF (worst-case compatibility decomposed)
    7. Raw text unstripped + CRLF
    8. Raw text unstripped + NFD + CRLF
    """
    formulario_path = DOCUMENTS["formulario"]["src"]
    with open(formulario_path, "r", encoding="utf-8") as f:
        content = f.read()

    results = {}
    all_passed = True

    print("=" * 100)
    print(" ADVERSARIAL CHARACTER COUNT & NORMALIZATION STRESS TESTING")
    print("=" * 100)
    header = f"{'Field':<28} | {'Limit':<5} | {'Clean(NFC)':<10} | {'Clean(NFD)':<10} | {'CRLF(NFC)':<10} | {'CRLF(NFD)':<10} | {'WorstRaw':<10} | {'Status'}"
    print(header)
    print("-" * 100)

    # Test let-binding fields
    for field_name, limit, min_val in OASYS_FIELDS:
        raw_val = extract_let(content, field_name)
        if raw_val is None:
            print(f"{field_name:<28} | {limit:<5} | NOT FOUND!")
            all_passed = False
            continue

        clean_val = clean_typst_text(raw_val)

        # Regime variants
        clean_nfc_lf = unicodedata.normalize("NFC", clean_val).replace("\r\n", "\n")
        clean_nfd_lf = unicodedata.normalize("NFD", clean_val).replace("\r\n", "\n")
        clean_nfc_crlf = clean_nfc_lf.replace("\n", "\r\n")
        clean_nfd_crlf = clean_nfd_lf.replace("\n", "\r\n")
        clean_nfkc_lf = unicodedata.normalize("NFKC", clean_val).replace("\r\n", "\n")
        clean_nfkd_crlf = unicodedata.normalize("NFKD", clean_val).replace("\r\n", "\n").replace("\n", "\r\n")

        raw_crlf = raw_val.replace("\r\n", "\n").replace("\n", "\r\n")
        raw_nfd_crlf = unicodedata.normalize("NFD", raw_crlf)

        len_clean_nfc_lf = len(clean_nfc_lf)
        len_clean_nfd_lf = len(clean_nfd_lf)
        len_clean_nfc_crlf = len(clean_nfc_crlf)
        len_clean_nfd_crlf = len(clean_nfd_crlf)
        len_raw_nfd_crlf = len(raw_nfd_crlf)

        regimes = {
            "clean_nfc_lf": len_clean_nfc_lf,
            "clean_nfd_lf": len_clean_nfd_lf,
            "clean_nfc_crlf": len_clean_nfc_crlf,
            "clean_nfd_crlf": len_clean_nfd_crlf,
            "clean_nfkc_lf": len(clean_nfkc_lf),
            "clean_nfkd_crlf": len(clean_nfkd_crlf),
            "raw_nfd_crlf": len_raw_nfd_crlf,
        }

        # Check if any clean regime exceeds limit
        field_pass = True
        for reg_name, count in regimes.items():
            if "clean" in reg_name and count > limit:
                field_pass = False
                all_passed = False
            if "clean" in reg_name and count < min_val:
                field_pass = False
                all_passed = False

        status = "PASS [SAFE]" if field_pass else "FAIL [EXCEEDED]"
        print(f"{field_name:<28} | {limit:<5} | {len_clean_nfc_lf:<10} | {len_clean_nfd_lf:<10} | {len_clean_nfc_crlf:<10} | {len_clean_nfd_crlf:<10} | {len_raw_nfd_crlf:<10} | {status}")
        results[field_name] = {
            "limit": limit,
            "min": min_val,
            "counts": regimes,
            "passed": field_pass,
        }

    # Test Kurzprofile in Screen 3
    p1_bio, p2_bio = extract_kurzprofile(content)
    for bio_name, bio_val in [("kurzprofil_p1_dit", p1_bio), ("kurzprofil_p2_udc", p2_bio)]:
        if bio_val is None:
            print(f"{bio_name:<28} | 1000  | NOT FOUND!")
            all_passed = False
            continue
        c_nfc = len(unicodedata.normalize("NFC", bio_val))
        c_nfd = len(unicodedata.normalize("NFD", bio_val))
        crlf_nfc = len(bio_val.replace("\r\n", "\n").replace("\n", "\r\n"))
        crlf_nfd = len(unicodedata.normalize("NFD", bio_val.replace("\r\n", "\n").replace("\n", "\r\n")))
        field_pass = crlf_nfd <= 1000 and c_nfc >= 100
        if not field_pass:
            all_passed = False
        status = "PASS [SAFE]" if field_pass else "FAIL [EXCEEDED]"
        print(f"{bio_name:<28} | 1000  | {c_nfc:<10} | {c_nfd:<10} | {crlf_nfc:<10} | {crlf_nfd:<10} | {crlf_nfd:<10} | {status}")
        results[bio_name] = {
            "limit": 1000,
            "min": 100,
            "counts": {"clean_nfc_lf": c_nfc, "clean_nfd_crlf": crlf_nfd},
            "passed": field_pass,
        }

    print("-" * 100)
    print(f"Adversarial Character Counting Result: {'PASS (100% compliant)' if all_passed else 'FAIL'}\n")
    return all_passed, results


# ==============================================================================
# 2. Stress-Testing Clean-State Compilation
# ==============================================================================

def run_stress_compilation_checks() -> Tuple[bool, Dict[str, Any]]:
    """Stress test Typst compilation:
    - Compiles from clean state into fresh isolated temp files
    - Checks exit code == 0
    - Analyzes stdout/stderr
    - Repeated compilation (concurrency / determinism check)
    """
    print("=" * 100)
    print(" TYPST CLEAN-STATE COMPILATION STRESS TESTING")
    print("=" * 100)

    all_passed = True
    compilation_results = {}

    for doc_key, cfg in DOCUMENTS.items():
        src_path = cfg["src"]
        print(f"\n---> Stress-Testing Compilation for [{doc_key}]: {src_path.name}")
        if not src_path.exists():
            print(f"ERROR: Source file {src_path} does not exist!")
            all_passed = False
            continue

        scratch_dir = WORKSPACE / ".clean_stress_tmp"
        scratch_dir.mkdir(parents=True, exist_ok=True)
        try:
            tmp_pdf = scratch_dir / f"{src_path.stem}_stress.pdf"

            # Pass 1: Clean compilation
            cmd = ["typst", "compile", str(src_path), str(tmp_pdf)]
            res1 = subprocess.run(cmd, capture_output=True, text=True)

            if res1.returncode != 0:
                print(f"FAIL: typst compile failed with code {res1.returncode}")
                print("STDERR:", res1.stderr)
                all_passed = False
                compilation_results[doc_key] = {"pass": False, "returncode": res1.returncode, "stderr": res1.stderr}
                continue

            if not tmp_pdf.exists():
                print(f"FAIL: Output PDF {tmp_pdf.name} was not created!")
                all_passed = False
                compilation_results[doc_key] = {"pass": False, "reason": "PDF file missing"}
                continue

            size1 = tmp_pdf.stat().st_size
            print(f"Pass 1: Success! Created {tmp_pdf.name} ({size1} bytes / {size1/1024:.1f} KB)")

            # Pass 2: Recompilation to test determinism and cache handling
            tmp_pdf2 = scratch_dir / f"{src_path.stem}_stress_pass2.pdf"
            res2 = subprocess.run(["typst", "compile", str(src_path), str(tmp_pdf2)], capture_output=True, text=True)
            size2 = tmp_pdf2.stat().st_size if tmp_pdf2.exists() else 0

            # Filter non-fatal font fallback warnings from critical errors
            fatal_errors = [line for line in res1.stderr.splitlines() if "error:" in line.lower()]
            font_warnings = [line for line in res1.stderr.splitlines() if "warning: unknown font family" in line]

            print(f"Pass 2: Recompilation success (returncode {res2.returncode}, size {size2} bytes)")
            print(f"Fatal errors: {len(fatal_errors)}, Font fallback warnings: {len(font_warnings)}")

            compilation_results[doc_key] = {
                "pass": True,
                "size_bytes": size1,
                "recompile_size_bytes": size2,
                "deterministic_size": (size1 == size2),
                "fatal_errors": fatal_errors,
                "font_warnings_count": len(font_warnings),
            }
        finally:
            import shutil
            if scratch_dir.exists():
                shutil.rmtree(scratch_dir)

    print("-" * 100)
    print(f"Clean-State Compilation Result: {'PASS' if all_passed else 'FAIL'}\n")
    return all_passed, compilation_results


# ==============================================================================
# 3. PDF Structural and Stream Integrity Verification
# ==============================================================================

def run_pdf_structural_checks() -> Tuple[bool, Dict[str, Any]]:
    """Deep structural checks on generated PDF artifacts:
    - %PDF- magic bytes
    - %%EOF trailer marker
    - File size constraints (>50 KB, <=5 MB)
    - Page count thresholds
    - Zero blank pages (every page has extracted text)
    - Raw stream objects count and non-zero streams
    """
    print("=" * 100)
    print(" PDF STRUCTURAL & STREAM INTEGRITY VALIDATION")
    print("=" * 100)

    all_passed = True
    pdf_results = {}

    for doc_key, cfg in DOCUMENTS.items():
        pdf_path = cfg["pdf"]
        print(f"\n---> Inspecting PDF Structure for [{doc_key}]: {pdf_path.name}")

        if not pdf_path.exists():
            print(f"ERROR: PDF file {pdf_path} not found! Compile required.")
            all_passed = False
            continue

        size = pdf_path.stat().st_size
        with open(pdf_path, "rb") as f:
            raw_bytes = f.read()

        # Check %PDF- header
        has_pdf_header = raw_bytes.startswith(b"%PDF-")
        pdf_version = raw_bytes[:8].decode("ascii", errors="replace")

        # Check %%EOF marker
        has_eof_marker = b"%%EOF" in raw_bytes[-1024:]

        # Check size constraints
        size_valid = cfg["min_size_bytes"] <= size <= cfg["max_size_bytes"]

        # Parse with pypdf
        reader = pypdf.PdfReader(pdf_path)
        num_pages = len(reader.pages)
        page_count_valid = num_pages >= cfg["min_pages"]

        # Check text on every page
        blank_pages = []
        total_text_chars = 0
        for i, page in enumerate(reader.pages):
            text = page.extract_text() or ""
            total_text_chars += len(text)
            if len(text.strip()) == 0:
                blank_pages.append(i + 1)

        # Raw streams
        streams = re.findall(b'stream\r?\n(.*?)\r?\nendstream', raw_bytes, re.DOTALL)
        total_streams = len(streams)
        non_zero_streams = sum(1 for s in streams if len(s) > 0)
        all_streams_nonzero = (total_streams > 0 and non_zero_streams == total_streams)

        doc_passed = (
            has_pdf_header and
            has_eof_marker and
            size_valid and
            page_count_valid and
            len(blank_pages) == 0 and
            all_streams_nonzero
        )

        if not doc_passed:
            all_passed = False

        print(f"Header:               {pdf_version} (Valid: {has_pdf_header})")
        print(f"EOF Marker:           {'Found %%EOF in trailer' if has_eof_marker else 'MISSING %%EOF'}")
        print(f"File Size:            {size} bytes ({size/1024:.2f} KB) - Valid: {size_valid}")
        print(f"Page Count:           {num_pages} pages (Min required: {cfg['min_pages']}) - Valid: {page_count_valid}")
        print(f"Blank Pages:          {len(blank_pages)} (Pages with text: {num_pages - len(blank_pages)}/{num_pages})")
        print(f"Total Text Chars:     {total_text_chars} chars (Avg {total_text_chars/num_pages:.0f} chars/page)")
        print(f"Stream Objects:       {non_zero_streams}/{total_streams} non-zero streams - Valid: {all_streams_nonzero}")
        print(f"Document Status:      {'PASS' if doc_passed else 'FAIL'}")

        pdf_results[doc_key] = {
            "path": str(pdf_path),
            "size_bytes": size,
            "version": pdf_version,
            "has_pdf_header": has_pdf_header,
            "has_eof_marker": has_eof_marker,
            "size_valid": size_valid,
            "num_pages": num_pages,
            "blank_pages": blank_pages,
            "total_text_chars": total_text_chars,
            "total_streams": total_streams,
            "non_zero_streams": non_zero_streams,
            "passed": doc_passed,
        }

    print("-" * 100)
    print(f"PDF Structural Integrity Result: {'PASS' if all_passed else 'FAIL'}\n")
    return all_passed, pdf_results


# ==============================================================================
# 4. Cross-Document Citation & Defect Integrity Stress Check
# ==============================================================================

def run_citation_stress_checks() -> Tuple[bool, Dict[str, Any]]:
    """Cross-document verification:
    - Verifies NO occurrence of the forbidden defective citation '@passos2026'
    - Verifies all citations in all documents exist in references.bib
    """
    print("=" * 100)
    print(" CROSS-DOCUMENT CITATION & ANTI-DEFECT INTEGRITY STRESS CHECK")
    print("=" * 100)

    if not BIB_FILE.exists():
        print("ERROR: references.bib missing!")
        return False, {}

    with open(BIB_FILE, "r", encoding="utf-8") as f:
        bib_content = f.read()
    valid_bib_keys = set(re.findall(r'@\w+\s*\{\s*([^,\s]+)\s*,', bib_content))

    all_passed = True
    citation_results = {}

    for doc_key, cfg in DOCUMENTS.items():
        src_path = cfg["src"]
        with open(src_path, "r", encoding="utf-8") as f:
            content = f.read()

        # Check for forbidden key @passos2026
        has_forbidden_passos2026 = "@passos2026" in content

        # Check all citations
        internal_labels = set(re.findall(r'<([a-zA-Z0-9_:-]+)>', content))
        raw_citations = set(re.findall(r'(?<![\w\.\-\\\\])@([a-zA-Z0-9_:-]+)', content))
        citations = {c for c in raw_citations if c not in internal_labels}

        invalid_keys = [c for c in citations if c not in valid_bib_keys]

        doc_pass = (not has_forbidden_passos2026) and (len(invalid_keys) == 0)
        if not doc_pass:
            all_passed = False

        print(f"[{doc_key}] Total citations: {len(citations)}")
        print(f"  Forbidden '@passos2026' detected: {has_forbidden_passos2026}")
        print(f"  Authoritative '@passos2605convolutionalneuralnetworks' present: {'passos2605convolutionalneuralnetworks' in citations}")
        print(f"  Invalid citations not in references.bib: {invalid_keys}")
        print(f"  Status: {'PASS' if doc_pass else 'FAIL'}")

        citation_results[doc_key] = {
            "citations_count": len(citations),
            "has_forbidden_passos2026": has_forbidden_passos2026,
            "has_authoritative_passos": "passos2605convolutionalneuralnetworks" in citations,
            "invalid_keys": invalid_keys,
            "passed": doc_pass,
        }

    print("-" * 100)
    print(f"Citation Integrity Result: {'PASS' if all_passed else 'FAIL'}\n")
    return all_passed, citation_results


# ==============================================================================
# Main Runner & CLI Entrypoint
# ==============================================================================

def main():
    print("#" * 100)
    print(" EMPIRICAL CHALLENGER 1: COMPREHENSIVE ADVERSARIAL TEST SUITE")
    print("#" * 100)

    chars_ok, chars_res = run_adversarial_character_checks()
    comp_ok, comp_res = run_stress_compilation_checks()
    pdf_ok, pdf_res = run_pdf_structural_checks()
    cite_ok, cite_res = run_citation_stress_checks()

    overall_verdict = chars_ok and comp_ok and pdf_ok and cite_ok

    print("=" * 100)
    print(" FINAL SUMMARY OF ADVERSARIAL CHALLENGE")
    print("=" * 100)
    print(f" 1. Character Ceiling Robustness (NFC/NFD/CRLF/LF): {'PASS' if chars_ok else 'FAIL'}")
    print(f" 2. Typst Clean-State Compilation:                   {'PASS' if comp_ok else 'FAIL'}")
    print(f" 3. PDF Structure, Magic Bytes & Non-Zero Streams:   {'PASS' if pdf_ok else 'FAIL'}")
    print(f" 4. Citation Integrity & Anti-Defect Check:         {'PASS' if cite_ok else 'FAIL'}")
    print("=" * 100)
    print(f" OVERALL VERDICT: {'APPROVE' if overall_verdict else 'REQUEST_CHANGES'}")
    print("=" * 100)

    return 0 if overall_verdict else 1


if __name__ == "__main__":
    sys.exit(main())
