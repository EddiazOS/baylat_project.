# Original User Request

## 2026-09-17T18:29:43Z

Generar y compilar los tres documentos formales requeridos para la postulación a la convocatoria de financiamiento de inicio BAYLAT-Anschubfinanzierung (OASys) entre la Technische Hochschule Deggendorf (DIT, Alemania) y la Universidad de Cartagena (UdC, Colombia): (1) el documento formal del formulario de aplicación con todos los campos reglamentarios y límites de caracteres en Typst (`formulario_oasys_baylat.typ`), (2) la memoria científica y técnica detallada en Alemán (`expose_wissenschaftlicher_bericht_baylat_de.typ`), y (3) la memoria científica y técnica detallada en Inglés (`expose_scientific_proposal_baylat_en.typ`), todos utilizando la plantilla oficial del proyecto y compilados a PDF.

Working directory: `/home/echoes/projects/AI_project/proyecto-babiera`
Integrity mode: development

## Requirements

### R1. Documento del Formulario Oficial OASys en Typst (`formulario_oasys_baylat.typ`)
Elaborar un documento formal en formato Typst (`.typ`) utilizando la plantilla `typst-scientific-report-template/template.typ` que organice y presente de manera estructurada y bilingüe todos los campos exigidos por la plataforma OASys de BAYLAT:
- Metadatos del proyecto: títulos y descriptores bilingües/trilingües (DE, ES, EN) y categorización ERC (`PE6`, `PE4`, `LS9`).
- Datos y perfiles de los socios: DIT (Partner 1, Baviera) y UdC (Partner 2, Colombia) con marcadores de posición claramente delimitados.
- Valor agregado de la cooperación (`Mehrwert des Projektpartners`) bilingüe (DE/ES).
- Alineación con la estrategia de internacionalización de ambas universidades (DE/ES).
- Resumen corto (`Kurzfassung`) en alemán y español, respetando estrictamente el límite máximo de 2.000 caracteres con espacios.
- Descripción detallada del proyecto (`Ausführliche Projektbeschreibung`) en alemán y español, respetando estrictamente el límite máximo de 10.000 caracteres con espacios.
- Justificación de necesidad del fondo semilla (`Anschubfinanzierung`) y proyección de la convocatoria de continuidad de gran escala (DFG–Minciencias).
- Plan de trabajo y cronograma de 12 meses (4 paquetes de trabajo, entregables e hitos), gestión de viajes bilaterales e inclusión de jóvenes investigadores.
- Compilar el documento a `formulario_oasys_baylat.pdf`.

### R2. Memoria Científica y Técnica Detallada en Alemán (`expose_wissenschaftlicher_bericht_baylat_de.typ`)
Elaborar la memoria técnica exhaustiva (Wissenschaftliches Exposé) en idioma **Alemán** para la sección de anexos de la postulación (PDF de hasta 5 MB), utilizando la plantilla `typst-scientific-report-template/template.typ`:
- Kontext und sozioökonomische Relevanz der vier kolumbianischen Matrizen: Kakao (*Theobroma cacao L.*), Spezialitätenkaffee (*Coffea arabica*), Bienenhonig (*Apis mellifera*) und natives Kokosöl (*Cocos nucifera*).
- Physikochemische Abbauphänomene und Reaktionskinetik auf molekularer Ebene, verknüpft mit spezifischen ATR-FTIR-Schwingungsbanden und standardisierten physikochemischen Referenzanalysen (AOAC / ISO).
- Kritischer Stand der Forschung und methodische Lücken basierend auf `references.bib` (Upadhyay & Chaudhary 2026, Passos 2026, Perré 2025, Pronk & Anthony 2026, Grundy et al. 2025, Li et al. 2026 usw.).
- Faktorieller 3-Stufen-Architekturbereich: Spektralkodierer (1D-CNN vs. Spectral Transformer vs. GNN) $\times$ Temporale Modelle (LSTM vs. Mamba SSM) $\times$ Physikalische Regularisierung (Empirische Basislinie vs. PINN mit Arrhenius-Straftermen vs. hierarchische Neural ODEs).
- Agiler und ressourcenschonender Versuchsansatz: Akzelerierte Alterung bei 25 °C, 40 °C, 60 °C (60% und 75% r.F.), kontinuierliche ATR-FTIR-Messungen und kostengünstige normierte Analytik (Peroxidzahl AOAC 965.33, Säuregrad, UV-Vis für 5-HMF nach AOAC 980.23, Folin-Ciocalteu, °Brix).
- Multikriterielle Pareto-Entscheidungsmatrix zur Architekturauswahl (Genauigkeit, Kausalität, Latenz/Speicher auf Edge-Systemen wie Raspberry Pi).
- Kooperationsmatrix RACI (UdC / DIT), Risikomanagement und vollständige Zitationen zu `references.bib`.
- Compilar el documento a `expose_wissenschaftlicher_bericht_baylat_de.pdf`.

### R3. Memoria Científica y Técnica Detallada en Inglés (`expose_scientific_proposal_baylat_en.typ`)
Elaborar la memoria técnica exhaustiva (Scientific Exposé / Detailed Research Proposal) en idioma **Inglés** para la sección de anexos y uso en comités científicos internacionales, utilizando la plantilla `typst-scientific-report-template/template.typ`:
- Socioeconomic relevance and bioeconomic framing of the four Colombian agri-food matrices: Cocoa (*Theobroma cacao L.*), Specialty Coffee (*Coffea arabica*), Honey (*Apis mellifera*), and Virgin Coconut Oil (*Cocos nucifera*).
- Physicochemical degradation mechanisms (polyphenol and lipid oxidation, chlorogenic acid degradation, 5-HMF formation, hydrolytic and oxidative rancidity) and their mapping onto ATR-FTIR vibrational bands and standardized physicochemical control parameters (AOAC / ISO).
- Critical literature review and research gap synthesis grounded in `references.bib` (Upadhyay & Chaudhary 2026, Passos 2026, Perré 2025, Pronk & Anthony 2026, Grundy et al. 2025, Li et al. 2026, etc.).
- 3-tier factorial architectural exploration space: Spectral Encoders (1D-CNN vs. Spectral Transformer vs. GNN) $\times$ Temporal Backbones (LSTM/GRU vs. Mamba SSM) $\times$ Physical Regularization (Unconstrained Empirical vs. PINN soft-penalty with Arrhenius laws vs. Hierarchical Neural ODEs).
- Agile, highly feasible experimental design: accelerated aging at 25 °C, 40 °C, and 60 °C (60% and 75% RH), continuous ATR-FTIR spectral scanning, and cost-effective standardized quality assays (peroxide value AOAC 965.33, titratable acidity, UV-Vis spectrophotometry for 5-HMF via AOAC 980.23, Folin-Ciocalteu total polyphenols, °Brix refractometry), projecting high-throughput chromatography (HPLC-DAD, GC-MS) onto the subsequent 3-year bilateral follow-up grant (DFG-Minciencias).
- Multi-objective Pareto selection criteria for final architecture adoption (generalization accuracy, causal spectral interpretability, kinetic identifiability, and edge AI feasibility on Raspberry Pi hardware).
- Governance (UdC / DIT RACI matrix), risk management, contingency protocols, and full BibTeX references linked to `references.bib`.
- Compilar el documento a `expose_scientific_proposal_baylat_en.pdf`.

## Acceptance Criteria

### Compilación y Formato Typst
- [ ] Los tres archivos fuente (`formulario_oasys_baylat.typ`, `expose_wissenschaftlicher_bericht_baylat_de.typ` y `expose_scientific_proposal_baylat_en.typ`) compilan limpiamente a PDF mediante `typst compile` sin errores de compilación ni de sintaxis.
- [ ] Los tres archivos PDF resultantes existen en `/home/echoes/projects/AI_project/proyecto-babiera` y son documentos válidos con tamaño mayor a 50 KB cada uno.
- [ ] Todos los documentos importan correctamente `typst-scientific-report-template/template.typ` y aplican las funciones `#project`, `#callout`, tablas con cabecera estilizada y `#bibliography("references.bib")` según las directrices de `GEMINI.md`.

### Conformidad de Contenido y Verificación de Restricciones
- [ ] En `formulario_oasys_baylat.typ`, los textos de `Kurzfassung` en alemán y español cumplen $\le 2.000$ caracteres con espacios.
- [ ] En `formulario_oasys_baylat.typ`, los textos de `Ausführliche Projektbeschreibung` en alemán y español cumplen $\le 10.000$ caracteres con espacios.
- [ ] Tanto la versión en alemán (`expose_wissenschaftlicher_bericht_baylat_de.typ`) como la versión en inglés (`expose_scientific_proposal_baylat_en.typ`) abordan exhaustivamente las cuatro matrices, los tres niveles factoriales de arquitectura, el enfoque analítico ágil AOAC/ISO y la hoja de ruta hacia DFG-Minciencias.
- [ ] Todas las citas espectroscópicas, de aprendizaje profundo y quimiometría en los tres documentos corresponden a claves válidas de `references.bib`.
