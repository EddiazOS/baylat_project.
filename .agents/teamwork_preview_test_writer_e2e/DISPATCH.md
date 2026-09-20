# Dispatch: E2E Testing Track - Test Suite & Verification Harness

**Target Workspace**: `/home/echoes/projects/AI_project/proyecto-babiera`
**Authoritative Request**: `/home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md`
**Agent Directory**: `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_test_writer_e2e`

## Mission
You are the Test Writer (`teamwork_preview_test_writer`).
Your mission is to design and implement the complete, opaque-box E2E test suite in Python (`test_baylat_suite.py`) and write `TEST_INFRA.md` and `TEST_READY.md` at the project root (`/home/echoes/projects/AI_project/proyecto-babiera`).

Read:
- `/home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md`
- `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_orchestrator_1/PROJECT.md`
- `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/handoff.md`

File Ownership:
- You exclusively own: `test_baylat_suite.py`, `TEST_INFRA.md`, and `TEST_READY.md`.
- DO NOT modify `.typ` source files.

Key Requirements for `test_baylat_suite.py`:
1. **Tier 1 - Compilation & PDF Generation**:
   - Compiles `formulario_oasys_baylat.typ`, `expose_wissenschaftlicher_bericht_baylat_de.typ`, and `expose_scientific_proposal_baylat_en.typ` via `typst compile`.
   - Asserts exit code == 0 for all 3.
   - Asserts that output PDF files exist.
2. **Tier 2 - Boundary & Character Count Constraints**:
   - Tests `formulario_oasys_baylat.typ` character limits:
     * Kurzfassung DE <= 2,000 chars (with spaces)
     * Kurzfassung ES <= 2,000 chars (with spaces)
     * Ausführliche Projektbeschreibung DE <= 10,000 chars (with spaces)
     * Ausführliche Projektbeschreibung ES <= 10,000 chars (with spaces)
     * Mehrwert des Projektpartners DE <= 1,000 chars (with spaces)
     * Mehrwert des Projektpartners ES <= 1,000 chars (with spaces)
     * Internationalisierungsstrategie DE/ES <= 2,000 chars (with spaces)
     * Kurzer Arbeitsplan <= 2,000 chars (with spaces)
3. **Tier 3 - Citation Integrity & Template Elements**:
   - Parses each `.typ` file for `@...` citations and verifies that all citation keys exist in `references.bib`.
   - Specifically flags any invalid citation like `@passos2026` (must be `@passos2605convolutionalneuralnetworks`).
   - Verifies `#project` call with required fields, `#callout` usage, and `#bibliography("references.bib")`.
4. **Tier 4 - PDF Artifact Validation**:
   - Verifies each PDF is a valid PDF (starts with `%PDF-`).
   - Verifies each PDF has file size > 50 KB (51,200 bytes).

Outputs:
- Write `test_baylat_suite.py` executable via `python3 test_baylat_suite.py`.
- Write `TEST_INFRA.md` documenting test architecture and coverage.
- Write `TEST_READY.md` summarizing test tiers and runner command.
- Write your handoff report to `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_test_writer_e2e/handoff.md`.

## 2026-09-17T18:37:46Z
You are the E2E Test Writer. Your working directory is /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_test_writer_e2e.
Read:
- /home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md
- /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_test_writer_e2e/DISPATCH.md
- /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_orchestrator_1/PROJECT.md
- /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/handoff.md

Implement the complete E2E test suite:
1. Create /home/echoes/projects/AI_project/proyecto-babiera/test_baylat_suite.py covering:
   - Tier 1: Compilation test for all 3 documents (formulario_oasys_baylat.typ, expose_wissenschaftlicher_bericht_baylat_de.typ, expose_scientific_proposal_baylat_en.typ)
   - Tier 2: Boundary & character count limits (Kurzfassung DE/ES <= 2,000; Ausführliche Beschreibung DE/ES <= 10,000; Mehrwert DE/ES <= 1,000; Arbeitsplan <= 2,000)
   - Tier 3: Citation keys check against references.bib (assert all cited keys exist, assert @passos2026 is NOT used) and template elements (#project, #callout, #bibliography)
   - Tier 4: PDF artifacts exist and size > 50 KB (51,200 bytes)
2. Create /home/echoes/projects/AI_project/proyecto-babiera/TEST_INFRA.md.
3. Create /home/echoes/projects/AI_project/proyecto-babiera/TEST_READY.md when tests are written.
Execute the test runner (python3 test_baylat_suite.py) to confirm it runs properly, and write your report to /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_test_writer_e2e/handoff.md. Report back via send_message.
