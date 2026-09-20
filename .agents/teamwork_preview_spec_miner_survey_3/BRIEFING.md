# BRIEFING — 2026-09-17T18:36:10Z

## Mission
Investigate and document all regulatory specifications, platform rules, field definitions, and character count constraints for the BAYLAT OASys application.

## 🔒 My Identity
- Archetype: Spec Miner
- Roles: Specification Miner, Teamwork specialist
- Working directory: /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3
- Original parent: e05c40fb-9d59-471b-832f-f4d85278737f
- Milestone: Survey Phase - OASys Regulatory Specifications

## 🔒 Key Constraints
- Read-only on codebase / external documents (write only in own .agents directory: /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3)
- Authoritative sources prioritized: 03_Leitfaden_Antrag_mit_OASys.pdf, ORIGINAL_REQUEST.md, GEMINI.md, propuesta_cientifica_baylat_oasys.md
- Strict character count limits: Kurzfassung <= 2,000 chars with spaces (DE & ES); Ausführliche Projektbeschreibung <= 10,000 chars with spaces (DE & ES)
- Comprehensive feature & edge case enumeration in handoff.md

## Current Parent
- Conversation ID: e05c40fb-9d59-471b-832f-f4d85278737f
- Updated: not yet

## Loaded Skills
None loaded.

## Task Summary
- **What to build**: Comprehensive specification inventory of the OASys BAYLAT application form, character counting methodology, form structure, field constraints, and compliance checks.
- **Success criteria**: Detailed, exhaustive specification catalog in handoff.md, verified against OASys guidelines (03_Leitfaden_Antrag_mit_OASys.pdf) and ORIGINAL_REQUEST.md.
- **Interface contracts**: /home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md
- **Code layout**: Rules in GEMINI.md (Typst template compliance, etc.)

## Key Decisions Made
- Extracted and analyzed UI screenshots from 03_Leitfaden_Antrag_mit_OASys.pdf (Stand 09/2026).
- Identified all exact field character limits in OASys (Titel <= 400, Stichwörter <= 200, Mehrwert/Warum Partner <= 1,000, Internationalisierung <= 2,000, Kurzfassung <= 2,000, Ausführliche Beschreibung <= 10,000, Zeitplan/Organisation <= 2,000, Warum keine andere Förderung <= 2,000, Bezug Ausschreibung <= 1,000, Kurzprofil Partner <= 1,000).
- Discovered critical discrepancy: draft Mehrwert in `propuesta_cientifica_baylat_oasys.md` is ~1,308 chars, exceeding the 1,000-char OASys limit; must provide compliant condensed version <= 1,000 chars alongside comprehensive version.
- Established character count methodology: Unicode characters with spaces (UTF-16 code units / Python `len(s)`), excluding Typst formatting tags.

## Artifact Index
- handoff.md — Comprehensive handoff report with Features Discovered and Edge Cases tables.
- progress.md — Liveness heartbeat and progress tracking.
- test_counts.py — Character count test script for drafted sections.
- check_all_limits.py — Exhaustive field limit validator script.
- screenshots/ — Extracted UI screenshots from 03_Leitfaden_Antrag_mit_OASys.pdf.
