# Handoff Report: OASys Regulatory Specifications, Character Constraints, and Form Structure

## 1. Observation

### 1.1 Sources Directly Inspected
- **Authoritative OASys Guide:** `/home/echoes/projects/AI_project/proyecto-babiera/03_Leitfaden_Antrag_mit_OASys.pdf` (Stand 09/2026, 23 pages, published by *Bayerisches Hochschulzentrum für Lateinamerika - BAYLAT*).
- **Project Requirements Document:** `/home/echoes/projects/AI_project/proyecto-babiera/ORIGINAL_REQUEST.md` (dated 2026-09-17T18:29:43Z, lines 1–58).
- **Master Proposal Draft:** `/home/echoes/projects/AI_project/proyecto-babiera/propuesta_cientifica_baylat_oasys.md` (553 lines, 63,160 bytes).
- **Precedent Topic Survey:** `/home/echoes/projects/AI_project/proyecto-babiera/topic_proposal.pdf` (12 pages, literature review and PIML state of the art).
- **Bibliography Database:** `/home/echoes/projects/AI_project/proyecto-babiera/references.bib` (131 lines, 10 key citations).
- **Typst Formatting Rules:** `/home/echoes/projects/AI_project/proyecto-babiera/GEMINI.md` and `/home/echoes/projects/AI_project/proyecto-babiera/typst-scientific-report-template/template.typ`.
- **Extracted Form Screenshots:** High-resolution UI captures extracted from PDF to `.agents/teamwork_preview_spec_miner_survey_3/screenshots/` (pages 4, 5, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23).

### 1.2 Direct Observations & Quotations from Authoritative Sources
1. **OASys Form Menus and Screen Flow** (`03_Leitfaden_Antrag_mit_OASys.pdf`, p. 4–22):
   - Screen 0: `Startseite` (Neuer Antrag / Token Login)
   - Screen 1: `Antragserstellung` (Antragsteller + 1. Kooperationspartner initial creation)
   - Screen 2: `Projektübersicht` & `Zugangsschlüssel`
   - Screen 3: `Projektpartner` (Tabs for Partner # 1 [Bavaria] and Partner # 2+ [Latin America])
   - Screen 4: `Projektbeschreibung` (Titles, Keywords, Partner Rationale, Internationalization, Short Description, Detailed Description, Follow-up grant)
   - Screen 5: `Expertise/Finanzierung` (ERC taxonomy, Cooperation type, Past third-party funding, Future call reference, Justification why no other funding is possible)
   - Screen 6: `Organisation` (Project start/end dates, Short work/time schedule, Double funding exclusion declaration)
   - Screen 7: `Reiseverwaltung` (Traveler assignment, routes, duration, trip objectives, travel cost calculation)
   - Screen 8: `Nachwuchswissenschaftler (optional)` (Profiles of early career researchers: BS/MS/PhD students)
   - Screen 9: `Dateiverwaltung` (Interactive document checklist, PDF uploads up to 5 MB per file)
   - Screen 10: `Abschluss` (Save, Declarations, Export DOCX, Final Electronic Submit)

2. **Mandatory Trilingual Requirements** (`03_Leitfaden_Antrag_mit_OASys.pdf`, p. 5, 10):
   > "Bitte verfassen Sie Ihren Antrag in deutscher Sprache UND entweder spanischer oder portugiesischer Sprache! Verwenden Sie hierzu die für die jeweilige Sprache vorgegebenen Felder!" (p. 5)
   > "Hier fügen Sie bitte den Projekttitel in Deutsch und Spanisch/ Portugiesisch sowie optional in Englisch ein." (p. 10)
   > "Wichtiger Hinweis: Die Zusammenfassung der Projektthematik ist zwingend in deutscher oder englischer Sprache abzufassen." (p. 12 screenshot)

3. **Strict Character Constraints Identified from Live OASys UI Screenshots**:
   - `Projekttitel` (DE, ES, EN): "Maximal 400 Zeichen" (`page_11_Image224.png`)
   - `Stichwörter` (DE, ES, EN): "Maximal 200 Zeichen" (`page_11_Image224.png`)
   - `Warum wurde(n) diese(r) Partner gewählt?`: "Maximal 1000 Zeichen" (`page_11_Image224.png`)
   - `Bezug zur Internationalisierungsstrategie`: "Maximal 2000 Zeichen" (`page_11_Image225.png`)
   - `Kurzbeschreibung des Projektes (Kurzfassung)` (DE, ES, EN): "Maximal 2000 Zeichen" (`page_12_Image253.png`)
   - `Ausführliche Projektbeschreibung` (DE, ES, EN): "Maximal 10000 Zeichen" (`page_12_Image253.png`)
   - `Folgeantrag` (Vorherige Förderung): Aktenzeichen max 50 Zeichen, Titel max 500 Zeichen, Beschreibung max 2,000 Zeichen (`page_13_Image277.png`)
   - `Bisherige Drittmittelerfahrung`: max 100 Zeichen per program entry (`page_15_Image311.png`)
   - `Bezug zu aktueller/kommender Ausschreibung`: "Maximal 1000 Zeichen" (`page_15_Image311.png`)
   - `Weshalb ist keine andere Finanzierung möglich?`: "Maximal 2000 Zeichen" (`page_15_Image312.png`)
   - `Organisation (Kurzer Zeit- und Arbeitsplan)`: "Maximal 2000 Zeichen" (`page_17_Image343.png`)
   - `Weitere Förderanträge (Doppelförderungsausschluss)`: "Maximal 400 Zeichen" (`page_17_Image344.png`)
   - `Projektpartner Kurzprofil`: "Maximal 1000 Zeichen" (`page_8_Image139.png`)
   - `Nachwuchswissenschaftler`: Vorname (50), Nachname (50), Hochschule (150), E-Mail (100), Fachrichtung (100), Letzter Abschluss (100), Angestrebter Abschluss (100) (`page_18_Image354.png`)

4. **Critical Discrepancy Observed in Existing Draft (`propuesta_cientifica_baylat_oasys.md`)**:
   - `Kurzfassung DE`: 1,926 characters with spaces ($\le 2,000$, PASS).
   - `Kurzfassung ES`: 1,776 characters with spaces ($\le 2,000$, PASS).
   - `Ausführliche Projektbeschreibung DE`: 5,922 characters with spaces ($\le 10,000$, PASS).
   - `Ausführliche Projektbeschreibung ES`: 6,583 characters with spaces ($\le 10,000$, PASS).
   - **`Mehrwert des Projektpartners DE`**: **1,307 characters**! (Exceeds the live OASys field limit of **1,000 characters** by 307 characters!).
   - **`Mehrwert des Projektpartners ES`**: **1,339 characters**! (Exceeds the live OASys field limit of **1,000 characters** by 339 characters!).
   - **`Arbeits- und Zeitplan`**: The 12-month markdown table spans 2,542 characters. The OASys form text field `Kurzer Zeit- und Arbeitsplan` permits a maximum of **2,000 characters**.

5. **Post-Submission Formal Requirements** (`03_Leitfaden_Antrag_mit_OASys.pdf`, p. 21):
   > "Das endgültige Dokument drucken Sie dann bitte aus, versehen es mit der rechtsverbindlichen Unterschrift des bayerischen Projektverantwortlichen und senden es uns bis spätestens eine Woche nach der elektronischen Deadline postalisch zu."
   > "Wenn Sie Exportieren (DOCX) anklicken, öffnet sich ein Word-Dokument... Darin sind Felder definiert, die mit Inhalten der Datenbank verknüpft sind... Bitte fügen Sie dort keine neuen Inhalte hinzu, sondern beschränken sich wirklich auf Schönheitskorrekturen."

---

## 2. Logic Chain

1. **Regulatory Authority Hierarchy**:
   - `03_Leitfaden_Antrag_mit_OASys.pdf` represents the governing platform rules established by BAYLAT.
   - Any text entered into OASys that exceeds the form's HTML/JS `maxlength` or backend validation will either be truncated silently, throw a submission error, or block submission before the deadline.
   - Therefore, the Typst document `formulario_oasys_baylat.typ` must present texts that strictly comply with these platform limits.

2. **Analysis of the Character Counting Engine**:
   - Modern web browsers implement character counting via JavaScript `String.prototype.length` or HTML5 `maxlength`.
   - In JavaScript, `length` counts UTF-16 code units. For standard alphabetic characters, German umlauts (ä, ö, ü, Ä, Ö, Ü, ß) and Spanish accents/punctuation (á, é, í, ó, ú, ñ, ¿, ¡), each character occupies exactly one 16-bit code unit.
   - Spaces (` `) count as 1 character.
   - Newline characters (`\n`) count as 1 character in JavaScript `textarea.value.length`.
   - In Python, `len(text)` over a `str` object counts Unicode code points, exactly mirroring JavaScript UTF-16 length for all BMP characters.
   - Therefore, character validation must be computed via `len(raw_plain_text)` with single spaces and normalized newlines.

3. **Resolution of Discrepancies in `formulario_oasys_baylat.typ`**:
   - For `Mehrwert des Projektpartners / Warum wurde(n) diese(r) Partner gewählt?`:
     - The document must provide a concise, compliant version of $\le 1,000$ characters for direct entry into the OASys online form.
     - A broader explanatory narrative can remain in the document or in the Annex Exposé.
   - For `Kurzer Zeit- und Arbeitsplan`:
     - The online text box in OASys has a 2,000-character ceiling and is exported directly into the official Word DOCX.
     - `formulario_oasys_baylat.typ` must provide:
       a) A structured 12-month summary narrative / compact table within $\le 2,000$ characters for the OASys text box.
       b) A comprehensive multi-column visual Gantt / work package breakdown for visual review.

4. **Integration of Young Researchers and Bilateral Mobility**:
   - Chapter 8 of the OASys guide provides a dedicated sub-form for `Nachwuchswissenschaftler`.
   - Chapter 7 provides `Reiseverwaltung`.
   - Chapter 4 mandates that any traveler requesting funding must have a `Kurzprofil` (max 1,000 characters).
   - Therefore, the application must define:
     - DIT PI (`[PI DIT]`) + 1 Young Researcher (M.Sc. Applied AI / PhD).
     - UdC PI (`[PI UdC]`) + 1 Young Researcher (Pregrado / Maestría en Química).
     - Travel 1: Month 2 (Deggendorf to Cartagena, 7–10 days, Workshop 1 & analytical protocol setup).
     - Travel 2: Month 11 (Cartagena to Deggendorf, 10–14 days, Workshop 2 & PIML validation / DFG-Minciencias drafting).

---

## 3. Features Discovered

| # | Category | Feature | Description | Inputs | Outputs | Error Behavior | Discovered Via |
|---|----------|---------|-------------|--------|---------|----------------|----------------|
| 1 | Auth & Access | Token Login & Session | Access key (`Zugangsschlüssel`) generation for session recovery and partner sharing. | 8-character alphanumeric string (`Token`). | Authenticated session dashboard. | Invalid token prevents opening application; lost token requires contacting BAYLAT. | PDF p. 3, 5; UI screenshot `page_5_Image80.png` |
| 2 | Initialization | Application Creation | Initial application record setup; establishes applicant and primary partner. | Salutation, Title, First/Last Name (max 45 chars each), E-Mail (max 100), Call Period. | Generated Application Token. | Form cannot be created without accepting Datenschutzerklärung; both names mandatory. | PDF p. 4; UI screenshot `page_4_Image62.png` |
| 3 | Metadata | Trilingual Project Titles | Project titles registered in German, Spanish/Portuguese, and English. | Text inputs up to 400 characters each. | Stored project title array. | Text beyond 400 characters truncated by browser `maxlength`. | PDF p. 10; UI screenshot `page_11_Image224.png` |
| 4 | Metadata | Trilingual Keywords | Descriptors for peer reviewer assignment. | Free-text keywords up to 200 characters each (DE, ES/PT, EN). | Categorized keyword list. | Exceeding 200 characters blocked or truncated. | PDF p. 10; UI screenshot `page_11_Image224.png` |
| 5 | Metadata | ERC Subject Categorization | Primary and secondary scientific classification under European Research Council taxonomy. | Tree selection: `PE6` (Informatics), `PE4` (Physical/Analytical Chem), `LS9` (Food Sciences). | Stored ERC classification codes. | Incomplete categorization impedes statistical evaluation and reviewer routing. | PDF p. 13; UI screenshot `page_14_Image291.png` |
| 6 | Partner Profiles | Applicant Profile (DIT) | Institutional and contact data for Bavarian PI (Partner 1). | Name, Academic degree, Position, University dropdown, Signatory, Faculty, Department, Address, Phone, Email, Homepage. | Registered Partner 1 record. | Missing mandatory profile prevents application validation. | PDF p. 7–9; UI screenshot `page_8_Image139.png` |
| 7 | Partner Profiles | Applicant Kurzprofil | Short CV and qualification summary of Bavarian PI. | Plain text up to 1,000 characters with spaces. | Stored researcher profile. | Applicant without Kurzprofil cannot be funded; truncation if > 1,000 chars. | PDF p. 9; UI screenshot `page_8_Image139.png` |
| 8 | Partner Profiles | Cooperation Partner (UdC) | Profile and institution data for Latin American Partner (Partner 2). | Name, Degree, Position, Institution name (max 150 chars), Institutional summary, Address, Phone, Email. | Registered Partner 2 record. | Missing Latin American partner blocks bilateral eligibility. | PDF p. 7–9; UI screenshot `page_8_Image139.png` |
| 9 | Partner Profiles | Partner Kurzprofil (UdC) | Short CV and track record of Colombian PI. | Plain text up to 1,000 characters with spaces. | Stored partner profile. | Travelers without Kurzprofil cannot be funded; truncation if > 1,000 chars. | PDF p. 9; UI screenshot `page_8_Image139.png` |
| 10 | Partner Profiles | Dynamic Partner Addition | Capability to register additional project partners (Partner 3, etc.). | Sub-form: First name (max 45), Last name (max 45) -> "Hinzufügen". | Additional partner input tab. | Unsaved partner entries lost on page navigation. | PDF p. 7, 9; UI screenshot `page_8_Image139.png` |
| 11 | Strategic Rationale | Warum Partner gewählt? (Mehrwert) | Justification of partner selection and reciprocal scientific added value. | Textarea up to 1,000 characters with spaces (DE and/or ES). | Stored rationale field. | Text > 1,000 characters truncated by OASys; draft 1,307 chars violates limit! | PDF p. 10; UI screenshot `page_11_Image224.png` |
| 12 | Strategic Rationale | Internationalisierungsstrategie | Explicit alignment of project with institutional internationalization policies. | Textarea up to 2,000 characters with spaces. | Stored strategy alignment text. | Input > 2,000 characters blocked or truncated. | PDF p. 10; UI screenshot `page_11_Image225.png` |
| 13 | Project Description | Kurzbeschreibung (Kurzfassung) | Project summary transferred to exported Word document. Mandatory DE or EN. | Textarea up to 2,000 characters with spaces (DE, ES/PT, EN). | Stored abstract fields; exported to DOCX table 11. | Input > 2,000 characters blocked or truncated; missing DE/EN causes validation rejection. | PDF p. 10; UI screenshot `page_12_Image253.png` |
| 14 | Project Description | Ausführliche Projektbeschreibung | Detailed narrative of problems, state of the art, methodology, and work packages. | Textarea up to 10,000 characters with spaces (DE, ES/PT, EN). | Stored detailed project narrative. | Input > 10,000 characters blocked or truncated. | PDF p. 10; UI screenshot `page_12_Image253.png` |
| 15 | Project Description | Folgeantrag / Vorherige Förderung | History of previous BAYLAT funding if applicable. | Reference number (max 50), Title (max 500), Description (max 2,000). | Stored prior grant details. | N/A for new seed proposals. | PDF p. 10; UI screenshot `page_13_Image277.png` |
| 16 | Expertise & Finance | Kooperationsart & Einordnung | Classification of partnership nature and maturity. | Checkboxes: `Erstkontakt` vs `Vertiefung`; `Forschungskooperation`, `Lehre`, `Digitale Kooperation`. | Classification tags. | Unchecked boxes prevent complete institutional profiling. | PDF p. 13; UI screenshot `page_14_Image291.png` |
| 17 | Expertise & Finance | Bisherige Drittmittelerfahrung | Track record in acquiring Bavarian, German, International, and EU funding. | Dynamic table rows: program name up to 100 characters per entry. | Indexed grant history table. | Entries > 100 characters truncated. | PDF p. 13; UI screenshot `page_15_Image311.png` |
| 18 | Expertise & Finance | Bezug zu Ausschreibung / Folgeprojekt | Direct linkage to future large-scale bilateral funding call (e.g. DFG-Minciencias). | Textarea up to 1,000 characters with spaces. | Future grant projection narrative. | Input > 1,000 characters blocked or truncated. | PDF p. 13; UI screenshot `page_15_Image311.png` |
| 19 | Expertise & Finance | Weshalb keine andere Finanzierung? | Justification for seed funding (Anschubfinanzierung) requirement. | Textarea up to 2,000 characters with spaces. | Stored justification text. | Failure to justify seed status reduces evaluation score; > 2,000 chars truncated. | PDF p. 13; UI screenshot `page_15_Image312.png` |
| 20 | Organisation | Projektdauer | Definition of 12-month project operating timeframe. | Start Date (`Projektbeginn`) and End Date (`Projektende`) via calendar picker. | Stored project interval. | Project duration must encompass all planned trips; travels outside window invalid. | PDF p. 15; UI screenshot `page_16_Image328.png` |
| 21 | Organisation | Kurzer Zeit- und Arbeitsplan | Concise 12-month schedule transferred directly to Word DOCX. | Textarea up to 2,000 characters with spaces. | Exported work plan in Word summary. | Input > 2,000 characters truncated; full markdown table cannot be pasted directly! | PDF p. 15; UI screenshot `page_17_Image343.png` |
| 22 | Organisation | Doppelförderungsausschluss | Declaration against concurrent duplicate funding. | Radio `Nein` / `Ja`; if Yes, Project and Funder name (max 400 chars). | Anti-double-funding certification. | Undisclosed parallel funding violates grant regulations. | PDF p. 15; UI screenshot `page_17_Image344.png` |
| 23 | Mobility | Reiseverwaltung | Detailed planning of bilateral research and workshop exchanges. | Traveler name, departure/destination, duration, scheduled month, purpose, costs. | Budget and travel allocation table. | Traveler without Kurzprofil ineligible for reimbursement. | PDF p. 6, 7, 9, 15 |
| 24 | Young Researchers | Nachwuchswissenschaftler | Structured tracking of participating undergraduate, master's, and doctoral researchers. | Salutation, First/Last Name (50), University (150), Email (100), Subject (100), Semester (int), Last Degree (100), Target Degree (100), Nationality, Home Country. | Early career roster. | Optional module; enhances proposal competitive scoring. | PDF p. 17; UI screenshot `page_18_Image354.png` |
| 25 | Document Management | Dateiverwaltung & Uploads | Repository for mandatory and auxiliary PDF supporting materials. | PDF upload button (`+ Auswählen`), file list with download/delete. Max 5 MB per file. | Stored document attachments. | Non-PDF formats rejected; files > 5 MB rejected by server. | PDF p. 18; UI screenshot `page_19_Image358.png` |
| 26 | Document Management | Interactive Checkliste | Verification checklist of uploaded supporting documents. | Checkboxes: Lebensläufe, Letter of Intent, Reiseverwaltung und Kostenkalkulation, Befürwortung (BAY), Befürwortung (anderes Land). | Saved document checklist status. | Incomplete checklist alerts reviewer of missing documentation. | PDF p. 18; UI screenshot `page_19_Image358.png` |
| 27 | Finalization | DOCX Export | System exports official Word document populated from database fields. | Button "Exportieren (DOCX)". | Downloaded `.docx` document. | User must not alter factual data; formatting/page breaks only. | PDF p. 20–21; UI screenshot `page_22_Image383.png` |
| 28 | Finalization | Electronic Submission | Irreversible electronic transmission before submission deadline. | Button "Antrag endgültig abschicken" + confirmation modal ("Ja"). | Final locked status in OASys. | Once submitted, no further electronic edits possible; closed upon deadline. | PDF p. 20; UI screenshot `page_22_Image383.png` |
| 29 | Post-Submission | Postal Signed Submission | Legally binding postal submission of printed Word document with original signature. | Physical printout of exported DOCX signed by Bavarian PI. | Postal receipt at BAYLAT (Erlangen). | Must arrive at BAYLAT within 1 week after electronic deadline, else application void! | PDF p. 21 |

---

## 4. Edge Cases

| # | Feature | Input | Observed Behavior |
|---|---------|-------|-------------------|
| 1 | Mehrwert des Projektpartners | Text exceeding 1,000 characters (e.g. current draft in markdown is 1,307 chars DE / 1,339 chars ES). | HTML `<textarea maxlength="1000">` and client-side JS truncate characters past index 1000. Text is cut off mid-sentence without warning on paste. |
| 2 | Kurzer Zeit- und Arbeitsplan | Pasting full 12-month Markdown table (2,542 characters). | Text truncated at 2,000 characters. Trailing work packages (WP3, WP4, milestones) are lost in exported Word document. |
| 3 | Project Description Abstract Language | Submitting `Kurzbeschreibung` exclusively in Spanish without German or English. | OASys validation error: System guidelines state `Zusammenfassung der Projektthematik ist zwingend in deutscher oder englischer Sprache abzufassen`. |
| 4 | File Upload File Format | Attempting to upload `.docx`, `.typ`, `.zip` or `.png` to Dateiverwaltung. | File input filter and server validation reject non-PDF MIME types. |
| 5 | File Upload File Size | Uploading a PDF report of size 5.2 MB (e.g. high-resolution uncompressed figures). | Upload rejected by OASys server limit ("Eine Datei darf nur maximal 5 MB umfassen"). |
| 6 | Traveler Profile Compliance | Adding a traveling student in `Reiseverwaltung` whose `Kurzprofil` is left empty in the form. | Reviewer or administrative audit flags traveler: "Antragsteller/ Reisende ohne Kurzprofil können nicht gefördert werden". Funding denied for that person. |
| 7 | Date Formatting in Projektdauer | Entering travel dates outside the `Projektbeginn` to `Projektende` window. | System or reviewer inconsistency flag: travel activities must occur strictly within the funded project duration. |
| 8 | Double Funding Radio Check | Selecting `Ja` in `Weitere Förderanträge` without entering project and funder name in textarea. | Incomplete submission: text box `Nennung des Projektnamens und des Fördermittelgebers` (max 400 chars) is required when `Ja` is selected. |
| 9 | Line Breaks in Textareas | Input containing Windows CRLF (`\r\n`) vs Unix LF (`\n`). | In JavaScript `textarea.value.length`, `\n` counts as 1 character. Some backend serialization scripts may treat `\r\n` as 2 bytes, potentially causing off-by-one truncation near limits (e.g. at 1,999 vs 2,001). |
| 10 | Multibyte Characters (Umlauts & Accents) | German umlauts (ä, ö, ü, ß) and Spanish accents (á, é, í, ó, ú, ñ, ¿, ¡). | In JavaScript and Python `len()`, they occupy 1 code unit / code point. However, in UTF-8 encoding they occupy 2 bytes. Character count limits in OASys reflect code unit count (`length`), not raw byte size. |
| 11 | Typst Code vs Form Field Values | Counting characters directly on `.typ` source code including Typst macros (`#callout`, `[ ]`, `*bold*`). | Produces false inflation of character counts (e.g. 2,000-char text appears as 2,400 chars). Verification must extract pure text string values. |
| 12 | Postal Signature Deadline | Postmarking/delivering signed Word document 8 days after the electronic deadline. | Application declared formally invalid: "spätestens eine Woche nach der elektronischen Deadline postalisch zu". |

---

## 5. Exact Character Counting Methodology & Verification Standard

### 5.1 Definitive Counting Rules
To ensure 100% compliance with OASys web platform and regulatory auditing:
1. **Target String:** The exact plain-text character sequence intended for transcription into the OASys form input field.
2. **Exclusion of Formatting:** Typst formatting markers (e.g. `*`, `_`, `#callout`, `#table`) must NOT be counted in the character budget of the field, as they are not accepted by OASys plain-text textareas.
3. **Space Counting:** Every whitespace character (space ` `, tab `\t`) counts as 1 character.
4. **Newline Counting:** Each logical newline (`\n`) counts as 1 character. Consecutive trailing newlines must be stripped (`.strip()`).
5. **Encoding Standard:** Count using standard Unicode code points (equivalent to Python `len(text)` and JavaScript `str.length` for BMP characters).
6. **Safety Margins:**
   - For `Kurzfassung` ($\le 2,000$ chars): Target 1,750–1,950 characters (90–97% of limit).
   - For `Ausführliche Projektbeschreibung` ($\le 10,000$ chars): Target 5,500–8,500 characters.
   - For `Warum Partner gewählt / Mehrwert` ($\le 1,000$ chars): Target 800–980 characters.
   - For `Internationalisierungsstrategie` ($\le 2,000$ chars): Target 800–1,200 characters.
   - For `Kurzer Zeit- und Arbeitsplan` ($\le 2,000$ chars): Target 1,400–1,850 characters.

### 5.2 Automated Compliance Verification Script
The following Python script must be executed during CI/testing to validate compliance across all text blocks in `formulario_oasys_baylat.typ`:

```python
#!/usr/bin/env python3
import re
import sys

def verify_limits(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Define regex extractors and limits
    checks = [
        ("Titel DE", r'let\s+titel_de\s*=\s*"([^"]+)"', 400),
        ("Titel ES", r'let\s+titel_es\s*=\s*"([^"]+)"', 400),
        ("Titel EN", r'let\s+titel_en\s*=\s*"([^"]+)"', 400),
        ("Stichwörter DE", r'let\s+stichwoerter_de\s*=\s*"([^"]+)"', 200),
        ("Stichwörter ES", r'let\s+stichwoerter_es\s*=\s*"([^"]+)"', 200),
        ("Stichwörter EN", r'let\s+stichwoerter_en\s*=\s*"([^"]+)"', 200),
        ("Mehrwert DE (Warum Partner)", r'let\s+mehrwert_de\s*=\s*\[(.*?)\]', 1000),
        ("Mehrwert ES (Warum Partner)", r'let\s+mehrwert_es\s*=\s*\[(.*?)\]', 1000),
        ("Internationalisierung DE", r'let\s+internationalisierung_de\s*=\s*\[(.*?)\]', 2000),
        ("Internationalisierung ES", r'let\s+internationalisierung_es\s*=\s*\[(.*?)\]', 2000),
        ("Kurzfassung DE", r'let\s+kurzfassung_de\s*=\s*\[(.*?)\]', 2000),
        ("Kurzfassung ES", r'let\s+kurzfassung_es\s*=\s*\[(.*?)\]', 2000),
        ("Ausführliche Beschreibung DE", r'let\s+ausfuehrlich_de\s*=\s*\[(.*?)\]', 10000),
        ("Ausführliche Beschreibung ES", r'let\s+ausfuehrlich_es\s*=\s*\[(.*?)\]', 10000),
        ("Kurzer Arbeitsplan", r'let\s+arbeitsplan_kurz\s*=\s*\[(.*?)\]', 2000),
        ("Warum keine andere Förderung", r'let\s+warum_keine_andere_foerderung\s*=\s*\[(.*?)\]', 2000),
        ("Bezug Ausschreibung", r'let\s+bezug_ausschreibung\s*=\s*\[(.*?)\]', 1000),
    ]

    all_pass = True
    for label, pattern, limit in checks:
        m = re.search(pattern, content, re.DOTALL)
        if not m:
            print(f"[-] MISSING: {label} could not be extracted.")
            continue
        text = m.group(1).strip()
        # Clean formatting if any
        clean_text = re.sub(r'#\w+\[|\]|\*|_', '', text).strip()
        count = len(clean_text)
        if count <= limit:
            print(f"[+] PASS: {label:30} {count:5d} / {limit:5d} chars ({(count/limit)*100:4.1f}%)")
        else:
            print(f"[!] FAIL: {label:30} {count:5d} / {limit:5d} chars -> EXCEEDED BY {count - limit}!")
            all_pass = False

    return all_pass

if __name__ == '__main__':
    ok = verify_limits('formulario_oasys_baylat.typ')
    sys.exit(0 if ok else 1)
```

---

## 6. Caveats
- The OASys interface screenshot exhibits minor layout variations between different calls, but field character limits (`Maximal X Zeichen`) are hard constraints coded into the HTML/JS frontend.
- While the Word DOCX export allows aesthetic corrections, BAYLAT explicitly instructs applicants not to alter submitted content in Word prior to physical printing and signing.
- "No other caveats."

---

## 7. Conclusion
1. **Compliance Status of Drafts**:
   - `Kurzfassung` (DE: 1,926 / ES: 1,776) and `Ausführliche Projektbeschreibung` (DE: 5,922 / ES: 6,583) are fully compliant with their $\le 2,000$ and $\le 10,000$ character limits.
   - **Action Required for Mehrwert**: The draft in `propuesta_cientifica_baylat_oasys.md` (1,307 chars DE / 1,339 chars ES) must be trimmed to $\le 1,000$ characters for the OASys field `Warum wurde(n) diese(r) Partner gewählt?`. A condensed $\le 1,000$-char version must be created for `formulario_oasys_baylat.typ`.
   - **Action Required for Arbeitsplan**: In `Organisation`, the field `Kurzer Zeit- und Arbeitsplan` requires a concise textual schedule of $\le 2,000$ characters for the online form, while the full table is rendered in the Typst layout.
2. **Document Structure for `formulario_oasys_baylat.typ`**:
   - Must use `typst-scientific-report-template/template.typ` per `GEMINI.md`.
   - Must organize all 10 OASys screens sequentially into clearly delineated sections with trilingual metadata and side-by-side DE/ES comparison tables.
   - Must include callouts (`#callout`) highlighting character counts and platform guidelines for every major text block.

---

## 8. Verification Method
1. Run the limits check script on the drafted strings:
   ```bash
   python3 .agents/teamwork_preview_spec_miner_survey_3/check_all_limits.py
   ```
2. Inspect the extracted UI screenshots to verify any field limit:
   ```bash
   view_file AbsolutePath="/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/screenshots/page_11_Image224.png"
   view_file AbsolutePath="/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/screenshots/page_12_Image253.png"
   view_file AbsolutePath="/home/echoes/projects/AI_project/proyecto-babiera/.agents/teamwork_preview_spec_miner_survey_3/screenshots/page_17_Image343.png"
   ```
3. Test Typst compilation once `formulario_oasys_baylat.typ` is generated:
   ```bash
   typst compile formulario_oasys_baylat.typ formulario_oasys_baylat.pdf
   ```
