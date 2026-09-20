# Reglas de Redacción Científica del Proyecto Babiera

Para todos los documentos técnicos, reportes de investigación, propuestas científicas y revisiones del proyecto `proyecto-babiera`:

## 1. Uso Obligatorio de Typst y Plantilla Científica
- Toda memoria científica formal, propuesta de financiamiento, reporte técnico o estado del arte debe redactarse en formato Typst (`.typ`).
- Debe utilizarse exclusivamente la plantilla configurada en `typst-scientific-report-template/template.typ`.

## 2. Estructura Estándar del Documento Typst
Todo archivo `.typ` debe comenzar importando la plantilla y configurando el bloque `project`:

```typst
#import "typst-scientific-report-template/template.typ": project, callout

#show: project.with(
  title: [Título Principal del Documento],
  subtitle: [Subtítulo o Marco de la Investigación],
  objective: [
    Objetivo central o pregunta de investigación que aparecerá en el bloque destacado con fondo neutro y borde lateral.
  ],
  authors: ("Autor / Institución 1", "Autor / Institución 2"),
  date: "17 de septiembre de 2026",
  doc_id: "ID-PROYECTO-AÑO-NUM",
  header_title: "Encabezado Técnico de Página",
)
```

## 3. Elementos Gráficos y Sintaxis
- **Bloques destacados / Callouts:** Usar `#callout(title: "Título")[Cuerpo del llamado]` para conclusiones, advertencias o vacíos metodológicos clave.
- **Tablas comparativas:** Utilizar `#table(...)` respetando el formato de cabecera resaltada (`rgb("#f0f3f6")`) y líneas divisorias compactas.
- **Citaciones y Bibliografía:** Emplear la sintaxis de citación nativa de Typst (`@key`) vinculada al archivo `references.bib` mediante `#bibliography("references.bib")` al final del documento.

## 4. Compilación y Validación
- Todo documento nuevo o modificado debe ser validado y compilado a PDF utilizando el compilador local de Typst:
  ```bash
  typst compile documento.typ documento.pdf
  ```
