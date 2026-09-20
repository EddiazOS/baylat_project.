# Dispatch: Survey 3 - OASys Regulatory Specifications, Character Constraints, and Form Structure

**Target Workspace**: `/home/echoes/projects/AI_project/proyecto-babiera`
**Authoritative Request**: `/home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md`
**Agent Directory**: `/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3`

## Mission
You are a Spec Miner. Investigate and document all regulatory specifications, platform rules, field definitions, and character count constraints for the BAYLAT OASys application.

Subagents MUST read `/home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md` before starting work.

Key tasks:
1. Examine all requirements for `formulario_oasys_baylat.typ`:
   - Project metadata, bilingual/trilingual titles, ERC categories (`PE6`, `PE4`, `LS9`).
   - Partner 1 (DIT, Bavaria) and Partner 2 (UdC, Colombia) data fields and placeholders.
   - Mehrwert des Projektpartners (DE/ES).
   - Internationalization strategy alignment (DE/ES).
   - Strict character count limits:
     * Kurzfassung <= 2,000 characters with spaces (German & Spanish).
     * Ausführliche Projektbeschreibung <= 10,000 characters with spaces (German & Spanish).
   - Seed fund rationale (Anschubfinanzierung) & DFG-Minciencias projection.
   - Work plan: 12 months, 4 Work Packages (WP1-WP4), deliverables and milestones, travel plans, young researchers participation.
2. Formulate exact character counting methodology: how are characters counted (UTF-8, with spaces, excluding Typst markup), and establish verification scripts/checks.
3. Review any existing guidelines or documentation in the workspace or related files.

## 2026-09-17T18:31:20Z
You are a Spec Miner agent. Your working directory is /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3.
Read /home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md and /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/DISPATCH.md.
Investigate all regulatory specifications and platform constraints for the OASys BAYLAT application:
1. Examine all required fields of the OASys form:
   - Metadata, titles (DE/ES/EN), ERC codes (PE6, PE4, LS9).
   - Partner 1 (DIT) and Partner 2 (UdC) profile structures.
   - Mehrwert des Projektpartners (DE/ES).
   - Internationalization strategy alignment (DE/ES).
   - Strict character count constraints: Kurzfassung <= 2,000 chars with spaces (DE & ES); Ausführliche Projektbeschreibung <= 10,000 chars with spaces (DE & ES).
   - Justification of Anschubfinanzierung & DFG-Minciencias follow-up projection.
   - 12-month work plan across 4 Work Packages (WP1-WP4), deliverables, milestones, exchange visits, young researchers.
2. Define exact character counting methodology and criteria to ensure compliance.
3. Document any existing templates, guidelines, or constraints.
Write your complete specification inventory to /home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/handoff.md and report back via send_message.
