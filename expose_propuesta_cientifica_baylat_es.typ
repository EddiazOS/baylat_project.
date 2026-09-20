#import "typst-scientific-report-template/template.typ": project, callout

#show: project.with(
  title: [Ecuaciones Diferenciales Neuronales Informadas por Física y Detección Espectral Multimodal para la Predicción Autónoma de Calidad y Frescura en Café Especial Colombiano],
  subtitle: [Memoria Científica y Propuesta de Investigación – Financiamiento Inicial BAYLAT (OASys 2026/2027)],
  objective: [
    Formular, evaluar y validar un marco analítico y computacional que integre espectroscopía infrarroja por transformada de Fourier con reflectancia total atenuada (ATR-FTIR), ensayos fisicoquímicos normatizados y modelos de Deep Learning informados por la física (PIML) en café especial colombiano (*Coffea arabica*). El proyecto se centra en contrastar rigurosamente métodos quimiométricos tradicionales (PLSR, SVR) frente a redes neuronales profundas (1D-CNN) y redes informadas por leyes cinéticas de degradación tipo Arrhenius (PINN) bajo condiciones de envejecimiento en climas tropicales, manteniendo una exploración modular de arquitecturas avanzadas (Mamba SSM, Transformers espectrales) y fortaleciendo la cooperación bilateral y la formación de investigadores entre la Technische Hochschule Deggendorf (DIT) y la Universidad de Cartagena (UdC).
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

= 1. Resumen Ejecutivo

El presente proyecto de investigación bilateral entre la Technische Hochschule Deggendorf (DIT, Baviera) y la Universidad de Cartagena (UdC, Colombia) propone el desarrollo de un marco analítico y computacional ágil para la predicción autónoma del deterioro fitoquímico y la pérdida de frescura en café especial colombiano (*Coffea arabica*). Con una asignación semilla de 12 meses financiada por BAYLAT (7.350 €), la investigación aborda la vulnerabilidad crítica que enfrentan los productores y exportadores durante el almacenamiento poscosecha en climas tropicales cálido-húmedos y el subsiguiente transporte marítimo transatlántico (20 a 45 días) hacia los mercados prémium europeos, en particular Baviera. En este trayecto, la autoxidación lipídica y la escisión hidrolítica de los ácidos clorogénicos degradan irreversiblemente los atributos sensoriales de lotes de alta calidad. Ante las limitaciones de la catación organoléptica convencional —inherentemente subjetiva y no predictiva— y el costo prohibitivo y demora de la cromatografía instrumental clásica, la investigación despliega una metodología dual innovadora: (1) el monitoreo experimental longitudinal bajo condiciones ambientales tropicales reales en el Caribe colombiano, respaldado por espectroscopía rápida en infrarrojo medio con reflectancia total atenuada (ATR-FTIR) y ensayos fisicoquímicos estandarizados (AOAC/ISO); y (2) el desarrollo de modelos de Deep Learning informados por la física (Physics-Informed Neural Networks - PINN), los cuales incorporan leyes cinéticas de degradación tipo Arrhenius para superar la rigidez de la quimiometría lineal (PLSR) y la falta de interpretabilidad física de las redes neuronales estándar. La sinergia binacional se articula mediante un workshop presencial intensivo en Cartagena y una estancia de investigación de 2 semanas en el Campus de IA de Deggendorf, generando los datos piloto indispensables para postular a la convocatoria bilateral de gran escala DFG-Minciencias.

*Palabras clave:* Café especial, Coffea arabica, ATR-FTIR, Redes neuronales informadas por la física (PINN), Cinética de degradación, Quimiometría.

---

= 2. Introducción y Planteamiento del Problema

== 2.1 Contexto Socioeconómico y Bioeconomía del Café Especial Colombiano
Colombia es uno de los principales productores mundiales de café arábica suave lavado de alta montaña (*Coffea arabica*). De acuerdo con las cifras oficiales de la Federación Nacional de Cafeteros de Colombia @fnc2023informecafetero, la actividad cafetera constituye el soporte socioeconómico fundamental del campo colombiano, sustentando a más de 540.000 familias campesinas distribuidas en más de 600 municipios a lo largo de las tres cordilleras andinas y zonas montañosas aisladas como la Sierra Nevada de Santa Marta. Con una cosecha nacional estabilizada en el rango de 12 a 14 millones de sacos verdes de 60 kg por año, el café representa un valor de exportaciones que oscila entre los 3.000 y 4.000 millones de USD anuales, consolidándose como el principal rubro no minero-energético de la canasta exportadora colombiana y un pilar estratégico de la bioeconomía rural @fnc2023informecafetero.

Dentro de esta estructura productiva, el segmento de los cafés especiales (*Specialty Coffee*), formalmente delimitado por los estándares de la Specialty Coffee Association @sca2020specialtycoffee, ha cobrado una relevancia económica transformadora. La SCA define como café especial aquel lote trazable que obtiene una calificación de taza igual o superior a 85 puntos en una escala sobre 100, evaluada mediante un riguroso protocolo de diez descriptores sensoriales (fragancia/aroma, sabor, sabor residual, acidez, cuerpo, balance, uniformidad, taza limpia, dulzor y puntaje general). Estos cafés, caracterizados por notas aromáticas florales, acidez cítrica y málica brillante y perfiles frutales de gran complejidad, acceden a considerables primas de precio en los mercados de especialidad europeos. En este escenario, el Estado Libre de Baviera y la República Federal de Alemania en su conjunto representan uno de los mercados de mayor sofisticación y demanda de cafés diferenciados de origen único, donde los consumidores y tostadores de micro-lotes remuneran sustancialmente la consistencia física y organoléptica @sca2020specialtycoffee.

== 2.2 Vulnerabilidad en Almacenamiento Tropical y Transporte Marítimo Transatlántico
No obstante el elevado valor económico de los cafés especiales, la preservación de su perfil de taza y frescura química enfrenta un obstáculo crítico: la extrema vulnerabilidad intrínseca del grano verde (*green coffee*) a las condiciones climáticas imperantes a lo largo de la cadena poscosecha. En Colombia, el almacenamiento intermedio en fincas, cooperativas locales y bodegas portuarias de acopio en la costa Caribe (p. ej., Cartagena de Indias o Santa Marta) se efectúa bajo condiciones ambientales tropicales cálido-húmedas, caracterizadas por temperaturas que fluctúan entre 25 °C y 38 °C y humedades relativas ambientales sostenidas entre el 60% y el 85% RH.

Esta vulnerabilidad es crítica durante la fase de transporte marítimo transatlántico. El tránsito en contenedores marítimos secos desde los puertos del Caribe colombiano hasta los principales puertos de desembarque del norte de Europa (Hamburgo, Bremen o Róterdam) se extiende habitualmente durante 20 a 45 días. En el interior de los contenedores estándar, la exposición solar directa sobre cubierta genera oscilaciones térmicas marcadas (superando frecuentemente los 40 °C durante el día y descendiendo bruscamente en la noche), lo que desencadena ciclos microclimáticos de condensación interna y evaporación ("lluvia de contenedor"). Estas fluctuaciones extremas catalizan trayectorias aceleradas de envejecimiento químico (*staling*), blanqueamiento del grano verde y pérdida irreversible de los compuestos volátiles y precursores solubles que definen el puntaje SCA, provocando que microlotes certificados inicialmente con 86–88 puntos arriben a Baviera degradados a calidades comerciales ordinarias (< 80 puntos).

== 2.3 Vías Fitoquímicas de Degradación y Marcadores Moleculares de Calidad
A escala biomolecular, el deterioro de *Coffea arabica* almacenado bajo estrés termohigrométrico responde a tres cascadas cinéticas acopladas:

1. *Hidrólisis y transformación de ácidos clorogénicos (CGA):* Los ácidos clorogénicos representan entre el 6% y el 9% de la materia seca del café arábica y comprenden ésteres cafeoilquínicos (5-CQA, 3-CQA, 4-CQA), dicafeoilquínicos y feruloilquínicos @farah2012coffeeconstituents. El 5-CQA, analito mayoritario, es el principal determinante de la acidez fina y del potencial antioxidante del grano. Durante el almacenamiento a temperaturas tropicales elevadas, los enlaces éster sufren una escisión hidrolítica progresiva que libera ácido quínico y ácido cafeico libre, o bien lactonizan formando quinidas astringentes @farah2012coffeeconstituents. Esta alteración modifica sustancialmente el balance ácido del grano, modificando la acidez titulable normada según el método oficial AOAC 920.92 @aoac92092 y generando sabores amargos metálicos indeseables.

2. *Peroxidación radicalaria de la fracción lipídica:* La fracción lipídica constituye del 12% al 17% del peso seco del grano y está integrada primordialmente por triacilgliceroles insaturados con elevado contenido de ácido linoleico ($"C18:2"$) y ésteres diterpénicos específicos (cafestol y kahweol). Por acción del oxígeno intersticial, la temperatura y la catálisis lumínica o metálica, los ácidos grasos insaturados experimentan reacciones radicalarias en cadena de autoxidación lipídica @buffo2004coffeevolatiles. En la fase de propagación se generan hidroperóxidos de lípidos conjugados, cuantificables analíticamente a través del índice de peróxidos conforme a la norma AOAC 965.33 @aoac96533. La descomposición secundaria de estos hidroperóxidos conduce a la formación de compuestos carbonílicos volátiles de bajo peso molecular (hexanal, trans-2-nonenal, octanal), responsables directos de los sabores rancios, notas a madera seca y defectos a paja vieja (*baggy*) @buffo2004coffeevolatiles.

3. *Dinámica higroscópica e intercambio de agua ligada:* El grano de café verde es una matriz coloidal porosa altamente higroscópica cuya dinámica de sorción y desorción responde a la humedad relativa del entorno y a la temperatura de almacenamiento. Las variaciones en el contenido de humedad gravimétrica, determinadas mediante las normas oficiales AOAC 968.11 @aoac96811 e ISO 6673 @iso6673, y de la actividad de agua ($a_w$) inducen transiciones vítreas en los biopolímeros celulares. Una actividad de agua superior a 0,65 a temperaturas superiores a 30 °C cataliza reacciones incipientes de Maillard no enzimáticas entre azúcares reductores libres y aminoácidos, propiciando el pardeamiento indeseado de los tejidos embrionarios y la inactivación metabólica de los granos.

== 2.4 Limitaciones de los Ensayos Convencionales y Oportunidades de la Espectroscopía ATR-FTIR
El control de calidad en las etapas de almacenamiento y comercialización enfrenta una brecha técnica insalvable con las herramientas operativas actuales:
- Por un lado, la *catación sensorial SCA* @sca2020specialtycoffee constituye una metodología inherentemente cualitativa, empírica y post-hoc. Está supeditada a la variabilidad subjetiva de los jueces catadores, sesgos de fatiga sensorial y falta de estandarización térmica en campo. Además, la catación únicamente diagnostica el deterioro una vez que las alteraciones sensoriales ya se han manifestado, imposibilitando la cuantificación objetiva de la vida útil restante (*remaining shelf-life*) de un lote en bodega o durante el tránsito marítimo.
- Por otro lado, las *metodologías analíticas instrumentales clásicas*, tales como la cromatografía líquida de alta resolución acoplada a detectores de arreglo de diodos (HPLC-DAD) y la cromatografía de gases acoplada a espectrometría de masas (GC-MS), proporcionan una excelente resolución química, pero exhiben limitaciones operativas determinantes. Son técnicas estrictamente destructivas, lentas (requiriendo horas o días para la extracción con solventes, purificación y corrida analítica), dependientes de reactivos tóxicos y asociadas a costos prohibitivos ($150 - 300 thin "USD"$ por muestra analizada). Estas características tornan inviable su implementación rutinaria en cooperativas de base, trilladoras o puertos de embarque.

Frente a estas restricciones analíticas, la *espectroscopía infrarroja media con reflectancia total atenuada (ATR-FTIR)* constituye una alternativa rápida y no destructiva @manzocco2020shelf. La técnica ATR-FTIR permite adquirir el perfil vibracional directo de muestras sólidas de café molido en un intervalo temporal menor a 2 minutos, sin preparación química previa, sin consumo de reactivos y con reproducibilidad instrumental excepcional. El espectro obtenido en la región del infrarrojo medio ($4000 - 600 thin "cm"^(-1)$) actúa como una huella molecular integral que captura simultáneamente las transiciones vibracionales asociadas a los enlaces fitoquímicos clave del café: la banda de estiramiento éster $nu("C=O")$ en $1745 thin "cm"^(-1)$ y el desarrollo del hombro de ácidos libres en $1715 thin "cm"^(-1)$, el doble enlace $nu(= "C-H")$ _cis_ en $3008 thin "cm"^(-1)$, la tensión de fenoles y agua en $3400 - 3250 thin "cm"^(-1)$, y los estiramientos de ésteres de ácidos clorogénicos en $1380 - 1150 thin "cm"^(-1)$. No obstante, la complejidad de las firmas espectrales ATR-FTIR —caracterizadas por intensa superposición de bandas, dispersión física y efectos de matriz— exige el desarrollo de modelos computacionales avanzados capaces de extraer correlaciones cinéticas causales y generalizar de forma robusta @manzocco2020shelf.

---

= 3. Pregunta Científica y Objetivos de la Investigación

== 3.1 Pregunta Central de Investigación
#callout(title: "Interrogante Científico Principal")[
  *Pregunta de Investigación:* ¿En qué medida los modelos de Deep Learning informados por la física (Physics-Informed Neural Networks, PINN), al integrar de forma explícita leyes cinéticas diferenciales de degradación de primer orden acopladas a la dependencia térmica de Arrhenius para la hidrólisis de ácidos clorogénicos y la peroxidación lipídica, superan a la quimiometría lineal clásica (regresión por mínimos cuadrados parciales, PLSR; y máquinas de soporte vectorial, SVR) y a las redes neuronales convolucionales empíricas (1D-CNN) en términos de exactitud predictiva ($R^2$, RMSE, MAPE), robustez de generalización ante lotes y orígenes no observados (*out-of-distribution*), e interpretabilidad fisicoquímica causal demostrable a partir de perfiles espectrales ATR-FTIR de café especial (*Coffea arabica*) almacenado bajo condiciones ambientales tropicales fluctuantes?
]

== 3.2 Objetivo General
Desarrollar, implementar y validar experimentalmente un marco analítico y computacional ágil de monitoreo no destructivo basado en espectroscopía infrarroja media (ATR-FTIR), perfiles de referencia fisicoquímicos normalizados (AOAC/ISO) y algoritmos de Deep Learning informados por la física (PINN), con el fin de cuantificar marcadores moleculares críticos y predecir de manera autónoma las trayectorias cinéticas de degradación y pérdida de frescura en lotes de café especial colombiano (*Coffea arabica*) sometidos a almacenamiento en condiciones ambientales tropicales y logística transatlántica.

== 3.3 Objetivos Específicos
1. *Alineado con WP1 (Puesta a punto experimental, recolección y Workshop en Cartagena):* Estandarizar el diseño experimental longitudinal y el protocolo analítico de adquisición espectral rápida ATR-FTIR sobre lotes certificados de café especial (*Coffea arabica* cultivares *Castillo*, *Caturra*, *Colombia* y *Geisha*), garantizando la calibración e intercomparación instrumental y realizando un workshop presencial bilateral intensivo de capacitación en Inteligencia Artificial aplicada a la espectroscopía agroalimentaria en la Universidad de Cartagena, impartido por la investigadora principal del DIT para docentes y jóvenes investigadores de la UdC.
2. *Alineado con WP2 (Monitoreo longitudinal en condiciones tropicales y analítica AOAC/ISO):* Ejecutar el monitoreo cinético longitudinal sistemático de las muestras sometidas a almacenamiento en condiciones ambientales reales de clima tropical cálido-húmedo del Caribe colombiano, consolidando una base de datos multimodal que asocie los barridos espectrales ATR-FTIR periódicos con determinaciones analíticas de referencia normalizadas: acidez titulable (@aoac92092), humedad residual y actividad de agua (@aoac96811, @iso6673), índice de peróxidos lipídicos (@aoac96533) y concentración de ácidos clorogénicos totales y 5-CQA.
3. *Alineado con WP3 (Modelado de ciencia de datos, estancia en Deggendorf y benchmark factorial):* Formular, calibrar y someter a benchmark comparativo estructurado en tres niveles metodológicos —quimiometría lineal y de kernel (PLSR, SVR), Deep Learning empírico (1D-CNN) y redes neuronales informadas por principios físicos (PINN acopladas a cinéticas de degradación de Arrhenius)— durante la estancia de investigación de 2 semanas del investigador de la UdC en el Campus de IA de la TH Deggendorf, verificando la consistencia física y la interpretabilidad espectral causal mediante mapas de atención y técnicas de atribución de gradientes (Grad-CAM y SHAP).
4. *Alineado con WP4 (Síntesis bilateral, publicaciones y estructuración de propuesta DFG-Minciencias):* Evaluar la viabilidad de despliegue computacional eficiente de los modelos optimizados en hardware embebido (Edge AI sobre plataformas de bajo costo como Raspberry Pi), transferir las capacidades a cooperativas y actores de la cadena cafetera, coautorar dos artículos científicos en revistas internacionales de alto impacto (Q1) y formular de manera conjunta la propuesta de investigación a gran escala (3 años) para la convocatoria bilateral DFG-Minciencias extendiendo el marco a otras matrices agroalimentarias de alta biodiversidad.

---

= 4. Marco Teórico y Estado del Arte

== 4.1 Fitoquímica de Coffea arabica y Marcadores Moleculares de Deterioro
La matriz biológica del grano de café arábica (*Coffea arabica*) representa un sistema metabólico altamente complejo, higroscópico y dinámico, cuya preservación postcosecha condiciona de forma directa los atributos sensoriales que definen el café especial de alta gama ($>= 85$ puntos SCA). Desde el punto de vista fitoquímico cuantitativo y funcional, el endospermo del grano está integrado por diversas familias moleculares (@farah2012coffeeconstituents):
- *Ácidos Clorogénicos (CGA):* Constituyen entre el $6\%$ y el $9\%$ de la biomasa seca total del grano verde. Químicamente, son ésteres formados por la condensación entre el ácido trans-cinámico sustituido (ácidos cafeico, ferúlico y p-cumárico) y el ácido quínico (ácido 1L-1(OH),3,4/5-tetrahidroxiciclohexanocarboxílico). La fracción predominante está representada por los ácidos cafeoilquínicos monocaffeilados (CQA), en los cuales el isómero ácido 5-cafeoilquínico (5-CQA) abarca entre el $70\%$ y el $80\%$ de la fracción polifenólica total, coexistiendo en equilibrio termodinámico con sus regioisómeros 3-CQA y 4-CQA. Asimismo, la matriz contiene ésteres dicafeoilquínicos (di-CQA, incluyendo los isómeros 3,4-diCQA, 3,5-diCQA y 4,5-diCQA; $1,5 - 2,5\%$) y ésteres feruloilquínicos (FQA; $0,8 - 1,4\%$). Estos metabolitos polifenólicos no solo actúan como potentes antioxidantes intracelulares donores de hidrógeno, sino que gobiernan el brillo de la acidez cítrica y málica y fungen como precursores esenciales del bouquet aromático durante la tostión.
- *Fracción Lipídica y Diterpenos:* Oscila entre el $12\%$ y el $17\%$ del peso seco del grano, confinada en vesículas citoplasmáticas (cuerpos lipídicos). Se encuentra dominada en un $75 - 80\%$ por triacilgliceroles (TAG) ricos en ácidos grasos insaturados, fundamentalmente ácido linoleico ($"C18:2"$, $omega-6$, que representa el $40 - 46\%$ del total de ácidos grasos esterificados) y ácido oleico ($"C18:1"$, $8 - 12\%$), complementados por ácidos grasos saturados de cadena larga como el ácido palmítico ($"C16:0"$, $30 - 35\%$) y esteárico ($"C18:0"$, $7 - 9\%$). En la fracción insaponificable ($15 - 20\%$ de la fracción lipídica) destacan dos diterpenos pentacíclicos de esqueleto caurano exclusivos del género: cafestol y kahweol, esterificados principalmente con ácidos grasos individuales. Estos diterpenos son bioindicadores taxonómicos de la especie arábica y estabilizadores coloidales de la matriz.
- *Alcaloides:* La cafeína (1,3,7-trimetilxantina, $1,0 - 1,4\%$ p/p) exhibe una excepcional estabilidad térmica y resistencia química frente a la oxidación atmosférica en condiciones estándar; en contraste, la trigonelina ($N$-metilbetaina del ácido nicotínico, $0,8 - 1,2\%$ p/p) opera como osmolito celular y regulador metabólico, constituyendo un precursor termolábil de compuestos aromáticos volátiles como piridinas y pirazinas.
- *Carbohidratos y Fracción Nitrogenada:* La sacarosa ($6 - 9\%$ p/p) representa el carbohidrato soluble libre dominante, susceptible a hidrólisis ácida o enzimática. Los polisacáridos estructurales insolubles ($45 - 50\%$ de la materia seca) están formados por complejos de galactomananos y arabinogalactanos ramificados que constituyen la pared celular vegetal. Las proteínas ($10 - 13\%$) abarcan globulinas de reserva (alelo-globulinas 11S) y una fracción minoritaria pero altamente reactiva de péptidos y aminoácidos libres (asparagina, ácido glutámico).

Durante el acopio, manipulación poscosecha y transporte transatlántico en climas cálidos y húmedos propios de las zonas tropicales colombianas, el café experimenta dos vías principales de deterioro fisicoquímico acopladas (@buffo2004coffeevolatiles, @ribeiro2011chemicalchanges):
1. *Hidrólisis e isomerización de ácidos clorogénicos:* Por acción de la humedad y la energía térmica ambiental, el enlace éster entre el ácido quínico y los ácidos hidroxicinámicos sufre una hidrólisis progresiva. Esta ruptura libera ácido quínico libre y ácido cafeico libre, alterando el pH del grano e incrementando la acidez titulable total mediante un perfil astringente, metálico y acre ("sourness" indeseada). De forma paralela, la autooxidación de los anillos orto-difenólicos del ácido cafeico genera quinonas intermedias reactivas que condensan irreversiblemente con aminoácidos libres, induciendo el pardeamiento enzimático residual y la decoloración del grano verde.
2. *Rancidez lipídica y biogénesis de volátiles degradativos:* La fracción insaturada de los lípidos (particularmente el ácido linoleico, provisto de carbonos metilénicos bis-alílicos $-"CH"="CH"-"CH"_2-"CH"="CH"-$ con baja energía de disociación de enlace $"C-H"$) es altamente vulnerable a la autoxidación radicalaria mediada por oxígeno difusivo. La iniciación y propagación generan hidroperóxidos lipídicos conjugados (ROOH), cuantificables a través del índice de peróxidos. Estos hidroperóxidos sufren posterior escisión homolítica secundaria ($beta$-scission) mediada por radicales alcoxilo ($"RO"^•$), produciendo una cascada de aldehídos volátiles alifáticos lineales y ramificados (hexanal, nonanal, octanal, trans-2-nonenal), cetonas y ácidos grasos libres de cadena corta. La acumulación de estos metabolitos secundarios es la responsable directa de la pérdida de frescura, enmascarando los atributos florales y frutales característicos de los cafés de especialidad con notas a grano rancio, paja, madera vieja y cartón húmedo ("staling").

== 4.2 Cinética de Deterioro y Termodinámica de Arrhenius en Condiciones Ambientales
La evolución cuantitativa de las especies fitoquímicas marcadoras de frescura a lo largo del tiempo de almacenamiento puede describirse analíticamente mediante modelos cinéticos diferenciales de orden aparente $n$ acoplados a la termodinámica clásica de velocidades de reacción (@manzocco2020shelf). Para un reactivo sustrato que decae (p. ej., concentración residual de 5-CQA, ésteres diterpénicos intactos o dobles enlaces _cis_ en lípidos), la ley de velocidad diferencial general adopta la forma:

$ (d C_i(t)) / (d t) = - k_i(T(t), a_w(t)) dot [C_i(t)]^(n_i) $

mientras que para la acumulación de productos secundarios de degradación (tales como hidroperóxidos lipídicos o ácido quínico libre):

$ (d P_j(t)) / (d t) = + k_j(T(t), a_w(t)) dot [C_i(t)]^(m_j) $

donde $C_i(t)$ y $P_j(t)$ corresponden a las concentraciones molares o másicas de sustratos y productos en el instante $t$, $n_i$ y $m_j$ representan los órdenes de reacción aparentes, y $k_i$ denota la constante cinética global de velocidad. En sistemas agroalimentarios de humedad intermedia como el café, las reacciones de autoxidación lipídica en etapas iniciales operan frecuentemente bajo un régimen cinético de orden aparente cero ($n_i = 0$) en presencia de oxígeno disponible, mientras que la hidrólisis de ésteres de ácidos clorogénicos exhibe típicamente una cinética de pseudo-primer orden ($n_i = 1$).

La dependencia fundamental de la constante cinética de velocidad $k_i$ respecto a la temperatura absoluta $T$ está descrita por la ecuación de Arrhenius:

$ k_i(T) = A_i dot exp(- E_(a,i) / (R dot T)) $

donde $A_i$ representa el factor pre-exponencial o factor de frecuencia entálpica ($"tiempo"^(-1)$), que cuantifica la frecuencia de colisiones moleculares con orientación espacial energéticamente favorable; $E_(a,i)$ es la energía de activación aparente de la reacción en la matriz sólida ($"kJ/mol"$), correspondiente a la barrera de energía libre de Gibbs que deben franquear los reactivos para alcanzar el estado de transición activado (típicamente $60 - 110 thin "kJ/mol"$ para la degradación térmica de CGA y oxidación lipídica en matrices secas); $R$ es la constante universal de los gases ideales ($8,314 thin "J/(mol" dot "K)"$); y $T$ es la temperatura termodinámica absoluta en Kelvin ($K$).

#callout(title: "Modelado Dinámico de Microclima Real frente a Ensayos Isotérmicos")[
  A diferencia de los protocolos tradicionales de pruebas aceleradas de vida útil (ASLT) que recurren a cámaras climáticas a temperaturas fijas (típicamente a 25, 40 o 60 °C), en esta investigación no se emplean cámaras isotérmicas artificiales. El calentamiento térmico forzado en atmósferas estáticas ($>= 40 - 60 thin degree"C"$) puede inducir alteraciones no representativas en la estructura macromolecular y disociar los equilibrios higroscópicos de sorción. En su lugar, la metodología propuesta modela las trayectorias de deterioro bajo las *fluctuaciones dinámicas del microclima real* registradas en bodegas tropicales y logística portuaria (Cartagena de Indias), integrando de forma continua los ciclos térmicos circadianos ($22 - 34 thin degree"C"$) y las oscilaciones de humedad relativa ($65 - 90\%$).
]

En este contexto ambiental no estacionario, la actividad de agua ($a_w = p / p_0$, vinculada en equilibrio con la humedad relativa ambiental por $"HR" = 100 dot a_w$) cumple un papel termodinámico crítico como modulador cinético. De acuerdo con la física de polímeros y la teoría de transiciones vítreas de Gordon-Taylor, el agua condensada en los microporos del grano actúa como plastificante molecular sobre la matriz amorfa de galactomananos y proteínas. A niveles bajos de humedad relativa ($a_w < 0,50$), la matriz del endospermo se encuentra en un estado vítreo rígido (*glassy state*), donde la viscosidad ultraelevada ($eta > 10^(12) thin "Pa" dot "s"$) reduce de forma sustancial la tasa de difusión traslacional de reactivos químicos y oxígeno diatómico.

Sin embargo, cuando las oscilaciones higrométricas tropicales elevan la actividad de agua por encima del umbral crítico ($a_w >= 0,60 - 0,70$), la temperatura de transición vítrea ($T_g$) desciende por debajo de la temperatura ambiente de almacenamiento ($T > T_g$). Este fenómeno induce la transición vítreo-gomosa de la matriz (*glass-to-rubber transition*), incrementando el volumen libre intermolecular y acelerando los coeficientes de difusión de oxígeno disuelto y agua reactiva. Por consiguiente, la constante de velocidad efectiva no es una magnitud estática, sino una variable acoplada a las series temporales dinámicas del microclima:

$ k_i(t) = A_i (a_w(t)) dot exp(- E_(a,i) / (R dot T(t))) $

La integración continua de este sistema dinámico no autónomo sobre las lecturas ambientales registradas por dataloggers calibrados permite predecir con exactitud mecanística la cinética real de agotamiento de frescura.

== 4.3 Principios Físicos de Espectroscopía Vibracional ATR-FTIR
La espectroscopía de infrarrojo medio por transformada de Fourier (FTIR) en el rango espectral de $4000 - 600 thin "cm"^(-1)$ (longitudes de onda $lambda$ entre $2,5$ y $16,7 thin mu"m"$) constituye una técnica analítica de alta sensibilidad cuántica para interrogar la estructura molecular del café. La absorción de fotones infrarrojos ocurre cuando la frecuencia de la radiación incidente coincide de forma resonante con la frecuencia de oscilación natural de un modo normal de enlace químico, con la condición mecánica cuántica obligatoria de que la vibración genere una variación periódica no nula en el momento dipolar eléctrico molecular ($partial bold(mu) / partial q != 0$). De este modo, los enlaces covalentes fundamentales de la biomasa cafetera ($"O-H"$, $"C-H"$, $"C=O"$, $"C=C"$, $"C-O"$) producen bandas de absorción vibracional intrínsecas debidas a movimientos de tensión (*stretching*, $nu$) simétrica y asimétrica, y de deformación o flexión (*bending*, $delta$) en el plano y fuera de él.

A fin de examinar muestras complejas de café finamente homogeneizado sin incurrir en tratamientos químicos de extracción con solventes orgánicos ni preparación destructiva de pastillas de KBr, la técnica de Reflectancia Total Atenuada (ATR) explota el fenómeno óptico de reflexión interna total (@ribeiro2011chemicalchanges). La radiación infrarroja incide con un ángulo $theta$ (típicamente $45 thin degree$) sobre la cara interna de un cristal de alto índice de refracción (elemento de reflexión interno de diamante, $n_1 approx 2,42$), colocado en íntimo contacto mecánico con la muestra sólida de café ($n_2 approx 1,40 - 1,50$). Dado que $n_1 > n_2$, al superar el ángulo crítico de incidencia ($theta > theta_c = arcsin(n_2 / n_1) approx 38,2 thin degree$), la radiación experimenta reflexión interna total en la interfase cristal-café.

En cada punto de reflexión se instaura una *onda electromagnética evanescente* estacionaria que penetra perpendicularmente en la muestra en dirección al eje $z$. La amplitud del campo eléctrico decae de forma exponencial continua conforme a:

$ E(z) = E_0 dot exp(- z / d_p) $

donde la profundidad de penetración característica $d_p$, definida como la distancia a la cual la intensidad del campo decae a un factor $1/e$ de su valor superficial, se deriva de las ecuaciones de Maxwell-Fresnel:

$ d_p(tilde(nu)) = 1 / (2 pi tilde(nu) n_1 sqrt(sin^2(theta) - (n_2 / n_1)^2)) $

Para la geometría instrumental adoptada, $d_p$ varía típicamente entre $0,65 thin mu"m"$ en los números de onda más altos ($4000 thin "cm"^(-1)$) y $4,2 thin mu"m"$ en la región de huella dactilar ($600 thin "cm"^(-1)$). Esta escala de penetración subcelular permite interrogar selectivamente la superficie sin distorsiones asociadas a la dispersión fotónica por partículas heterogéneas.

La atenuación de la reflectancia en cada número de onda $tilde(nu)$ debido a la absorción de los enlaces fitoquímicos se relaciona directamente con la concentración volumétrica de los analitos a través de la ley de Beer-Lambert modificada para ATR:

$ A(tilde(nu)) = - log_(10) (R(tilde(nu)) / R_0(tilde(nu))) = sum_i epsilon_i(tilde(nu)) dot b_("eff")(tilde(nu)) dot C_i $

donde $A(tilde(nu))$ es la absorbancia espectral aparente, $epsilon_i(tilde(nu))$ es el coeficiente de absortividad molar de la especie química absorbente $i$, $C_i$ es su concentración en el volumen sondeado, y $b_("eff")(tilde(nu)) prop d_p(tilde(nu))$ corresponde al camino óptico efectivo. Esta relación linealizada es la base fisicoquímica que faculta el desacoplamiento de perfiles químicos a partir de firmas espectrales.

#table(
  columns: (1.1fr, 1.4fr, 2.1fr, 3.0fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Número de onda ($"cm"^(-1)$)],
    [Modo Vibracional],
    [Grupo Funcional y Matriz],
    [Evolución Cinética Durante el Almacenamiento Tropical]
  ),
  [$3400 - 3250$],
  [Tensión $nu("O-H")$],
  [Agua adsorbida ($a_w$) y fenoles libres de CGA],
  [Desplazamiento del máximo y ensanchamiento de banda por modulación higroscópica y condensación de puentes de hidrógeno.],
  [$3008$],
  [Tensión $nu(= "C-H")$ _cis_],
  [Dobles enlaces olefínicos en TAG (linoleico y oleico)],
  [Atenuación progresiva por peroxidación lipídica radicalaria y conversión a peróxidos e hidroperóxidos conjugados _trans_.],
  [$2925, 2854$],
  [Tensión $nu_("as"), nu_("s")("C-H")$],
  [Grupos metileno ($-"CH"_2-$) y metilo ($-"CH"_3$) alifáticos],
  [Bandas lipídicas termoestables de baja variabilidad; empleadas como estándar interno de normalización espectral por SNV.],
  [$1745$],
  [Tensión $nu("C=O")$ éster],
  [Triglicéridos y ésteres diterpénicos (cafestol, kahweol)],
  [Atenuación gradual de la intensidad pico y aparición paulatina de un hombro asimétrico a frecuencias inferiores por hidrólisis lipídica.],
  [$1715 - 1695$],
  [Tensión $nu("C=O")$ carboxilo],
  [Ácidos grasos libres (AGL) y ácido quínico liberado],
  [Incremento continuo y monotónico correlacionado con la pérdida de frescura, erigiéndose en biomarcador espectral de añejamiento ("staling").],
  [$1650 - 1600$],
  [Tensión $nu("C=C")$ aromático y amida I],
  [Anillo bencénico de ácidos hidroxicinámicos y proteínas],
  [Atenuación por polimerización oxidativa de restos orto-difenólicos y condensación con cadenas peptídicas.],
  [$1380 - 1150$],
  [Tensión $nu("C-O")$, flexión $delta("O-H")$],
  [Enlaces éster de ácidos cafeoilquínicos (5-CQA)],
  [Decrecimiento cuantitativo reproducible, con elevada correlación cruzada respecto al decaimiento de CGA por HPLC/Folin.],
  [$1050 - 1030$],
  [Tensión $nu("C-O")$ piranósica],
  [Sacarosa y polisacáridos estructurales (galactomananos)],
  [Atenuación lenta asociada a reacciones incipientes de pardeamiento no enzimático y consumo de carbohidratos solubles.]
)

== 4.4 Estado del Arte: De la Quimiometría Clásica a la Inteligencia Artificial Informada por la Física
La evaluación instrumental de la calidad en matrices agroalimentarias mediante espectroscopía infrarroja ha estado tradicionalmente dominada por metodologías quimiométricas multivariantes clásicas (@boadu2024developinganovel, @feng2021applicationofvisibleinfrared, @widiarto2026detectionofadulteration). Herramientas no supervisadas como el Análisis de Componentes Principales (PCA) y modelos de regresión supervisada lineal como la Regresión de Mínimos Cuadrados Parciales (PLSR) o métodos basados en funciones de base radial (Support Vector Regression - SVR) se han aplicado profusamente en café para autenticación de cultivares, clasificación de origen geográfico y detección de adulteraciones con granos defectuosos o cereales foráneos.

A pesar de su contrastada utilidad práctica en problemas estáticos, la quimiometría clásica adolece de tres limitaciones estructurales insalvables para el monitoreo dinámico:
1. *Atemporalidad:* Procesa cada firma espectral como un punto aislado e independiente en un hiperespacio euclidiano, ignorando la correlación causal temporal inherente a las trayectorias de descomposición.
2. *Supuesto de linealidad:* Es incapaz de desacoplar no linealidades ópticas complejas (como solapamientos multiescala de bandas vibracionales con dispersión dependiente del tamaño de partícula).
3. *Agnosticismo físico:* Los coeficientes de regresión se determinan mediante criterios puramente estadísticos de maximización de covarianza, lo que provoca que los modelos fallen en la extrapolación temporal ante regímenes térmicos e higrométricos no presenciados en el conjunto de calibración.

En la última década, las arquitecturas de Deep Learning han emergido para solventar estas restricciones. En particular, las redes neuronales convolucionales unidimensionales (1D-CNN) se han consolidado como un enfoque prometedor en quimiometría espectral (@passos2605convolutionalneuralnetworks). Las convoluciones 1D con filtros adaptativos de distintos anchos actúan como operadores de derivación y filtrado continuos, extrayendo representaciones jerárquicas capaces de deconvolucionar picos espectrales solapados sin requerir pretratamientos manuales ad-hoc. No obstante, como advierte Passos (@passos2605convolutionalneuralnetworks), las redes neuronales puramente dirigidas por datos carecen de restricciones fenomenológicas explícitas: en aplicaciones agroalimentarias con conjuntos de datos de tamaño moderado, las arquitecturas no regularizadas tienden a sobreajustar el ruido instrumental y pueden producir estimaciones incompatibles con las leyes físicas (p. ej., anticipar la generación espontánea de 5-CQA o tasas de degradación negativas en etapas tardías de almacenamiento), vulnerando los principios universales de la termodinámica.

Para superar tanto las limitaciones de linealidad de la quimiometría como la falta de consistencia fenomenológica en redes estándar, el enfoque de Machine Learning Informado por la Física (PIML / Physics-Informed Neural Networks - PINN) integra ecuaciones diferenciales ordinarias mecanísticas directamente en el aprendizaje supervisado (@perre2025towardmechanisticmodels). Perré demostró que la inserción de operadores diferenciales físicos en redes neuronales previene el desvío numérico y confiere a los modelos capacidad de extrapolación fidedigna en procesos no estacionarios con escasez de datos. En el procesamiento térmico de café, Pronk & Anthony (@pronk2026neuralnetworkplacementin) evidenciaron que la estructuración de redes neuronales acopladas como términos correctores o residuos de leyes fisicoquímicas garantiza la invariancia termodinámica y supera ampliamente a las arquitecturas empíricas desprovistas de guía teórica.

Simultáneamente, la literatura reciente ha incorporado mecanismos avanzados de atención espectral (Spectral Attention Mechanism, SAM) y modelos de espacio de estados (SSM) para dotar a las redes neuronales de interpretabilidad química y escalabilidad en secuencias largas. Upadhyay & Chaudhary (@upadhyay2026enhancingspectralanalysis) demostraron que la autoatención multimodal permite resaltar de manera automática las regiones espectrales ligadas a grupos funcionales específicos, asegurando que las inferencias descansen en transiciones vibracionales químicamente coherentes y no en correlaciones estadísticas no causales. Por su parte, Li et al. (@li2026asgmambaadaptivespectral) desarrollaron la arquitectura ASGMamba, probando que los modelos de espacio de estados selectivos capturan dinámicas temporales de largo alcance con una complejidad computacional lineal $cal(O)(L)$, superando la barrera cuadrática $cal(O)(L^2)$ de los Transformers estándar y posibilitando el procesamiento ultrarrápido de espectrogramas longitudinales. Asimismo, los marcos de fusión multimodal analizados por Felizzato et al. (@felizzato2025datafusionfor) y las revisiones analíticas sobre control espectral y trazabilidad lipídica de Grundy et al. (@grundy2025reviewofcurrent) confirman la urgente necesidad de articular matrices espectrales con análisis fisicoquímicos estandarizados.

Para responder a este desafío de manera sistemática, el presente proyecto implementa un benchmark factorial de tres niveles algorítmicos comparativos más un módulo exploratorio:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header([Nivel de Benchmark], [Familia de Modelos], [Configuración y Función en el Estudio]),
  [Nivel 1: Línea Base],
  [Quimiometría Clásica \ (Lineal y de Kernel)],
  [PLSR (5 a 12 variables latentes) y Support Vector Regression (SVR con kernel RBF) sobre espectros normalizados con SNV y Savitzky-Golay.],
  [Nivel 2: Deep Learning],
  [Deep Learning Empírico \ (Optimización Basada en Datos)],
  [1D-CNN con núcleos convolucionales multiescala ($3, 7, 15, 31$) y cabezal de regresión MLP; entrenamiento guiado por error cuadrático medio.],
  [Nivel 3: PIML],
  [Deep Learning con Física \ (PINN con Regularización Cinética)],
  [Red neuronal informada por la física donde la función de pérdida penaliza desviaciones respecto a cinéticas de degradación tipo Arrhenius.],
  [Exploración Modular],
  [Modelos de Secuencia & NODEs \ (LSTM / Mamba / Transformers / NODE)],
  [Screening exploratorio de redes recurrentes (LSTM), modelos Mamba de espacio de estados (@li2026asgmambaadaptivespectral), Transformers espectrales (@upadhyay2026enhancingspectralanalysis) y Neural ODEs continuas.]
)


---


= 5. Metodología de Investigación y Diseño Experimental

== 5.1 Fase Experimental y Muestreo en Clima Tropical

=== 5.1.1 Variedades de Café Arábica y Certificación en Origen
La investigación se fundamenta en el análisis prospectivo de cuatro variedades representativas y de alto valor agronómico de café arábica colombiano (*Coffea arabica* L.): *Castillo*, *Caturra*, *Colombia* y *Geisha*. Con el fin de garantizar una estricta trazabilidad de origen y homogeneidad pre-experimental, todos los lotes proceden de fincas y cooperativas cafetaleras de alta montaña bajo orígenes agroecológicos estrictamente controlados en los departamentos de Huila, Nariño, Tolima y Cauca, cultivados en cotas altitudinales comprendidas entre los $1.500$ y $2.000$ metros sobre el nivel del mar (m s. n. m.).

El beneficio poscosecha de todos los lotes se homologa mediante el proceso de beneficio húmedo tradicional lavado (despulpado mecánico inmediato, fermentación aeróbica/anaeróbica controlada en tanques durante $18 - 24 thin "horas"$, lavado con agua pura de manantial y secado solar/parabólico uniforme hasta estabilizar el grano entre un $10,5\%$ y $11,5\%$ de humedad base). Previo al inicio de los ensayos de almacenamiento, cada lote es sometido a un protocolo de evaluación física y sensorial estandarizado conducido por un panel de tres catadores certificados Q-Grader, siguiendo la metodología oficial de la Specialty Coffee Association (@sca2020specialtycoffee). Únicamente se incorporan a la cohorte experimental aquellos lotes que obtienen una calificación sensorial consolidada igual o superior a $85$ puntos sobre $100$ ($>= 85,0 thin "puntos SCA"$), catalogándose formalmente como cafés especiales prémium (*Specialty Coffee*) con perfiles aromáticos complejos, acidez limpia y ausencia de defectos primarios o secundarios.

=== 5.1.2 Régimen de Almacenamiento en Condiciones Ambientales Tropicales Reales
El almacenamiento experimental se desarrolla íntegramente en las instalaciones de bodegaje de la Universidad de Cartagena (Cartagena de Indias, departamento de Bolívar, Colombia), situadas a nivel del mar en la costa caribeña colombiana. Dicha localización geográfica se seleccionó por su representatividad logística y ambiental: Cartagena de Indias constituye el principal nodo portuario y logístico de exportación de café de Colombia hacia la Unión Europea (con arribo habitual a terminales marítimas de Hamburgo, Róterdam y Bremen), compartiendo condiciones macroambientales con los puertos vecinos de Barranquilla y Santa Marta.

Las muestras de café verde en pergamino/almendra se disponen en bodegas de acopio ventiladas pasivamente, expuestas al régimen climático dinámico natural característico del trópico cálido y húmedo caribeño, sin intervención de aire acondicionado ni sistemas de climatización asistida. El grano experimenta fluctuaciones térmicas circadianas naturales en el rango de $26 thin degree"C"$ a $36 thin degree"C"$, acopladas a valores de humedad relativa ambiental fluctuantes entre el $70\%$ y el $90\%$, reproduciendo las condiciones reales de almacenamiento y pre-embarque a las que están expuestos los lotes antes de su consolidación en contenedores de ultramar.

=== 5.1.3 Monitoreo Continuo con Dataloggers Multiparamétricos y Descarte de Cámaras Artificiales
El seguimiento ambiental macro y microclimático se efectúa de manera continua e ininterrumpida mediante una red de dataloggers multiparamétricos digitales calibrados y certificados metrológicamente (precisión instrumental de $plus.minus 0,3 thin degree"C"$ en temperatura y $plus.minus 2,0\%$ en humedad relativa). Los sensores se distribuyen tanto en el espacio aéreo de la bodega como en el núcleo interno y superficie de los sacos de acopio, registrando a intervalos sistemáticos de 15 minutos:
1. *Temperatura ambiental ($T$):* Monitoreo térmico continuo expresado en grados Celsius ($degree"C"$) y Kelvin ($"K"$).
2. *Humedad relativa del aire ($"HR"$):* Dinámica de intercambio de vapor de agua expresada en porcentaje ($"%"$).
3. *Temperatura de punto de rocío ($T_("rocío")$ o $T_("dew")$):* Parámetro psicrométrico crítico para detectar fenómenos incipientes de microcondensación superficial en los sacos ante caídas térmicas nocturnas.

#callout(title: "Justificación del Monitoreo en Condiciones Naturales vs. Cámaras Isotérmicas")[
  A diferencia de los esquemas de degradación acelerada que someten el café a cámaras isotérmicas cerradas a temperaturas fijas (p. ej., $25 thin degree"C"$, $40 thin degree"C"$ o $60 thin degree"C"$), en este protocolo no se emplean atmósferas artificiales isotérmicas. El calentamiento en cámaras térmicas forzadas puede alterar las constantes cinéticas relativas, inducir la evaporación prematura de fracciones volátiles y suprimir los ciclos circadianos acoplados de humedad y temperatura que determinan la degradación hidrolítica real en zonas tropicales. El almacenamiento en condiciones ambientales reales asegura que los espectros adquiridos representen con precisión las trayectorias de envejecimiento natural observables en la logística comercial.
]

=== 5.1.4 Diseño Longitudinal Prospectivo y Protocolo de Submuestreo Periódico
El diseño experimental contempla un seguimiento longitudinal periódico durante un periodo ininterrumpido de 6 meses (180 días de almacenamiento continuo). La toma de muestras se realiza en ocho hitos temporales predeterminados: días $t_0 = 0$, $t_1 = 15$, $t_2 = 30$, $t_3 = 60$, $t_4 = 90$, $t_5 = 120$, $t_6 = 150$ y $t_7 = 180$.

En cada hito temporal se extrae una fracción representativa de $500 thin "g"$ de cada lote y variedad mediante un tomamuestras cónico estandarizado acoplado a un protocolo de cuarteo sistemático en cruz, procesando tres réplicas analíticas independientes por punto ($4 thin "variedades" times 8 thin "hitos temporales" times 3 thin "réplicas biológicas/analíticas" = 96 thin "muestras compuestas"$). Para neutralizar el impacto del calentamiento mecánico por fricción durante la molienda, las submuestras destinadas a la adquisición espectral y físico-química se someten a molienda criogénica o molienda analítica refrigerada a $4 thin degree"C"$, tamizándose en malla estándar ASTM No. 35 ($< 0,50 thin "mm"$) y almacenándose al vacío en viales opacos de vidrio borosilicato sellados con nitrógeno hasta su lectura instrumental inmediata.

#table(
  columns: (1.1fr, 1.2fr, 0.9fr, 1.3fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Variedad (*Coffea arabica*)],
    [Origen Geográfico y Altitud],
    [Puntaje SCA Inicial],
    [Condición de Almacenamiento],
    [Diseño Longitudinal de Muestreo]
  ),
  [Castillo], [Huila ($1.650 thin "m s. n. m."$)], [86,5 puntos], [Cartagena (Ambiente natural costero: $26-36 thin degree"C"$, $70-90\%$ HR)], [8 tiempos ($0, 15, 30, 60, 90, 120, 150, 180$ días) $times$ 3 réplicas],
  [Caturra], [Nariño ($1.900 thin "m s. n. m."$)], [87,0 puntos], [Cartagena (Ambiente natural costero: $26-36 thin degree"C"$, $70-90\%$ HR)], [8 tiempos ($0, 15, 30, 60, 90, 120, 150, 180$ días) $times$ 3 réplicas],
  [Colombia], [Tolima ($1.550 thin "m s. n. m."$)], [85,5 puntos], [Cartagena (Ambiente natural costero: $26-36 thin degree"C"$, $70-90\%$ HR)], [8 tiempos ($0, 15, 30, 60, 90, 120, 150, 180$ días) $times$ 3 réplicas],
  [Geisha], [Cauca ($1.850 thin "m s. n. m."$)], [89,0 puntos], [Cartagena (Ambiente natural costero: $26-36 thin degree"C"$, $70-90\%$ HR)], [8 tiempos ($0, 15, 30, 60, 90, 120, 150, 180$ días) $times$ 3 réplicas]
)

---

== 5.2 Caracterización Fisicoquímica Normatizada y Adquisición Espectral ATR-FTIR

=== 5.2.1 Batería Analítica de Referencia bajo Normas Oficiales (*Ground Truth*)
Con el propósito de suministrar los valores de referencia analítica (*ground truth*) indispensables para entrenar y validar los modelos de aprendizaje automático, cada submuestra es evaluada en los laboratorios de la Universidad de Cartagena mediante cuatro ensayos fisicoquímicos normatizados ejecutados en estricto triplicado:

1. *Acidez Titulable (Norma AOAC 920.92):*
   Determinación potenciométrica de la acidez total mediante extracción acuosa en caliente: se pesan $10,00 plus.minus 0,01 thin "g"$ de muestra de café finamente molido y se suspenden en $100 thin "mL"$ de agua desionizada previamente hervida y desgasificada para eliminar el $"CO"_2$ disuelto (@aoac92092). La infusión se mantiene en agitación constante a $90 thin degree"C"$ durante 15 minutos, se enfría a $20 thin degree"C"$ y se filtra al vacío. La titulación potenciométrica se efectúa con solución estandarizada de hidróxido de sodio ($0,100 thin "N NaOH"$) bajo monitoreo continuo con electrodo de vidrio combinado calibrado con tampones certificados de $p"H" 4,01$, $7,00$ y $10,01$, alcanzando como punto final un $p"H"$ de $8,20 plus.minus 0,02$. Los resultados se reportan en miliequivalentes de $"NaOH"$ por $100 thin "g"$ de muestra en base seca y como porcentaje equivalente de ácido clorogénico.

2. *Humedad Residual y Actividad de Agua ($a_w$) (Normas AOAC 968.11 e ISO 6673):*
   La humedad higroscópica residual se evalúa mediante termogravimetría de pérdida por secado: se colocan $5,000 thin "g"$ de café en pesafiltros metálicos tarados y se someten a desecación isotérmica en estufa de convección forzada a $105 plus.minus 1 thin degree"C"$ hasta registrar peso constante (diferencia $< 0,001 thin "g"$ en dos pesadas sucesivas espaciadas por 1 hora), conforme a las prescripciones de AOAC 968.11 (@aoac96811) e ISO 6673 (@iso6673). De forma paralela y complementaria, la actividad de agua ($a_w$) se determina a $25,00 plus.minus 0,05 thin degree"C"$ empleando un higrómetro de punto de rocío de espejo enfriado (*chilled-mirror dewpoint sensor*, resolución de $0,0001 thin a_w$ y exactitud de $plus.minus 0,003 thin a_w$), calibrado periódicamente con disoluciones salinas patrón de $"NaCl"$ y $"LiCl"$.

3. *Índice de Peróxidos Lipídicos (Norma AOAC 965.33):*
   Cuantificación del deterioro por autooxidación en la fracción grasa del grano: se extraen los lípidos totales mediante maceración en frío con $n$-hexano y éter de petróleo anhidro ($1:1 thin v/v$) en frascos ámbar protegidos de la luz durante 12 horas a $4 thin degree"C"$, evitando la termo-oxidación de los diterpenos cafestol y kahweol. Tras la evaporación del solvente a presión reducida en evaporador rotatorio a temperatura inferior a $35 thin degree"C"$, se pesan con exactitud $2,000 thin "g"$ de aceite extraído y se disuelven en $30 thin "mL"$ de disolvente mixto ácido acético glacial:cloroformo ($3:2 thin v/v$) (@aoac96533). Se adicionan $0,5 thin "mL"$ de solución saturada de yoduro de potasio ($"KI"$), se incuba exactamente 1 minuto en oscuridad total, se añaden $30 thin "mL"$ de agua destilada y se titula el yodo liberado ($"I"_2$) con solución valorada de tiosulfato de sodio ($0,010 thin "N Na"_2"S"_2"O"_3$) empleando solución de almidón al $1\%$ como indicador visual hasta decoloración persistente. El índice de peróxidos ($"IP"$) se expresa en miliequivalentes de oxígeno activo por kilogramo de lípido extraído ($"meq" thin "O"_2 / "kg lípido"$).

4. *Polifenoles Totales, Ácido 5-Cafeoilquínico (5-CQA) y Marcadores Térmicos (AOAC 980.23 / Folin-Ciocalteu):*
   Extracción hidroalcohólica de compuestos fenólicos asistida por baño ultrasónico ($20 thin "min"$ a $25 thin degree"C"$ en metanol:agua $70:30 thin v/v$). La concentración de fenoles totales se cuantifica mediante la reacción colorimétrica de óxido-reducción de Folin-Ciocalteu en medio alcalino alcalinizado con carbonato de sodio ($"Na"_2"CO"_3$ al $7,5\% thin m/v$), midiendo la absorbancia a $765 thin "nm"$ en espectrofotómetro UV-Vis de doble haz. El contenido se interpola contra una curva de calibración analítica elaborada con estándar ultrapuro de ácido 5-cafeoilquínico (5-CQA, pureza $>= 98,5\%$, Sigma-Aldrich). Adicionalmente, se ejecuta un barrido espectrofotométrico en la región ultravioleta a $325 thin "nm"$ para el seguimiento directo de ésteres clorogénicos libres y el monitoreo de hidroximetilfurfural (5-HMF) como indicador de degradación térmica y caramelización temprana según los principios de la norma AOAC 980.23.

=== 5.2.2 Protocolo de Adquisición Espectral ATR-FTIR en Infrarrojo Medio
La recolección de las firmas moleculares vibracionales se ejecuta sobre el café molido empleando un espectrómetro infrarrojo por transformada de Fourier (FTIR) equipado con celda de Reflectancia Total Atenuada (ATR) mono-reflexión con cristal de diamante o seleniuro de zinc (ZnSe) de alto índice de refracción y ángulo de incidencia de $45 degree$.

El protocolo de medición comprende las siguientes especificaciones metrológicas y fisicoquímicas:
- *Rango Espectral:* Infrarrojo medio entre $4000 thin "cm"^(-1)$ y $600 thin "cm"^(-1)$, cubriendo las bandas diagnósticas de tensión lipídica, carbonílica, carboxílica, aromática y de polisacáridos.
- *Resolución Espectral:* $4 thin "cm"^(-1)$, generando $3528$ canales espectrales por muestra tras interpolación y corrección de fase Mertz con función de apodización Happ-Genzel.
- *Número de Barridos:* $64$ barridos (*scans*) interferométricos acumulados por cada espectro individual, asegurando una relación señal-ruido ($"SNR" > 50.000:1$) que minimiza el ruido térmico del detector DLATGS.
- *Replicación Analítica:* Cada muestra compuesta es escaneada en estricto triplicado analítico independiente con recarga completa del portamuestras y aplicación de presión mecánica constante controlada por celda dinamométrica (apriete estandarizado a $80 plus.minus 2 thin "N"$ sobre el cristal de ATR) para garantizar un contacto íntimo y reproducible entre la matriz granular y la onda evanescente.
- *Sustracción de Fondo Atmosférico y Descontaminación:* Previo a la lectura de cada réplica, se registra un espectro de fondo atmosférico (*air background* con 64 barridos) contra el cristal limpio para sustracción dinámica de vapor de $"H"_2"O"$ y $"CO"_2$ ambiental. Finalizada cada lectura, la superficie del cristal se limpia de manera sistemática mediante hisopos ópticos impregnados de etanol e isopropanol al $99,9\%$ grado espectroscópico, verificando la ausencia de bandas residuales mediante prueba de transmisión $> 99,5\%$ antes de montar la muestra consecutiva.

#table(
  columns: (1.2fr, 1.4fr, 1.5fr, 1.9fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  stroke: 0.5pt + luma(200),
  table.header(
    [Parámetro Analítico],
    [Norma Oficial / Protocolo],
    [Principio Instrumental],
    [Relevancia Cinética y Rango Típico]
  ),
  [Acidez Titulable], [AOAC 920.92 (@aoac92092)], [Titulación potenciométrica con $"NaOH" thin 0,1 thin "N"$ a $p"H" 8,20$], [Refleja hidrólisis de CGA a ácido quínico libre ($1,5 - 4,0 thin "meq/100 g"$)],
  [Humedad Residual], [AOAC 968.11 (@aoac96811), ISO 6673 (@iso6673)], [Pérdida por secado en estufa a $105 thin degree"C"$], [Monitoreo de ganancia higroscópica en ambiente tropical ($9,5 - 13,0\%$)],
  [Actividad de Agua ($a_w$)], [Sensor de espejo enfriado], [Higrometría de punto de rocío a $25 thin degree"C"$], [Indicador termodinámico de proliferación fúngica y Maillard ($0,50 - 0,72 thin a_w$)],
  [Índice de Peróxidos], [AOAC 965.33 (@aoac96533)], [Extracción lipídica en frío y titulación iodométrica], [Oxidación primaria de lípidos e insaturaciones ($0,8 - 15,0 thin "meq" thin "O"_2/"kg"$)],
  [Polifenoles y 5-CQA], [AOAC 980.23 / Folin-Ciocalteu], [Espectrofotometría UV-Vis a $765 thin "nm"$ y $325 thin "nm"$], [Cinética de degradación de antioxidantes clorogénicos ($35 - 75 thin "mg/g"$)],
  [Firma Vibracional], [ATR-FTIR mono-reflexión], [Absorción en infrarrojo medio ($4000 - 600 thin "cm"^(-1)$)], [Monitoreo multivariable no destructivo de bandas moleculares diagnósticas]
)

---

== 5.3 Pipeline de Ciencia de Datos, Modelado y Validación Cruzada Rigurosa

=== 5.3.1 Preprocesamiento de Firmas Espectrales Infrarrojas
Las firmas espectrales brutas de café verde presentan perturbaciones ópticas sistemáticas inherentes a la dispersión de luz de partículas no esféricas (*multiplicative scatter*), variaciones locales en la densidad de empaquetamiento y derivas instrumentales de línea base. Para acondicionar los datos previo al modelado, se aplica una secuencia estandarizada de preprocesamiento matemático en Python empleando librerías especializadas (`scikit-learn`, `SciPy`, `chemometrics`):

1. *Corrección de Dispersión por Variable Normal Estándar (SNV):*
   Cada espectro individual $bold(x) = [x_1, x_2, dots, x_P]^T$ (donde $P = 3528$ canales espectrales) se normaliza centrando por su media y escalando por su desviación estándar:
   $ x_(i,"SNV") = (x_i - macron(x)) / s_x, quad macron(x) = 1/P sum_(j=1)^P x_j, quad s_x = sqrt(1/(P - 1) sum_(j=1)^P (x_j - macron(x))^2) $
   Este paso elimina las variaciones multiplicativas de camino óptico efectivo causadas por el tamaño de grano de la muestra molida.

2. *Corrección de Deriva de Línea Base (ALS):*
   Alineación de la línea base espectral mediante el método de Mínimos Cuadrados Penalizados Asimétricos (*Asymmetric Least Squares Smoothing* - ALS), optimizando una función de pérdida que penaliza asimétricamente los residuales positivos frente a los negativos mediante parámetros de peso $p = 0,001$ y coeficiente de suavidad $lambda = 10^5$, removiendo inclinaciones de fondo sin distorsionar los picos vibracionales.

3. *Filtrado Derivativo de Savitzky-Golay (SG):*
   Aplicación de diferenciación polinomial local de Savitzky-Golay utilizando un polinomio de segundo orden ajustado en una ventana simétrica móvil de 15 puntos espectrales ($Delta nu approx 14 thin "cm"^(-1)$). Se evalúan tanto la primera derivada ($1^("ra") thin "SG"$) para eliminar desplazamientos aditivos basales como la segunda derivada ($2^("da") thin "SG"$) para desacoplar dobletes solapados y acentuar las diferencias finas de curvatura en las regiones críticas de carbonilos lipídicos ($1745 thin "cm"^(-1)$), carboxilos libres de degradación ($1715 thin "cm"^(-1)$) y olefinas insaturadas ($3008 thin "cm"^(-1)$).

=== 5.3.2 Benchmark Factorial de Tres Niveles y Arquitecturas Computacionales
El núcleo computacional del proyecto implementa un benchmark factorial comparativo de tres niveles algorítmicos para contrastar de manera rigurosa la quimiometría tradicional frente a arquitecturas modernas de inteligencia artificial:

- *Nivel 1: Línea Base Quimiométrica Clásica (Modelos Lineales y de Kernel)*
  - *Regresión por Mínimos Cuadrados Parciales (PLSR):* Descomposición simultánea de las matrices espectrales $bold(X)$ y analíticas $bold(Y)$ en factores o variables latentes ortogonales (LVs) maximizando la covarianza mutua mediante el algoritmo SIMPLS. Se barre de 1 a 15 LVs, seleccionando la dimensionalidad óptima mediante el criterio de codo en el error de validación cruzada ($"RMSECV"$).
  - *Regresión de Vectores de Soporte (SVR):* Algoritmo basado en programación cuadrática y márgenes suaves con kernel de base radial Gaussiana ($"RBF"$: $K(bold(x), bold(x)') = exp(- gamma ||bold(x) - bold(x)'||^2)$). Los hiperparámetros de penalización $C in [10^(-2), 10^3]$, ancho de banda $gamma in [10^(-4), 10^1]$ y tubo de insensibilidad $epsilon in [10^(-3), 0,5]$ se optimizan mediante optimización Bayesiana exhaustiva.

- *Nivel 2: Deep Learning Convolucional Empírico (1D-CNN Multiescala)*
  - Red neuronal profunda unidimensional diseñada específicamente para la topología continua de datos espectrales (@passos2605convolutionalneuralnetworks).
  - La arquitectura incorpora cuatro ramas convolucionales paralelas con núcleos receptivos de longitudes diferenciadas ($k_1 = 3$, $k_2 = 7$, $k_3 = 15$ y $k_4 = 31$ canales espectrales), emulando bloques Inception para extraer simultáneamente características locales angostas (picos agudos de enlace éster o aromático) y bandas anchas de dispersión (bandas de asociación puente de hidrógeno de humedad en $3400 thin "cm"^(-1)$).
  - Cada bloque convolucional va seguido de normalización por lotes (*Batch Normalization*), activación no lineal GELU (*Gaussian Error Linear Unit*), capas de reducción *MaxPooling 1D* ($"stride" = 2$) y capas de desconexión aleatoria regularizadora (*Dropout*, $p = 0,25$).
  - El vector aplanado de características alimenta un cabezal de regresión de tipo Perceptrón Multicapa (MLP) con dos capas densas de 128 y 64 neuronas con regularización $L_2$ ($"weight decay" = 10^(-4)$), entrenado con el algoritmo AdamW minimizando exclusivamente el error cuadrático medio de los datos ($cal(L)_("datos") = "MSE"$).

- *Nivel 3: Deep Learning Informado por la Física (PINN con Restricciones Cinéticas de Arrhenius)*
  - Arquitectura neuronal físicamente consistente que fusiona la capacidad de representación espectral de las 1D-CNNs con el conocimiento cinético formulado en el marco teórico (@perre2025towardmechanisticmodels, @pronk2026neuralnetworkplacementin).
  - La red se entrena optimizando una función de pérdida multiobjetivo compuesta:
    $ cal(L)_("total") = cal(L)_("datos") + lambda_1 cal(L)_("cinética") + lambda_2 cal(L)_("monotonía") $
    donde:
    1. *Pérdida Empírica de Datos:* Error cuadrático frente a los valores observados en las normas oficiales:
       $ cal(L)_("datos") = 1/N sum_(i=1)^N (y_i - hat(y)_i)^2 $
    2. *Pérdida Residual Cinética de Arrhenius:* Penalización de las desviaciones respecto a las ecuaciones diferenciales que gobiernan la degradación de analitos sensibles (p. ej., ácido 5-CQA o lípidos insaturados) en función de la temperatura real $T_j(t)$ registrada por los dataloggers:
       $ cal(L)_("cinética") = 1/M sum_(j=1)^M ((d hat(C)_j)/(d t) + k(T_j) dot [hat(C)_j]^(n))^2, quad k(T_j) = A_0 dot exp(- E_a / (R dot T_j(t))) $
       donde $d hat(C)_j / d t$ se calcula analíticamente mediante diferenciación automática computacional (*Autograd* de PyTorch), $E_a$ representa la energía de activación aparente, $A_0$ el factor pre-exponencial y $n$ el orden de reacción.
    3. *Pérdida de Monotonía Termodinámica:* Penalización de violaciones cinéticas de conservación de masa y no-reversibilidad espontánea en empaque cerrado:
       $ cal(L)_("monotonía") = 1/M sum_(j=1)^(M-1) "máx"(0, hat(C)_(j+1) - hat(C)_j) $
       asegurando que metabolitos degradables no exhiban incrementos ficticios de concentración a lo largo de la trayectoria temporal.
  - Los hiperparámetros de penalización $lambda_1$ y $lambda_2$ se calibran adaptativamente durante las épocas de entrenamiento utilizando balance de gradientes por pesos de incertidumbre (*Gradient Normalization* / GradNorm).

- *Exploración Modular Adicional de Modelos de Secuencia y Espacio de Estados:*
  - Como módulo exploratorio complementario, se evalúan redes recurrentes bidireccionales con celdas de memoria LSTM/GRU, modelos de espacio de estados Mamba para series temporales espectrales continuas (*ASGMamba* @li2026asgmambaadaptivespectral), arquitecturas Transformer con mecanismos de atención espectral (*Spectral Attention Mechanisms* - SAM @upadhyay2026enhancingspectralanalysis) y Ecuaciones Diferenciales Neuronales continuas (*Neural ODEs* - NODE) para comparar su eficiencia temporal e inductiva frente a la PINN canónica.

=== 5.3.3 Protocolo de Validación Cruzada Rigurosa Anti-Fuga de Datos (*Leave-One-Batch-Out*)
En quimiometría espectral y aplicaciones agroalimentarias de Deep Learning, el particionamiento aleatorio estándar (*Random K-Fold*) sobreestima la exactitud predictiva. Dado que las lecturas replicadas de un mismo lote comparten correlaciones instrumentales y de origen, una división aleatoria reparte muestras de un mismo lote entre entrenamiento y prueba, incurriendo en fuga de datos (*data leakage*).

Para certificar una evaluación imparcial y traslacional, el proyecto establece como norma metodológica estricta la validación cruzada por grupos estructurada por lote de origen (*GroupKFold* / *Leave-One-Batch-Out* - LOBO):
- En cada partición de validación, la totalidad de los espectros y réplicas pertenecientes a un lote específico o variedad de un departamento de origen se excluyen por completo del conjunto de entrenamiento y se reservan como conjunto de prueba independiente (*test fold*).
- Este procedimiento garantiza que los modelos sean juzgados exclusivamente por su capacidad para generalizar patrones moleculares intrínsecos ante lotes agrícolas, cosechas y orígenes geográficos no observados previamente en la etapa de optimización.

=== 5.3.4 Métricas Estadísticas Cuantitativas de Desempeño
La evaluación del rendimiento analítico de cada arquitectura se cuantifica a través de cuatro métricas estandarizadas en quimiometría:

1. *Coeficiente de Determinación ($R^2$):*
   Calculado de forma independiente en calibración ($R_("cal")^2$), validación cruzada agrupada ($R_("cv")^2$) y predicción sobre lotes externos ($R_("pred")^2$):
   $ R^2 = 1 - (sum_(i=1)^N (y_i - hat(y)_i)^2) / (sum_(i=1)^N (y_i - macron(y))^2) $

2. *Raíz del Error Cuadrático Medio de Predicción ($"RMSEP"$):*
   $ "RMSEP" = sqrt(1/N_("test") sum_(i=1)^(N_("test")) (y_i - hat(y)_i)^2) $
   evaluado en las mismas unidades físicas del analito de referencia ($"meq/kg"$, $\%$, $"mg/g"$).

3. *Desviación Predictiva Residual (*Residual Predictive Deviation*, $"RPD"$):*
   Relación adimensional entre la variabilidad intrínseca del conjunto de datos y el error del modelo:
   $ "RPD" = "SD"_("referencia") / "RMSEP" = sqrt(1/(N_("test") - 1) sum_(i=1)^(N_("test")) (y_i - macron(y))^2) / "RMSEP" $
   Se adoptan los umbrales de rigor analítico estandarizados:
   - $"RPD" < 1,5$: Modelo predictivo no confiable.
   - $1,5 <= "RPD" < 2,0$: Capacidad de tamizaje o discriminación semicuantitativa preliminar.
   - $2,0 <= "RPD" < 2,5$: Buen desempeño predictivo para aplicaciones de monitoreo.
   - $"RPD" >= 2,5$: Excelente capacidad cuantitativa, apta para control analítico oficial e industrial.

4. *Error Porcentual Absoluto Medio (*Mean Absolute Percentage Error*, $"MAPE"$):*
   $ "MAPE" = 100\% / N_("test") sum_(i=1)^(N_("test")) |(y_i - hat(y)_i) / y_i| $

=== 5.3.5 Interpretabilidad Espectral Explicable (XAI) y Validación Fisicoquímica Causal
Para la adopción de modelos de inteligencia artificial en el sector agroalimentario es fundamental garantizar su interpretabilidad fisicoquímica. Con el fin de verificar que las estimaciones se sustenten en bandas espectrales asociadas a analitos reales y no en correlaciones artificiales con el ruido instrumental, el pipeline integra dos metodologías complementarias de explicabilidad espectral (*Explainable Artificial Intelligence* - XAI):

1. *SHAP (SHapley Additive exPlanations):*
   Se calculan los valores de atribución basados en teoría de juegos cooperativos mediante implementaciones de `TreeExplainer` para modelos no lineales y `DeepExplainer` para redes neuronales. Los valores de Shapley $phi_j$ cuantifican la contribución marginal neta que la absorbancia en el número de onda $nu_j$ aporta al desvío de la predicción respecto a la media poblacional.

2. *Grad-CAM 1D (Gradient-weighted Class Activation Mapping):*
   Se proyectan los gradientes calculados mediante retropropagación sobre los mapas de activación de la última capa convolucional de la 1D-CNN y la PINN:
   $ alpha_k = 1/L sum_(l=1)^L (partial hat(y)) / (partial A_l^k), quad L_("Grad-CAM")^("1D")(nu) = "ReLU"(sum_k alpha_k A^k(nu)) $
   generando una curva unidimensional de saliencia que ilumina las zonas espectrales a las cuales la red asigna mayor relevancia diagnóstica.

*Criterio de Validación Causal Fisicoquímica:*
Los perfiles de atribución de SHAP y los picos de activación de Grad-CAM se contrastan directamente contra las bandas de asignación vibracional determinadas en el marco teórico (Sección 4.3):
- Para el *Índice de Peróxidos*, los picos dominantes de saliencia deben converger en $3008 thin "cm"^(-1)$ (pérdida de dobles enlaces insaturados _cis_ de ácidos grasos), $1745 thin "cm"^(-1)$ (estiramiento $nu("C=O")$ éster) y en la aparición del hombro en $1715 thin "cm"^(-1)$ (formación de hidroperóxidos y aldehídos volátiles).
- Para la *Acidez Titulable*, los pesos deben concentrarse en la banda de carboxilos libres en $1715 - 1695 thin "cm"^(-1)$ y en la región de enlace $nu("C-O")$ de ácidos orgánicos en $1250 - 1150 thin "cm"^(-1)$.
- Para la degradación de *Polifenoles y 5-CQA*, las activaciones neuronales deben asociarse a las vibraciones aromáticas del anillo cafeoilo en $1650 - 1600 thin "cm"^(-1)$ y a los modos combinados de éster quínico en $1380 - 1150 thin "cm"^(-1)$.
- Para *Humedad y $a_w$*, la respuesta debe sincronizarse con la banda ancha de tensión $nu("O-H")$ entre $3400$ y $3250 thin "cm"^(-1)$.

Cualquier arquitectura que exhiba elevados índices métricos ($R^2$, $"RPD"$) pero asigne pesos salientes a regiones espectralmente inactivas o bandas atmosféricas residuales será rechazada por inconsistencia biofísica.

=== 5.3.6 Despliegue en el Borde (*Edge AI*) y Factibilidad en Hardware de Bajo Costo
Como hito técnico final orientado a la transferencia tecnológica hacia cooperativas caficultoras y terminales portuarias, las arquitecturas óptimas seleccionadas en el benchmark se optimizan para inferencia ligera en el borde (*Edge Computing*):
- Los modelos entrenados en clústeres GPU de la DIT se cuantizan post-entrenamiento (*Post-Training Quantization* - PTQ) reduciendo la precisión numérica de coma flotante de 32 bits (FP32) a precisión reducida de 16 bits (FP16) y enteros de 8 bits (INT8).
- Se realiza la exportación del grafo de cómputo hacia el formato estándar interoperable ONNX (*Open Neural Network Exchange*) y ejecución mediante el motor ligero ONNX Runtime / PyTorch Mobile.
- Se ejecuta un banco de pruebas de estrés computacional en una computadora de placa reducida (*Single-Board Computer* - SBC) de bajo costo tipo Raspberry Pi 4B / 5 (procesador ARM Cortex-A76 o Cortex-A72 a $1,8 - 2,4 thin "GHz"$, $4 - 8 thin "GB"$ RAM LPDDR4).
- Se definen los siguientes criterios de desempeño para la evaluación en dispositivos de borde:
  1. *Latencia de inferencia:* Inferior a $2,0 thin "segundos"$ por firma espectral triplicada ($< 2,0 thin "s/muestra"$).
  2. *Consumo de memoria volátil:* Ocupación de memoria RAM inferior a $500 thin "MB"$ ($< 500 thin "MB"$) durante la carga y ejecución continua del modelo.
  3. *Tolerancia al error de cuantización:* Degradación del $R^2$ inferior al $1,0\%$ respecto al modelo en precisión FP32 completa, demostrando la viabilidad económica y operativa de instalar analizadores espectrales inteligentes autónomos en las bodegas portuarias de Cartagena y centros de acopio campesinos en Colombia.

---

= 6. Cronograma de Ejecución y Paquetes de Trabajo (WP1 a WP4) a 12 Meses

El plan de trabajo del proyecto se estructura de forma rigurosa en cuatro paquetes de trabajo (*Work Packages* - WP) interconectados y secuenciales durante un horizonte de ejecución estricto de 12 meses. Esta organización optimiza el aprovechamiento de la infraestructura analítica en Cartagena y la potencia computacional en Deggendorf, garantizando la viabilidad de los hitos técnicos y de movilidad.

== 6.1 Desglose Minucioso de Actividades por Paquete de Trabajo

=== WP1: Recolección, Acondicionamiento de Muestras, Calibración y Workshop en Cartagena (Meses 1–4)
- *Institución Responsable:* Universidad de Cartagena (UdC) con participación activa de Technische Hochschule Deggendorf (DIT).
- *Investigadores Líderes:* Prof. Dr. Ricardo Vivas (UdC) y Prof. Dr. Isabel Suárez (DIT).
- *Actividad 1.1 (Mes 1): Selección botánica, acopio y caracterización inicial:* Adquisición de lotes homogéneos de café especial (*Coffea arabica*) pertenecientes a cultivares de alta relevancia agronómica y comercial (*Castillo*, *Caturra*, *Colombia* y *Geisha*), procedentes de microcuencas de alta montaña en Bolívar y Magdalena. Verificación de pureza varietal y evaluación sensorial preliminar según el protocolo estándar de la Specialty Coffee Association (@sca2020specialtycoffee), seleccionando muestras con puntaje de catación superior a 85 puntos.
- *Actividad 1.2 (Meses 1–2): Acondicionamiento microambiental y metrología:* Preparación de los sistemas de almacenamiento en cámaras de acopio en Cartagena bajo gradiente térmico e higrométrico representativo de climas tropicales cálido-húmedos ($25 - 40 thin degree"C"$ y $60 - 80\%$ de humedad relativa). Instalación y calibración metrológica de dataloggers multiparamétricos autónomos para registro continuo de temperatura y humedad a intervalos de 15 minutos.
- *Actividad 1.3 (Meses 1–2): Puesta a punto e intercomparación espectrométrica ATR-FTIR:* Calibración de la platina de reflectancia total atenuada (ATR) con cristal de diamante en el espectrómetro de la UdC. Estandarización de parámetros de adquisición: rango medio ($4000 - 600 thin "cm"^(-1)$), 64 barridos acumulados por espectro a resolución óptica de $4 thin "cm"^(-1)$, sustracción automatizada de fondo atmosférico ($"CO"_2$ y vapor de $"H"_2 "O"$) y registro de triplicados técnicos por réplica biológica (@ribeiro2011chemicalchanges).
- *Actividad 1.4 (Mes 2): Misión 1 — Visita Senior DIT y Workshop Bilateral en Cartagena:* Estancia presencial de 10 días de la investigadora principal bávara, Prof. Dr. Isabel Suárez, en la Universidad de Cartagena. Impartición del workshop presencial intensivo de 1 semana (*"Inteligencia Artificial y Modelado Físico-Químico en Espectroscopía Agroalimentaria"*) para investigadores, profesores y estudiantes de posgrado de la UdC. Alineación directa de los protocolos de muestreo químico, estandarización de pipelines de digitalización y transferencia de datos primarios.
- *Actividad 1.5 (Meses 3–4): Consolidación del dataset piloto:* Pruebas preliminares de almacenamiento acelerado a pequeña escala, escaneo espectral inicial y validación de la estabilidad de la señal infrarroja.
#callout(title: "Hito H1 (Mes 4)")[
  *Protocolo experimental y analítico estandarizado, dataloggers e instrumentación ATR-FTIR calibrados en Cartagena, y base de datos espectral piloto validada conjuntamente tras la ejecución de la Misión 1.*
]

=== WP2: Monitoreo Longitudinal en Clima Tropical y Analítica Fisicoquímica Normatizada (Meses 3–8)
- *Institución Responsable:* Universidad de Cartagena (UdC) con soporte remoto de DIT.
- *Investigador Líder:* Prof. Dr. Ricardo Vivas (UdC), con vinculación de jóvenes investigadores y estudiantes de posgrado.
- *Actividad 2.1 (Meses 3–8): Ensayos longitudinales de envejecimiento en condiciones ambientales:* Muestreo temporal continuo y no destructivo a lo largo de 180 días de almacenamiento bajo fluctuaciones ambientales tropicales naturales del Caribe colombiano, simulando las condiciones reales de bodegaje en origen y tránsito marítimo hacia Europa. Extracción periódica y controlada de alícuotas a intervalos preestablecidos ($t_0, t_1, ..., t_k$).
- *Actividad 2.2 (Meses 3–8): Barrido espectral sistemático ATR-FTIR:* Adquisición longitudinal de firmas vibracionales de café verde y café tostado molido en triplicado técnico, asegurando la trazabilidad de picos diagnósticos de autoxidación lipídica ($1745 thin "cm"^(-1)$), hidrólisis ácida ($1715 thin "cm"^(-1)$) y decaimiento fenólico ($1600 - 1650 thin "cm"^(-1)$) (@manzocco2020shelf).
- *Actividad 2.3 (Meses 3–8): Batería analítica fisicoquímica normatizada de referencia:*
  1. *Humedad y Actividad de Agua ($a_w$):* Determinación gravimétrica en estufa a 105 °C según AOAC 968.11 @aoac96811 e ISO 6673 @iso6673, acoplada a higrómetro de punto de rocío a 25 °C.
  2. *Acidez Titulable y pH:* Valoración potenciométrica con solución valorada de $N a O H thin 0,1 thin "M"$ conforme a AOAC 920.92 @aoac92092.
  3. *Índice de Peróxidos en Fracción Grasa:* Extracción lipídica por solvente en frío y titulación iodométrica estandarizada según AOAC 965.33 @aoac96533 para cuantificar la formación de hidroperóxidos primarios derivados de ácidos grasos insaturados.
  4. *Equivalentes de Ácidos Clorogénicos y Polifenoles Totales:* Microcuantificación espectrofotométrica UV-Vis con reactivo de Folin-Ciocalteu y determinación a $325 thin "nm"$ y $765 thin "nm"$ calibrada contra ácido 5-cafeoilquínico (5-CQA) y derivados furánicos según el método normatizado AOAC 980.23.
- *Actividad 2.4 (Meses 6–8): Preprocesamiento espectral y aseguramiento de calidad:* Aplicación de corrección de dispersión por Variable Normal Estándar (*Standard Normal Variate* - SNV), corrección de línea base y filtrado de derivadas por Savitzky-Golay (polinomio de 2do orden, ventana de 15 puntos). Construcción de la matriz relacional $X_("espectros") in RR^(N times P)$ y $Y_("química") in RR^(N times K)$.
#callout(title: "Hito H2 (Mes 8)")[
  *Base de datos longitudinal espectro-química completa, curada, normalizada y anonimizada, con cobertura temporal exhaustiva y ensayos analíticos de referencia AOAC/ISO certificados.*
]

=== WP3: Modelado de Ciencia de Datos, Clústeres GPU y Estancia Bilateral en Deggendorf (Meses 6–11)
- *Institución Responsable:* Technische Hochschule Deggendorf (DIT) en colaboración activa con la UdC.
- *Investigadora Líder:* Prof. Dr. Isabel Suárez (DIT), con participación del joven investigador de la UdC.
- *Actividad 3.1 (Meses 6–8): Formulación e implementación del benchmark factorial de tres niveles:*
  - *Nivel 1 (Quimiometría clásica):* Calibración de modelos lineales de Regresión por Mínimos Cuadrados Parciales (PLSR, 5 a 12 variables latentes) y Regresión de Vectores de Soporte (SVR con kernel Gaussiano RBF).
  - *Nivel 2 (Deep Learning empírico):* Diseño de redes convolucionales unidimensionales (1D-CNN) con módulos de convolución multiescala ($k in {3, 7, 15, 31}$) y normalización por lotes (@passos2605convolutionalneuralnetworks), junto con la exploración de modelos de atención multimodal (@upadhyay2026enhancingspectralanalysis) y modelos de espacio de estados (Mamba / ASGMamba @li2026asgmambaadaptivespectral).
  - *Nivel 3 (Deep Learning informado por la física - PINN):* Implementación en PyTorch de arquitecturas neuronales informadas por cinética fisicoquímica, donde la función de pérdida optimiza:
    $ cal(L)_("total") = 1/N sum_(i=1)^N (y_i - hat(y)_i)^2 + lambda_1 1/M sum_(j=1)^M ((d hat(C)_j)/(d t) + k_j (T) hat(C)_j)^2 + lambda_2 cal(R)_("termo") $
    restringiendo las trayectorias de degradación de ácidos clorogénicos según la ley cinética de primer orden de Arrhenius $k(T) = A exp(-E_a / (R T))$ y forzando monotonía termodinámica bajo balance de masa estricto (@perre2025towardmechanisticmodels, @pronk2026neuralnetworkplacementin).
- *Actividad 3.2 (Meses 7–9): Entrenamiento de alto rendimiento en clústeres GPU:* Despliegue de scripts de entrenamiento distribuido en el clúster de supercómputo GPU del Campus de IA de Deggendorf, optimizando paralelismo de datos y búsqueda bayesiana de hiperparámetros.
- *Actividad 3.3 (Meses 8–9): Misión 2 — Estancia de investigación de 2 semanas del joven investigador de la UdC en Deggendorf:* Movilidad académica transatlántica de dos semanas completas (14 días / 14 noches) de un joven investigador del grupo de la UdC en el Campus de IA de la DIT. Capacitación práctica intensiva en entrenamiento de redes PINN sobre clústeres GPU, herramientas de explicabilidad en IA (Grad-CAM, SHAP), análisis de sensibilidad y co-redacción técnica de la propuesta DFG-Minciencias.
- *Actividad 3.4 (Meses 9–11): Validación cruzada agrupada e interpretabilidad explicable (XAI):* Protocolo riguroso de validación *Leave-One-Batch-Out* (GroupKFold) para descartar fuga de información inter-lote. Mapeo de atribución espectral (Grad-CAM y Integrated Gradients) verificando que los gradientes de atención de la red converjan causalmente en las frecuencias diagnósticas del café ($1745, 1715, 1600 - 1650 thin "cm"^(-1)$). Pruebas de cuantización de parámetros (INT8 y FP16) proyectando el despliegue en microcomputadores embebidos (Raspberry Pi 4B/5).
#callout(title: "Hito H3 (Mes 9)")[
  *Arquitectura híbrida óptima seleccionada mediante optimización de Pareto (precisión RMSE/$R^2$, fidelidad fisicoquímica y compresión edge), causalidad espectral validada experimentalmente y estancia Misión 2 concluida exitosamente.*
]

=== WP4: Síntesis Bilateral, Publicaciones Conjuntas Q1, Informe Final y Proyecto DFG (Meses 10–12)
- *Institución Responsable:* Consorcio Conjunto DIT – UdC (co-liderazgo de Prof. Suárez y Prof. Vivas).
- *Actividad 4.1 (Meses 10–11): Taller de síntesis bilateral e integración de resultados:* Sesiones bilaterales de trabajo en formato híbrido para consolidar los análisis comparativos entre la química clásica de degradación y el modelado neuronal de física informada.
- *Actividad 4.2 (Meses 10–12): Redacción y sometimiento de dos artículos científicos Q1:*
  - *Manuscrito 1 (Enfoque Químico-Analítico):* *"Longitudinal ATR-FTIR tracking and kinetic degradation mechanisms of specialty Coffea arabica in tropical storage environments"*, dirigido a *Food Chemistry* o *Food Research International*.
  - *Manuscrito 2 (Enfoque Computacional e IA):* *"Physics-Informed Neural Networks and Spectral State-Space Models for Non-Destructive Freshness Trajectory Forecasting in Specialty Agri-Foods"*, dirigido a *Computers and Electronics in Agriculture* o *IEEE Transactions on AgriFood Electronics*.
- *Actividad 4.3 (Meses 11–12): Elaboración y entrega del informe final BAYLAT:* Consolidación técnica, contable y documental de todas las actividades ejecutadas, comprobación de gastos según directrices del sistema OASys y presentación del informe de cierre científico.
- *Actividad 4.4 (Meses 11–12): Formulación y radicación de la propuesta a gran escala DFG-Minciencias:* Elaboración integral del proyecto de investigación conjunto para la convocatoria bilateral DFG (Alemania) – Minciencias (Colombia) con un horizonte de financiación de 3 años, expandiendo la plataforma a nuevas matrices de biodiversidad y metabolómica avanzada.
#callout(title: "Hito H4 (Mes 12)")[
  *Informe final técnico-financiero aprobado por BAYLAT, dos artículos en revistas científicas Q1 remitidos a revisión por pares y propuesta de gran escala DFG-Minciencias formalmente radicada.*
]

== 6.2 Cronograma Mensual de Ejecución e Hitos Operativos

La siguiente matriz detalla la distribución temporal de los paquetes de trabajo, la asignación institucional y la sincronización de los hitos a lo largo de los 12 meses de duración del proyecto:

#table(
  columns: (0.9fr, 2.5fr, 0.7fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else if row in (1, 6, 11, 16) { rgb("#fbfcfd") } else { none },
  align: (left, left, center, center, center, center, center, center, center, center, center, center, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Paquete], [Actividad Operativa], [Líder],
    [M1], [M2], [M3], [M4], [M5], [M6], [M7], [M8], [M9], [M10], [M11], [M12],
    [Hito Clave]
  ),
  table.cell(rowspan: 5)[*WP1:* Preparación y Misión 1],
  [1.1 Acopio y caracterización SCA café especial], [UdC], [x], [], [], [], [], [], [], [], [], [], [], [], [],
  [1.2 Acondicionamiento y dataloggers tropicales], [UdC], [x], [x], [], [], [], [], [], [], [], [], [], [], [],
  [1.3 Estandarización instrumental ATR-FTIR], [UdC], [x], [x], [], [], [], [], [], [], [], [], [], [], [],
  [1.4 *Misión 1: Workshop IA presencial Cartagena*], [DIT], [], [x], [], [], [], [], [], [], [], [], [], [], [*M1 en Mes 2*],
  [1.5 Ensayos piloto y dataset de calibración], [UdC/DIT], [], [], [x], [x], [], [], [], [], [], [], [], [], [*H1 (Mes 4)*],
  table.cell(rowspan: 4)[*WP2:* Monitoreo y Analítica],
  [2.1 Almacenamiento longitudinal tropical (180 d)], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.2 Barridos espectrales continuos ATR-FTIR], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.3 Batería analítica AOAC (humedad, peróxidos, CGA)], [UdC], [], [], [x], [x], [x], [x], [x], [x], [], [], [], [], [],
  [2.4 Preprocesamiento y curaduría de la base de datos], [UdC/DIT], [], [], [], [], [], [x], [x], [x], [], [], [], [], [*H2 (Mes 8)*],
  table.cell(rowspan: 4)[*WP3:* Modelado y Misión 2],
  [3.1 Formulación benchmark 3 niveles (PLSR/CNN/PINN)], [DIT], [], [], [], [], [], [x], [x], [x], [], [], [], [], [],
  [3.2 Entrenamiento distribuido clústeres GPU], [DIT], [], [], [], [], [], [], [x], [x], [x], [], [], [], [],
  [3.3 *Misión 2: Estancia 2 semanas Deggendorf*], [UdC], [], [], [], [], [], [], [], [x], [x], [], [], [], [*M2 en Mes 8–9*],
  [3.4 Validación Leave-One-Batch, XAI y Edge AI], [DIT/UdC], [], [], [], [], [], [], [], [], [x], [x], [x], [], [*H3 (Mes 9)*],
  table.cell(rowspan: 4)[*WP4:* Síntesis y DFG],
  [4.1 Taller bilateral de síntesis e integración], [DIT/UdC], [], [], [], [], [], [], [], [], [], [x], [x], [], [],
  [4.2 Redacción de 2 artículos científicos Q1], [DIT/UdC], [], [], [], [], [], [], [], [], [], [x], [x], [x], [],
  [4.3 Elaboración y radicación de informe final BAYLAT], [DIT/UdC], [], [], [], [], [], [], [], [], [], [], [x], [x], [],
  [4.4 Formulación y radicación propuesta DFG-Minciencias], [DIT/UdC], [], [], [], [], [], [], [], [], [], [], [x], [x], [*H4 (Mes 12)*]
)

---

= 7. Cooperación Bilateral, Plan de Movilidad y Presupuesto BAYLAT

== 7.1 Sinergia Científica e Institucional (UdC – DIT)

La cooperación bilateral formalizada en esta propuesta capitaliza una complementariedad disciplinaria e institucional de alto nivel entre Baviera y Colombia, donde ninguna de las dos partes podría alcanzar los objetivos propuestos actuando de forma aislada:

- *Universidad de Cartagena (UdC, Colombia) — Liderazgo Químico-Experimental:* A través del grupo de investigación liderado por el Prof. Dr. Ricardo Vivas en la Facultad de Ciencias Exactas y Naturales, la UdC aporta más de dos décadas de excelencia en la caracterización fitoquímica de recursos naturales tropicales, química de lípidos y polifenoles, y control analítico normatizado de alimentos. La UdC dispone de laboratorios con espectrómetros FTIR de investigación, infraestructura para determinaciones fisicoquímicas estandarizadas (AOAC/ISO), vínculos directos con federaciones y cooperativas de caficultores de la región Caribe y Andina, y la capacidad logística para ejecutar estudios de vida útil bajo condiciones ambientales tropicales reales.
- *Technische Hochschule Deggendorf (DIT, Alemania) — Liderazgo en IA Aplicada y Supercómputo:* A través del Campus de IA y la Facultad de Informática Aplicada, bajo la dirección de la Prof. Dr. Isabel Suárez, la DIT es un centro de referencia en Baviera para la investigación algorítmica de frontera. La DIT aporta clústeres de cómputo de alto rendimiento equipados con GPUs de última generación para deep learning, experticia consolidada en el desarrollo de redes neuronales informadas por principios físicos (PINN), modelos de espacio de estados para series temporales (Mamba SSM), explicabilidad algorítmica (XAI) y cuantización de redes neuronales para su ejecución eficiente en dispositivos de borde (Edge AI) como microcomputadores Raspberry Pi.

Esta complementariedad cierra la brecha existente entre la recolección empírica de datos espectrales en zonas de producción tropicales y el modelado computacional avanzado en Baviera, capacitando a su vez a investigadores en una plataforma bioinformática especializada.

== 7.2 Plan de Movilidad Transatlántica y Formación de Investigadores

Para materializar la transferencia tecnológica y la cohesión científica del consorcio, el plan de movilidad se articula en dos misiones presenciales estratégicas:

=== Misión 1: Investigadora Senior DIT a Cartagena de Indias (10 Días, Mes 2)
- *Participante:* Prof. Dr. Isabel Suárez (Líder científica y solicitante principal DIT).
- *Itinerario y Duración:* Múnich (MUC) – Cartagena (CTG) – Múnich (MUC); estancia de 10 días y 10 noches durante el Mes 2.
- *Objetivos Académicos y Técnicos:*
  1. Impartir el workshop presencial intensivo de 1 semana *"Inteligencia Artificial y Modelado Físico-Químico en Espectroscopía Agroalimentaria"*, capacitando a investigadores, docentes y al menos a 15 estudiantes de posgrado de la UdC en arquitecturas PINN, procesamiento de tensores y quimiometría espectral.
  2. Inspeccionar in situ los laboratorios de la UdC, verificar la calibración metrológica del espectrómetro ATR-FTIR y de los dataloggers en las bodegas tropicales de café.
  3. Establecer el protocolo conjunto de curaduría, metadatos y almacenamiento seguro en la nube para la transferencia continua de datos espectrales hacia Deggendorf.

=== Misión 2: Joven Investigador de la UdC al Campus de IA de Deggendorf (Estrictamente 2 Semanas / 14 Días / 14 Noches, Meses 8–9)
- *Participante:* Investigador joven en etapa de formación doctoral o de maestría adscrito al grupo de investigación del Prof. Dr. Ricardo Vivas (UdC).
- *Itinerario y Duración:* Cartagena (CTG) – Múnich (MUC) – Deggendorf; estancia programada de ESTRICTAMENTE DOS SEMANAS (14 DÍAS / 14 NOCHES) entre los Meses 8 y 9.
- *Objetivos Académicos y Técnicos:*
  1. Entrenamiento inmersivo en el clúster GPU del Campus de IA de la DIT bajo la tutoría directa de la Prof. Suárez, dominando entornos de trabajo en PyTorch y JAX para optimización de funciones de pérdida acopladas a ecuaciones de Arrhenius.
  2. Ejecución de los scripts de benchmark factorial sobre la base de datos longitudinal completa remitida desde Cartagena y cálculo de mapas de atribución Grad-CAM y SHAP sobre las bandas diagnósticas.
  3. Participar en la estructuración de los paquetes de trabajo computacionales del proyecto mayor bilateral a postular ante la DFG y Minciencias.

== 7.3 Presupuesto Consolidado de la Cooperación BAYLAT

El presupuesto se ciñe de manera estricta y transparente a las directrices de financiamiento inicial (*Anschubfinanzierung*) de BAYLAT, cumpliendo rigurosamente con los límites normativos de cada rubro y situándose por debajo del techo financiero máximo (*Förderhöchstsatz*) de 8.000 €:

- *Vuelos Transatlánticos (Clase Económica con Reserva Anticipada):*
  - Misión 1 (Prof. Dr. Isabel Suárez: Múnich – Cartagena – Múnich): 1.450 €.
  - Misión 2 (Joven Investigador UdC: Cartagena – Múnich – Cartagena): 1.500 €.
  - Subtotal Vuelos: 2.950 €.
- *Gastos de Alojamiento:*
  - Misión 1: 10 noches en Cartagena a 110 €/noche = 1.100 €.
  - Misión 2: 14 noches en Deggendorf (residencia universitaria / casa de huéspedes DIT) a 55 €/noche = 770 €.
  - Subtotal Alojamiento: 1.870 €.
- *Viáticos Diarios / Dietas de Subsistencia (Según Normativa BayRKG / DAAD):*
  - Misión 1: 10 días de estancia en Colombia a 50 €/día = 500 €.
  - Misión 2: 14 días de estancia en Alemania a 45 €/día = 630 €.
  - Subtotal Viáticos: 1.130 €.
- *Seguro Médico Internacional de Viaje y Accidentes (Tope BAYLAT de 100 € por persona):*
  - Misión 1: 100 €.
  - Misión 2: 100 €.
  - Subtotal Seguro: 200 €.
- *Gastos de Organización del Workshop Presencial en Cartagena:*
  - Alquiler de soporte logístico, material impreso de trabajo y refrigerios/catering para los participantes del curso intensivo en la UdC: 450 €.
- *Subtotal Movilidad Bilateral y Eventos Presenciales:*
  - Total Misión 1 (DIT -> UdC): 1.450 € + 1.100 € + 500 € + 100 € + 450 € = *3.600 €*.
  - Total Misión 2 (UdC -> DIT, 14 días): 1.500 € + 770 € + 630 € + 100 € = *3.000 €*.
  - Subtotal Movilidades (Misión 1 + Misión 2): *6.600 €*.
- *Materiales de Laboratorio Fungibles (Tope de Convocatoria BAYLAT):*
  - Reactivos analíticos de referencia, solventes y patrones de ácido 5-cafeoilquínico para ensayos de envejecimiento acelerado de café en laboratorio: *600 €* (tope máximo permitido por la normativa de financiamiento inicial de BAYLAT).
- *Medios Digitales y Difusión Técnica:*
  - Accesorios de hardware audiovisual para transmisión híbrida en alta definición del workshop y licencias de colaboración técnica en línea: *150 €*.
- *Monto Total Solicitado a BAYLAT:*
  $3.600 thin "€" + 3.000 thin "€" + 600 thin "€" + 150 thin "€" = bold(7.350 thin "€")$.
  Este valor resulta estrictamente inferior al techo financiero de 8.000 € autorizado por el programa de financiamiento inicial de BAYLAT.

#table(
  columns: (1.5fr, 0.9fr, 0.9fr, 0.8fr, 0.8fr, 2.1fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else if row == 8 { rgb("#eef5fb") } else { none },
  align: (left, center, center, center, center, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Rubro Presupuestal],
    [Misión 1 \ (DIT -> UdC)],
    [Misión 2 \ (UdC -> DIT)],
    [Otros \ Gastos],
    [Total (€)],
    [Base de Cálculo y Justificación Normativa]
  ),
  [Pasajes aéreos transatlánticos], [1.450 €], [1.500 €], [-], [2.950 €], [Vuelos internacionales MUC-CTG y CTG-MUC en clase económica con tarifa reducida],
  [Gastos de alojamiento], [1.100 €], [770 €], [-], [1.870 €], [10 noches a 110 € (Cartagena) / 14 noches a 55 € (residencia DIT Deggendorf)],
  [Viáticos y dietas de subsistencia], [500 €], [630 €], [-], [1.130 €], [10 días a 50 €/día (Colombia) / 14 días a 45 €/día (Alemania) según BayRKG],
  [Seguro médico internacional], [100 €], [100 €], [-], [200 €], [Póliza internacional de salud y accidentes (tope normativo de 100 € por persona)],
  [Logística y catering workshop], [450 €], [-], [-], [450 €], [Material didáctico, equipos audiovisuales y refrigerios de workshop en UdC],
  [Materiales fungibles laboratorio], [-], [-], [600 €], [600 €], [Reactivos y patrones puros de 5-CQA para cinética (tope máx. de 600 € en BAYLAT)],
  [Medios digitales y licencias], [-], [-], [150 €], [150 €], [Periféricos para streaming híbrido del workshop y soporte telemático],
  [*Total Presupuesto Solicitado*], [*3.600 €*], [*3.000 €*], [*750 €*], [*7.350 €*], [*Monto total solicitado a BAYLAT (estrictamente inferior al tope de 8.000 €)*]
)

---

= 8. Proyección Estratégica: Escalabilidad a la Convocatoria Bilateral DFG - Minciencias

== 8.1 Hoja de Ruta para la Postulación Conjunta DFG - Minciencias (3 Años)

El financiamiento semilla otorgado por BAYLAT actúa como una herramienta catalizadora estratégica orientada a la eliminación sistemática de riesgos técnicos y metodológicos (*de-risking*). Las principales agencias de fomento a la investigación internacional de gran envergadura, en particular la Fundación Alemana para la Investigación (*Deutsche Forschungsgemeinschaft* - DFG) y el Ministerio de Ciencia, Tecnología e Innovación de Colombia (*Minciencias*), exigen en sus convocatorias bilaterales la existencia demostrada de una sólida trayectoria de cooperación interinstitucional, protocolos analíticos previamente armonizados y datos piloto empíricos reproducibles.

Durante los Meses 11 y 12 del presente proyecto, el equipo conjunto DIT – UdC redactará y radicará una propuesta de investigación colaborativa trianual (*36 meses*) bajo el esquema *DFG-Minciencias Bilateral Research Grants*. Dicho proyecto de gran escala contará con los siguientes pilares estructurales:
1. *Consorcio Científico Ampliado:* Consolidación de un grupo interdisciplinario binacional con intercambio de investigadores posdoctorales y codirección formal de tesis doctorales (*Cotutelle de Thèse*) entre la DIT y programas doctorales colombianos.
2. *Financiamiento Trianual de Gran Escala:* Solicitud presupuestal estimada en aproximadamente 350.000 € ante la DFG (para posiciones de investigadores en Baviera, tiempo de supercómputo y analítica metabolómica avanzada) y un presupuesto equivalente en pesos colombianos ante Minciencias (para personal técnico, trabajo de campo en regiones productoras y dotación de laboratorio en la UdC).
3. *Cronograma Estratégico de Radicación:* Presentación de la propuesta integral en la ventanilla anual bilateral de la DFG y Minciencias durante el Mes 12, garantizando la continuidad inmediata de la alianza científica una vez finalizado el financiamiento inicial BAYLAT.

== 8.2 Escalamiento hacia Matrices Agroalimentarias Estratégicas de la Biodiversidad Colombiana

El marco metodológico fundamentado en física informada (PIML), validado rigurosamente en café especial (*Coffea arabica*) durante la fase BAYLAT, será transferido y adaptado en la propuesta DFG-Minciencias hacia otras tres matrices agroalimentarias de altísimo valor comercial, ecológico y social en Colombia:

1. *Cacao Fino de Aroma (*Theobroma cacao L.*):*
   Colombia es reconocido por la ICCO como productor de cacao fino y de aroma, un cultivo estratégico para la sustitución de cultivos de uso ilícito en zonas de posconflicto. En el proyecto ampliado se modelará la cinética de autooxidación lipídica de la manteca de cacao (degradación de triglicéridos insaturados) y la degradación térmica de flavonoides antioxidantes (monómeros de epicatequina, catequina y procianidinas oligoméricas) durante el almacenamiento de grano seco y licor de cacao, acoplando bandas infrarrojas a índices de acidez y peróxidos normatizados.
2. *Miel de Abejas Artesanal (*Apis mellifera*):*
   Matriz dulce no fermentada producida por apicultores en agroecosistemas del bosque seco tropical del Caribe y vertientes andinas. El modelo de física informada incorporará cinéticas multivariables para predecir la acumulación de 5-hidroximetilfurfural (5-HMF) según el ensayo normatizado AOAC 980.23, la inactivación térmica de enzimas sensibles (diastasa e invertasa) y la cinética higroscópica que induce fermentaciones indeseadas por levaduras osmofílicas.
3. *Aceite Virgen de Coco (*Cocos nucifera*):*
   Producto líder de bioeconomía costera en comunidades del litoral Caribe y Pacífico colombiano. El modelado abordará la lipólisis hidrolítica y la formación de hidroperóxidos primarios y compuestos carbonílicos secundarios volátiles (enlace éster en $1745 thin "cm"^(-1)$ y peróxidos según AOAC 965.33), preservando las propiedades nutracéuticas de los triglicéridos de cadena media (ácido láurico C12:0).

#table(
  columns: (1.3fr, 1.3fr, 1.8fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  align: (left, left, left, left),
  stroke: 0.5pt + luma(200),
  table.header(
    [Matriz Agroalimentaria],
    [Especie Botánica],
    [Marcadores Moleculares Críticos],
    [Analítica Normatizada de Referencia]
  ),
  [Café Especial Lavado],
  [*Coffea arabica*],
  [Decaimiento de 5-CQA, peroxidación de lípidos diterpénicos y acidez libre],
  [AOAC 965.33, AOAC 920.92, AOAC 968.11, ISO 6673],
  [Cacao Fino de Aroma],
  [*Theobroma cacao*],
  [Oxidación de epicatequina, lipólisis de manteca y pérdida de metilxantinas],
  [Folin-Ciocalteu UV-Vis, acidez titulable de grasa, AOAC 965.33],
  [Miel de Abejas Artesanal],
  [*Apis mellifera*],
  [Generación de 5-HMF, actividad diastásica y decaimiento de azúcares reductores],
  [Espectrofotometría UV-Vis AOAC 980.23, conductividad eléctrica],
  [Aceite Virgen de Coco],
  [*Cocos nucifera*],
  [Hidrólisis de triacilgliceroles de cadena media (ácido láurico) y peróxidos],
  [Índice de peróxidos AOAC 965.33, acidez libre de lípidos, dienos conjugados]
)

== 8.3 Integración de Metabolómica Cromatográfica Avanzada (LC-HRMS y GC-MS)

Mientras que el financiamiento inicial BAYLAT sienta las bases mediante espectroscopía rápida ATR-FTIR de bajo costo acoplada a química húmeda convencional, la fase de escalamiento con la DFG y Minciencias integrará plataformas cromatográficas de alta resolución para la caracterización y cuantificación detallada de los productos intermedios de degradación:

- *Metabolómica No Dirigida por LC-HRMS (Q-TOF / Orbitrap):* Permite la detección, elucidación estructural y cuantificación absoluta de metabolitos secundarios minoritarios, polifenoles conjugados, derivados de ácidos cafeoilquínicos y productos avanzados de glicación/oxidación en las cuatro matrices.
- *Perfilado de Volátiles por HS-SPME-GC-MS:* Monitoreo de la fracción volátil del aroma (pirazinas, ésteres aromáticos, terpenos) y de marcadores tempranos de rancidez y añejamiento (hexanal, nonanal, octen-3-ol y furanos).
- *Fusión de Datos Multinivel e Interpretabilidad Mecanicista:* Los perfiles cromatográficos de alta resolución se emplearán para anclar y parametrizar los términos cinéticos mecanísticos de las PINNs, correlacionando picos vibracionales FTIR con identidades químicas inequívocas mediante técnicas de fusión de datos (*low-level*, *mid-level* y *high-level data fusion* @felizzato2025datafusionfor).

== 8.4 Despliegue en Dispositivos de Borde (Edge AI / Raspberry Pi) para Cooperativas y PYMES

La visión aplicada de la alianza germano-colombiana trasciende la investigación teórica para brindar soluciones tecnológicas democratizadas a la cadena de valor:

- *Compresión y Cuantización de Redes:* Los modelos PINN y 1D-CNN seleccionados en el benchmark serán sometidos a técnicas de optimización estructural, incluyendo poda de conexiones no críticas (*network pruning*) y cuantización post-entrenamiento de parámetros de precisión flotante a enteros (*FP32 -> INT8/FP16*).
- *Despliegue en Hardware Embebido de Bajo Costo (Raspberry Pi):* Implementación de los modelos optimizados en microcomputadores monoplaca (*Single-Board Computers* - SBC) de bajo consumo energético, tales como Raspberry Pi 4B o Raspberry Pi 5 acoplados a mini-espectrómetros portátiles USB/I2C. Los ensayos de viabilidad preliminares garantizan una latencia de inferencia inferior a $2,0 thin "segundos"$ por muestra y un requerimiento de memoria RAM inferior a $500 thin "MB"$.
- *Impacto Socioeconómico Directo:* Esta solución de *Edge AI* descentralizada permitirá a cooperativas de pequeños caficultores en Colombia evaluar la vida útil remanente y la estabilidad de sus lotes directamente en los centros de acopio sin depender de laboratorios especializados costosos ni de conectividad continua a la nube. Simultáneamente, permitirá a pequeñas y medianas empresas tostadoras e importadoras en Baviera monitorizar en tiempo real el envejecimiento del grano verde tras su arribo a Europa, garantizando la prima de calidad asociada al café especial y la sostenibilidad del comercio transatlántico.

---

#bibliography("references.bib", title: [Referencias Bibliográficas])
