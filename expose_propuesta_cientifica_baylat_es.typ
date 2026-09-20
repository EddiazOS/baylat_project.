#import "typst-scientific-report-template/template.typ": project, callout

#show: project.with(
  title: [Ecuaciones Diferenciales Neuronales Informadas por Física y Detección Espectral Multimodal para la Predicción Autónoma de Calidad y Frescura en Café Especial Colombiano],
  subtitle: [Memoria Científica y Propuesta de Investigación – Financiamiento Inicial BAYLAT (OASys 2026/2027)],
  objective: [
    Formular, evaluar y validar un marco analítico y computacional que integre espectroscopía infrarroja por transformada de Fourier con reflectancia total atenuada (ATR-FTIR), ensayos fisicoquímicos normatizados y modelos de Deep Learning informados por la física (PIML) en café especial colombiano (*Coffea arabica*). El proyecto se centra en contrastar rigurosamente métodos quimiométricos tradicionales (PLSR, SVR) frente a redes neuronales profundas (1D-CNN) y redes informadas por leyes cinéticas de degradación tipo Arrhenius (PINN) bajo condiciones de envejecimiento acelerado, manteniendo una exploración modular de arquitecturas avanzadas (Mamba SSM, Transformers espectrales) y fortaleciendo la cooperación bilateral y la formación de investigadores entre la Technische Hochschule Deggendorf (DIT) y la Universidad de Cartagena (UdC).
  ],
  authors: (
    "Prof. Dr. Isabel Suárez — Technische Hochschule Deggendorf (DIT), Campus de IA",
    "Prof. Dr. Ricardo Vivas — Universidad de Cartagena (UdC), Facultad de Ciencias Exactas y Naturales",
  ),
  date: "17 de septiembre de 2026",
  doc_id: "BAYLAT-EXP-ES-2026",
  header_title: "Propuesta de Investigación Científica (BAYLAT) — DIT & UdC",
)

#set text(lang: "es")

= 1. Resumen Ejecutivo y Marco Bioeconómico del Café Especial Colombiano

== 1.1 Motivación y Desafíos de Calidad en la Cadena de Valor Cafetera
La República de Colombia destaca a nivel internacional por su liderazgo en la producción de café arábica suave de alta montaña (*Coffea arabica*). El cultivo de café representa el motor socioeconómico de más de $550.000$ familias campesinas en las cordilleras andinas (Huila, Nariño, Cauca, Eje Cafetero, Santander y Sierra Nevada de Santa Marta). Los cafés especiales ("Specialty Coffee"), que alcanzan calificaciones superiores a los $85$ puntos según los estándares de la Specialty Coffee Association (SCA), acceden a importantes sobreprecios en los mercados europeos y, particularmente, en el mercado de Baviera.

No obstante, la preservación de los atributos de frescura, acidez brillante y notas aromáticas enfrenta serias dificultades durante el almacenamiento prolongado, el transporte transatlántico marítimo ($20$ a $45$ días de tránsito desde el puerto de Cartagena de Indias hacia Hamburgo o Róterdam) y las condiciones climáticas tropicales intermedias. Las fluctuaciones ambientales de temperatura ($20 - 40 thin degree"C"$) y humedad relativa ($50 - 85\%$ HR) desencadenan cinéticas de deterioro complejas:
1. *Oxidación de la fracción lipídica:* El café contiene entre un $12\%$ y un $17\%$ de lípidos (ésteres de cafestol, kahweol y triglicéridos ricos en ácido linoleico), los cuales sufren peroxidación por radicales libres generando hidroperóxidos y aldehídos volátiles responsables del añejamiento o "staling".
2. *Degradación hidrolítica y térmica de ácidos clorogénicos (CGA):* Los ácidos cafeoilquínicos (5-CQA, 3-CQA, 4-CQA), esenciales en la acidez fina del grano, se hidrolizan liberando ácido quínico y cafeico o forman lactonas quínicas (chinidos) de marcado sabor metálico y astringente.
3. *Dinámica de humedad y actividad de agua ($a_w$):* La sorción de vapor de agua cataliza reacciones de oscurecimiento no enzimático y acelera la pérdida de compuestos volátiles.

El aseguramiento de calidad convencional depende de cataciones sensoriales subjetivas o de costosos análisis cromatográficos destructivos (HPLC, GC-MS con costos de $150 - 300 thin "USD"$ por muestra), impidiendo un monitoreo frecuente y accesible en cooperativas y puntos de acopio rurales.

#callout(title: "Pregunta Científica Central del Proyecto")[
  *Pregunta de Investigación:* ¿En qué medida los modelos de Deep Learning y las redes neuronales informadas por principios físicos y químicos (PINNs acopladas a cinéticas de degradación tipo Arrhenius) permiten predecir de forma autónoma los cambios en la calidad y frescura del café a partir de espectros continuos ATR-FTIR, y cómo se desempeñan frente a los métodos quimiométricos tradicionales de Machine Learning (PLSR, SVR) en términos de precisión, capacidad de generalización e interpretabilidad espectral causal?
]

== 1.2 Alcance del Proyecto Semilla y Hoja de Ruta de Escalabilidad
Este proyecto semilla de 12 meses ($8.610 thin "EUR"$) se enfoca deliberadamente en una única matriz agroalimentaria emblemática: el *café especial colombiano*, garantizando profundidad experimental, reproducibilidad analítica y solidez metodológica bajo un presupuesto acotado.

La metodología establecida –articulación de ATR-FTIR, métodos analíticos normatizados de bajo costo y modelos físico-químicos neuronales– constituirá la evidencia preliminar indispensable para presentar una propuesta conjunta de gran escala dentro de la convocatoria *DFG-Minciencias Bilateral Research Grants* (con una duración de 3 años). En dicha fase de expansión, el marco se aplicará a otras matrices estratégicas de la biodiversidad colombiana: cacao fino de aroma (*Theobroma cacao L.*), miel de abejas artesanal (*Apis mellifera*) y aceite de coco virgen (*Cocos nucifera*), incorporando metabolómica cromatográfica de alta resolución (LC-HRMS, GC-MS).

---

= 2. Fundamentos Botánicos, Fitoquímicos y Cinética de Degradación

Se evaluarán muestras certificadas de variedades colombianas representativas: *Castillo*, *Caturra*, *Colombia* y *Geisha*. Su estructura fitoquímica comprende:
- *Ácidos clorogénicos (CGA):* $6 - 9\%$ de la masa seca, dominados por el ácido 5-cafeoilquínico (5-CQA).
- *Lípidos:* $12 - 17\%$, con alto contenido de ácido linoleico ($"C18:2"$) y ésteres diterpénicos.
- *Alcaloides:* Cafeína ($1,0 - 1,4\%$) y trigonelina ($0,8 - 1,2\%$).
- *Carbohidratos:* Sacarosa ($6 - 9\%$) y polisacáridos estructurales.

== 2.1 Modelado Cinético y Dependencia Térmica de Arrhenius
La degradación de componentes diana se formula mediante leyes de velocidad diferencial integradas con la relación de Arrhenius:

$ (d C_i(t)) / (d t) = - k_i(T) dot [C_i(t)]^(n_i), quad k_i(T) = A_i dot exp(- E_(a,i) / (R dot T)) $

donde $C_i(t)$ representa la concentración del analito $i$ al tiempo $t$, $n_i$ es el orden de reacción aparente ($n=1$ para degradación de 5-CQA y $n=0$ o $1$ para peroxidación lipídica primaria), $A_i$ es el factor de frecuencia pre-exponencial ($"s"^(-1)$), $E_(a,i)$ es la energía de activación aparente ($"kJ/mol"$), $R = 8,314 thin "J" / ("mol" dot "K")$ y $T$ es la temperatura absoluta en Kelvin.

== 2.2 Espectroscopía Vibracional ATR-FTIR de Café
La espectroscopía ATR-FTIR con cristal de diamante captura el rango infrarrojo medio ($4000 - 600 thin "cm"^(-1)$) sin preparación de muestra, permitiendo un monitoreo longitudinal no destructivo:

#table(
  columns: (1.2fr, 1.5fr, 2.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Número de onda ($"cm"^(-1)$)],
    [Modo Vibracional],
    [Grupo Funcional Asociado],
    [Evolución Cinética Durante el Almacenamiento]
  ),
  [$3400 - 3250$],
  [Tensión $nu("O-H")$],
  [Agua ($a_w$) y grupos fenólicos de CGA],
  [Disminución por desecación o ensanchamiento por sorción higroscópica],
  [$3008$],
  [Tensión $nu(= "C-H")$ _cis_-alqueno],
  [Cadenas insaturadas de lípidos de café],
  [Pérdida continua de señal debida a peroxidación lipídica por radicales],
  [$2925, 2854$],
  [Tensión $nu_("as"), nu_("s")("C-H")$ alifática],
  [Cadenas hidrocarbonadas de lípidos],
  [Bandas termoestables empleadas como estándar interno de normalización],
  [$1745$],
  [Tensión $nu("C=O")$ éster],
  [Triacilgliceroles y ésteres de cafestol],
  [Ensanchamiento y aparición de un hombro en $1715 thin "cm"^(-1)$ por hidrólisis],
  [$1715 - 1695$],
  [Tensión $nu("C=O")$ ácido carboxílico],
  [Ácido quínico liberado y ácidos grasos libres],
  [Aparición e incremento progresivo que delata envejecimiento del grano],
  [$1650 - 1600$],
  [Tensión $nu("C=C")$ aromático / $nu("C=O")$],
  [Anillo aromático de restos cafeoilo],
  [Disminución por condensación oxidativa y formación de polímeros quinónicos],
  [$1380 - 1150$],
  [Tensión $nu("C-O")$, flexión $delta("O-H")$],
  [Enlaces éster de ácidos cafeoilquínicos],
  [Atenuación continua correlacionada con la pérdida cuantitativa de 5-CQA],
  [$1050 - 1030$],
  [Tensión $nu("C-O")$ carbohidratos],
  [Sacarosa y polisacáridos estructurales],
  [Decaimiento lento por reacciones de caramelización y Maillard incipiente]
)

---

= 3. Métodos Analíticos de Referencia Estandarizados (AOAC / ISO)

Para dotar a los modelos espectrales de valores objetivos de referencia contrastados, la Universidad de Cartagena ejecuta protocolos normalizados según AOAC International:
1. *Acidez Titulable (AOAC 920.92):* Infusión normalizada de $10 thin "g"$ de café en $100 thin "mL"$ de agua desgasificada y titulación potenciométrica con $0,1 thin "N NaOH"$ hasta el punto final de $p"H" 8,20$.
2. *Contenido de Humedad y Actividad de Agua (AOAC 968.11 / ISO 6673):* Determinación termogravimétrica en estufa a $105 thin degree"C"$ hasta peso constante; medición de actividad de agua ($a_w$) con sensor de punto de rocío de espejo enfriado.
3. *Índice de Peróxidos en Lípidos de Café (AOAC 965.33):* Extracción de grasa con solventes en frío y valoración iodométrica con tiosulfato de sodio ($"Na"_2"S"_2"O"_3$) en presencia de almidón ($"meq" thin "O"_2/"kg lípido"$).
4. *Polifenoles Totales y Ácidos Clorogénicos (Folin-Ciocalteu / UV-Vis tras AOAC 980.23):* Cuantificación espectrofotométrica a $765 thin "nm"$ y $325 thin "nm"$ contrastada con curvas patrón de ácido 5-cafeoilquínico puro.

---

= 4. Revisión Crítica de Literatura, Vacíos Científicos e Hipótesis

La bibliografía internacional evidencia un interés creciente en la unión entre espectroscopía e inteligencia artificial:
- *Quimiometría Lineal:* La mayoría de estudios en café utilizan PCA y regresión por mínimos cuadrados parciales (PLSR) para clasificación de origen y detección de fraudes (@boadu2024developinganovel, @feng2021applicationofvisibleinfrared, @widiarto2026detectionofadulteration). Estos métodos asumen linealidad estática e ignoran la trayectoria cinética continua.
- *Redes Neuronales Convolucionales:* Passos (@passos2605convolutionalneuralnetworks) demostró que las 1D-CNNs con núcleos multiescala capturan eficazmente bandas vibracionales complejas, si bien advierte del riesgo de sobreajuste al ruido cuando se dispone de datos de entrenamiento limitados.
- *Mecanismos de Atención Espectral:* Upadhyay & Chaudhary (@upadhyay2026enhancingspectralanalysis) desarrollaron mecanismos de autoatención espectral (SAM), logrando que los pesos atencionales coincidan directamente con las frecuencias de resonancia de los grupos funcionales reactivos.
- *Modelos de Espacio de Estados:* Li et al. (@li2026asgmambaadaptivespectral) presentaron ASGMamba, demostrando una complejidad computacional lineal $cal(O)(L)$ frente a secuencias multivariadas, lo que permite modelar series temporales largas de degradación con eficiencia muy superior a los Transformers.
- *Aprendizaje Informado por Física (PIML):* Perré (@perre2025towardmechanisticmodels) demostró la utilidad de las PINNs para procesos de transferencia de materia y calor en secado. Pronk & Anthony (@pronk2026neuralnetworkplacementin) comprobaron en procesos de tostado de café que ubicar la red neuronal como un término residual de corrección mecanicista evita violaciones termodinámicas. Igualmente, Felizzato et al. (@felizzato2025datafusionfor) y Grundy et al. (@grundy2025reviewofcurrent) recalcan la importancia de integrar datos multisensoriales con bases mecanicistas.

*Vacío de Conocimiento Identificado:* No existe en la literatura un estudio comparativo sistemático que evalúe si las arquitecturas de Deep Learning informadas por física superan de forma estadísticamente significativa a la quimiometría lineal (PLSR) en series de envejecimiento de café especial bajo condiciones tropicales reales.

---

= 5. Metamodelo Exploratorio y Benchmark en 3 Niveles

Se implementa una estructura de evaluación comparativa en tres niveles:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header([Nivel de Benchmark], [Familia de Modelos], [Configuración y Función en el Estudio]),
  [Nivel 1: Línea Base],
  [Quimiometría Clásica \ (Lineal y de Kernel)],
  [PLSR (5 a 12 variables latentes), Support Vector Regression (SVR con kernel RBF) y Random Forest sobre espectros normalizados (SNV + Savitzky-Golay).],
  [Nivel 2: Deep Learning],
  [Deep Learning Empírico \ (Caja Negra Dirigida por Datos)],
  [1D-CNN con núcleos multiescala ($3, 7, 15, 31 thin "canales"$) y cabezal de regresión MLP; entrenamiento guiado exclusivamente por el error cuadrático medio.],
  [Nivel 3: PIML],
  [Deep Learning con Física \ (PINN con Pérdida Cinética)],
  [PINN híbrida que minimiza $cal(L)_("total") = cal(L)_("datos") + lambda cal(L)_("cinética")$, incorporando las ecuaciones de Arrhenius como términos de penalización diferencial.],
  [Exploración Modular],
  [Modelos de Secuencia & NODEs \ (LSTM / Mamba / Transformers / Neural ODEs)],
  [Evaluación complementaria de redes recurrentes (LSTM/GRU), modelos Mamba de espacio de estados (@li2026asgmambaadaptivespectral), Transformers espectrales con mapas de atención (@upadhyay2026enhancingspectralanalysis) y ecuaciones diferenciales neuronales continuas (Neural ODEs / NODE).]
)

== 5.1 Formulación de la Pérdida en la Arquitectura PINN
El entrenamiento de la red PINN optimiza una función compuesta:

$ cal(L)_("total") = 1/N sum_(i=1)^N (y_i - hat(y)_i)^2 + lambda_1 1/M sum_(j=1)^M ((d hat(C)_j)/(d t) + k(T) hat(C)_j)^2 + lambda_2 cal(R)_("monotonía") $

donde $cal(L)_("cinética")$ castiga trayectorias que vulneren la cinética de degradación esperada a la temperatura $T$, y $cal(R)_("monotonía")$ impide incrementos espontáneos espurios de ácidos clorogénicos en sistemas cerrados.

== 5.2 Criterio Multiobjetivo de Pareto y Despliegue en Hardware de Borde
La selección de la mejor arquitectura se realiza conforme a tres criterios de Pareto:
1. *Precisión de Generalización:* RMSE y $R^2 >= 0,90$ en validación cruzada por lotes externos (*Leave-One-Batch-Out*).
2. *Consistencia Mecanicista:* Explicabilidad espectral validada con Grad-CAM y SHAP sobre las bandas funcionales ($1745, 1715, 1600 - 1650 thin "cm"^(-1)$).
3. *Factibilidad en Borde:* Cuantización a FP16/INT8 con latencia de inferencia $< 2,0 thin "segundos"$ y consumo $< 500 thin "MB"$ de RAM en computador monoplaca Raspberry Pi 4B/5.

---

= 6. Cooperación Bilateral, Plan de Trabajo y Presupuesto

== 6.1 Sinergia Institucional y Liderazgo Científico
- *Technische Hochschule Deggendorf (DIT) — Prof. Dr. Isabel Suárez:* Formulación matemática de pérdidas cinéticas, entrenamiento distribuido en clústeres GPU, desarrollo de PINN, Mamba y análisis de explicabilidad XAI; dirección del workshop en Cartagena.
- *Universidad de Cartagena (UdC) — Prof. Dr. Ricardo Vivas:* Suministro y caracterización botánica de cafés especiales, diseño y control de cámaras de degradación acelerada (25, 40 y 60 °C), escaneo ATR-FTIR longitudinal y analítica normalizada AOAC.

== 6.2 Movilidad Bilateral e Impacto en Jóvenes Investigadores
1. *Misión 1 (DIT -> UdC, Mes 2, 10 días):* Visita científica de la Prof. Dr. Isabel Suárez a Cartagena. Dictado de un workshop presencial de 1 semana ("Inteligencia Artificial Aplicada y Métodos Físico-Químicos para el Análisis Espectral Agroalimentario") dirigido a profesores y estudiantes de maestría y doctorado de la UdC; calibración y homologación experimental de protocolos FTIR en los laboratorios del Prof. Vivas.
2. *Misión 2 (UdC -> DIT, Meses 8–9, 21 días):* Estancia de investigación de 3 semanas de un joven investigador del grupo del Prof. Vivas en el Campus de IA del DIT. Entrenamiento avanzado en PyTorch, optimización de modelos en clústeres GPU, validación de inferencia en Raspberry Pi y co-redacción de la propuesta de gran escala DFG-Minciencias.

== 6.3 Cronograma de 12 Meses e Hitos Operativos
- *WP1 (Meses 1–4, UdC/DIT):* Puesta a punto experimental, recolección de café y Workshop 1 en Cartagena con la Prof. Dr. Suárez (M2). *Hito H1 (M4):* Protocolo analítico y datos piloto consolidados.
- *WP2 (Meses 3–8, UdC):* Almacenamiento acelerado (180 días), barrido continuo ATR-FTIR y analítica AOAC. *Hito H2 (M8):* Base de datos longitudinal completada.
- *WP3 (Meses 6–11, DIT/UdC):* Benchmarking en 3 niveles, estancia del investigador de UdC en Deggendorf (M8–9). *Hito H3 (M9):* Arquitectura óptima de Pareto seleccionada.
- *WP4 (Meses 10–12, DIT/UdC):* Síntesis bilateral, envío de 2 artículos científicos y estructuración de la propuesta DFG-Minciencias. *Hito H4 (M12):* Radicación del proyecto y reporte final a BAYLAT.

== 6.4 Presupuesto Detallado de la Cooperación (Total Solicitado: 8.610 €)
El presupuesto concuerda fielmente con las directrices de la convocatoria de financiamiento inicial BAYLAT y con la hoja oficial de cálculo (*06_Reiseverwaltung_Kostenkalkulation_Anschubfinanzierung.xlsx*):

#table(
  columns: (1.4fr, 0.9fr, 0.9fr, 0.8fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  align: (left, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header([Rubro Presupuestal], [Misión 1 (DIT->UdC)], [Misión 2 (UdC->DIT)], [Total], [Base de Cálculo Normativa]),
  [Pasajes aéreos (Ida/Vuelta)], [1.600 €], [1.700 €], [3.300 €], [Vuelos transatlánticos en clase económica (Múnich-Cartagena / Cartagena-Múnich)],
  [Gastos de Alojamiento], [1.100 €], [1.365 €], [2.465 €], [10 noches a 110 € en Cartagena / 21 noches a 65 € en Deggendorf],
  [Viáticos / Dietas de Estancia], [500 €], [945 €], [1.445 €], [10 días a 50 € (Colombia) / 21 días a 45 € (Alemania) según BayRKG],
  [Logística y Catering Workshop], [400 €], [-], [400 €], [Atención y refrigerios para el workshop presencial de IA en la UdC],
  [Seguro Médico de Viaje], [100 €], [100 €], [200 €], [Seguro de salud y accidentes internacional (tope máx. 200 € en BAYLAT)],
  [Materiales de Laboratorio], [-], [-], [600 €], [Reactivos y patrones para cinética de café (tope máx. 600 € en BAYLAT)],
  [Gastos de Medios Digitales], [-], [-], [200 €], [Accesorios para transmisión híbrida del workshop y sesiones virtuales],
  [*Presupuesto Total Solicitado*], [*3.700 €*], [*4.110 €*], [*8.610 €*], [*Monto total solicitado a BAYLAT (Deckblatt y Belegliste)*]
)

== 6.5 Proyección hacia la Convocatoria DFG-Minciencias
Los resultados y datos piloto generados en este proyecto semilla sustentarán la postulación de una propuesta de investigación conjunta de 3 años en el marco del programa bilateral *DFG-Minciencias Bilateral Research Grants*. En esa fase a gran escala, la metodología desarrollada en café se transferirá hacia el *cacao fino de aroma*, la *miel de abejas* y el *aceite de coco virgen*, acoplando la espectroscopía de campo con metabolómica de alta resolución (LC-HRMS, GC-MS).

#bibliography("references.bib", title: [Referencias Bibliográficas])
