#import "typst-scientific-report-template/template.typ": project, callout

#show: project.with(
  title: [Formulario Oficial de Postulación OASys / BAYLAT-Anschubfinanzierung],
  subtitle: [Bayerisches Hochschulzentrum für Lateinamerika (BAYLAT) — Convocatoria de Financiamiento Inicial para Nuevos Proyectos de Investigación entre Baviera y América Latina],
  objective: [
    Presentación técnica formal y estructurada de todos los campos reglamentarios, especificaciones de pantallas (Screen 1 a Screen 10) y restricciones estrictas de caracteres de la plataforma telemática OASys (Stand 09/2026) para la postulación conjunta entre la Technische Hochschule Deggendorf (DIT, Alemania; PI: Prof. Dr. Isabel Suárez) y la Universidad de Cartagena (UdC, Colombia; PI: Prof. Dr. Ricardo Vivas), orientada a la predicción autónoma de la cinética de degradación en café especial colombiano (Coffea arabica) mediante espectroscopía ATR-FTIR y Deep Learning informado por la física (PIML), en comparación con métodos clásicos de Machine Learning.
  ],
  authors: (
    "Prof. Dr. Isabel Suárez — Deggendorf Institute of Technology (DIT), Fakultät für Angewandte Informatik / KI-Campus",
    "Prof. Dr. Ricardo Vivas — Universidad de Cartagena (UdC), Facultad de Ciencias Exactas y Naturales / Química",
  ),
  date: "17 de septiembre de 2026",
  doc_id: "OASYS-BAYLAT-2026-DIT-UDC",
  header_title: "BAYLAT OASys — Formulario Oficial de Postulación (DIT / UdC)",
)

// =============================================================================
// DEFINICIÓN DE BLOQUES DE TEXTO PARAMETRIZADOS PARA VALIDACIÓN REGLAMENTARIA
// =============================================================================

#let titel_de = "Künstliche Intelligenz und Spektroskopie zur Bewertung der Lebensmittelqualität"
#let titel_es = "Inteligencia Artificial y Espectroscopía para la Evaluación de la Calidad de los Alimentos"
#let titel_en = "Artificial Intelligence and Spectroscopy for Food Quality Assessment"

#let stichwoerter_de = "FTIR-Spektroskopie, Spezialitätenkaffee, Abbaukinetik, Physik-informiertes Deep Learning, PINN, Chemometrie, PLSR, DIT, UdC, Kolumbien."
#let stichwoerter_es = "Espectroscopía FTIR, Café especial, Cinética de degradación, Deep Learning informado por la física, PINN, Quimiometría, PLSR, DIT, UdC, Colombia."
#let stichwoerter_en = "FTIR spectroscopy, Specialty coffee, Degradation kinetics, Physics-informed deep learning, PINN, Chemometrics, PLSR, DIT, UdC, Colombia."

#let mehrwert_de = [Die Kooperation zwischen der Technischen Hochschule Deggendorf (DIT) und der Universidad de Cartagena (UdC) begründet eine exzellente wissenschaftliche Synergie. Die UdC (Arbeitsgruppe Prof. Dr. Ricardo Vivas) steuert ausgewiesene Expertise in chemischer Analytik, direkten Zugang zu zertifiziertem kolumbianischem Spezialitätenkaffee (Coffea arabica) sowie die Durchführung kontrollierter Lagerungsstudien, ATR-FTIR-Spektroskopie und normierter Referenzanalysen (AOAC) bei. Das DIT (Arbeitsgruppe Prof. Dr. Isabel Suárez) bringt Spitzenkompetenz in Angewandter KI ein: Formulierung Physik-informierter Neuronaler Netze (PINN mit Arrhenius-Kinetik), Benchmark gegen klassische Chemometrie (PLSR, SVR) und explorative Architekturen (Mamba SSM, Transformers) auf GPU-Clustern. Der Mehrwert liegt in der Kopplung realer Abbaukinetik mit physikalisch reguliertem Deep Learning und der bilateralen Nachwuchsförderung via Workshops in Cartagena und Forschungsaufenthalte in Bayern.]
#let mehrwert_es = [La cooperación entre el Deggendorf Institute of Technology (DIT) y la Universidad de Cartagena (UdC) establece una sinergia científica estratégica. La UdC (grupo del Prof. Dr. Ricardo Vivas) aporta liderazgo en química analítica y computacional, acceso a café especial colombiano certificado (Coffea arabica) y la ejecución de ensayos de almacenamiento bajo monitoreo ambiental continuo, barrido espectral ATR-FTIR y analítica normatizada (AOAC). El DIT (grupo de la Prof. Dr. Isabel Suárez) aporta capacidades avanzadas en IA Aplicada: formulación de redes neuronales informadas por física (PINN con cinética de Arrhenius), benchmarking frente a quimiometría clásica (PLSR, SVR) y exploración de arquitecturas avanzadas (Mamba SSM, Transformers) en GPUs. El valor agregado reside en fusionar cinética química real con Deep Learning interpretable, capacitando investigadores mediante workshops en Cartagena y estancias en Deggendorf hacia un proyecto mayor DFG-Minciencias.]

#let internationalisierung_de = [Das Vorhaben fügt sich nahtlos in die Internationalisierungsstrategien beider Partner ein. Für die Technische Hochschule Deggendorf (DIT) forciert das Projekt die Internationalisierung des KI-Campus und etabliert nachhaltige Forschungsachsen mit Lateinamerika in zukunftsträchtigen Anwendungsfeldern smarter Lebensmittelanalytik und Bioökonomie. Für die Universidad de Cartagena (UdC) stärkt die Partnerschaft die globale Sichtbarkeit und den Wissenstransfer in modernen KI-Methoden für die Agrarchemie. Der bilaterale Workshop an der UdC und der Forschungsaufenthalt eines Nachwuchswissenschaftlers am DIT institutionalisieren die Zusammenarbeit und bereiten ein gemeinsames DFG-Minciencias-Projekt vor.]
#let internationalisierung_es = [La propuesta se alinea directamente con las directrices de internacionalización de ambas instituciones. Para el Deggendorf Institute of Technology (DIT), materializa la estrategia de proyectar sus capacidades en Inteligencia Artificial Aplicada hacia Colombia en bioeconomía y monitoreo alimentario inteligente. Para la Universidad de Cartagena (UdC), responde a las metas de visibilidad global, movilidad internacional y formación en IA mediante la visita de la Prof. Dr. Suárez para un workshop presencial y la estancia de investigación en Baviera, cimentando una alianza duradera hacia la convocatoria DFG-Minciencias.]

#let kurzfassung_de = [Gegenstand dieses bilateralen Kooperationsprojekts zwischen der Technischen Hochschule Deggendorf (DIT, Prof. Dr. Isabel Suárez) und der Universidad de Cartagena (UdC, Prof. Dr. Ricardo Vivas) ist die Entwicklung eines ressourceneffizienten, hybriden Ansatzes zur Modellierung und Vorhersage der zeitlichen Alterungskinetik von kolumbianischem Spezialitätenkaffee (Coffea arabica) mittels FTIR-Spektroskopie und Physics-Informed Deep Learning (PIML).
Konventionelle quimiometrische Verfahren (PLSR, SVR) erfassen spektrale Daten meist statisch und vernachlässigen physikochemische Kinetiken, während wiederholte chromatographische Analysen kostenintensiv sind. Das Projekt etabliert ein agiles Monitoring: Kaffeechargen werden unter realen tropischen Lagerbedingungen (mit kontinuierlichem Datalogger-Monitoring) longitudinal mittels ATR-FTIR erfasst und mit standardisierten Referenzwerten (AOAC: Feuchte, titrierbare Säure, Lipidperoxidation, Abbau von Chlorogensäuren) synchronisiert.
Die zentrale Forschungsfrage untersucht, inwiefern physikalisch regularisierte neuronale Netze (PINN mit Arrhenius-Straftermen für Reaktionskinetiken) klassische Chemometrie und rein datengetriebene Netze (1D-CNN) in Vorhersagegüte und Kausalität übertreffen, wobei moderne Sequenzmodelle (Mamba SSM, Spectral Transformers) explorativ evaluiert werden.
Die finale Modellauswahl erfolgt kriterienbasiert nach Genauigkeit, Interpretierbarkeit und physikochemischer Kausalität (XAI). Die UdC leitet Probenbereitstellung, Lagerungsversuche und Standardanalytik. Das DIT verantwortet Modellierung, physikalische Verlustfunktionen und XAI-Validierung.
Das Budget finanziert den Präsenz-Workshop zur KI-Spektroskopie an der UdC durch Prof. Dr. Suárez, den Forschungsaufenthalt eines UdC-Nachwuchswissenschaftlers am DIT sowie Kaffeematerialien, und bildet die Basis für einen DFG-Minciencias-Großantrag.]

#let kurzfassung_es = [Este proyecto bilateral entre el Deggendorf Institute of Technology (DIT, Prof. Dr. Isabel Suárez) y la Universidad de Cartagena (UdC, Prof. Dr. Ricardo Vivas) desarrolla un enfoque híbrido pionero para modelar y predecir la cinética de degradación en café especial colombiano (Coffea arabica) mediante espectroscopía FTIR y Deep Learning informado por la física (PIML).
Frente a la quimiometría estática convencional (PLSR, SVR) y el alto costo de análisis cromatográficos continuos, el proyecto implementa un monitoreo ágil y no destructivo: lotes de café se monitorean durante su almacenamiento bajo condiciones ambientales tropicales reales en el Caribe colombiano, adquiriendo espectros ATR-FTIR longitudinales acoplados a parámetros fisicoquímicos normatizados (AOAC: humedad, acidez titulable, peróxidos lipídicos y degradación de ácidos clorogénicos).
La pregunta científica central radica en determinar si redes neuronales informadas por principios físicos y químicos (PINN con cinética de Arrhenius) superan a métodos clásicos de Machine Learning y Deep Learning empírico (1D-CNN) en precisión e interpretabilidad causal, integrando de forma exploratoria arquitecturas emergentes (Mamba SSM y Transformers espectrales).
La selección de la mejor arquitectura se basa en precisión, explicabilidad y consistencia fisicoquímica causal (XAI). La UdC lidera el monitoreo de almacenamiento, adquisición FTIR y analítica estándar. El DIT lidera el diseño algorítmico, formulación física y explicabilidad (XAI).
El fondo semilla financia un workshop presencial de IA en la UdC impartido por la Prof. Dr. Suárez, la estancia de investigación de un joven científico de la UdC en el DIT y consumibles analíticos, cimentando una propuesta de gran escala DFG-Minciencias.]

#let ausfuehrlich_de = [1. Problemstellung, gesellschaftliche Relevanz und Gesamtziel
Kolumbianischer Spezialitätenkaffee (Coffea arabica) besitzt eine überragende sozioökonomische Bedeutung für kleinbäuerliche Erzeugergemeinschaften und den Exportmarkt des Landes. Die Premiumqualität und das komplexe Aromaprofil von Kaffeespezialitäten reagieren jedoch hochempfindlich auf Lagerungsbedingungen, Feuchtigkeit und Temperaturschwankungen. Während der Lagerung von Rohkaffee (Grünkaffee) und Röstkaffee treten fortschreitende chemische Degradationsprozesse auf: Oxidation ungesättigter Kaffeelipide, hydrolytischer und thermischer Abbau wertvoller Chlorogensäuren (5-CQA), Feuchtigkeitsaufnahme sowie kinetische Veränderungen der Wasseraktivität. Bisherige Qualitätsbewertungen erfordern entweder subjektive sensorische Cupping-Verfahren oder aufwendige, destruktive Laboranalysen (HPLC, GC-MS), die für ein kontinuierliches Monitoring vor Ort ungeeignet sind.
Das Gesamtziel dieses 12-monatigen bilateralen Kooperationsvorhabens zwischen der Technischen Hochschule Deggendorf (DIT) und der Universidad de Cartagena (UdC) ist die Entwicklung eines ressourceneffizienten, nicht-destruktiven analytischen Paradigmas: die präzise Vorhersage der zeitlichen Alterungskinetik von Kaffeespezialitäten durch die Fusion von Fourier-Transform-Infrarotspektroskopie (ATR-FTIR) mit Physik-informiertem Machine Learning (PIML), validiert gegen normierte nasschemische Referenzparameter.

2. Wissenschaftlicher Stand, Forschungslücken und zentrale wissenschaftliche Frage
In der spektroskopischen Lebensmittelanalytik wird FTIR traditionell zur statischen Klassifikation von Sorten oder zur Verfälschungsprüfung mittels multivariater Standardstatistik (PCA, PLSR) eingesetzt (vgl. Boadu 2024, Passos 2026). Diese Verfahren behandeln spektrale Signaturen als isolierte Zeitpunkte und modellieren keine physikalisch-chemischen Reaktionsdynamiken.
Rein datengetriebene Deep-Learning-Modelle (z. B. 1D-CNN) erzielen zwar hohe Anpassungsgüten, agieren jedoch als intransparente Black-Box-Systeme, die bei begrenzten Spektraldaten zu Scheinkorrelationen neigen. Physik-informierte neuronale Netze (PINNs; Perré 2025) integrieren Naturgesetze als Regularisierungsterme. Jüngste Befunde zum Kaffeerösten (Pronk & Anthony 2026) betonen jedoch, dass physikalische Restriktionen sorgfältig konditioniert sein müssen, um Verzerrungen zu vermeiden.
Die zentrale wissenschaftliche Frage lautet: Inwieweit können Deep-Learning- und Physik-informierte Modelle (PINNs mit integrierten Arrhenius-Abbaukinetiken) Veränderungen der Kaffeequalität aus FTIR-Spektren zuverlässig prognostizieren, und wie schneiden sie im systematischen Vergleich mit klassischen chemometrischen Verfahren (PLSR, SVR) bezüglich Vorhersagegüte, Generalisierung und Kausalität ab?

3. Spezifische Ziele des Vorhabens
- Ziel 1 (UdC): Etablierung eines standardisierten Versuchsprotokolls zum longitudinalen Monitoring von kolumbianischem Spezialitätenkaffee unter realen tropischen Lagerbedingungen (26–36 °C und 70–90% r.F.) mit kontinuierlicher ATR-FTIR-Spektrenakquise und paralleler Bestimmung normierter AOAC-Referenzwerte (Feuchte, Wasseraktivität, Säuregrad, Peroxidzahl, Gesamtpolyphenole/Chlorogensäuren).
- Ziel 2 (DIT): Entwicklung eines explorativen Metamodells und Durchführung eines 3-stufigen Benchmarkings: (i) Klassische Chemometrie (PLSR, SVR), (ii) Empirisches Deep Learning (1D-CNN, MLP), und (iii) Physik-informierte Modelle (PINNs mit kinetischer Arrhenius-Strafterm-Regularisierung), mit modularer Offenheit für moderne Sequenzarchitekturen (Mamba SSM, Spectral Transformers und Neural ODEs).
- Ziel 3 (Gemeinsam): Kriterienbasierte Auswahl der optimalen Modellarchitektur (Validierungsgenauigkeit, chemische Kausalität der Bandenattribution mittels XAI und Generalisierungsfähigkeit).
- Ziel 4 (Kooperation): Durchführung eines bilateralen KI- und Spektroskopie-Workshops an der UdC durch Prof. Dr. Suárez, Forschungsaufenthalt eines UdC-Nachwuchswissenschaftlers am DIT und Ausarbeitung eines DFG-Minciencias-Vollantrags zur Skalierung auf weitere Agrarmatrizen (Theobroma cacao, Apis mellifera, Cocos nucifera) und Chromatographie.

4. Methodischer Ansatz und exploratives Metamodell
Das Projekt verfolgt eine rigorose analytische und algorithmische Pipeline:
- Proben und Alterung (UdC): Zertifizierter kolumbianischer Hochlandkaffee (Arabica) aus kontrolliertem Anbau. Longitudinale Lagerung unter realen tropischen Bedingungen über 180 Tage mit periodischer spektraler Beprobung im MIR-Bereich (4000–600 cm⁻¹). Erfassung der Schwingungsbanden für Lipide (1745 cm⁻¹ C=O), Chlorogensäuren (1600–1650 cm⁻¹) und Kohlenhydrate (1050 cm⁻¹).
- Standard-Analytik (UdC): Feuchtegehalt (AOAC 968.11), Wasseraktivität (aw-Wert), titrierbare Gesamtsäure, Peroxidzahl der Kaffeelipide (AOAC 965.33), photometrische Erfassung der Chlorogensäure-Äquivalente (Folin-Ciocalteu / UV-Vis nach AOAC 980.23).
- Datenvorverarbeitung (DIT): Streulichtkorrektur (SNV), Basislinienkorrektur und 1./2. Ableitungen nach Savitzky-Golay.
- Modell-Benchmarking (DIT):
  1. Klassischer Benchmark: PLSR und Support Vector Regression (SVR) als Standardreferenz.
  2. Empirisches Deep Learning: 1D-CNNs mit multiskalaren Faltungskernen (Passos 2026) zur Merkmalsextraktion.
  3. Physik-informierte Regularisierung: PINN-Architektur, bei der die Verlustfunktion um ein kinetisches Residuum erweitert wird: L_ges = L_daten + lambda * L_kinetik, basierend auf einer Pseudo-Reaktionsordnung erster Ordnung gekoppelt mit der Arrhenius-Beziehung k(T) = A * exp(-Ea / (R*T)).
  4. Exploratives Screening: Modulare Evaluierung moderner State-Space-Modelle (Mamba / ASGMamba; Li et al. 2026), Spectral Transformers (SAM; Upadhyay & Chaudhary 2026) und kontinuierlicher neuronaler Differentialgleichungen (Neural ODEs / NODE) zur Modellierung kontinuierlicher Sequenzen.

5. Institutionelle Synergien und Kooperationsstruktur
Die Arbeitsgruppe von Prof. Dr. Ricardo Vivas (UdC, Fakultät für Naturwissenschaften) besitzt langjährige Erfahrung in chemischer Analytik, instrumenteller Naturstoffchemie und quantenchemischer Modellierung. Sie leitet die Probenahme, experimentelle Alterung und Standardanalytik.
Die Arbeitsgruppe von Prof. Dr. Isabel Suárez (DIT, Fakultät für Angewandte Informatik / KI-Campus) verfügt über ausgewiesene Expertise in maschinellem Lernen, Physik-informierten neuronalen Architekturen und High-Performance-Computing. Sie verantwortet die mathematische Modellformulierung, GPU-Trainingsroutinen und XAI-Validierung.
Das Mobilitätsbudget finanziert gezielt: (1) Eine Entsendung von Prof. Dr. Suárez nach Cartagena für einen einwöchigen Präsenz-Workshop zur KI-Spektroskopie für Forschende und Studierende sowie zur Versuchsstandardisierung; (2) Einen zweiwöchigen Forschungsaufenthalt eines UdC-Nachwuchswissenschaftlers am KI-Campus Deggendorf zum intensiven algorithmischen Training und Modelltransfer.

6. Arbeitsplan, Meilensteine und Zukunftsperspektive
Die Laufzeit von 12 Monaten gliedert sich in 4 synchronisierte Arbeitspakete (AP):
- AP1 (Monate 1–4, UdC/DIT): Versuchsaufbau, Probenlogistik und Messstandardisierung an der UdC. Präsenz-Workshop 1 in Cartagena mit Prof. Dr. Suárez (Monat 2). Meilenstein M1: Standardisiertes Alterungsprotokoll und Pilotdaten etabliert.
- AP2 (Monate 3–8, UdC): Durchführung des longitudinalen Monitorings unter tropischen Bedingungen, kontinuierliche ATR-FTIR-Scans und AOAC-Analytik. Meilenstein M2: Vollständiger Kaffeespektraldatensatz fertiggestellt.
- AP3 (Monate 6–11, DIT): Modelltraining, 3-Ebenen-Benchmark und XAI-Attributionsanalyse. Forschungsaufenthalt des UdC-Nachwuchswissenschaftlers in Deggendorf (Monat 8–9). Meilenstein M3: Optimale Modellarchitektur identifiziert und validiert.
- AP4 (Monate 10–12, DIT/UdC): Bilaterale Synthese, Publikationserstellung und Finalisierung des DFG-Minciencias-Vollantrags. Meilenstein M4: Folgeantrag eingereicht und Abschlussbericht erstellt.]

#let ausfuehrlich_es = [1. Planteamiento del problema, relevancia socioeconómica y objetivo general
El café especial colombiano (Coffea arabica) representa un pilar socioeconómico fundamental para más de 550.000 familias caficultoras y constituye un producto insignia en los mercados internacionales de alta calidad. Sin embargo, los atributos sensoriales, la frescura y la estabilidad química del café verde y tostado son altamente vulnerables a factores ambientales durante el almacenamiento, transporte y fluctuaciones climáticas. En estas fases se desencadenan cinéticas progresivas de deterioro: autooxidación de lípidos insaturados, degradación hidrolítica y térmica de ácidos clorogénicos bioactivos (5-CQA), aumento en la actividad de agua y pérdida de volátiles aromáticos. La determinación convencional del estado de frescura y vida útil se basa en paneles de catación sensorial o en análisis cromatográficos e instrumentales destructivos (HPLC, GC-MS), lentos y de alto costo, inaccesibles para el monitoreo continuo en cooperativas o centros de acopio.
El objetivo general de este proyecto de cooperación bilateral de 12 meses entre el Deggendorf Institute of Technology (DIT, Alemania) y la Universidad de Cartagena (UdC, Colombia) es desarrollar una metodología analítica no destructiva y de alta transferibilidad: predecir la cinética de degradación y pérdida de frescura en café especial mediante la integración de espectroscopía infrarroja por transformada de Fourier (ATR-FTIR) y modelos de Deep Learning informados por la física (PIML), contrastados y calibrados con parámetros fisicoquímicos normatizados.

2. Estado del arte, vacíos metodológicos y pregunta científica
En el análisis agroalimentario, la espectroscopía FTIR se ha aplicado predominantemente a la clasificación estática de origen o detección de adulteraciones mediante quimiometría lineal tradicional (PCA, PLSR; Boadu 2024, Passos 2026). Estos modelos procesan espectros como observaciones aisladas e ignoran la naturaleza temporal y cinética de los fenómenos moleculares de degradación.
Por su parte, los modelos de Deep Learning empíricos (1D-CNN) pueden alcanzar un buen ajuste numérico en calibración, pero al carecer de restricciones mecanicistas pueden sobreajustar fluctuaciones aleatorias o correlaciones no causales. Las Redes Neuronales Informadas por la Física (PINN; Perré 2025) incorporan restricciones mecanicistas en su función de costo. Sin embargo, investigaciones recientes en tostado de café (Pronk & Anthony 2026) demuestran que las regularizaciones físicas deben estar rigurosamente formuladas para no inducir sesgos ante cinéticas complejas.
La pregunta científica central se define así: ¿En qué medida pueden los modelos de Deep Learning y las redes informadas por principios físicos y químicos (PINN con cinética de degradación tipo Arrhenius) predecir con precisión los cambios en la calidad del café a partir de espectros FTIR longitudinales, y cómo se desempeñan al compararse rigurosamente con métodos tradicionales de Machine Learning (PLSR, SVR) en términos de capacidad predictiva, interpretabilidad espectral y generalización?

3. Objetivos específicos del proyecto
- Objetivo 1 (UdC): Estandarizar el diseño experimental longitudinal y el protocolo analítico de adquisición espectral rápida ATR-FTIR en café especial bajo condiciones ambientales tropicales reales en el Caribe colombiano (26–36 °C y 70–90% HR) con medición periódica de parámetros normatizados AOAC (humedad, actividad de agua, acidez titulable, peróxidos lipídicos, polifenoles totales y ácidos clorogénicos).
- Objetivo 2 (DIT): Desarrollar un metamodelo exploratorio y ejecutar un benchmarking en tres niveles: (i) Quimiometría tradicional de referencia (PLSR, SVR), (ii) Deep Learning empírico (1D-CNN, MLP), y (iii) Modelos informados por física/química (PINN con regularización cinética de Arrhenius), manteniendo un marco abierto para evaluar modelos de espacio de estados (Mamba SSM), Transformers espectrales y Neural ODEs.
- Objetivo 3 (Conjunto): Seleccionar la arquitectura óptima evaluando error de generalización, fidelidad fisicoquímica y coherencia mecanicista de bandas espectrales mediante explicabilidad causal (Grad-CAM y SHAP).
- Objetivo 4 (Cooperación): Ejecutar un workshop presencial de IA y quimiometría en la UdC a cargo de la Prof. Dr. Suárez, una estancia de investigación de un joven científico de la UdC en el DIT y formular una propuesta de gran escala DFG-Minciencias con proyección a otras matrices agrícolas (Theobroma cacao, Apis mellifera, Cocos nucifera) y cromatografía fina.

4. Enfoque metodológico y metamodelo exploratorio
El proyecto articula una metodología sistemática:
- Muestreo y almacenamiento (UdC): Café especial colombiano (Coffea arabica) certificado. Almacenamiento longitudinal bajo condiciones ambientales tropicales reales durante 180 días con lecturas periódicas ATR-FTIR (4000–600 cm⁻¹), monitoreando bandas diagnósticas: ésteres lipídicos (1745 cm⁻¹ C=O), ácidos clorogénicos / fenoles (1600–1650 cm⁻¹) y carbohidratos/polisacáridos (1050 cm⁻¹).
- Métodos analíticos de referencia (UdC): Contenido de humedad (AOAC 968.11), actividad de agua (aw), acidez titulable, índice de peróxidos en lípidos de café (AOAC 965.33) y cuantificación espectrofotométrica de polifenoles/ácidos clorogénicos (Folin-Ciocalteu / UV-Vis según AOAC 980.23).
- Preprocesamiento espectral (DIT): Corrección de dispersión (SNV), corrección de línea base y derivadas Savitzky-Golay.
- Benchmarking del Metamodelo (DIT):
  1. Nivel Clásico: Modelos PLSR y Support Vector Regression (SVR) como línea base industrial.
  2. Nivel Deep Learning: 1D-CNNs con núcleos adaptados al ancho espectral (Passos 2026).
  3. Nivel Informado por Física: PINN acoplada a una cinética de pseudo-primer orden dC/dt = -k(T)*C^n con ecuación de Arrhenius k(T) = A*exp(-Ea/(R*T)), incorporada a la función de pérdida: L = L_datos + lambda * L_cinetica.
  4. Exploración Avanzada: Evaluación modular de Mamba SSM (Li et al. 2026), Spectral Transformers (Upadhyay & Chaudhary 2026) y ecuaciones diferenciales neuronales continuas (Neural ODEs / NODE).

5. Sinergia institucional y esquema de cooperación bilateral
El grupo del Prof. Dr. Ricardo Vivas (UdC, Facultad de Ciencias Exactas y Naturales) cuenta con sólida trayectoria en química analítica, modelado computacional y aseguramiento de calidad agroalimentaria. Lidera el diseño experimental, almacenamiento longitudinal y analítica de referencia.
El grupo de la Prof. Dr. Isabel Suárez (DIT, Facultad de Informática Aplicada / Campus de IA) aporta liderazgo en IA aplicada, redes neuronales informadas por física y computación de alto rendimiento. Lidera el diseño algorítmico, entrenamiento en clústeres GPU y análisis XAI.
El presupuesto financia directamente la cooperación presencial: (1) Misión de la Prof. Dr. Suárez a Cartagena para impartir un workshop intensivo de IA aplicada a espectroscopía para semilleros y posgrados de la UdC y calibrar protocolos de laboratorio; (2) Estancia de 2 semanas de un joven investigador de la UdC en Deggendorf para transferencia metodológica y entrenamiento conjunto de modelos.

6. Plan de trabajo, hitos y proyección futura
El plan de 12 meses se organiza en 4 Paquetes de Trabajo (WP):
- WP1 (Meses 1–4, UdC/DIT): Ajuste de protocolos, acondicionamiento de lotes de café y Workshop 1 en Cartagena con la Prof. Dr. Suárez (Mes 2). Hito H1: Protocolo de almacenamiento y datos piloto establecidos.
- WP2 (Meses 3–8, UdC): Monitoreo longitudinal en condiciones tropicales reales, mediciones continuas ATR-FTIR y analítica AOAC. Hito H2: Base de datos longitudinal consolidada.
- WP3 (Meses 6–11, DIT): Entrenamiento de modelos, benchmarking factorial y estancia del investigador junior de UdC en Deggendorf (Mes 8–9). Hito H3: Arquitectura óptima identificada y validada con XAI.
- WP4 (Meses 10–12, DIT/UdC): Síntesis bilateral, redacción de dos artículos científicos y estructuración de la postulación DFG-Minciencias. Hito H4: Propuesta radicada y reporte final a BAYLAT.]

#let arbeitsplan_kurz = [Das 12-monatige Vorhaben gliedert sich in 4 synchronisierte Arbeitspakete (AP) mit 2 Meilenstein-Aktivitäten:
- AP1 (Monate 1–4, UdC/DIT): Versuchsaufbau, Probenlogistik von kolumbianischem Spezialitätenkaffee (Arabica) und Messstandardisierung an der UdC. Durchführung von Workshop 1 in Cartagena (Monat 2) unter Leitung von Prof. Dr. Isabel Suárez zur Vermittlung von KI- und Spektroskopiekompetenzen für Nachwuchskräfte und zur Standardisierung der ATR-FTIR- und AOAC-Analytik (Feuchte, Säure, Peroxidzahl, Chlorogensäuren). Meilenstein M1 (Monat 4): Standardisiertes Messprotokoll und Pilotdaten etabliert.
- AP2 (Monate 3–8, UdC): Longitudinales Monitoring unter realen tropischen Lagerbedingungen (26–36 °C, 70–90% r.F.) über 180 Tage mit periodischer ATR-FTIR-Erfassung und nasschemischer Standardanalytik. Konsolidierung der longitudinalen Spektraldatenbank. Meilenstein M2 (Monat 8): Vollständiger Kaffeedatensatz fertiggestellt.
- AP3 (Monate 6–11, DIT/UdC): Algorithmenentwicklung und Benchmarking am DIT. Implementierung der 3 Modellstufen: klassische Chemometrie (PLSR, SVR), datengetriebenes Deep Learning (1D-CNN) und Physik-informierte Netze (PINN mit Arrhenius-Straftermen) sowie exploratives Screening (Mamba SSM, Transformers). 2-wöchiger Forschungsaufenthalt eines UdC-Nachwuchswissenschaftlers am KI-Campus Deggendorf (Monat 8–9). Meilenstein M3 (Monat 9): Identifikation der optimalen Modellarchitektur (Genauigkeit, chemische Kausalität via XAI).
- AP4 (Monate 10–12, DIT/UdC): Bilaterale Ergebnissynthese, Erstellung zweier gemeinsamer Open-Access-Publikationen und Ausarbeitung des DFG-Minciencias-Verbundantrags zur Skalierung auf weitere Agrarmatrizen (Kakao, Honig, Kokosöl) und Hochdurchsatz-Chromatographie. Meilenstein M4 (Monat 12): Einreichung des Folgeantrags und Abschlussbericht.]

#let warum_keine_andere_foerderung = [Für die Etablierung dieser neuen transatlantischen Forschungskooperation existiert in dieser initialen Phase kein alternatives Förderformat. Großvolumige bilaterale Programme (wie DFG-Minciencias) oder europäische Verbundprojekte setzen zwingend belastbare experimentelle Pilotdaten, harmonisierte Spektral- und Referenzdatensätze sowie den Nachweis einer funktionierenden Arbeitsteilung beider Institutionen voraus. Ohne die gezielte BAYLAT-Anschubfinanzierung können der internationale Präsenz-Workshop zur KI-Spektroskopie an der UdC in Cartagena und der mehrwöchige Forschungsaufenthalt des kolumbianischen Nachwuchswissenschaftlers in Deggendorf nicht realisiert werden. Die Anschubförderung ist daher der unverzichtbare Katalysator zur Risikominimierung und methodischen Fundierung des geplanten Großprojekts.]

#let bezug_ausschreibung = [Die Ergebnisse dieses Anschubprojekts münden direkt in einen bilateralen Vollantrag im gemeinsamen Programm der Deutschen Forschungsgemeinschaft (DFG) und des kolumbianischen Minciencias (DFG-Minciencias Bilateral Research Grants). Die Einreichung erfolgt in Monat 11–12 der Projektlaufzeit mit Fokus auf die Ausweitung des PIML-Ansatzes auf chromatographische Metabolomik (HPLC-DAD, GC-MS) und weitere regionale Schlüsselmatrizen (Kakao, Honig, Kokosöl).]

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
  [Screen 7], [Reiseverwaltung], [Movilidad Bilateral], [2 viajes bilaterales (DIT->UdC M2; UdC->DIT M8–9); cálculo viáticos BayRKG.],
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
  [Projektverantwortliche (DIT)], [Prof. Dr. Isabel Suárez (Fakultät für Angewandte Informatik / KI-Campus)],
  [Projektverantwortlicher (UdC)], [Prof. Dr. Ricardo Vivas (Facultad de Ciencias Exactas y Naturales / Química)],
  [Geplante Projektlaufzeit], [12 Monate (01.02.2027 bis 31.01.2028)],
  [Art der Kooperation], [Erstkontakt / Aufbau einer neuen strategischen Forschungspartnerschaft],
  [Ziel-Folgeprogramm], [DFG-Minciencias Bilateral Research Grants (Joint Call Deutsche Forschungsgemeinschaft & Minciencias)]
)

== 1.2 Títulos Trilingües del Proyecto (Projekttitel — Máx. 400 caracteres)

#table(
  columns: (0.8fr, 3.2fr, 0.7fr, 0.7fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  align: (center, left, center, center),
  table.header([Idioma], [Título Oficial Registrado en Plataforma], [Longitud], [Límite]),
  [DE], [#titel_de], [79 c], [400 c],
  [ES], [#titel_es], [86 c], [400 c],
  [EN], [#titel_en], [68 c], [400 c]
)

== 1.3 Descriptores Temáticos y Palabras Clave (Stichwörter — Máx. 200 caracteres)

#table(
  columns: (0.8fr, 3.2fr, 0.7fr, 0.7fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  align: (center, left, center, center),
  table.header([Idioma], [Palabras Clave Registradas (Descriptores OASys)], [Longitud], [Límite]),
  [DE], [#stichwoerter_de], [135 c], [200 c],
  [ES], [#stichwoerter_es], [145 c], [200 c],
  [EN], [#stichwoerter_en], [136 c], [200 c]
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
  *Procedimiento de seguridad:* Tras la creación inicial del expediente, OASys emite un código alfanumérico único (*Zugangsschlüssel / Token*) de 8 dígitos. Dicho token permite retomar la sesión, transferir privilegios de edición técnica entre la solicitante bávara (Prof. Dr. Isabel Suárez, DIT) y el socio latinoamericano (Prof. Dr. Ricardo Vivas, UdC), y bloquear la edición previa a la transmisión irreversible.
]

#table(
  columns: (1.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Elemento del Sistema], [Descripción de la Configuración de Sesión]),
  [Estado del Expediente], [In Bearbeitung (Expediente abierto para postulación bilateral 2026/2027)],
  [Zugangsschlüssel (Token)], [BAY-2026-X8K9 (Identificador criptográfico de acceso compartido DIT / UdC)],
  [Datenschutzerklärung], [Aceptada formalmente por la Investigadora Principal bávara el 17.09.2026],
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
  [Projektverantwortliche (PI)], [Prof. Dr. Isabel Suárez],
  [Akademischer Grad / Funktion], [Prof. Dr. rer. nat. / Professorin für Angewandte Künstliche Intelligenz und Data Science],
  [Dienstadresse], [Dieter-Görlitz-Platz 1, 94469 Deggendorf, Freistaat Bayern, Deutschland],
  [Kontakt], [E-Mail: isabel.suarez [at] th-deg.de | Tel: +49 (0) 991 3615-800],
  [Rechtsverbindliche Unterschrift], [Präsident der TH Deggendorf / Dekan der Fakultät für Angewandte Informatik]
)

#block(inset: 6pt, stroke: 0.5pt + luma(180), radius: 2pt)[
  *Kurzprofil der Antragstellerin (Prof. Dr. Isabel Suárez, DIT — Máx. 1.000 caracteres con espacios | Actual: 489 c):*
  \
  Prof. Dr. Isabel Suárez forscht und lehrt am KI-Campus der Technischen Hochschule Deggendorf (DIT). Ihre wissenschaftliche Expertise liegt in den Bereichen Angewandtes Maschinelles Lernen, Physik-informierte neuronale Architekturen (PINNs), multivariate Zeitreihenmodellierung sowie spektrale Signalanalyse. Sie leitet Projekte zur industriellen KI-Anwendung und verfügt über Hochleistungs-GPU-Infrastrukturen zur Beschleunigung komplexer differentialgleichungsbasierter Modellierungen.
]

== 3.2 Partner 2: Kooperationspartner (Colombia) — Universidad de Cartagena

#table(
  columns: (1.1fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Campo de Registro], [Datos Oficiales del Socio Cooperador Latinoamericano]),
  [Institution], [Universidad de Cartagena (UdC)],
  [Fakultät / Institut], [Facultad de Ciencias Exactas y Naturales / Programa de Química],
  [Projektverantwortlicher (PI)], [Prof. Dr. Ricardo Vivas],
  [Akademischer Grad / Funktion], [Ph.D. en Ciencias Químicas / Profesor Titular e Investigador en Química Computacional y Analítica],
  [Dienstadresse], [Campus San Agustín / Sede Claustro de San Agustín, Cra. 6 \#36-100, Cartagena de Indias, Colombia],
  [Kontakt], [E-Mail: rvivasr [at] unicartagena.edu.co | Tel: +57 (605) 660-0102],
  [Profil der Hochschule], [Staatliche Hochschule (gegr. 1827) mit institutioneller Exzellenzakkreditierung im Karibikraum.]
)

#block(inset: 6pt, stroke: 0.5pt + luma(180), radius: 2pt)[
  *Kurzprofil des Kooperationspartners (Prof. Dr. Ricardo Vivas, UdC — Máx. 1.000 caracteres con espacios | Actual: 497 c):*
  \
  Prof. Dr. Ricardo Vivas ist Professor Titular an der Universidad de Cartagena mit herausragender wissenschaftlicher Reputation in chemischer Analytik, quantenchemischer Modellierung und Naturstoffforschung. Seine Arbeitsgruppe verfügt über umfassende Erfahrung in instrumenteller Analytik (FTIR, Spektrophotometrie, Chromatographie) und Stabilitätsprüfungen von Naturstoffen. Er leitet Forschungsinitiativen zur molekularen Charakterisierung und Qualitätssteigerung kolumbianischer Agrarerzeugnisse.
]

// =============================================================================
// SCREEN 4: PROJEKTBESCHREIBUNG (STRATEGISCHE BEGRÜNDUNG & KERNTEXTE)
// =============================================================================

= Screen 4: Projektbeschreibung (Estrategia, Resúmenes y Memoria Detallada)

#callout(title: "Regla de Pantalla 4 — Cumplimiento Estricto de Presupuestos de Caracteres")[
  *Control de caracteres con espacios en los campos de entrada de Screen 4:*
  - Mehrwert des Projektpartners: Máximo 1.000 caracteres (Alemán y Español).
  - Internationalisierungsbezug: Máximo 2.000 caracteres (Alemán y Español).
  - Kurzfassung des Projekts: Máximo 2.000 caracteres (Alemán y Español).
  - Ausführliche Projektbeschreibung: Máximo 10.000 caracteres (Alemán y Español).
]

== 4.1 Mehrwert des Projektpartners (Valor Agregado de la Cooperación — Máx. 1.000 caracteres)

#table(
  columns: (1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Mehrwert DE (989 / 1.000 c)], [Valor Agregado ES (953 / 1.000 c)]),
  [#mehrwert_de],
  [#mehrwert_es]
)

== 4.2 Bezug zur Internationalisierungsstrategie (Estrategia de Internacionalización — Máx. 2.000 caracteres)

#table(
  columns: (1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Internationalisierung DE (750 / 2.000 c)], [Internacionalización ES (600 / 2.000 c)]),
  [#internationalisierung_de],
  [#internationalisierung_es]
)

== 4.3 Kurzfassung des Projekts (Resumen Ejecutivo — Máx. 2.000 caracteres)

#table(
  columns: (1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Kurzfassung DE (1.870 / 2.000 c)], [Resumen Corto ES (1.719 / 2.000 c)]),
  [#kurzfassung_de],
  [#kurzfassung_es]
)

== 4.4 Ausführliche Projektbeschreibung (Memoria Técnica Detallada — Máx. 10.000 caracteres)

#table(
  columns: (1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Ausführliche Beschreibung DE (7.792 / 10.000 c)], [Descripción Detallada ES (7.801 / 10.000 c)]),
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
  [DIT (Baviera)], [Bayerische Forschungsstiftung / Hightech Agenda Bayern], [KI-Transferprojekte, Deep Learning für Sensordaten und Spektroskopie.],
  [DIT (Baviera)], [BMBF (Bundesministerium für Bildung und Forschung)], [Verbundprojekte zu angewandtem maschinellem Lernen und Industrie-4.0-Analytik.],
  [UdC (Colombia)], [Minciencias (Ministerio de Ciencia, Tecnología e Innovación)], [Proyectos nacionales de valorización de recursos biológicos y calidad agroalimentaria.],
  [UdC (Colombia)], [Sistema General de Regalías (SGR Colombia)], [Fortalecimiento de laboratorios de química analítica y desarrollo de bioproductos.]
)

== 5.2 Weshalb ist keine andere Finanzierung möglich? (Máx. 2.000 caracteres | Actual: 815 c)

#block(inset: 8pt, stroke: 0.5pt + rgb("#2b2b2b"), fill: rgb("#fafbfc"), radius: 2pt)[
  #warum_keine_andere_foerderung
]

== 5.3 Bezug zu einer Ausschreibung / Zukünftiger Drittmittelantrag (Máx. 1.000 caracteres | Actual: 455 c)

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

== 6.1 Kurzer Zeit- und Arbeitsplan für das OASys-Eingabefeld (Máx. 2.000 caracteres | Actual: 1.816 c)

#block(inset: 8pt, stroke: 0.5pt + rgb("#2b2b2b"), fill: rgb("#fafbfc"), radius: 2pt)[
  #arbeitsplan_kurz
]

== 6.2 Matriz Exhaustiva del Plan de Trabajo de 12 Meses (4 Paquetes de Trabajo, Entregables e Hitos)

#table(
  columns: (0.6fr, 1.4fr, 0.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Monat], [Arbeitspaket (AP)], [Lead], [Aktivitäten, Entregables (D) und Meilensteine (M)]),
  [M1], [AP1: Versuchsplanung], [UdC], [Beschaffung und botanische Verifizierung von kolumbianischem Spezialitätenkaffee (Arabica); Kalibrierung der multiparametrischen Datalogger und Lagervorbereitung.],
  [M2], [AP1: Standardisierung], [UdC/DIT], [*Workshop 1 (Präsenz in Cartagena, Prof. Dr. Isabel Suárez):* Standardisierung der ATR-FTIR-Spektrenakquise und AOAC-Analytik (Feuchte, Peroxidzahl, Säure, Chlorogensäuren). *Entregable D1.1: Protokollhandbuch*.],
  [M3], [AP2: Kinetik-Start], [UdC], [Start des Kaffeelagerungsmonitorings unter realen tropischen Bedingungen; Baseline-Scans ($t_0$) und periodische FTIR-Messungen ($t_1$); Bestimmung von Feuchte, aw, Säuregrad und Lipidperoxiden (AOAC 965.33).],
  [M4], [AP2: Monitoring & AP1], [UdC], [Fortführung der FTIR-Zeitreihen; photometrische Chlorogensäure-Bestimmung (Folin/UV-Vis). *Meilenstein M1: Standardisiertes Messprotokoll und Pilotdaten etabliert*.],
  [M5], [AP2: Datenkonsolidierung], [UdC/DIT], [Erste Datenübergabe an DIT; Datenvorverarbeitung (SNV, MSC, Savitzky-Golay); Bereinigung von CO₂/H₂O-Atmosphärenbanden. *Entregable D1.2: Bereinigter Rohdatensatz*.],
  [M6], [AP3: Modellimplementierung], [DIT], [GPU-Implementierung des 3-stufigen Benchmark-Raums: (i) PLSR/SVR, (ii) 1D-CNN, (iii) PINN mit kinetischen Verlustfunktionen am KI-Campus Deggendorf.],
  [M7], [AP2/AP3: Labor & PIML], [UdC/DIT], [Abschluss der experimentellen Stabilitätsreihen an der UdC; Einbettung der Arrhenius-Restriktionen in das Modelltraining am DIT.],
  [M8–9], [AP3: Mobilität & Tuning], [DIT/UdC], [*Forschungsaufenthalt (Präsenz in Deggendorf):* 2-wöchiger Aufenthalt eines UdC-Nachwuchswissenschaftlers am DIT für gemeinsames Training und XAI-Attributionsanalyse. *Meilenstein M2: Kaffeedatenbank konsolidiert*.],
  [M10], [AP3: Architekturauswahl], [DIT/UdC], [Multikriterielle Entscheidungsfindung (Genauigkeit, chemische Kausalität und XAI-Attribution). *Entregable D3.1: Benchmark- und XAI-Bericht*. *Meilenstein M3: Optimale Architektur identifiziert*.],
  [M11], [AP4: Bilaterale Synthese], [DIT/UdC], [Gesamtsynthese der Ergebnisse via virtuelle Arbeitsplattform; Finalisierung von 2 gemeinsamen Open-Access-Fachpublikationen; Ausarbeitung des DFG-Minciencias-Antrags.],
  [M12], [AP4: Antrag & Abschluss], [DIT/UdC], [Einreichung des gemeinsamen DFG-Minciencias-Vollantrags; Fertigstellung des Abschlussberichts an BAYLAT. *Entregable D4.1: Zwei Fachartikel*. *Entregable D4.2: DFG-Minciencias-Antrag*. *Meilenstein M4: Vollantrag eingereicht und Projektabschluss*.]
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
  *Normativa presupuestal BAYLAT:* La financiación se destina a gastos de viaje y dietas según el Bayerisches Reisekostengesetz (BayRKG), así como a rubros de apoyo a eventos científicos, seguros reglamentarios (máx. 200 €) y materiales específicos de laboratorio (máx. 600 €). Todos los rubros coinciden estrictamente con la hoja oficial *06_Reiseverwaltung_Kostenkalkulation_Anschubfinanzierung.xlsx*.
]

== 7.1 Planificación de Misiones Científicas Bilaterales

#table(
  columns: (0.7fr, 1.1fr, 0.9fr, 1fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Misión], [Ruta de Viaje], [Mes / Duración], [Participantes], [Objetivos Específicos de Trabajo]),
  [Reise 1], [München -> Cartagena (UdC)], [Monat 2 (10 Tage)], [Prof. Dr. Isabel Suárez (DIT)], [*Workshop an der UdC:* Leitung des bilateralen KI- und Spektroskopie-Workshops für Nachwuchskräfte; Kalibrierung der Datalogger und Standardisierung der Messprotokolle.],
  [Reise 2], [Cartagena -> Deggendorf (DIT)], [Monat 8–9 (14 Tage)], [1 Nachwuchswissenschaftler/in (UdC - Gruppe Prof. Vivas)], [*Forschungsaufenthalt am DIT:* GPU-Training der Modelle, XAI-Interpretierbarkeit, Modellvalidierung und Mitarbeit am DFG-Antrag.]
)

== 7.2 Estimación Presupuestal Consolidada de la Cooperación Bilateral (7.350 €)

#table(
  columns: (1.2fr, 0.9fr, 0.9fr, 0.8fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  align: (left, center, center, center, left),
  table.header([Kostenkategorie (BAYLAT)], [Reise 1 (DIT->UdC)], [Reise 2 (UdC->DIT)], [Gesamtbetrag], [Berechnungsgrundlage (gem. BayRKG / BayHO)]),
  [Flugkosten (Hin- und Rückflug)], [1.450 €], [1.500 €], [2.950 €], [Transatlantik Economy-Tarife (München-Cartagena / Cartagena-München)],
  [Übernachtungskosten], [1.100 €], [770 €], [1.870 €], [10 Nächte à 110 € in Cartagena / 14 Nächte à 55 € in Gästehaus DIT],
  [Tagegelder (Verpflegungspauschale)], [500 €], [630 €], [1.130 €], [10 Tage à 50 € (Kolumbien) / 14 Tage à 45 € (Deutschland)],
  [Bewirtung und Repräsentanz], [450 €], [-], [450 €], [Tagungsbewirtung für bilateralen KI-Workshop an der UdC],
  [Auslandskrankenversicherung], [100 €], [100 €], [200 €], [Maximal zulässiger Fördersatz nach BAYLAT-Richtlinien],
  [Labormaterialien (Kaffeeanalytik)], [-], [-], [600 €], [Standards für Chlorogensäuren, Reagenzien (Max. 600 € nach BAYLAT)],
  [Sachausgaben digitale Formate], [-], [-], [150 €], [Streaming- und Konferenzzubehör für hybride Zusammenarbeit],
  [*Gesamtfördersumme BAYLAT*], [*3.600 €*], [*3.000 €*], [*7.350 €*], [*Beantragtes Gesamtbudget bei BAYLAT (Deckblatt & Belegliste, Förderhöchstsatz: 8.000 €)*]
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
  [[Nachwuchs DIT 1]], [TH Deggendorf], [Angewandte Informatik], [B.Sc. -> M.Sc. Applied AI], [Implementierung von 1D-CNNs, PINNs, Mamba-Modellen und XAI auf GPU-Clustern.],
  [[Nachwuchs UdC 1]], [Univ. de Cartagena], [Chemie / Analytik], [Químico -> M.Sc. Química], [Durchführung kontrollierter Kaffeelagerung, ATR-FTIR-Spektrenakquise und Mobilität nach Deggendorf.],
  [[Nachwuchs UdC 2]], [Univ. de Cartagena], [Chemie], [Pregrado -> Químico (Tesis)], [Standardisierte AOAC-Analysen (Feuchte, Peroxidzahl AOAC 965.33, UV-Vis Chlorogensäuren).]
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
  [[X]], [Curriculum Vitae PI DIT (Baviera)], [PDF (<= 5 MB)], [Prof. Dr. Isabel Suárez: Werdegang, Publikationen (KI/ML) und Drittmittelerfahrung.],
  [[X]], [Curriculum Vitae PI UdC (Kolumbien)], [PDF (<= 5 MB)], [Prof. Dr. Ricardo Vivas: Werdegang, Publikationen (Chemie/Spektroskopie) und Projekte.],
  [[X]], [Curriculum Vitae Nachwuchskräfte], [PDF (<= 5 MB)], [Kurzlebensläufe der teilnehmenden Studierenden / Promovierenden beider Hochschulen.],
  [[X]], [Letter of Intent (Kooperationsabkommen)], [PDF (<= 5 MB)], [Rechtsverbindliche Kooperationsabsichtserklärung der Hochschulleitungen DIT und UdC.],
  [[X]], [Befürwortungsschreiben Fakultät / IO], [PDF (<= 5 MB)], [Unterstützungsschreiben des International Office und der zuständigen Dekanate.],
  [[X]], [Reisekostenkalkulation (Detailliert)], [PDF (<= 5 MB)], [Ausgefülltes BAYLAT-Excel-Formular (06_Reiseverwaltung_Kostenkalkulation.xlsx).]
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
  4. *Postalischer Nachlauf:* El documento Word oficial generado debe imprimirse, ser suscrito con *firma jurídica vinculante de la Investigadora Principal bávara (Prof. Dr. Isabel Suárez)* y remitirse por correo postal a la sede de BAYLAT en Erlangen en el plazo máximo estricto de *1 semana tras la fecha límite electrónica*.
]

#table(
  columns: (1fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#f0f3f6") } else { none },
  table.header([Schritt im Antragsabschluss], [Operative Maßnahmen und Nachweisführung]),
  [Schritt 1: System-Prüfung], [Erfolgreiche Validierung aller Mussfelder, ERC-Codes und Textbudgets in Screen 1 bis 9.],
  [Schritt 2: DOCX-Generierung], [Herunterladen des automatisch befüllten Antragsformulars zur Drucklegung und Archivierung.],
  [Schritt 3: Elektronisches Abschicken], [Auslösung des finalen Sendebefehls; Sperrung des Systems für nachträgliche Bearbeitungen.],
  [Schritt 4: Rechtsverbindliche Signatur], [Originalunterschrift von Prof. Dr. Isabel Suárez auf dem Deckblatt.],
  [Schritt 5: Postalischer Versand], [Postalischer Eingang der unterschriebenen Papierfassung bei BAYLAT (Erlangen) binnen 7 Tagen.]
)

// =============================================================================
// REFERENCIAS Y FUNDAMENTACIÓN TÉCNICA
// =============================================================================

= Referencias Científicas y Fundamentación Bibliográfica

La formulación técnica de los objetivos, la selección del café especial colombiano y el espacio exploratorio de arquitecturas neuronales informadas por la física adoptadas en este formulario se fundamentan en la literatura científica especializada:

- Codificación espectral mediante redes neuronales convolucionales adaptadas al ancho de banda vibracional y mecanismos de atención espectral: @passos2605convolutionalneuralnetworks, @upadhyay2026enhancingspectralanalysis, @feng2021applicationofvisibleinfrared, @boadu2024developinganovel.
- Modelado temporal eficiente de series continuas mediante modelos de espacio de estados: @li2026asgmambaadaptivespectral.
- Regularización física mediante redes neuronales informadas por física (PINN) bajo cinéticas de degradación: @perre2025towardmechanisticmodels, @pronk2026neuralnetworkplacementin, @felizzato2025datafusionfor.
- Autenticidad espectroscópica y cinética de calidad en café y alimentos: @widiarto2026detectionofadulteration, @grundy2025reviewofcurrent.

#bibliography("references.bib", title: [Literaturverzeichnis / Referencias Bibliográficas])
