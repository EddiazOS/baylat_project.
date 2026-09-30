---
name: scientific-writing
description: >-
  Guía y protocolo exhaustivo para la redacción, revisión de estilo y traducción
  de propuestas de financiamiento científico (grants), memorias técnicas y artículos en cualquier disciplina.
  Elimina el lenguaje hiperbólico, clichés de LLM (agent-speak), alucinaciones de alcance
  y garantiza un registro académico sobrio, objetivo y verificado.
---

# Scientific Writing & Academic Rigor Skill (Universal Core)

Esta skill define el estándar metodológico y lingüístico para la producción y revisión de documentos científicos, propuestas de investigación (*grant proposals* como BAYLAT, DFG, Horizon Europe, NSF, MinCiencias), reportes técnicos y artículos científicos en cualquier disciplina (computación, física, biotecnología, medicina, química, ingeniería, ciencias sociales).

Su objetivo primordial es erradicar el estilo inflado, melodramático y superficial característico de los modelos de lenguaje (*agent-speak* / *LLM fluff*), sustituyéndolo por un registro académico riguroso, formal y sobrio, propio de investigadores principales (*PIs*) y revisores de comités científicos internacionales.

---

## 1. Filosofía Fundamental: El Principio de Sobriedad Científica

1. **La ciencia se demuestra con datos y protocolos, no con adjetivos:** En un documento técnico, los adjetivos superlativos y valorativos (*"extraordinario"*, *"revolucionario"*, *"disruptivo"*, *"crucial"*, *"aberrante"*) restan credibilidad a la propuesta y activan el escepticismo inmediato de los evaluadores.
2. **Neutralidad descriptiva frente a dramatismo:** Los problemas de investigación no son *"catástrofes inminentes"* ni *"obstáculos insalvables"*; son **restricciones cinéticas, analíticas, fisicoquímicas u operativas** que se abordan mediante metodologías sistemáticas.
3. **Precisión ontológica y matemática:** Cada concepto debe corresponder exactamente a su definición en la literatura científica consolidada de la disciplina respectiva. Queda terminantemente prohibido el uso de metáforas poéticas o simplificaciones vulgares.
4. **Realismo en los compromisos (Principio de Alcance Presupuestado):** Un documento científico nunca debe prometer entregables, arquitecturas de hardware o condiciones experimentales que no estén formalmente contemplados en el presupuesto, el cronograma o los paquetes de trabajo (*Work Packages*).

---

## 2. Los Seis Pilares de la Redacción Científica Universal

### Pilar I: Eliminación de Grandilocuencia e Hipérbole
- **Diagnóstico:** Los LLMs tienden a exagerar la importancia de los problemas con adjetivación inflamada para generar interés artificial.
- **Regla:** Describa el fenómeno en términos de magnitudes cuantitativas, tasas cinéticas, límites de detección o condiciones experimentales reales.
- **Ejemplos:**
  - ❌ *Incorrecto:* "El sistema experimenta una extrema vulnerabilidad intrínseca y se degrada irreversiblemente ante la severidad del entorno."
  - ✅ *Correcto:* "El material es susceptible a procesos de deterioro térmico e hidrolítico durante la exposición prolongada a condiciones ambientales fluctuantes."
  - ❌ *Incorrecto:* "El método convencional es inherentemente subjetivo y la caracterización instrumental tiene un costo prohibitivo y demora inaceptable."
  - ✅ *Correcto:* "El ensayo estándar proporciona una evaluación cualitativa sin cuantificar tasas de cambio en el tiempo, mientras que el análisis instrumental de alta resolución implica tiempos de procesamiento prolongados y requerimientos especializados de laboratorio."

### Pilar II: Lista Negra Universal de Clichés de Agente (*LLM Agent-Speak*)
- **Diagnóstico:** Existen muletillas y frases cliché que delatan de inmediato la redacción automatizada y le restan seriedad al texto en cualquier disciplina.
- **Términos estrictamente prohibidos y sus reemplazos canónicos:**

| Término Prohibido | Motivo de Rechazo | Reemplazo Académico Aprobado |
| :--- | :--- | :--- |
| **"Cuello de botella"** / *"Bottleneck"* | Cliché corporativo e informal | *Limitación metodológica*, *restricción analítica*, *desafío experimental* |
| **"Disruptivo"** / *"Disruptive"* | Jerga de mercadotecnia / *buzzword* | *Alternativa no destructiva*, *enfoque complementario*, *metodología innovadora* |
| **"Paradigma"** / *"Potente paradigma"* | Abuso retórico grandilocuente | *Marco metodológico*, *enfoque analítico*, *arquitectura predictiva* |
| **"De vanguardia"** / *"Cutting-edge"* | Cliché publicitario vacío | *Avanzado*, *reciente*, *de alta resolución*, *especializado* |
| **"Caja negra"** / *"Black box"* | Informalidad de divulgación | *Modelo puramente empírico*, *falta de restricciones teóricas explícitas*, *modelo dirigido por datos* |
| **"Espurio"** / *"Correlación espuria"* | Muletilla computacional repetitiva | *Correlación no causal*, *sobreajuste al ruido de fondo*, *fluctuaciones aleatorias* |
| **"Innegociable"** | Tono autoritario no académico | *Condición operativa necesaria*, *criterio de diseño indispensable* |
| **"Ostenta"** / *"Liderazgo indiscutible"* | Tono chauvinista o protocolario | *Representa uno de los principales referentes*, *cuenta con una presencia relevante* |
| **"Desentrañar los mecanismos"** | Metáfora poética de LLM | *Identificar y cuantificar productos intermedios*, *caracterizar las rutas cinéticas / funcionales* |
| **"Meticulosamente"** / *"Fielmente"* | Adverbios afectivos innecesarios | *Sistemáticamente*, *según el protocolo estándar*, *con precisión* |
| **"Aberrante"** / *"Categóricamente"* | Tono hiperbólico y dogmático | *No representativo*, *se desestima debido a*, *no se considera en este alcance* |
| **"Revolucionario / Sin precedentes"** | Afirmación infundada de mercadotecnia | *Novedoso*, *escasamente explorado en la literatura especializada* |

### Pilar III: Rigor Conceptual y Fundamento Teórico
- **Regla:** En cualquier área del conocimiento:
  1. Utilizar conceptos formales y leyes consolidadas de la disciplina (ej. balances de materia y energía, principios de conservación, leyes cinéticas, cotas de complejidad computacional).
  2. No inventar dinámicas intermedias sin respaldo matemático ni atribuir propiedades físicas a variables descriptivas no cuantificadas.
  3. En modelado espectroscópico o bioinformático: especificar rangos analíticos en unidades oficiales ($\text{cm}^{-1}$, $\text{nm}$, $\text{Da}$, etc.), vincular señales a enlaces moleculares o biomarcadores identificados y fundamentar las hipótesis.

### Pilar IV: Dialéctica Objetiva y Ausencia de Polémicas Defensivas
- **Diagnóstico:** Los agentes a menudo redactan secciones agresivas intentando justificar por qué su propuesta es superior mediante la descalificación de otros grupos o métodos.
- **Regla:** Un proyecto científico no polemiza ni denigra. Explica con serenidad la idoneidad del diseño experimental para responder a la pregunta de investigación formulada.

### Pilar V: Realismo Operativo y Prohibición de Alucinación de Alcance
- **Regla de Alcance:** Un texto científico o propuesta técnica debe restringirse de forma inflexible a lo presupuestado y planificado:
  1. **Hardware e Infraestructura:** No prometer despliegues en dispositivos embebidos, sensores o infraestructura de campo a menos que el proyecto cuente con presupuesto formalmente aprobado para tales componentes.
  2. **Correspondencia Objetivos-WPs:** No agregar objetivos específicos huérfanos. Si existen $N$ Paquetes de Trabajo (*Work Packages*), existen exactamente $N$ objetivos específicos.
  3. **Condiciones Experimentales:** Describir con exactitud el entorno de prueba real y no mezclar ensayos secundarios no contemplados en el plan de trabajo.
  4. **Costos y Movilidades:** La duración de viajes, dietas diarias y transportes deben coincidir al céntimo con las hojas de cálculo presupuestales oficiales.

### Pilar VI: Simetría Multilingüe y Cumplimiento de Restricciones Formales
- En convocatorias internacionales (como BAYLAT / DFG / Horizon Europe / DAAD), el documento debe guardar perfecta consonancia técnica entre sus versiones en español, alemán e inglés:
  - Mismo número de objetivos específicos, mismos plazos cronológicos, mismos indicadores de desempeño.
  - Cumplimiento inflexible de límites de caracteres bajo cualquier normalización Unicode (NFC, NFD) y terminaciones de línea (LF, CRLF).
  - Citas bibliográficas exactas vinculadas a identificadores canónicos en `references.bib`.

---

## 3. Arquitectura Modular: Adaptación a Proyectos Específicos

Para evitar falsos positivos y adaptar las auditorías a cualquier proyecto, el sistema opera en dos niveles:
1. **Núcleo Universal (Universal Core):** Siempre activo. Audita clichés, hipérboles y tono académico.
2. **Manifiesto de Alcance (`.scope_rules.json`):** Archivo JSON opcional en la raíz de cada proyecto que define qué hardware, objetivos y condiciones experimentales aplican a dicho proyecto.

Para auditar un documento:
```bash
python3 scripts/audit_scientific_style.py documento.typ
```
Si existe un archivo `.scope_rules.json` en el proyecto, el linter lo incorporará automáticamente; si no existe, operará en modo agnóstico universal.

---

## 4. Rúbrica de Autoevaluación Previa a la Entrega

Antes de dar por concluida una respuesta o edición, responda afirmativamente a cada uno de estos puntos:
- [ ] ¿El texto carece de palabras de marketing (*disruptivo, vanguardia, revolucionario, sin precedentes*)?
- [ ] ¿Se eliminaron frases hechas de LLM (*cuello de botella, paradigma, simple caja negra, correlación espuria*)?
- [ ] ¿Los fenómenos están descritos con terminología estándar de la disciplina correspondiente?
- [ ] ¿No se añadieron promesas de hardware no financiado ni objetivos no respaldados por los WPs?
- [ ] ¿El tono es sereno y evita la descalificación polémica de metodologías alternativas?
- [ ] ¿Las cifras, plazos y presupuestos coinciden con la fuente de verdad del proyecto?
- [ ] ¿Las citas bibliográficas corresponden exactamente a claves existentes en `references.bib`?
- [ ] ¿La compilación (Typst / LaTeX) se ejecuta sin errores fatales?
