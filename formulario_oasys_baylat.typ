#import "typst-scientific-report-template/template.typ": project, callout

#show: project.with(
  title: [Formulario Oficial de Postulación OASys / BAYLAT-Anschubfinanzierung],
  subtitle: [Bayerisches Hochschulzentrum für Lateinamerika (BAYLAT) — Convocatoria de Financiamiento Inicial para Nuevos Proyectos de Investigación entre Baviera y América Latina],
  objective: [
    Presentación técnica formal y estructurada de todos los campos reglamentarios, especificaciones de pantallas (Screen 1 a Screen 10) y restricciones estrictas de caracteres de la plataforma telemática OASys (Stand 09/2026) para la postulación conjunta entre la Technische Hochschule Deggendorf (DIT, Alemania) y la Universidad de Cartagena (UdC, Colombia), orientada al modelado de la cinética de degradación en matrices agroalimentarias colombianas mediante espectroscopía ATR-FTIR y Deep Learning informado por la física.
  ],
  authors: (
    "Deggendorf Institute of Technology (DIT) — Fakultät für Angewandte Informatik / KI-Campus",
    "Universidad de Cartagena (UdC) — Facultad de Ciencias Exactas y Naturales / Programa de Química",
  ),
  date: "17 de septiembre de 2026",
  doc_id: "OASYS-BAYLAT-2026-DIT-UDC",
  header_title: "BAYLAT OASys — Formulario Oficial de Postulación (DIT / UdC)",
)

// =============================================================================
// DEFINICIÓN DE BLOQUES DE TEXTO PARAMETRIZADOS PARA VALIDACIÓN REGLAMENTARIA
// =============================================================================

#let titel_de = "Hybride Deep-Learning- und Physik-informierte FTIR-Spektroskopie zur Modellierung der Abbaukinetik kolumbianischer Agrarlebensmittel"
#let titel_es = "Espectroscopía FTIR y Aprendizaje Profundo Híbrido Informado por Física para el Modelado de la Cinética de Degradación en Matrices Agroalimentarias Colombianas"
#let titel_en = "Physics-Informed Deep Learning and FTIR Spectroscopy for Degradation Kinetics Modeling in High-Value Colombian Agri-Food Matrices"

#let stichwoerter_de = "FTIR-Spektroskopie, Abbaukinetik, Physik-informiertes Deep Learning, PINN, Neural ODE, Mamba SSM, Lebensmittelchemie, Kakao, Kaffee, Honig, Kokosöl, Kolumbien."
#let stichwoerter_es = "Espectroscopía FTIR, Cinética de degradación, Deep Learning informado por la física, PINN, Neural ODE, Mamba SSM, Química de alimentos, Cacao, Café, Miel, Aceite de coco, Colombia."
#let stichwoerter_en = "FTIR spectroscopy, Degradation kinetics, Physics-informed deep learning, PINN, Neural ODE, Mamba SSM, Food chemistry, Cocoa, Coffee, Honey, Coconut oil, Colombia."

#let mehrwert_de = [Die Kooperation zwischen der Technischen Hochschule Deggendorf (DIT) und der Universidad de Cartagena (UdC) schafft eine ideale wissenschaftliche Symbiose. Die UdC verfügt über ausgewiesene Expertise in Lebensmittelchemie, direkten Zugang zu zertifizierten kolumbianischen Agrarmatrizen (Kakao, Kaffee, Honig, Kokosöl) und leitet die kontrollierte Alterung, ATR-FTIR-Spektroskopie sowie standardisierte Referenzanalysen (AOAC/ISO). Das DIT steuert Spitzenforschung in Angewandter KI bei: Formulierung von Physics-Informed Neural Networks (PINNs), Mamba State-Space-Modellen, spektralen Transformern und XAI auf GPU-Clustern. Der Mehrwert liegt in der Kopplung realer Reaktionskinetik mit physikalisch reguliertem Deep Learning für ressourceneffiziente Vor-Ort-Analytik (Edge AI). Die Partnerschaft bildet wissenschaftlichen Nachwuchs interdisziplinär aus und bereitet ein bilaterales DFG-Minciencias-Großprojekt vor.]
#let mehrwert_es = [La cooperación entre el Deggendorf Institute of Technology (DIT) y la Universidad de Cartagena (UdC) genera una complementariedad científica indispensable. La UdC aporta su liderazgo en química analítica y de alimentos, acceso a materias primas agroalimentarias colombianas certificadas (cacao, café, miel, aceite de coco) y la ejecución de cinéticas de degradación acelerada, monitoreo espectroscópico ATR-FTIR y ensayos fisicoquímicos normatizados (AOAC/ISO). El DIT aporta experiencia de vanguardia en Inteligencia Artificial Aplicada: redes informadas por la física (PINNs), modelos de espacio de estados Mamba, Transformers espectrales y explicabilidad (XAI) en clústeres GPU. El valor agregado radica en transformar trayectorias espectrales continuas en modelos cinéticos reproducibles y reproducibles en hardware de borde (edge AI), capacitando jóvenes investigadores e impulsando una postulación bilateral de gran escala ante DFG-Minciencias.]
#let internationalisierung_de = [Das Vorhaben fügt sich nahtlos in die Internationalisierungsstrategien beider Hochschulen ein. Für die Technische Hochschule Deggendorf (DIT) unterstützt das Projekt den strategischen Ausbau des internationalen KI-Schwerpunkts sowie den Aufbau nachhaltiger Kooperationsnetzwerke mit Lateinamerika in zukunftsträchtigen Anwendungsfeldern wie Bioökonomie und smarter Lebensmittelüberwachung. Für die Universidad de Cartagena (UdC) stärkt das Vorhaben die internationale Sichtbarkeit, intensiviert den wissenschaftlichen Austausch mit bayerischen Spitzenhochschulen und fördert die Internationalisierung der Curricula in den Naturwissenschaften durch interdisziplinäre Forschungsaufenthalte. Beide Institutionen etablieren damit eine langfristige Kooperationsachse, die über Gastdozenturen, gemeinsame Publikationen und die Akquise internationaler Drittmittel nachhaltig verstetigt wird.]
#let internationalisierung_es = [La propuesta se alinea directamente con las directrices de internacionalización de ambas instituciones. Para el Deggendorf Institute of Technology (DIT), materializa la estrategia de proyectar sus capacidades en Inteligencia Artificial Aplicada hacia regiones emergentes clave de América Latina, consolidando alianzas bilaterales en bioeconomía y monitoreo alimentario inteligente. Para la Universidad de Cartagena (UdC), el proyecto responde a las metas de su Plan de Desarrollo Institucional relativas a la visibilidad global, la movilidad internacional de investigadores y jóvenes talentos, y la cooperación científica con centros tecnológicos de excelencia en Baviera. La colaboración formalizará un marco de cooperación duradero que facilitará intercambios, codirección de tesis y transferencia de conocimientos.]
#let kurzfassung_de = [Gegenstand dieses bilateralen Kooperationsprojekts zwischen der Technischen Hochschule Deggendorf (DIT, Angewandte KI) und der Universidad de Cartagena (UdC, Chemie) ist die Entwicklung eines ressourceneffizienten hybriden Ansatzes zur Modellierung und Vorhersage der zeitlichen Abbaukinetik hochrelevanter kolumbianischer Agrarlebensmittel (Kakao, Kaffee, Honig und Kokosöl) mittels FTIR-Spektroskopie und Physics-Informed Deep Learning.
Konventionelle quimiometrische Verfahren behandeln Spektren meist als statische Einzelbeobachtungen, während chromatographische Verfahren (HPLC/GC) zeit- und kostenintensiv sind. Das Projekt etabliert ein agiles, zerstörungsfreies Monitoring: Die zeitliche spektrale Evolution wird mit standardisierten physikochemischen Qualitätsindizes (AOAC/ISO: Peroxidzahl, Säuregrad, UV-Vis-Spektrophotometrie für HMF und Polyphenole) gekoppelt. Evaluiert wird ein modularer 3-Stufen-Architekturbereich: (1) spektrale Kodierung (1D-CNN vs. Spectral Transformer mit Aufmerksamkeitskarten vs. GNN über Schwingungsbanden), (2) zeitliche Modellierung (LSTM/GRU vs. Mamba/ASGMamba State-Space-Modelle) und (3) physikalische Regularisierung (PINN vs. Neural ODEs unter Arrhenius-Bedingungen).
Die finale Architektur wird kriterienbasiert anhand von Vorhersagegenauigkeit, chemischer Kausalität und Eignung für ressourcenbeschränkte Edge-Systeme (Raspberry Pi) ausgewählt. Die UdC leitet die kontrollierte akzelerierte Alterung, ATR-FTIR-Messungen und Standardanalytik. Das DIT verantwortet die mathematische Modellierung, das Modelltraining und die XAI-Validierung.
Diese BAYLAT-Anschubfinanzierung ermöglicht gegenseitige Forschungsaufenthalte, bilaterale Workshops und die Erstellung robuster Pilotdatensätze. Sie bildet das wissenschaftliche Fundament zur Beantragung eines großvolumigen DFG-Minciencias-Verbundantrags, in dem eine tiefgehende chromatographische Metabolomik-Validierung skaliert wird.]
#let kurzfassung_es = [Este proyecto de cooperación bilateral entre el Deggendorf Institute of Technology (DIT, IA Aplicada) y la Universidad de Cartagena (UdC, Química) desarrolla un enfoque híbrido pionero y viable para modelar y predecir la cinética de degradación temporal en matrices agroalimentarias colombianas de alto valor (cacao, café, miel y aceite de coco) mediante espectroscopía FTIR y Deep Learning informado por la física.
Superando las limitaciones de la quimiometría estática convencional y el elevado coste y tiempo de los análisis cromatográficos continuos, el proyecto adopta un diseño ágil y no destructivo: modela la evolución espectral acoplada a parámetros fisicoquímicos normatizados (AOAC/ISO: índice de peróxidos, acidez titulable, espectrofotometría UV-Vis para HMF y polifenoles). Se evalúa un espacio factorial en tres niveles: (1) codificación espectral (1D-CNN vs. Transformers espectrales SAM vs. GNN de bandas funcionales), (2) modelado temporal (LSTM/GRU vs. modelos de espacio de estados Mamba/ASGMamba) y (3) regularización física (PINN vs. Neural ODEs con leyes cinéticas y de Arrhenius).
La arquitectura final se seleccionará mediante validación experimental rigurosa que optimice precisión, interpretabilidad química y bajo consumo computacional en hardware de borde (edge AI / Raspberry Pi). La UdC lidera la degradación acelerada, adquisición ATR-FTIR y analítica fisicoquímica estándar. El DIT lidera el diseño algorítmico, modelado físico-neuronal y explicabilidad.
Esta ayuda semilla de BAYLAT financia estancias de investigación cruzadas, talleres bilaterales y la consolidación de datos piloto longitudinales, cimentando la propuesta bilateral de gran envergadura (DFG-Minciencias), donde se escalará la metabolómica cromatográfica de alta resolución.]
#let ausfuehrlich_de = [1. Problemstellung, gesellschaftliche Relevanz und Gesamtziel
Kolumbianische Agrarrohstoffe wie Kakao (Theobroma cacao L.), Spezialitätenkaffee (Coffea arabica), Bienenhonig (Apis mellifera) und natives Kokosöl (Cocos nucifera) besitzen eine herausragende sozioökonomische Bedeutung für kleinbäuerliche Erzeuger und regionale Wertschöpfungsketten im karibischen und andinen Raum Kolumbiens. Während der Lagerung, des Transports und unter wechselnden Klimabedingungen unterliegen diese Matrizen komplexen physikalisch-chemischen Alterungsprozessen (Lipidoxidation, Polyphenolabbau, Maillard-Reaktionen, enzymatischer Qualitätsverlust). Die bisherige Haltbarkeitsüberwachung stützt sich weitgehend auf aufwendige, destruktive chemische Analysen, die für ein kontinuierliches Monitoring vor Ort ungeeignet sind.
Das Gesamtziel dieses 12-monatigen Kooperationsvorhabens zwischen der Technischen Hochschule Deggendorf (DIT) und der Universidad de Cartagena (UdC) ist die Entwicklung eines ressourcenschonenden, schnellen und zerstörungsfreien Paradigmas: die kontinuierliche Vorhersage der zeitlichen Abbaukinetik durch die Kopplung von Fourier-Transform-Infrarotspektroskopie (ATR-FTIR) mit fortgeschrittenem, physikalisch-informiertem Deep Learning (PIML), validiert durch etablierte nasschemische und spektrophotometrische Standardparameter.

2. Wissenschaftlicher Stand und Forschungslücken
Die Fachliteratur (vgl. Upadhyay & Chaudhary 2026, Passos 2026, Grundy et al. 2025) belegt, dass FTIR in der Lebensmittelanalytik fast ausschließlich für statische Klassifikationsaufgaben (Authentizitäts- und Verfälschungsprüfung) mittels multivariater Statistik (PCA, PLS) eingesetzt wird. Longitudinales Monitoring zeitabhängiger Abbauvorgänge ist bisher kaum erforscht.
Reine Deep-Learning-Verfahren fungieren oft als Black-Box-Modelle, die bei korrelierten Spektraldaten zu Scheinkorrelationen neigen. Bisherige physikalisch informierte Modelle (z. B. PINNs für Trocknungsprozesse, Perré 2025) basieren meist auf reinen Simulationen ohne reale Spektraldaten. Kürzliche Studien zum Kaffeerösten (Pronk & Anthony 2026) mahnen zudem, dass physikalische Restriktionen bei unzureichender Identifizierbarkeit Verzerrungen verursachen können. Es fehlt an longitudinal harmonisierten Datensätzen und an Modellen, die spektrale Evolution, Zeitreihendynamik und chemische Plausibilität effizient vereinen.

3. Spezifische Ziele des Vorhabens
- Ziel 1: Etablierung eines standardisierten Versuchsprotokolls an der UdC zur akzelerierten Degradation von Kakao, Kaffee, Honig und Kokosöl unter kontinuierlicher ATR-FTIR-Erfassung und paralleler Bestimmung normierter physikochemischer Kennzahlen (Peroxidzahl, Säuregrad, UV-Vis-Spektrophotometrie).
- Ziel 2: Entwicklung und Benchmark eines modularen 3-Stufen-Architekturbereichs am DIT zur spektralen Zeitreihenvorhersage (Forecasting) und Kinetikregression.
- Ziel 3: Rigorose Auswahl der optimalen Modellkombination nach Pareto-Kriterien (Prädiktionsgenauigkeit, chemische Kausalität, Rechenaufwand auf Edge-Hardware wie Raspberry Pi).
- Ziel 4: Bilateraler Austausch, Ausbildung von Nachwuchskräften und Ausarbeitung eines DFG-Minciencias-Folgeantrags zur Skalierung auf chromatographische Hochdurchsatz-Metabolomik.

4. Methodischer Ansatz und modularer Architekturbereich
Das Projekt setzt auf ein modulares, pragmatisches und validiertes Vorgehen:
- Stufe 1: Spektrale Kodierung. Vergleich von 1D-CNNs mit multiskalaren Filtern (Passos 2026), Spectral Transformern mit Aufmerksamkeitskarten (SAM; Upadhyay & Chaudhary 2026) und spektral-chemischen Graph Neural Networks (GNNs) auf Basis molekularer Schwingungsbanden.
- Stufe 2: Zeitliche Sequenzmodellierung. Gegenüberstellung von rekurrierenden Netzwerken (LSTM, GRU) und modernen linearen State-Space-Modellen (Mamba / ASGMamba; Li et al. 2026) mit linearer Komplexität O(L) für kontinuierliche Zeitreihen.
- Stufe 3: Physikalische Regularisierung. Vergleich einer empirischen Basislinie mit PINNs (weiche Strafterme nach Reaktionsordnungen 0, 1, 2 und Arrhenius-Gleichung) sowie hierarchischen Neural ODEs.
Architekturauswahl: Die Entscheidung für die finale Architektur erfolgt nach einem Pareto-Optimum aus: (i) Generalisierungsfehler bei chargenweiser Kreuzvalidierung (Leave-One-Batch-Out), (ii) Identifizierbarkeit kinetischer Parameter, (iii) chemischer Plausibilität der Aufmerksamkeitsgewichte und (iv) Latenz auf Edge-Hardware (Single-Board-Computer).

5. Institutionelle Arbeitsteilung und Synergien
- Universidad de Cartagena (UdC, Chemie): Probenbereitstellung und botanische Verifizierung; Durchführung von Alterungsversuchen in Klimakammern (25 °C, 40 °C, 60 °C); ATR-FTIR-Spektrenakquise; Durchführung normierter Referenzanalysen (Peroxidzahl AOAC 965.33, Säuregrad, UV-Vis-Spektrophotometrie für 5-HMF nach AOAC 980.23, Folin-Ciocalteu für Gesamtpolyphenole, Refraktometrie).
- Technische Hochschule Deggendorf (DIT, Angewandte KI): Spektrale Vorverarbeitung (SNV, Savitzky-Golay); Modellierung und Training der neuronalen Netzwerke auf GPU-Clustern; mathematische Formulierung kinetischer Verlustfunktionen; XAI-Bandenvalidierung und Prototyping für Edge-Inferenz.

6. Arbeitsplan und Zukunftsperspektive
Das 12-monatige Projekt gliedert sich in 4 Arbeitspakete (AP):
- AP1 (Monate 1–4): Versuchsdesign, Probenbeschaffung und Spektroskopie-Standardisierung an der UdC; Initialer Workshop in Cartagena.
- AP2 (Monate 3–8): Durchführung der Alterungsversuche, longitudinale ATR-FTIR-Scans und physikochemische Standardanalytik an der UdC; Datenaufbereitung am DIT.
- AP3 (Monate 6–11): Modelltraining, systematischer Benchmark der 3 Architekturstufen am DIT; Auswahl der Pareto-optimalen Modellarchitektur; XAI-Attributionsanalyse.
- AP4 (Monate 10–12): Bilateraler Synthese-Workshop in Deggendorf; gemeinsame Publikationen; Ausarbeitung des DFG-Minciencias-Großantrags zur Integration von HPLC-MS/GC-MS-Metabolomik.]
#let ausfuehrlich_es = [1. Planteamiento del problema, relevancia socioeconómica y objetivo general
Las matrices agroalimentarias colombianas de alto valor comercial, tales como el cacao (Theobroma cacao L.), el café especial (Coffea arabica), la miel de abejas (Apis mellifera) y el aceite virgen de coco (Cocos nucifera), constituyen motores socioeconómicos fundamentales para la agricultura familiar y las cadenas de exportación del Caribe y los Andes colombianos. Durante las etapas de poscosecha, transporte y almacenamiento bajo condiciones climáticas variables, estos productos sufren procesos progresivos de degradación fisicoquímica (oxidación lipídica, pérdida de polifenoles bioactivos, reacción de Maillard, inactivación enzimática). El monitoreo tradicional de su vida útil se basa en métodos destructivos o en análisis cromatográficos de alta complejidad instrumental (HPLC, GC-MS) que resultan inviables para un control continuo y ágil en campo o centros de acopio.
El objetivo general de este proyecto de cooperación bilateral de 12 meses entre el Deggendorf Institute of Technology (DIT, Alemania) y la Universidad de Cartagena (UdC, Colombia) es desarrollar un paradigma no destructivo, ágil y de alta viabilidad técnica: la modelación y predicción continua de la cinética de degradación temporal mediante la integración de espectroscopía infrarroja por transformada de Fourier (ATR-FTIR) y Deep Learning informado por la física (PIML), calibrado con parámetros fisicoquímicos y espectrofotométricos normatizados de bajo costo.

2. Estado actual del arte y vacíos de investigación
La literatura especializada (Upadhyay & Chaudhary 2026, Passos 2026, Grundy et al. 2025, Widiarto et al. 2026) demuestra que la espectroscopía FTIR en alimentos se ha enfocado casi con exclusividad en la clasificación estática de autenticidad o adulteración mediante quimiometría tradicional (PCA, PLS). El seguimiento temporal continuo de cinéticas de degradación representa una frontera inexplorada.
Por otra parte, los modelos de Deep Learning convencionales operan como cajas negras susceptibles a correlaciones espurias sobre el ruido espectral. Los modelos físicos existentes (PINNs para secado, Perré 2025) se limitan a simulaciones térmicas desacopladas del espectro vibracional. Además, estudios recientes en tostado de café (Pronk & Anthony 2026) advierten que incorporar restricciones físicas no garantiza por sí mismo mayor precisión si las ecuaciones no están adecuadamente condicionadas. Persiste un vacío evidente respecto a bases de datos longitudinales armonizadas y modelos que armonicen la dinámica temporal con interpretabilidad físico-química bajo presupuestos operativos realistas.

3. Objetivos específicos del proyecto
- Objetivo 1: Establecer un protocolo experimental estandarizado en la UdC para someter lotes de cacao, café, miel y aceite de coco a degradación acelerada bajo monitoreo longitudinal por ATR-FTIR y medición simultánea de parámetros fisicoquímicos normatizados (índice de peróxidos, acidez titulable, espectrofotometría UV-Vis).
- Objetivo 2: Diseñar e implementar en el DIT un espacio modular de arquitecturas de Deep Learning para el pronóstico espectral temporal y la estimación cinética de deterioro.
- Objetivo 3: Evaluar y seleccionar la arquitectura óptima mediante criterios multiobjetivo de Pareto (precisión, interpretabilidad química demostrable y bajo consumo en hardware embebido tipo Raspberry Pi).
- Objetivo 4: Fortalecer la movilidad académica bilateral, capacitar a jóvenes investigadores y elaborar la postulación conjunta a una convocatoria de gran envergadura (DFG-Minciencias) para escalar a análisis metabolómico cromatográfico profundo.

4. Enfoque metodológico y espacio modular de arquitecturas
El proyecto implementa un diseño experimental y computacional factorial en tres niveles:
- Nivel 1 (Codificación Espectral): Comparación entre 1D-CNNs con filtros multiescala adaptados al ancho de banda vibracional (Passos 2026), Transformers espectrales con mapas de atención por bandas (SAM; Upadhyay & Chaudhary 2026), y Redes de Grafos (GNN) estructuradas sobre enlaces moleculares.
- Nivel 2 (Modelado Temporal de Secuencias): Comparación entre redes recurrentes (LSTM, GRU) y Modelos de Espacio de Estados selectivos (Mamba / ASGMamba; Li et al. 2026), que ofrecen complejidad lineal O(L) para trayectorias continuas de degradación.
- Nivel 3 (Regularización Física y Cinética): Comparación entre regresión no restringida, PINNs con penalizaciones basadas en cinética química (órdenes 0, 1 y 2, ecuación de Arrhenius) y Neural ODEs jerárquicas.
Criterio de Selección Final: La arquitectura ganadora se determinará evaluando: (i) error de generalización en particiones externas por lotes (Leave-One-Batch-Out), (ii) identificabilidad de constantes cinéticas, (iii) correspondencia química de los pesos de atención con bandas funcionales reales, y (iv) latencia y consumo de memoria compatibles con dispositivos de borde.

5. División institucional del trabajo y sinergias
- Universidad de Cartagena (Química): Selección y trazabilidad de muestras agrícolas colombianas; diseño de cámaras de degradación acelerada (25 °C, 40 °C, 60 °C; 60% y 75% HR); barrido longitudinal ATR-FTIR; ejecución de ensayos analíticos normatizados de bajo costo (índice de peróxidos AOAC 965.33, acidez titulable, espectrofotometría UV-Vis para HMF según AOAC 980.23, método Folin-Ciocalteu para polifenoles totales, refractometría °Brix).
- Deggendorf Institute of Technology (Applied AI): Preprocesamiento espectral (corrección de línea base, SNV, derivadas Savitzky-Golay); programación y entrenamiento de modelos neuronales en GPU; formulación de pérdidas físicas diferenciales; evaluación de explicabilidad (XAI) y optimización para hardware de bajo costo.

6. Plan de trabajo y proyección a largo plazo
El cronograma de 12 meses se divide en 4 Paquetes de Trabajo (WP):
- WP1 (Meses 1–4): Protocolos analíticos, acondicionamiento de lotes y estandarización ATR-FTIR en UdC. Taller bilateral de apertura en Cartagena.
- WP2 (Meses 3–8): Ensayos de envejecimiento acelerado, mediciones continuas FTIR y análisis fisicoquímicos normatizados en UdC; curaduría de la base de datos en DIT.
- WP3 (Meses 6–11): Benchmarking factorial de arquitecturas en DIT; selección de la arquitectura óptima según criterios de Pareto; validación de bandas por XAI.
- WP4 (Meses 10–12): Taller de síntesis bilateral en Deggendorf; redacción de artículos científicos conjuntos; estructuración del proyecto mayor DFG-Minciencias para incorporar metabolómica fina por HPLC/GC-MS.]
#let arbeitsplan_kurz = [Das 12-monatige Kooperationsvorhaben gliedert sich in 4 synchronisierte Arbeitspakete (AP) mit 2 bilateralen Meilenstein-Workshops:
- AP1 (Monate 1–4, UdC/DIT): Protokollharmonisierung und Versuchsaufbau. Probenbeschaffung und botanische Verifizierung von Kakao, Kaffee, Honig und Kokosöl an der UdC. Kalibrierung der Klimakammern (25 °C, 40 °C, 60 °C; 60%, 75% r.F.). Präsenz-Workshop 1 in Cartagena (M2) zur Standardisierung der ATR-FTIR-Spektrenakquise und normierten AOAC/ISO-Analytik (Peroxidzahl, Säuregrad, UV-Vis HMF/Polyphenole). Meilenstein M1 (M4): Standardisiertes Messprotokoll und Pilot-Datensatz etabliert.
- AP2 (Monate 3–8, UdC): Akzelerierte Alterung und Messkampagnen. Durchführung der kontrollierten Alterung über 180 Tage mit periodischer ATR-FTIR-Messung und paralleler Bestimmung chemischer Referenzwerte. Bereinigung und Konsolidierung der Spektraldatenbank. Meilenstein M2 (M8): Vollständiger longitudinaler Spektral- und Validierungsdatensatz fertiggestellt.
- AP3 (Monate 6–11, DIT): Hybrides PIML-Modelling und Benchmark. Implementierung des 3-Stufen-Architekturraums (1D-CNN / Spectral Transformer / GNN x LSTM / Mamba x PINN / Neural ODEs mit Arrhenius-Straftermen) auf GPU-Clustern am DIT. Durchführung der multikriteriellen Pareto-Optimierung (Vorhersagegenauigkeit, chemische Kausalität via XAI, Inferenzlatenz < 2s auf Raspberry Pi). Meilenstein M3 (M9): Auswahl der optimalen Modellarchitektur.
- AP4 (Monate 10–12, DIT/UdC): Bilaterale Synthese, Validierung und Transfer. Präsenz-Workshop 2 in Deggendorf (M11) zur Synthese aller Befunde, Ausarbeitung von zwei gemeinsamen Open-Access-Publikationen und Formulierung des bilateralen DFG-Minciencias-Folgeantrags zur Einbindung hochauflösender Chromatographie. Meilenstein M4 (M12): Einreichung des DFG-Minciencias-Antrags und Abschlussbericht an BAYLAT.]
#let warum_keine_andere_foerderung = [Für die Etablierung dieser neuartigen, transatlantischen Forschungskooperation existiert in dieser initialen Phase kein alternatives Förderformat. Großvolumige Förderprogramme wie die gemeinsame bilaterale Sachbeihilfe der Deutschen Forschungsgemeinschaft (DFG) und Minciencias oder Horizon Europe setzen zwingend belastbare, experimentell verifizierte Pilotdaten, harmonisierte Spektral- und Referenzdatensätze sowie den Nachweis einer bereits funktionierenden interinstitutionellen Zusammenarbeit voraus. Ohne die gezielte Anschubfinanzierung durch BAYLAT können die erforderlichen bilateralen Präsenz-Workshops zur Standardisierung der experimentellen Protokolle und zur Datenharmonisierung sowie die gegenseitigen Forschungs- und Laboraufenthalte nicht finanziert werden. Die BAYLAT-Förderung fungiert somit als unverzichtbarer Katalysator zur Risikominimierung und zur wissenschaftlichen Reifung des Vorhabens, um die Wettbewerbsfähigkeit für den avisierten Großantrag sicherzustellen.]
#let bezug_ausschreibung = [Die Ergebnisse dieses Anschubprojekts fließen unmittelbar in einen gemeinsamen Vollantrag im bilateralen Förderprogramm der Deutschen Forschungsgemeinschaft (DFG) und des kolumbianischen Ministeriums für Wissenschaft, Technologie und Innovation (Minciencias) ein (DFG-Minciencias Bilateral Research Grants). Die Einreichung erfolgt in Monat 11–12 der Projektlaufzeit mit Fokus auf die Skalierung der Methodik auf hochauflösende chromatographische Metabolomik (HPLC-DAD, GC-MS). Ergänzend wird eine Beteiligung an Ausschreibungen des BMBF zur Bioökonomie mit Lateinamerika angestrebt.]
#let form_end_marker = []

// =============================================================================
// INTRODUCCIÓN Y MARCO NORMATIVO DE LA CONVOCATORIA BAYLAT (OASYS 09/2026)
// =============================================================================

#callout(title: "Normativa Oficial BAYLAT y Especificaciones de la Plataforma OASys (Stand 09/2026)")[
  El presente documento técnico compila la totalidad de los datos, formularios, estructuras tabulares y justificaciones estratégicas requeridas para la postulación a la convocatoria *Förderprogramm zur Anschubfinanzierung für neue Forschungsprojekte zwischen Bayern und Lateinamerika (BAYLAT)*. El flujo del documento reproduce con exactitud las 10 pantallas operativas del sistema telemático OASys (*Online-Antragsverwaltungssystem*), garantizando estricta adherencia a los límites máximos de caracteres por campo de texto y a los requisitos de idioma bilingüe (Alemán y Español) y trilingüe en metadatos, conforme a la guía oficial (*03_Leitfaden_Antrag_mit_OASys.pdf*).
]

= Estructura de Navegación por Pantallas en OASys

#table(
  columns: (1.2fr, 2fr, 1.8fr, 3.5fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  align: (center, left, left, left),
  table.header([Pantalla], [Denominación OASys], [Módulo / Función], [Requisitos y Restricciones Operativas]),
  [Screen 1], [Antragserstellung / Stammdaten], [Creación y Metadatos], [Títulos (<= 400 c), Descriptores (<= 200 c), Clasificación ERC PE6/PE4/LS9.],
  [Screen 2], [Projektübersicht / Zugang], [Seguridad y Gobernanza], [Generación de Token (8 caracteres), recuperación de sesión y co-edición.],
  [Screen 3], [Projektpartner (P1 / P2)], [Perfiles Institucionales], [P1 (DIT, Baviera) y P2 (UdC, Colombia); Kurzprofil individual <= 1.000 c.],
  [Screen 4], [Projektbeschreibung], [Contenido Científico], [Mehrwert (<= 1.000 c), Kurzfassung (<= 2.000 c), Ausführlich (<= 10.000 c).],
  [Screen 5], [Expertise / Finanzierung], [Financiamiento Semilla], [Drittmittel anterior; Justificación Anschub (<= 2.000 c); DFG (<= 1.000 c).],
  [Screen 6], [Organisation], [Plan de Trabajo y Ética], [Cronograma breve (<= 2.000 c) + Matriz 12 meses; Doppelförderungsausschluss.],
  [Screen 7], [Reiseverwaltung], [Movilidad Bilateral], [2 viajes bilaterales (DIT->UdC M2; UdC->DIT M11); cálculo viáticos BayRKG.],
  [Screen 8], [Nachwuchswissenschaftler], [Jóvenes Investigadores], [Perfiles estructurados de estudiantes de maestría, doctorado y pregrado.],
  [Screen 9], [Dateiverwaltung], [Gestión Documental], [Checklist interactivo y repositorio de anexos en PDF (máximo 5 MB c/u).],
  [Screen 10], [Abschluss / Einreichung], [Cierre y Firma Postal], [Validación final, exportación a DOCX, envío digital y firma física postal.]
)

// =============================================================================
// SCREEN 1: ANTRAGSERSTELLUNG & ALLGEMEINE STAMMDATEN
// =============================================================================

= Screen 1: Antragserstellung & Allgemeine Stammdaten (Metadatos del Proyecto)

#callout(title: "Regla de Pantalla 1 — Directriz de Idioma y Límites de Entrada")[
  *Límites de plataforma:* Títulos en Alemán, Español e Inglés con un límite estricto de 400 caracteres con espacios cada uno. Descriptores temáticos (Stichwörter) con límite estricto de 200 caracteres con espacios cada uno. Clasificación científica primaria y secundaria obligatoria en la taxonomía ERC (*European Research Council*).
]

== 1.1 Metadatos Generales de la Convocatoria

#table(
  columns: (1fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Parámetro de Convocatoria], [Valor Registrado en OASys]),
  [Förderprogramm], [Förderprogramm zur Anschubfinanzierung für neue Forschungsprojekte zwischen Bayern und Lateinamerika (BAYLAT)],
  [Ausschreibungsrunde], [Aufruf 2026 / 2027 — Anschubfinanzierung bilateraler Spitzenforschung],
  [Antragstellende Institution (Baviera)], [Deggendorf Institute of Technology (Technische Hochschule Deggendorf – DIT)],
  [Kooperationspartner (Lateinamerika)], [Universidad de Cartagena (UdC), Cartagena de Indias, Colombia],
  [Geplante Projektlaufzeit], [12 Monate (01.02.2027 bis 31.01.2028)],
  [Art der Kooperation], [Erstkontakt / Aufbau einer neuen zukunftsweisenden strategischen Forschungspartnerschaft],
  [Ziel-Folgeprogramm], [DFG-Minciencias Bilateral Research Grants (Joint Call Deutsche Forschungsgemeinschaft & Minciencias)]
)

== 1.2 Títulos Trilingües del Proyecto (Projekttitel — Máx. 400 caracteres)

#table(
  columns: (0.8fr, 3.2fr, 0.7fr, 0.7fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  align: (center, left, center, center),
  table.header([Idioma], [Título Oficial Registrado en Plataforma], [Longitud], [Límite]),
  [DE], [#titel_de], [132 c], [400 c],
  [ES], [#titel_es], [159 c], [400 c],
  [EN], [#titel_en], [129 c], [400 c]
)

== 1.3 Descriptores Temáticos y Palabras Clave (Stichwörter — Máx. 200 caracteres)

#table(
  columns: (0.8fr, 3.2fr, 0.7fr, 0.7fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  align: (center, left, center, center),
  table.header([Idioma], [Palabras Clave Registradas (Descriptores OASys)], [Longitud], [Límite]),
  [DE], [#stichwoerter_de], [159 c], [200 c],
  [ES], [#stichwoerter_es], [180 c], [200 c],
  [EN], [#stichwoerter_en], [162 c], [200 c]
)

== 1.4 Clasificación Científica según Taxonomía ERC (European Research Council)

#table(
  columns: (1fr, 1.2fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Nivel], [Código ERC], [Denominación Oficial y Subcategorías Disciplinares]),
  [*Primario*], [PE6 Informatics and Computer Science], [PE6_11 Machine learning, statistical data processing, pattern recognition; PE6_12 Scientific computing, simulation and modelling tools.],
  [*Secundario 1*], [PE4 Physical and Analytical Chemical Sciences], [PE4_1 Physical chemistry; PE4_5 Analytical chemistry, chemical instrumentation, separation techniques, spectroscopic methods (FTIR/ATR).],
  [*Secundario 2*], [LS9 Applied Life Sciences], [LS9_9 Food sciences: food chemistry, food safety, post-harvest technology, agro-food matrix stability.]
)

// =============================================================================
// SCREEN 2: PROJEKTÜBERSICHT & ZUGANGSSCHLÜSSEL
// =============================================================================

= Screen 2: Projektübersicht & Zugangsschlüssel (Gobernanza y Seguridad)

#callout(title: "Regla de Pantalla 2 — Gestión del Token y Acceso Colaborativo")[
  *Procedimiento de seguridad:* Tras la creación inicial del expediente, OASys emite un código alfanumérico único (*Zugangsschlüssel / Token*) de 8 dígitos. Dicho token permite retomar la sesión, transferir privilegios de edición técnica entre el solicitante bávaro (DIT) y el socio latinoamericano (UdC), y bloquear la edición previa a la transmisión irreversible.
]

#table(
  columns: (1.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Elemento del Sistema], [Descripción de la Configuración de Sesión]),
  [Estado del Expediente], [In Bearbeitung (Expediente abierto para postulación bilateral 2026/2027)],
  [Zugangsschlüssel (Token)], [BAY-2026-X8K9 (Identificador criptográfico de acceso compartido DIT / UdC)],
  [Datenschutzerklärung], [Aceptada formalmente por el Investigador Principal bávaro el 17.09.2026],
  [Co-edición Transatlántica], [Habilitada para intercambio y revisión simultánea de textos técnicos entre Deggendorf y Cartagena],
  [Bloqueo Telemático], [Se activa al presionar "Antrag endgültig abschicken" previo a la fecha límite oficial]
)

// =============================================================================
// SCREEN 3: PROJEKTPARTNER (PERFILES INSTITUCIONALES Y DE INVESTIGADORES)
// =============================================================================

= Screen 3: Projektpartner (Datos Institucionales y de los Investigadores)

#callout(title: "Regla de Pantalla 3 — Requisitos de Perfil y Elegibilidad")[
  *Directriz de elegibilidad:* Cada investigador solicitante y socio de viaje debe contar con un perfil biográfico sintético (*Kurzprofil*) de máximo 1.000 caracteres con espacios. Según el manual de BAYLAT, los viajeros sin Kurzprofil registrado en plataforma quedan inhabilitados para recibir reembolso de viáticos y pasajes.
]

== 3.1 Partner 1: Antragsteller (Baviera, Alemania) — Technische Hochschule Deggendorf

#table(
  columns: (1.1fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Campo de Registro], [Datos Oficiales del Solicitante Bávaro]),
  [Institution], [Technische Hochschule Deggendorf (Deggendorf Institute of Technology – DIT)],
  [Fakultät / Institut], [Fakultät für Angewandte Informatik / KI-Campus Deggendorf],
  [Projektverantwortlicher (PI)], [Prof. Dr. [Nombre del Investigador Principal - DIT]],
  [Akademischer Grad / Funktion], [Prof. Dr. rer. nat. / W2-Professor für Angewandte Künstliche Intelligenz und Data Science],
  [Dienstadresse], [Dieter-Görlitz-Platz 1, 94469 Deggendorf, Freistaat Bayern, Deutschland],
  [Kontakt], [E-Mail: pi.applied-ai [at] th-deg.de | Tel: +49 (0) 991 3615-800],
  [Rechtsverbindliche Unterschrift], [Präsident der TH Deggendorf / Dekan der Fakultät für Angewandte Informatik]
)

#block(inset: 6pt, stroke: 0.5pt + luma(180), radius: 2pt)[
  *Kurzprofil des Antragstellers (DIT — Máx. 1.000 caracteres con espacios | Actual: 457 c):*
  \
  Prof. Dr. [Nombre del Investigador Principal - DIT] leitet die Forschungsgruppe für Maschinelles Lernen und Angewandte Künstliche Intelligenz am DIT. Seine/Ihre Expertise umfasst moderne neuronale Architekturen, Deep-Learning-Methoden für multivariate Zeitreihen, spektrale Datenanalyse sowie Physik-informierte neuronale Netze (PINNs). Das Institut verfügt über modernste GPU-Computing-Cluster für rechenintensive Modellierungen, Modellkomprimierung und Edge-AI.
]

== 3.2 Partner 2: Kooperationspartner (Colombia) — Universidad de Cartagena

#table(
  columns: (1.1fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Campo de Registro], [Datos Oficiales del Socio Cooperador Latinoamericano]),
  [Institution], [Universidad de Cartagena (UdC)],
  [Fakultät / Institut], [Facultad de Ciencias Exactas y Naturales / Programa de Química],
  [Projektverantwortlicher (PI)], [Dr. [Nombre del Investigador Principal - UdC]],
  [Akademischer Grad / Funktion], [Ph.D. en Ciencias Químicas / Profesor Titular e Investigador en Química Analítica],
  [Dienstadresse], [Campus San Agustín / Sede Claustro de San Agustín, Cra. 6 \#36-100, Cartagena de Indias, Colombia],
  [Kontakt], [E-Mail: pi.quimica [at] unicartagena.edu.co | Tel: +57 (605) 660-0102],
  [Profil der Hochschule], [Staatliche Hochschule (gegr. 1827) mit institutioneller Exzellenzakkreditierung im Karibikraum.]
)

#block(inset: 6pt, stroke: 0.5pt + luma(180), radius: 2pt)[
  *Kurzprofil des Kooperationspartners (UdC — Máx. 1.000 caracteres con espacios | Actual: 468 c):*
  \
  Dr. [Nombre del Investigador Principal - UdC] ist Experte für chemische Analytik, Stabilitätsstudien und Qualitätsbewertung agroalimentärer Rohstoffe. Sein/Ihr Forschungsschwerpunkt liegt auf der Kinetik des physikochemischen Abbaus, Lipid- und Polyphenoloxidation sowie standardisierten spektroskopischen und nasschemischen Messverfahren bei Kakao, Kaffee, Honig und pflanzlichen Ölen. Er/Sie leitet das Labor für instrumentelle Analytik und Naturstoffchemie an der UdC.
]

// =============================================================================
// SCREEN 4: PROJEKTBESCHREIBUNG (STRATEGISCHE BEGRÜNDUNG & KERNTEXTE)
// =============================================================================

= Screen 4: Projektbeschreibung (Estrategia, Resúmenes y Memoria Detallada)

#callout(title: "Regla de Pantalla 4 — Cumplimiento Estricto de Presupuestos de Caracteres")[
  *Control de caracteres con espacios en los campos de entrada de Screen 4:*
  - *Warum wurde(n) diese(r) Partner gewählt? (Mehrwert):* Máximo estricto de *1.000 caracteres*.
  - *Bezug zur Internationalisierungsstrategie:* Máximo estricto de *2.000 caracteres*.
  - *Kurzbeschreibung des Projektes (Kurzfassung):* Máximo estricto de *2.000 caracteres*.
  - *Ausführliche Projektbeschreibung:* Máximo estricto de *10.000 caracteres*.
  Todos los textos han sido optimizados y validados para ingresar íntegros sin riesgo de truncamiento.
]

== 4.1 Warum wurde(n) diese(r) Partner gewählt? (Mehrwert des Projektpartners — Máx. 1.000 caracteres)

#table(
  columns: (1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Fassung in deutscher Sprache (916 / 1.000 c)], [Versión en lengua española (950 / 1.000 c)]),
  [#mehrwert_de],
  [#mehrwert_es]
)

== 4.2 Bezug zur Internationalisierungsstrategie (Máx. 2.000 caracteres)

#table(
  columns: (1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Fassung in deutscher Sprache (884 / 2.000 c)], [Versión en lengua española (817 / 2.000 c)]),
  [#internationalisierung_de],
  [#internationalisierung_es]
)

== 4.3 Kurzbeschreibung des Projektes (Kurzfassung — Máx. 2.000 caracteres)

#table(
  columns: (1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Kurzfassung DE (1.926 / 2.000 c)], [Kurzfassung ES (1.776 / 2.000 c)]),
  [#kurzfassung_de],
  [#kurzfassung_es]
)

== 4.4 Ausführliche Projektbeschreibung (Máx. 10.000 caracteres)

#table(
  columns: (1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Ausführliche Beschreibung DE (5.922 / 10.000 c)], [Descripción Detallada ES (6.583 / 10.000 c)]),
  [#ausfuehrlich_de],
  [#ausfuehrlich_es]
)

== 4.5 Folgeantrag / Vorherige Förderung (Declaración de Antecedentes BAYLAT)

#table(
  columns: (1.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Parámetro de Antecedentes], [Declaración Registrada en OASys]),
  [Handelt es sich um einen Folgeantrag?], [Nein (Erstantrag im Förderprogramm BAYLAT-Anschubfinanzierung).],
  [Vorheriges Aktenzeichen / Titel], [Entfällt (Keine vorherige Finanzierung durch BAYLAT vorhanden).],
  [Strategische Einordnung], [Initialförderung zur Grundlegung einer neuen dauerhaften Forschungspartnerschaft.]
)

// =============================================================================
// SCREEN 5: EXPERTISE UND FINANZIERUNG
// =============================================================================

= Screen 5: Expertise und Finanzierungsbegründung (Drittmittel & Anschlussförderung)

#callout(title: "Regla de Pantalla 5 — Justificación de la Financiación Inicial")[
  *Requisito sustantivo de evaluación:* BAYLAT exige demostrar por qué el proyecto requiere financiamiento semilla (*Anschubfinanzierung*) y cómo se proyecta hacia una convocatoria de gran envergadura (DFG, Horizon Europe, BMBF).
]

== 5.1 Bisherige Drittmittelerfahrung der beteiligten Projektleiter

#table(
  columns: (0.9fr, 1.3fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Institution], [Fördergeber / Programm], [Fokus und Drittmittelkompetenz]),
  [DIT (Baviera)], [Bayerische Forschungsstiftung / Hightech Agenda Bayern], [KI-Transferprojekte, Deep Learning für Sensordaten, Edge-Computing.],
  [DIT (Baviera)], [BMBF (Bundesministerium für Bildung und Forschung)], [Verbundprojekte zu angewandtem maschinellem Lernen und Industrie-4.0-Analytik.],
  [UdC (Colombia)], [Minciencias (Ministerio de Ciencia, Tecnología e Innovación)], [Proyectos nacionales de valorización de recursos biológicos y calidad alimentaria.],
  [UdC (Colombia)], [Sistema General de Regalías (SGR Colombia)], [Fortalecimiento de laboratorios de química analítica y desarrollo de bioproductos.]
)

== 5.2 Weshalb ist keine andere Finanzierung möglich? (Máx. 2.000 caracteres | Actual: 990 c)

#block(inset: 8pt, stroke: 0.5pt + rgb("#2b2b2b"), fill: rgb("#fafbfc"), radius: 2pt)[
  #warum_keine_andere_foerderung
]

== 5.3 Bezug zu einer Ausschreibung / Zukünftiger Drittmittelantrag (Máx. 1.000 caracteres | Actual: 583 c)

#block(inset: 8pt, stroke: 0.5pt + rgb("#2b2b2b"), fill: rgb("#fafbfc"), radius: 2pt)[
  #bezug_ausschreibung
]

// =============================================================================
// SCREEN 6: ORGANISATION, ARBEITSPLAN & DOPPELFÖRDERUNGSAUSSCHLUSS
// =============================================================================

= Screen 6: Organisation, Arbeitsplan und Doppelförderungsausschluss

#callout(title: "Regla de Pantalla 6 — Plan de Trabajo y Cronograma (12 Meses)")[
  *Formato dual de entrega:* OASys contempla un área de texto sintética (*Kurzer Zeit- und Arbeitsplan*, máx. 2.000 caracteres con espacios) que se transfiere automáticamente a la plantilla DOCX exportable, complementada por la matriz detallada de 4 paquetes de trabajo (AP/WP), entregables e hitos.
]

== 6.1 Kurzer Zeit- und Arbeitsplan für das OASys-Eingabefeld (Máx. 2.000 caracteres | Actual: 1.838 c)

#block(inset: 8pt, stroke: 0.5pt + rgb("#2b2b2b"), fill: rgb("#fafbfc"), radius: 2pt)[
  #arbeitsplan_kurz
]

== 6.2 Matriz Exhaustiva del Plan de Trabajo de 12 Meses (4 Paquetes de Trabajo, Entregables e Hitos)

#table(
  columns: (0.6fr, 1.4fr, 0.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Monat], [Arbeitspaket (AP)], [Lead], [Aktivitäten, Entregables (D) und Meilensteine (M)]),
  [M1], [AP1: Versuchsplanung], [UdC], [Beschaffung und botanische Verifizierung von Kakao, Kaffee, Honig und Kokosöl; Kalibrierung der Klimakammern (25 °C, 40 °C, 60 °C; 60%, 75% r.F.).],
  [M2], [AP1: Standardisierung], [UdC/DIT], [*Workshop 1 (Präsenz in Cartagena):* Standardisierung der ATR-FTIR-Spektrenakquise und AOAC/ISO-Standardanalytik; Festlegung Datenprotokoll. *Entregable D1.1: Protokollhandbuch*.],
  [M3], [AP2: Kinetik-Start], [UdC], [Start der akzelerierten Alterung; Baseline-Scans ($t_0$) und periodische FTIR-Messungen ($t_1$); Bestimmung Peroxidzahl (AOAC 965.33), Säuregrad, UV-Vis HMF (AOAC 980.23).],
  [M4], [AP2: Monitoring & AP1], [UdC], [Fortführung der FTIR-Zeitreihen; Messung von Polyphenolen (Folin-Ciocalteu) und °Brix. *Meilenstein M1: Standardisiertes Messprotokoll und Pilotdatensatz etabliert*.],
  [M5], [AP2: Datenkonsolidierung], [UdC/DIT], [Erste Datenübergabe an DIT; Datenvorverarbeitung (SNV, MSC, Savitzky-Golay); Bereinigung von CO₂/H₂O-Atmosphärenbanden. *Entregable D1.2: Bereinigter Rohdatensatz*.],
  [M6], [AP3: PIML-Implementierung], [DIT], [GPU-Implementierung der Stufe-1-Modelle (1D-CNN, Spectral Transformer mit SAM, GNN) und Stufe-2-Modelle (LSTM, Mamba) am KI-Campus des DIT.],
  [M7], [AP2/AP3: Labor & PIML], [UdC/DIT], [Abschluss der experimentellen Stabilitätsreihen an der UdC; Formulierung der physikalischen Straffunktionen (PINN Arrhenius und Neural ODEs) am DIT.],
  [M8], [AP3: Faktorielles Tuning], [DIT], [Faktorielles Modelltraining und Kreuzvalidierung (Leave-One-Batch-Out). *Entregable D2.1: Vollständige Spektral- und Referenzdatenbank*. *Meilenstein M2: Experimentelle Alterungsdatenbank konsolidiert*.],
  [M9], [AP3: Architekturauswahl], [DIT/UdC], [Multikriterielle Pareto-Entscheidungsfindung (Genauigkeit, chemische Kausalität, Inferenzlatenz < 2 s auf Edge-Hardware). *Meilenstein M3: Optimale Modellarchitektur ausgewählt*.],
  [M10], [AP3/AP4: XAI & Edge-AI], [DIT/UdC], [XAI-Aufmerksamkeitsanalyse zur Zuordnung diagnostischer Schwingungsbanden; Prototyp-Deployment auf Single-Board-Computer (Raspberry Pi). *Entregable D3.1: Benchmark- und XAI-Bericht*.],
  [M11], [AP4: Bilaterale Synthese], [DIT/UdC], [*Workshop 2 (Präsenz in Deggendorf):* Gesamtsynthese der Ergebnisse; Finalisierung von 2 gemeinsamen Fachpublikationen; Ausarbeitung des DFG-Minciencias-Verbundantrags.],
  [M12], [AP4: Antrag & Abschluss], [DIT/UdC], [Einreichung des gemeinsamen DFG-Minciencias-Vollantrags; Fertigstellung des Abschlussberichts an BAYLAT. *Entregable D4.1: Zwei Open-Access-Manuskripte*. *Entregable D4.2: DFG-Minciencias-Antrag*. *Meilenstein M4: Vollantrag eingereicht und Projektabschluss*.]
)

== 6.3 Erklärung zum Ausschluss von Doppelförderung (Doppelförderungsausschluss)

#table(
  columns: (1.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Prüfpunkt im Formular], [Offizielle Erklärung im OASys-System]),
  [Wurden für dieses Projekt weitere Anträge gestellt?], [Nein.],
  [Erklärung zur Ausschließlichkeit], [Hiermit wird bestätigt, dass für dieselben Projektaktivitäten und Reisekosten keine parallelen Förderanträge bei anderen Stellen eingereicht wurden oder werden.],
  [Rechtliche Verbindlichkeit], [Rechtsverbindlich bestätigt durch den Antragsteller im Rahmen der postalischen Unterschrift.]
)

// =============================================================================
// SCREEN 7: REISEVERWALTUNG & MOBILITÄTSPLANUNG
// =============================================================================

= Screen 7: Reiseverwaltung und Mobilitätsplanung (Reise- und Budgetmatrix)

#callout(title: "Regla de Pantalla 7 — Directrices de Gestión de Viajes y Gastos de Estancia")[
  *Normativa de viáticos y pasajes:* La financiación de BAYLAT se destina exclusivamente a gastos de viaje y dietas de estancia para científicos de ambas instituciones según el Bayerisches Reisekostengesetz (BayRKG) y las tarifas del DAAD. Los gastos de equipamiento o reactivos son aportados como contrapartida institucional.
]

== 7.1 Planificación de Misiones Científicas Bilaterales

#table(
  columns: (0.7fr, 1.1fr, 0.9fr, 1fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Misión], [Ruta de Viaje], [Mes / Duración], [Participantes], [Objetivos Específicos de Trabajo]),
  [Reise 1], [Deggendorf (DIT) -> Cartagena (UdC)], [Monat 2 (7–10 Tage)], [Prof. Dr. [PI DIT] + 1 Nachwuchswissenschaftler (DIT)], [*Workshop 1 an der UdC:* Standardisierung der ATR-FTIR-Messungen, Kalibrierung der Klimakammern, Vereinbarung des Datenübertragungsprotokolls.],
  [Reise 2], [Cartagena (UdC) -> Deggendorf (DIT)], [Monat 11 (10–14 Tage)], [Dr. [PI UdC] + 1 Nachwuchswissenschaftler (UdC)], [*Workshop 2 am DIT:* Auswertung aller Validierungsdaten, Modell-Benchmarking auf GPU-Clustern, Ausarbeitung des DFG-Minciencias-Antrags.]
)

== 7.2 Estimación Presupuestal Consolidada de la Movilidad Bilateral

#table(
  columns: (1fr, 0.8fr, 0.8fr, 0.8fr, 1.6fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  align: (left, center, center, center, left),
  table.header([Kostenkategorie], [Reise 1 (DIT->UdC)], [Reise 2 (UdC->DIT)], [Gesamtbetrag], [Berechnungsgrundlage]),
  [Flugkosten (Hin- und Rückflug)], [2.200 €], [2.400 €], [4.600 €], [2 Personen je Reise, Economy-Tarife Transatlantik],
  [Aufenthaltskosten / Tagegelder], [1.400 €], [2.200 €], [3.600 €], [Tagegelder & Hotel nach BayRKG / DAAD-Pauschalen],
  [Inlandstransfers & Visa/Versicherung], [400 €], [400 €], [800 €], [Flughafentransfer, Auslandskrankenversicherung],
  [*Gesamtsumme Mobilität*], [*4.000 €*], [*5.000 €*], [*9.000 €*], [*Beantragtes Gesamtbudget bei BAYLAT*]
)

// =============================================================================
// SCREEN 8: NACHWUCHSWISSENSCHAFTLER
// =============================================================================

= Screen 8: Nachwuchswissenschaftler (Beteiligung von Nachwuchskräften)

#callout(title: "Regla de Pantalla 8 — Promoción del Relevo Científico")[
  *Criterio de priorización:* BAYLAT valora positivamente la inclusión activa de jóvenes investigadores en formación (estudiantes de pregrado, maestría y doctorado), garantizando un efecto multiplicador formativo y transferencia transatlantica de capacidades.
]

== 8.1 Registro Estructurado de Jóvenes Investigadores Participantes

#table(
  columns: (1.1fr, 1fr, 1fr, 1fr, 1.9fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Name / Vorname], [Institution], [Fachrichtung], [Abschluss / Ziel], [Rolle und Arbeitsschwerpunkt im Projekt]),
  [[Nachwuchs DIT 1]], [TH Deggendorf], [Angewandte Informatik], [B.Sc. -> M.Sc. Applied AI], [Entwicklung von Spektral-Transformern, Mamba-Modellen und XAI-Pipelines auf GPU-Clustern.],
  [[Nachwuchs UdC 1]], [Univ. de Cartagena], [Chemie / Analytik], [Químico -> M.Sc. Química], [Durchführung kontrollierter Alterungsversuche, ATR-FTIR-Spektrenakquise und Datenpflege.],
  [[Nachwuchs UdC 2]], [Univ. de Cartagena], [Chemie], [Pregrado -> Químico (Tesis)], [Standardisierte Nassanalysen (AOAC 965.33 Peroxidzahl, UV-Vis 5-HMF nach AOAC 980.23).]
)

// =============================================================================
// SCREEN 9: DATEIVERWALTUNG & CHECKLISTE
// =============================================================================

= Screen 9: Dateiverwaltung & Checkliste (Verwaltung der Upload-Dateien)

#callout(title: "Regla de Pantalla 9 — Restricciones de Carga Documental")[
  *Requisitos técnicos de anexos:* Solo se admiten archivos en formato PDF con un tamaño máximo estricto de *5 MB por archivo*. Todos los documentos deben estar debidamente identificados y firmados donde corresponda.
]

== 9.1 Lista de Verificación y Documentos Obligatorios para la Carga Telemática

#table(
  columns: (0.5fr, 1.8fr, 1.2fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  align: (center, left, left, left),
  table.header([Status], [Erforderliches Dokument], [Dateityp / Limit], [Spezifikation und Zweck im Antragsverfahren]),
  [[X]], [Wissenschaftliches Exposé (Vollversion)], [PDF (<= 5 MB)], [Ausführliche wissenschaftlich-technische Projektbeschreibung (Memoria técnica).],
  [[X]], [Curriculum Vitae PI DIT (Baviera)], [PDF (<= 5 MB)], [Akademischer Werdegang, Publikationsverzeichnis (KI/ML) und Drittmittelerfahrung.],
  [[X]], [Curriculum Vitae PI UdC (Kolumbien)], [PDF (<= 5 MB)], [Akademischer Werdegang, Publikationen (Chemie/Spektroskopie) und Forschungsprojekte.],
  [[X]], [Curriculum Vitae Nachwuchskräfte], [PDF (<= 5 MB)], [Kurzlebensläufe der teilnehmenden Studierenden / Promovierenden beider Hochschulen.],
  [[X]], [Letter of Intent (Kooperationsabkommen)], [PDF (<= 5 MB)], [Rechtsverbindliche Kooperationsabsichtserklärung der Hochschulleitungen DIT und UdC.],
  [[X]], [Befürwortungsschreiben Fakultät / IO], [PDF (<= 5 MB)], [Unterstützungsschreiben des International Office und der zuständigen Dekanate.],
  [[X]], [Reisekostenkalkulation (Detailliert)], [PDF (<= 5 MB)], [Detaillierte Aufstellung der Flug-, Übernachtungs- und Tagegeldpauschalen.]
)

// =============================================================================
// SCREEN 10: ABSCHLUSS, VALIDIERUNG, DOCX-EXPORT & POSTALISCHE EINREICHUNG
// =============================================================================

= Screen 10: Abschluss, Validierung, DOCX-Export & Postalische Einreichung

#callout(title: "Regla de Pantalla 10 — Protocolo Formal de Doble Envío (Digital y Postal)")[
  *Procedimiento de validez jurídica (BAYLAT Leitfaden p. 20-21):*
  1. *Validierung:* Comprobación electrónica automática de campos obligatorios y límites de caracteres en OASys.
  2. *Exportieren (DOCX):* Generación del documento Word oficial poblado directamente desde la base de datos de OASys. No se permiten alteraciones de contenido fáctico en el Word.
  3. *Antrag endgültig abschicken:* Transmisión electrónica definitiva en la plataforma antes de la fecha límite (proceso irreversible).
  4. *Postalischer Nachlauf:* El documento Word oficial generado debe imprimirse, ser suscrito con *firma jurídica vinculante del Investigador Principal bávaro (DIT)* y remitirse por correo postal a la sede de BAYLAT en Erlangen en el plazo máximo estricto de *1 semana tras la fecha límite electrónica*.
]

#table(
  columns: (1fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Schritt im Antragsabschluss], [Operative Maßnahmen und Nachweisführung]),
  [Schritt 1: System-Prüfung], [Erfolgreiche Validierung aller Mussfelder, ERC-Codes und Textbudgets in Screen 1 bis 9.],
  [Schritt 2: DOCX-Generierung], [Herunterladen des automatisch befüllten Antragsformulars zur Drucklegung und Archivierung.],
  [Schritt 3: Elektronisches Abschicken], [Auslösung des finalen Sendebefehls; Sperrung des Systems für nachträgliche Bearbeitungen.],
  [Schritt 4: Rechtsverbindliche Signatur], [Originalunterschrift des Projektverantwortlichen der TH Deggendorf auf dem Deckblatt.],
  [Schritt 5: Postalischer Versand], [Postalischer Eingang der unterschriebenen Papierfassung bei BAYLAT (Erlangen) binnen 7 Tagen.]
)

// =============================================================================
// REFERENCIAS Y FUNDAMENTACIÓN TÉCNICA
// =============================================================================

= Referencias Científicas y Fundamentación Bibliográfica

La formulación técnica de los objetivos, la selección de matrices agroalimentarias y el espacio factorial de arquitecturas neuronales informadas por la física adoptadas en este formulario se fundamentan en la literatura científica especializada:

- Codificación espectral mediante redes neuronales convolucionales adaptadas al ancho de banda vibracional y mecanismos de atención espectral: @passos2605convolutionalneuralnetworks, @upadhyay2026enhancingspectralanalysis, @feng2021applicationofvisibleinfrared, @boadu2024developinganovel.
- Modelado temporal eficiente de trayectorias espectrales continuas mediante modelos de espacio de estados selectivos: @li2026asgmambaadaptivespectral.
- Regularización física mediante redes neuronales informadas por física (PINN) y ecuaciones diferenciales neuronales bajo leyes cinéticas: @perre2025towardmechanisticmodels, @pronk2026neuralnetworkplacementin, @felizzato2025datafusionfor.
- Autenticidad espectroscópica y cinética de degradación en matrices agroalimentarias y lípidos: @widiarto2026detectionofadulteration, @grundy2025reviewofcurrent.

#bibliography("references.bib", title: [Literaturverzeichnis / Referencias Bibliográficas])
