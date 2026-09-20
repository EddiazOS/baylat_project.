# Project: BAYLAT-Anschubfinanzierung (OASys) Grant Application

## Architecture
- **Document Engineering Layer**: Typst (`typst 0.15.1`) with official template `typst-scientific-report-template/template.typ` (`#project`, `#callout`, formatted `#table`, and `#bibliography`).
- **Domain Modeling Layer**:
  - 4 Agro-food matrices: Cocoa (*Theobroma cacao L.*), Specialty Coffee (*Coffea arabica*), Honey (*Apis mellifera*), Virgin Coconut Oil (*Cocos nucifera*).
  - Molecular degradation pathways mapped to diagnostic ATR-FTIR vibrational bands ($4000 - 650\,\text{cm}^{-1}$).
  - Standardized wet-chemical ground truth: AOAC 965.33 (peroxide value), AOAC 980.23 (UV-Vis 5-HMF), Folin-Ciocalteu (total polyphenols), titratable acidity, °Brix refractometry.
  - 3-tier factorial AI exploration space:
    - Tier 1: Encoders (1D-CNN vs. Spectral Transformer with SAM vs. GNN)
    - Tier 2: Temporal Backbones (LSTM vs. Mamba SSM / ASGMamba)
    - Tier 3: Physical Regularization (Empirical vs. PINN soft-penalty with Arrhenius laws vs. Hierarchical Neural ODEs)
  - Multi-objective Pareto selection (Accuracy, Causal Interpretability, Kinetic Identifiability, Edge AI on Raspberry Pi).
  - Governance (UdC/DIT RACI matrix), risk management, and bilateral 3-year DFG-Minciencias follow-up roadmap.
- **Verification Layer**:
  - Automated test runner verifying compilation, PDF validity (>50 KB), character count boundaries, citation key validity against `references.bib`, and structural elements.

## Feature Inventory
| # | Feature | Description | Milestone | Source | Status |
|---|---------|-------------|-----------|--------|--------|
| 1 | OASys Form - Metadata | Trilingual titles (DE, ES, EN <= 400 chars), keywords (<= 200 chars), ERC classification (`PE6`, `PE4`, `LS9`) | M1 | Survey 3 / ORIGINAL_REQUEST R1 | VERIFIED |
| 2 | OASys Form - Partner Profiles | DIT (Partner 1) and UdC (Partner 2) institutional profiles and researcher profiles (<= 1,000 chars) | M1 | Survey 3 / ORIGINAL_REQUEST R1 | VERIFIED |
| 3 | OASys Form - Mehrwert des Partners | Scientific added value and complementarity in DE and ES (strictly <= 1,000 chars for OASys web form limit) | M1 | Survey 3 / ORIGINAL_REQUEST R1 | VERIFIED |
| 4 | OASys Form - Internationalization | Alignment with DIT and UdC internationalization strategies in DE and ES (<= 2,000 chars) | M1 | Survey 3 / ORIGINAL_REQUEST R1 | VERIFIED |
| 5 | OASys Form - Kurzfassung | Project abstract in DE (<= 2,000 chars) and ES (<= 2,000 chars) | M1 | Survey 1, 3 / ORIGINAL_REQUEST R1 | VERIFIED |
| 6 | OASys Form - Ausführliche Beschreibung | Detailed project description in DE (<= 10,000 chars) and ES (<= 10,000 chars) | M1 | Survey 1, 3 / ORIGINAL_REQUEST R1 | VERIFIED |
| 7 | OASys Form - Financing & DFG Follow-up | Seed funding rationale (<= 2,000 chars) and DFG-Minciencias projection (<= 1,000 chars) | M1 | Survey 3 / ORIGINAL_REQUEST R1 | VERIFIED |
| 8 | OASys Form - Work Plan & Travel | 12-month work plan across 4 WPs, deliverables, milestones, mobility plan (DIT<->UdC), early-career researchers | M1 | Survey 3 / ORIGINAL_REQUEST R1 | VERIFIED |
| 9 | OASys Form - PDF Generation | Clean compilation of `formulario_oasys_baylat.typ` to `formulario_oasys_baylat.pdf` (> 50 KB) | M1, E2E | Survey 1 / ORIGINAL_REQUEST R1 | VERIFIED |
| 10 | German Exposé - 4 Matrices & Socioeconomics | Context and socioeconomics of Cocoa, Coffee, Honey, and Coconut Oil in Colombia | M2 | Survey 2 / ORIGINAL_REQUEST R2 | VERIFIED |
| 11 | German Exposé - Degradation & ATR-FTIR | Molecular degradation kinetics, activation energies ($E_a$), and diagnostic ATR-FTIR vibrational band mapping | M2 | Survey 2 / ORIGINAL_REQUEST R2 | VERIFIED |
| 12 | German Exposé - AOAC/ISO Reference Assays | Standardized wet-chemical assays (AOAC 965.33, AOAC 980.23, Folin-Ciocalteu, acidity, Brix) | M2 | Survey 2 / ORIGINAL_REQUEST R2 | VERIFIED |
| 13 | German Exposé - Literature Gaps & BibTeX | Critical review citing `references.bib` (Upadhyay, Passos via `@passos2605...`, Perré, Pronk, Grundy, Li, etc.) | M2 | Survey 1, 2 / ORIGINAL_REQUEST R2 | VERIFIED |
| 14 | German Exposé - 3-Tier AI Factorial Space | 18-model exploration space (Encoders x Temporal Backbones x Physics Regularization) with PINN Arrhenius soft-penalties | M2 | Survey 2 / ORIGINAL_REQUEST R2 | VERIFIED |
| 15 | German Exposé - Accelerated Aging Design | 6 climate regimes (25, 40, 60 °C; 60%, 75% RH) over 180 days across 12 batches | M2 | Survey 2 / ORIGINAL_REQUEST R2 | VERIFIED |
| 16 | German Exposé - Pareto Selection & Edge AI | Multi-objective Pareto matrix (Accuracy, Causality, Latency < 2.0s and RAM < 500MB on Raspberry Pi) | M2 | Survey 2 / ORIGINAL_REQUEST R2 | VERIFIED |
| 17 | German Exposé - Governance, Risk & Roadmap | RACI matrix (UdC/DIT), 5-risk contingency protocol, and 3-year DFG-Minciencias bridge | M2 | Survey 2 / ORIGINAL_REQUEST R2 | VERIFIED |
| 18 | German Exposé - PDF Generation | Clean compilation of `expose_wissenschaftlicher_bericht_baylat_de.typ` to `expose_wissenschaftlicher_bericht_baylat_de.pdf` (> 50 KB) | M2, E2E | Survey 1 / ORIGINAL_REQUEST R2 | VERIFIED |
| 19 | English Exposé - 4 Matrices & Bioeconomy | Socioeconomic framing, bioeconomy, and chemical profiles of the 4 matrices in English | M3 | Survey 2 / ORIGINAL_REQUEST R3 | VERIFIED |
| 20 | English Exposé - Degradation & Vibrational Bands | Reaction mechanisms, kinetics, and comprehensive ATR-FTIR spectral band assignments | M3 | Survey 2 / ORIGINAL_REQUEST R3 | VERIFIED |
| 21 | English Exposé - AOAC/ISO Quality Assays | Wet-chemical reference protocols and projection of HPLC-DAD / GC-MS to follow-up grant | M3 | Survey 2 / ORIGINAL_REQUEST R3 | VERIFIED |
| 22 | English Exposé - Literature Synthesis & BibTeX | Research gap analysis citing `references.bib` with verified keys | M3 | Survey 1, 2 / ORIGINAL_REQUEST R3 | VERIFIED |
| 23 | English Exposé - 3-Tier Factorial Space | Comprehensive formulation of the 18 architectures (Encoders x Backbones x Regularizers) | M3 | Survey 2 / ORIGINAL_REQUEST R3 | VERIFIED |
| 24 | English Exposé - Agile Aging Experimental Matrix | Incubation regimes, sampling frequency, batch design, and scan protocol | M3 | Survey 2 / ORIGINAL_REQUEST R3 | VERIFIED |
| 25 | English Exposé - Pareto Selection & Edge AI | Multi-criteria optimization, causal saliency alignment, edge deployment constraints | M3 | Survey 2 / ORIGINAL_REQUEST R3 | VERIFIED |
| 26 | English Exposé - Governance, Risk & Scaling | UdC/DIT RACI governance, contingency matrix, and DFG-Minciencias bilateral scaling plan | M3 | Survey 2 / ORIGINAL_REQUEST R3 | VERIFIED |
| 27 | English Exposé - PDF Generation | Clean compilation of `expose_scientific_proposal_baylat_en.typ` to `expose_scientific_proposal_baylat_en.pdf` (> 50 KB) | M3, E2E | Survey 1 / ORIGINAL_REQUEST R3 | VERIFIED |
| 28 | E2E Testing Harness & Runner | Automated Python/Bash test harness running all 4 tiers of opaque-box tests | E2E | Project Pattern Dual Track | VERIFIED |
| 29 | Tier 1: Feature & Compilation Testing | Automated tests checking that all 3 files compile cleanly to PDF with exit code 0 | E2E | Acceptance Criteria | VERIFIED |
| 30 | Tier 2: Boundary & Character Count Testing | Strict character count validation for Kurzfassung, Ausführliche Beschreibung, Mehrwert, etc. | E2E | Acceptance Criteria | VERIFIED |
| 31 | Tier 3: Cross-Document & Citation Integrity | Citation key cross-checks against `references.bib` and template element verification (`#callout`, `#table`) | E2E | Acceptance Criteria | VERIFIED |
| 32 | Tier 4: PDF Artifact Validation (>50 KB) | Validation of generated PDF files (> 50 KB each, valid PDF magic headers) | E2E | Acceptance Criteria | VERIFIED |
| 33 | Tier 5: Adversarial Hardening | White-box verification of text formatting, edge cases, and robustness | M4 | Project Pattern Final Milestone | VERIFIED |

## Milestones
| # | Name | Scope | Dependencies | Status | Key Output Artifacts |
|---|------|-------|-------------|--------|---------------------|
| E2E | E2E Testing Track | Test suite design, runner script, validation harness, publishes `TEST_READY.md` | Survey | DONE | `test_baylat_suite.py`, `TEST_INFRA.md`, `TEST_READY.md` (30/30 pass) |
| M1 | Formulario OASys | Author `formulario_oasys_baylat.typ` and compile `formulario_oasys_baylat.pdf` | Survey | DONE | 16 pages, 357.9 KB, 17/17 character limits compliant |
| M2 | Exposé German | Author `expose_wissenschaftlicher_bericht_baylat_de.typ` and compile `expose_wissenschaftlicher_bericht_baylat_de.pdf` | Survey | DONE | 19 pages, 478.9 KB, German scientific exposé |
| M3 | Exposé English | Author `expose_scientific_proposal_baylat_en.typ` and compile `expose_scientific_proposal_baylat_en.pdf` | Survey | DONE | 25 pages, 562.3 KB, English scientific proposal |
| M4 | Final Acceptance & Gate | Pass 100% E2E tests (Tiers 1-4) & adversarial coverage hardening (Tier 5) | E2E, M1, M2, M3 | DONE | Reviewer 1 & 2 APPROVE, Challenger 1 & 2 APPROVE, Auditor CLEAN |

## Interface Contracts
### Template ↔ Document Files
- All 3 documents import:
  `#import "typst-scientific-report-template/template.typ": project, callout`
- Configured `#show: project.with(...)` with required fields, doc_id, and header_title.
- Language setup:
  - `formulario_oasys_baylat.typ`: `lang: "es"`
  - `expose_wissenschaftlicher_bericht_baylat_de.typ`: `#set text(lang: "de")`, `#bibliography("references.bib", title: [Literaturverzeichnis])`
  - `expose_scientific_proposal_baylat_en.typ`: `#set text(lang: "en")`, `#bibliography("references.bib", title: [References])`

### Document Files ↔ Bibliography
- Citation keys strictly match `references.bib`:
  - `upadhyay2026enhancingspectralanalysis`
  - `boadu2024developinganovel`
  - `felizzato2025datafusionfor`
  - `li2026asgmambaadaptivespectral`
  - `passos2605convolutionalneuralnetworks` (Year 2605 verified; zero occurrences of `@passos2026`)
  - `perre2025towardmechanisticmodels`
  - `pronk2026neuralnetworkplacementin`
  - `widiarto2026detectionofadulteration`
  - `grundy2025reviewofcurrent`
  - `feng2021applicationofvisibleinfrared`

### OASys Character Constraints Contract
- `Kurzfassung DE`: $\le 2,000$ characters with spaces (Actual: 1,926 chars)
- `Kurzfassung ES`: $\le 2,000$ characters with spaces (Actual: 1,776 chars)
- `Ausführliche Projektbeschreibung DE`: $\le 10,000$ characters with spaces (Actual: 5,922 chars)
- `Ausführliche Projektbeschreibung ES`: $\le 10,000$ characters with spaces (Actual: 6,583 chars)
- `Warum Partner gewählt / Mehrwert DE`: $\le 1,000$ characters with spaces (Actual: 916 chars)
- `Warum Partner gewählt / Mehrwert ES`: $\le 1,000$ characters with spaces (Actual: 950 chars)
- `Internationalisierungsstrategie DE`: $\le 2,000$ characters with spaces (Actual: 884 chars)
- `Internationalisierungsstrategie ES`: $\le 2,000$ characters with spaces (Actual: 817 chars)
- `Kurzer Zeit- und Arbeitsplan`: $\le 2,000$ characters with spaces (Actual: 1,838 chars)
- `Warum keine andere Förderung`: $\le 2,000$ characters with spaces (Actual: 984 chars)
- `Bezug Ausschreibung`: $\le 1,000$ characters with spaces (Actual: 473 chars)

## Code Layout
- Root project directory: `/home/echoes/projects/AI_project/proyecto-babiera`
  - `formulario_oasys_baylat.typ` (Source for Milestone 1 - 538 lines, 34.4 KB)
  - `formulario_oasys_baylat.pdf` (Output for Milestone 1 - 16 pages, 357.9 KB)
  - `expose_wissenschaftlicher_bericht_baylat_de.typ` (Source for Milestone 2 - 599 lines, 54.2 KB)
  - `expose_wissenschaftlicher_bericht_baylat_de.pdf` (Output for Milestone 2 - 19 pages, 478.9 KB)
  - `expose_scientific_proposal_baylat_en.typ` (Source for Milestone 3 - 699 lines, 61.3 KB)
  - `expose_scientific_proposal_baylat_en.pdf` (Output for Milestone 3 - 25 pages, 562.3 KB)
  - `references.bib` (Authoritative BibTeX database - 10 entries)
  - `typst-scientific-report-template/template.typ` (Authoritative Typst template)
  - `test_baylat_suite.py` (E2E Test Runner authored by E2E Testing Track)
  - `TEST_INFRA.md` (E2E Test Infrastructure documentation)
  - `TEST_READY.md` (E2E Test Suite Ready signal)
