# Dispatch: Milestone 1 - Formulario Oficial OASys en Typst

**Target Workspace**: `/home/echoes/projects/AI_project/proyecto-babiera`
**Authoritative Request**: `/home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md`
**Agent Directory**: `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_worker_m1`

## Integrity Warning
DO NOT CHEAT. All implementations must be genuine. DO NOT hardcode test results, create dummy/facade implementations, or circumvent the intended task. A teamwork_preview_auditor will independently verify your work. Integrity violations WILL be detected and your work WILL be rejected.

## Mission
You are the Worker for Milestone 1 (`teamwork_preview_worker`).
Your mission is to author `formulario_oasys_baylat.typ` at `/home/echoes/projects/AI_project/proyecto-babiera/formulario_oasys_baylat.typ` and compile it to `formulario_oasys_baylat.pdf`.

Read:
- `/home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md`
- `/home/echoes/projects/AI_project/proyecto-babiera/GEMINI.md`
- `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_orchestrator_1/PROJECT.md`
- `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/handoff.md`
- `/home/echoes/projects/AI_project/proyecto-babiera/propuesta_cientifica_baylat_oasys.md`
- `/home/echoes/projects/AI_project/proyecto-babiera/typst-scientific-report-template/template.typ`

File Ownership:
- You exclusively own: `formulario_oasys_baylat.typ` and `formulario_oasys_baylat.pdf`.
- DO NOT edit any other `.typ` file.

Key Requirements:
1. **Template & Styling**:
   - Must import `#import "typst-scientific-report-template/template.typ": project, callout`.
   - Configure `#show: project.with(...)` with appropriate titles, bilingual authors (DIT / UdC), date "17 de septiembre de 2026", doc_id "OASYS-BAYLAT-2026-DIT-UDC".
   - Use `#callout` boxes to highlight OASys guidelines, character budgets, and platform requirements for each screen.
   - Use `#table(...)` with styled headers for bilingual fields, partner data, and 12-month work plan.
2. **OASys Form Fields & Structure**:
   - Section 1: Stammdaten / Project Metadata (Trilingual titles <= 400 chars, keywords <= 200 chars, ERC classification `PE6`, `PE4`, `LS9`).
   - Section 2: Partner Profile DIT (Partner 1, Bavaria) & Partner Profile UdC (Partner 2, Colombia) with Kurzprofil (<= 1,000 chars).
   - Section 3: Warum wurde(n) diese(r) Partner gewählt? (Mehrwert) in DE and ES. **CRITICAL**: The text designated for the OASys web form MUST strictly be <= 1,000 characters with spaces (use the condensed compliant versions from `spec_miner_survey_3/handoff.md`).
   - Section 4: Bezug zur Internationalisierungsstrategie (DE and ES, <= 2,000 chars).
   - Section 5: Kurzbeschreibung / Kurzfassung in DE and ES (strictly <= 2,000 characters with spaces each; use the verified texts from `propuesta_cientifica_baylat_oasys.md`).
   - Section 6: Ausführliche Projektbeschreibung in DE and ES (strictly <= 10,000 characters with spaces each; use the verified texts from `propuesta_cientifica_baylat_oasys.md`).
   - Section 7: Finanzierung & Anschubfinanzierung (Why seed funding is required <= 2,000 chars; DFG-Minciencias follow-up <= 1,000 chars).
   - Section 8: Organisation & Arbeitsplan (12 months, 4 WPs: WP1 Protocol harmonization & sensor setup; WP2 Accelerated aging & ATR-FTIR scanning; WP3 3-tier PIML modeling & Pareto optimization; WP4 Joint workshop, validation & DFG-Minciencias submission). Include concise text (<= 2,000 chars) for the OASys form field, plus a comprehensive visual table.
   - Section 9: Reiseverwaltung (Mobility plan: DIT to UdC Month 2; UdC to DIT Month 11) & Nachwuchswissenschaftler (BS/MS/PhD students).
   - Section 10: Dateiverwaltung & Checkliste (Checklist of required PDFs, declarations, postal submission protocol).
3. **Compilation & Verification**:
   - Compile via `typst compile formulario_oasys_baylat.typ formulario_oasys_baylat.pdf`.
   - Verify exit code == 0.
   - Verify generated PDF > 50 KB.
   - Verify character counts using Python.
   - Write your handoff report to `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_worker_m1/handoff.md`.

## 2026-09-17T18:37:46Z
You are the Worker for Milestone 1. Your working directory is /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_worker_m1.
Read:
- /home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md
- /home/echoes/projects/AI_project/proyecto-babiera/GEMINI.md
- /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_worker_m1/DISPATCH.md
- /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_orchestrator_1/PROJECT.md
- /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/handoff.md
- /home/echoes/projects/AI_project/proyecto-babiera/propuesta_cientifica_baylat_oasys.md
- /home/echoes/projects/AI_project/proyecto-babiera/typst-scientific-report-template/template.typ

DO NOT CHEAT. All implementations must be genuine. DO NOT hardcode test results, create dummy/facade implementations, or circumvent the intended task. A teamwork_preview_auditor will independently verify your work. Integrity violations WILL be detected and your work WILL be rejected.

Your exclusive files: formulario_oasys_baylat.typ and formulario_oasys_baylat.pdf.
Author the complete, publication-grade OASys form in Typst following all 10 screens from the 09/2026 Leitfaden. Ensure:
- Mehrwert DE and ES are strictly <= 1,000 characters with spaces for the OASys text area.
- Kurzfassung DE and ES are strictly <= 2,000 characters with spaces.
- Ausführliche Projektbeschreibung DE and ES are strictly <= 10,000 characters with spaces.
- Work plan has 12 months, 4 WPs, deliverables, milestones, concise text (<= 2,000 chars) + formatted table.
- Compile using `typst compile formulario_oasys_baylat.typ formulario_oasys_baylat.pdf`.
- Confirm exit code == 0 and PDF size > 50 KB.
Write your report to /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_worker_m1/handoff.md and report back via send_message.
