---
layout: default
title: '030. Okay, ahora el siguiente flujo actualizado es: 2. Release Plannin…'
parent: Orquestación n8n productiva
nav_order: 30
permalink: /04-orquestacion-productiva/030/
---

{% raw %}

# Prompt 030
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 35,062 caracteres &middot; **Posición en la conversación:** 30 de 103

---

```
Okay, ahora el siguiente flujo actualizado es: 2. Release Planning (Refinament Before Discovery)

Entradas del flujo: URL de la Wiki del product planning que sacamos del paso anterior, pero debe pedir el agente supervisor una aprobacion para pasar al realse planning sino le pregunte si quiere volver a generar el product planning con otros datos

Flujo:


{
  \"nodes\": [
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/375?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -4032,
        480
      ],
      \"id\": \"e856e76c-87a3-4b9d-878e-5504f40a0596\",
      \"name\": \"1. Cargar documento product planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Release%20Planning.pdf\",
        \"options\": {
          \"response\": {
            \"response\": {
              \"responseFormat\": \"file\",
              \"outputPropertyName\": \"Ejemplo_Release_Planning.pdf\"
            }
          }
        }
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -3792,
        480
      ],
      \"id\": \"73e89e6c-237e-4b22-bbdf-c6c311b10a17\",
      \"name\": \"Obtener ejemplo release planning\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -3584,
        480
      ],
      \"id\": \"f90df9c5-9e09-41e1-82fa-1e7d9df5ecfd\",
      \"name\": \"Cambiar etiqueta de identificación\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-robotics-er-1.5-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-robotics-er-1.5-preview\"
        },
        \"text\": \"=Objetivo: Necesito tu ayuda para definir:\\n\\n- Fecha de inicio y fin del primer release.\\n- Fecha de inicio y fin de los 4 sprints del primer release\\n- Rango de Story Points a completar durante el release\\n\\nRol: Eres un Product Owner que tiene en experiencia planificando releases según la restricción por fecha fija (Fecha y presupuesto fijos, pero alcance flexible).\\n\\nContexto: Lee el Product Planning para tener contexto del Producto (””” {{ $('1. Cargar documento product planning').item.json.content }}”””). Soy un Product Owner Proxy que va a guiar la construcción del nuevo producto PoliTutorías. Mi equipo esta conformado por 6 personas con diferentes roles como: Discovery, Scrum (Mi rol), Agile Testing, Backend, Frontend, DevOps. La planificación del release es por fecha fija con duración de 2 meses total (8 semanas, solo días laborables) que dura desde 8 enero a 5 marzo de 2026. El número de sprints en el release son 4 y duran 2 semanas cada uno (Empiezan los jueves y terminan los jueves). El equipo tiene un rango de velocidad histórico de 31 a 42 Story Points. Para realizar estas tareas lee las secciones 1, 2 y 3 del documento \\\"\\\"\\\"Ejemplo_Release_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo.\\n\\nAcción: \\n\\n- Calcular la fecha de inicio de fin de los 4 sprints del primer release utilizando la fecha de inicio y fin del release.\\n- Calcular el rango de story points que el scrum team puede completar todo el release (Multiplicar cada valor de la velocidad por el número de sprints)\\n\\nFormato:\\nResponde ÚNICAMENTE con un objeto JSON válido con esta estructura:\\n{\\n  \\\"fechas_release\\\": { \\\"inicio\\\": \\\"...\\\", \\\"fin\\\": \\\"...\\\" },\\n  \\\"sprints\\\": [\\n    { \\\"nombre\\\": \\\"Sprint 1\\\", \\\"fechas\\\": \\\"Del X al Y\\\" },\\n    { \\\"nombre\\\": \\\"Sprint 2\\\", \\\"fechas\\\": \\\"...\\\" }\\n  ],\\n  \\\"velocidad\\\": { \\\"baja\\\": , \\\"alta\\\":  },\\n  \\\"rango_total_sp\\\": {\\n     \\\"calculo_bajo\\\": \\\"Cantidad Sprints * Velocidad baja = \\\",\\n     \\\"calculo_alto\\\": \\\"Cantidad Sprints * Velocidad alta = \\\",\\n     \\\"min\\\": ,\\n     \\\"max\\\": \\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -3344,
        480
      ],
      \"id\": \"c9ffc6ae-b2e7-47a7-b4fa-cbcf344d0387\",
      \"name\": \"2. Calcular fechas del release y el rango de story points\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Release%20Planning.pdf\",
        \"options\": {
          \"response\": {
            \"response\": {
              \"responseFormat\": \"file\",
              \"outputPropertyName\": \"Ejemplo_Release_Planning.pdf\"
            }
          }
        }
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -2944,
        480
      ],
      \"id\": \"9ee6f4a5-9871-4c6e-9f36-5495ddf190d6\",
      \"name\": \"Obtener ejemplo release planning1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2752,
        480
      ],
      \"id\": \"f187d640-280f-428a-9155-18d2d7b1dcbc\",
      \"name\": \"Cambiar etiqueta de identificación1\"
    },
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Release%20Planning.pdf\",
        \"options\": {
          \"response\": {
            \"response\": {
              \"responseFormat\": \"file\",
              \"outputPropertyName\": \"Ejemplo_Product_Planning.pdf\"
            }
          }
        }
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -2160,
        480
      ],
      \"id\": \"9b3ad9cc-7e46-40a1-b924-62ec5d62d624\",
      \"name\": \"Obtener ejemplo release planning2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1968,
        480
      ],
      \"id\": \"dca158ad-a678-46a7-8488-1d5cba60c52b\",
      \"name\": \"Cambiar etiqueta de identificación2\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-robotics-er-1.5-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-robotics-er-1.5-preview\"
        },
        \"text\": \"=Objetivo: Necesito tu ayuda para:\\n\\n- Bajar el nivel de abstracción de épicas a HUs\\n- Definir las funcionalidades mínimas liberables para el primer release (MRFs)\\n- Priorizar el product backlog\\n\\nRol: Eres un Product Owner que tiene en experiencia refinando product backlogs, ordenando y priorizando estratégicamente.\\n\\nContexto: Lee el Product Planning para tener contexto del Producto (”””{{ $('1. Cargar documento product planning').item.json.content }} ”””). Soy un Product Owner Proxy que va a guiar la construcción del nuevo producto PoliTutorías y estoy enfocándome en el planificar el primer release. Mi equipo puede completar durante el release este rango de SP “””{{ JSON.stringify($('Sanitizar paso 2').first().json.rango_total_sp) }} ””” . Para priorizar el product backlog considera que: Must have → MRFs, Will have → Historias que se van a entregar durante el release (Suma SP de HUs ≤ rango bajo SP), Might have → Historias que podrían entregarse si la velocidad lo permite (Suma SP de HUs ≤ rango alto SP), Won’t have → stas funcionalidades no entrarán en este release (Suma SP de HUs > rango alto SP). Para realizar estas tareas lee las sección 5 del documento \\\"\\\"\\\"Ejemplo_Release_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo.\\n\\nAcción: \\n\\n- Desglosar las Épicas de alto nivel en HUs (Nuevo Product Backlog) evitando brechas/inconsistencias entre funcionalidades. Suficientes que superen el rango alto de SP del equipo.\\n- Seleccionar las HUs que se alineen estratégicamente con el objetivo del primer release ().\\n- Ordenar el Product Backlog de manera lógica no colocando HUs dependientes de otra primero, a la par que asegura las HUs (MRFs) se entreguen durante los dos primeros sprints.\\n\\nFormato:\\nResponde ESTRICTAMENTE en formato JSON con esta estructura:\\n{\\n  \\\"objetivo_release\\\": \\\"Copiar el objetivo del primer release del documento\\\",\\n  \\\"backlog_refinado\\\": [\\n    {\\n      \\\"id\\\": \\\"HU01\\\",\\n      \\\"titulo\\\": \\\"Título corto de la historia\\\",\\n      \\\"historia_usuario\\\": \\\"Como [rol] quiero [acción] para [beneficio]\\\",\\n      \\\"estimacion_sp\\\": 13,\\n      \\\"prioridad_moscow\\\": \\\"Must have\\\" \\n    },\\n    {\\n      \\\"id\\\": \\\"HU02\\\",\\n      \\\"titulo\\\": \\\"Título corto de la historia\\\",\\n      \\\"historia_usuario\\\": \\\"...\\\",\\n      \\\"estimacion_sp\\\": 8,\\n      \\\"prioridad_moscow\\\": \\\"Will have\\\"\\n    },\\n    {\\n      \\\"id\\\": \\\"HU03\\\",\\n      \\\"titulo\\\": \\\"...\\\",\\n      \\\"historia_usuario\\\": \\\"...\\\",\\n      \\\"estimacion_sp\\\": 5,\\n      \\\"prioridad_moscow\\\": \\\"Might have\\\"\\n    }\\n    ...\\n  ],\\n  \\\"analisis_mrf\\\": {\\n    \\\"total_sp_will_have\\\": 0, \\n    \\\"total_sp_mrf\\\": 0,\\n    \\\"formula_calculo\\\": \\\"total_sp_mrf SP / total_sp_will_have SP * 100%\\\",\\n    \\\"porcentaje_mrf\\\": 0,\\n    \\\"conclusion\\\": \\\"Texto explicativo indicando si el porcentaje está dentro del rango recomendado (60-70%) y por qué es adecuado.\\\"\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -2544,
        480
      ],
      \"id\": \"470b8a70-030d-475d-976c-ec5173044c7f\",
      \"name\": \"3. Refinar PB, seleccionar MRF y priorizar PB\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-robotics-er-1.5-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-robotics-er-1.5-preview\"
        },
        \"text\": \"=Objetivo: Necesito tu ayuda para:\\n\\n- Definir objetivos comerciales para los 4 sprints.\\n- Definir las HUs para cada uno de los 4 sprints\\n\\nRol: Eres un Product Owner que tiene en experiencia redactando objetivos comerciales (Nivel Abstracción negocio) y seleccionando HUs de manera estratégica.\\n\\nContexto: Lee el Product Planning para tener contexto del Producto (”””{{ $('1. Cargar documento product planning').item.json.content }} ”””). Soy un Product Owner Proxy que va a guiar la construcción del nuevo producto PoliTutorías y estoy enfocándome en el planificar el primer release por fecha fija. El product backlog actual es: “““{{ JSON.stringify($('Sanitizar paso 3').first().json.backlog_refinado) }} ””” y el objetivo del release es “““{{ JSON.stringify($('Sanitizar paso 3').first().json.objetivo_release) }} ”””.\\n\\nMi equipo tiene una velocidad histórica de “””{{ JSON.stringify($('Sanitizar paso 2').first().json.velocidad) }} ”””.El total de SP del Sprint Mapping debe coincidir con el rango bajo total de SP del release (Will Have: Historias que se van a entregar durante el release ) “””{{ JSON.stringify($('Sanitizar paso 2').first().json.rango_total_sp) }} ”””. Para realizar estas tareas lee las sección 6 del documento \\\"\\\"\\\"Ejemplo_Release_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo.\\n\\nAcción:\\n\\n- Redactar objetivos comerciales para cada uno de los 4 sprints de manera clara y concisa, recordando que dichos objetivos deben ser verificables al finalizar el sprint y definen qué logra el negocio al final de cada sprint. Evita incluir frases como: “Elevar 15% ventas” o cualquier otro dato estadístico.\\n- Seleccionar las HUs que se alineen estratégicamente con cada uno de los objetivos de los 4 sprints.\\n\\nFormato:\\nResponde ESTRICTAMENTE en JSON con este formato:\\n{\\n  \\\"sprint_mapping\\\": [\\n    {\\n      \\\"sprint_name\\\": \\\"Sprint 1\\\",\\n      \\\"objetivo_comercial\\\": \\\"Texto del objetivo comercial.\\\",\\n      \\\"lista_hus\\\": [\\n        { \\\"id\\\": \\\"HU01\\\", \\\"titulo\\\": \\\"\\\", \\\"Estimación (SP)\\\": \\\"\\\" },\\n        { \\\"id\\\": \\\"HU02\\\", \\\"titulo\\\": \\\"\\\", \\\"Estimación (SP)\\\": \\\"\\\" }\\n      ]\\n    },\\n    {\\n      \\\"sprint_name\\\": \\\"Sprint 2\\\",\\n      \\\"objetivo_comercial\\\": \\\"...\\\",\\n      \\\"lista_hus\\\": [\\n         { \\\"id\\\": \\\"HU03\\\", \\\"titulo\\\": \\\"...\\\", \\\"Estimación (SP)\\\": \\\"\\\" }\\n      ]\\n    }\\n  ]\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -1744,
        480
      ],
      \"id\": \"bca81e6b-ff7f-4518-a9a3-8ff7e1689892\",
      \"name\": \"4. Crear el sprint mapping\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN SEGURA PARA EXTRAER DATOS ---\\nconst getData = (nodeName) => {\\n  try {\\n    const node = $(nodeName).first();\\n    return node ? node.json : {};\\n  } catch (error) {\\n    return {};\\n  }\\n};\\n\\n// --- 2. RECUPERAR DATOS ---\\nconst dataFechas = getData('Sanitizar paso 2');\\nconst dataBacklog = getData('Sanitizar paso 3'); \\nconst dataMapping = getData('Sanitizar paso 4'); \\n// NUEVO: Recuperamos el backlog ya ordenado del nodo intermedio\\n// Asegúrate de que tu nodo anterior se llame 'Reordenar Backlog' o ajusta este nombre\\nconst dataOrdenado = getData('Ordenar PB'); \\n\\n// Desestructuración segura\\nconst fechas = dataFechas.fechas_release || {};\\nconst sprints = dataFechas.sprints || [];\\nconst velocidad = dataFechas.velocidad || {};\\nconst rangoSp = dataFechas.rango_total_sp || {};\\n\\nconst objetivo = dataBacklog.objetivo_release || \\\"No definido\\\";\\nconst mrf = dataBacklog.analisis_mrf || {};\\nconst sprintsMapping = dataMapping.sprint_mapping || [];\\n\\n// CAMBIO PRINCIPAL: Usamos el backlog_ordenado si existe; si no, el original\\nconst backlog = dataOrdenado.backlog_ordenado || [];\\n\\n// Función limpieza texto\\nconst clean = (text) => (text || '').toString().replace(/\\\\n/g, ' ').trim();\\n\\n// --- 3. CONSTRUCCIÓN DEL MARKDOWN ---\\n\\nlet md = `# 01_Release Planning\\\\n\\\\n`;\\n\\n// SECCIÓN 1: RELEASE DE FECHA FIJA\\nmd += `## 1. Release de fecha fija\\\\n`;\\nmd += `- **Fecha de inicio:** ${fechas.inicio || 'Pendiente'}\\\\n`;\\nmd += `- **Fecha de fin:** ${fechas.fin || 'Pendiente'}\\\\n`;\\nmd += `- **Duración de cada sprint:** 1 semana (Estándar)\\\\n\\\\n`;\\n\\nif (sprints.length > 0) {\\n    md += `### Cronograma de Sprints:\\\\n`;\\n    sprints.forEach((s, index) => {\\n        const detalle = typeof s === 'string' ? s : `${s.fechas} `;\\n        const nombreSprint = s.nombre || `Sprint ${index + 1}`;\\n        md += `- **${nombreSprint}:** ${detalle}\\\\n`;\\n    });\\n}\\nmd += `\\\\n`;\\n\\n// SECCIÓN 2 Y 3: VELOCIDAD Y RANGO\\nmd += `## 2. Rango de velocidad del equipo\\\\n`;\\nmd += `- **Velocidad Alta:** ${velocidad.alta || '?'} SP/Sprint\\\\n`;\\nmd += `- **Velocidad Baja:** ${velocidad.baja || '?'} SP/Sprint\\\\n\\\\n`;\\n\\nmd += `## 3. Rango de Story Points del Release\\\\n`;\\nif (typeof rangoSp === 'object') {\\n    md += `Se estima que el equipo podrá completar entre **${rangoSp.min || rangoSp.bajo || '?'}** y **${rangoSp.max || rangoSp.alto || '?'}** Story Points.\\\\n\\\\n`;\\n} else {\\n    md += `Rango estimado: **${rangoSp}**\\\\n\\\\n`;\\n}\\n\\n// SECCIÓN 4: OBJETIVO\\nmd += `## 4. Objetivo del Release\\\\n`;\\nmd += `> ${objetivo}\\\\n\\\\n`;\\n\\n// SECCIÓN 5: CONJUNTO DE MRF (TABLA CON ORDEN SPRINT MAPPING)\\nmd += `## 5. Conjunto de MRF (Backlog Priorizado)\\\\n`;\\nmd += `### Detalle de Historias de Usuario\\\\n`;\\nmd += `| ID | Título | Estimación (SP) | Prioridad (MoSCoW) |\\\\n`;\\nmd += `|---|---|---|---|\\\\n`;\\n\\nif (backlog.length > 0) {\\n    // IMPORTANTE: Hemos eliminado el .sort() que ordenaba por prioridad.\\n    // Ahora respetará el orden en que vienen del nodo 'Reordenar Backlog'.\\n\\n    backlog.forEach(item => {\\n        md += `| ${clean(item.id)} | ${clean(item.titulo)} | ${item.estimacion_sp || item.estimacion || 0} | **${clean(item.prioridad_moscow || item.moscow)}** |\\\\n`;\\n    });\\n} else {\\n    md += `| - | No hay historias definidas | - | - |\\\\n`;\\n}\\n\\nmd += `\\\\n### Análisis de viabilidad MRF\\\\n`;\\nmd += `- **Total SP Planificado:** ${mrf.total_sp_will_have || 0} SP\\\\n`;\\nmd += `- **Total SP de MRF (Must Have):** ${mrf.total_sp_mrf || 0} SP\\\\n`;\\nif (mrf.porcentaje_mrf) {\\n    md += `- **Proporción de esfuerzo:** ${mrf.porcentaje_mrf}% (Recomendado: 60-70%)\\\\n`;\\n}\\nif (mrf.conclusion) {\\n    md += `\\\\n**Conclusión:** ${mrf.conclusion}\\\\n\\\\n`;\\n} else {\\n    md += `\\\\n\\\\n`;\\n}\\n\\n// SECCIÓN 6: SPRINT MAPPING\\nmd += `## 6. Sprint Mapping\\\\n\\\\n`;\\n\\nif (sprintsMapping.length > 0) {\\n    sprintsMapping.forEach(sprint => {\\n        md += `### 🚩 ${sprint.sprint_name}\\\\n`;\\n        \\n        if (sprint.objetivo_comercial) {\\n            md += `**Objetivo:** *${sprint.objetivo_comercial}*\\\\n\\\\n`;\\n        }\\n\\n        md += `| ID | Título | Estimación (SP) |\\\\n`;\\n        md += `|:---:|---|:---:|\\\\n`; \\n\\n        const hus = sprint.lista_hus || [];\\n        \\n        if (hus.length > 0) {\\n            hus.forEach(hu => {\\n                const sp = hu[\\\"Estimación (SP)\\\"] || hu.estimacion || 0;\\n                md += `| **${clean(hu.id)}** | ${clean(hu.titulo)} | ${sp} |\\\\n`;\\n            });\\n        } else {\\n            md += `| - | Sin historias asignadas | - |\\\\n`;\\n        }\\n        md += `\\\\n---\\\\n`; \\n    });\\n} else {\\n    md += `_No se ha generado la planificación de sprints._\\\\n`;\\n}\\n\\n// --- 4. RETORNAR RESULTADO ---\\nreturn [{\\n  json: {\\n    nombre_archivo: \\\"01_Release_Planning.md\\\",\\n    contenido_markdown: md,\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -848,
        304
      ],
      \"id\": \"6d270853-ab28-4d72-8428-ac9ec7de1a54\",
      \"name\": \"Generar documento markdown\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN SEGURA PARA EXTRAER DATOS ---\\nconst getData = (nodeName) => {\\n  try {\\n    const node = $(nodeName).first();\\n    return node ? node.json : {};\\n  } catch (error) {\\n    return {};\\n  }\\n};\\n\\n// --- 2. RECUPERAR DATOS DEL NODO ORDENADO ---\\n// Asegúrate de que el nombre coincida exactamente con tu nodo de ordenamiento\\nconst dataOrdenado = getData('Ordenar PB'); \\n\\n// Obtenemos la lista ya priorizada. Si falla, usamos array vacío.\\nconst backlog = dataOrdenado.backlog_ordenado || [];\\n\\n// Función para limpiar texto (los saltos de línea rompen las tablas en Markdown)\\nconst clean = (text) => (text || '').toString().replace(/\\\\n/g, ' ').trim();\\n\\n// --- 3. CONSTRUCCIÓN DEL MARKDOWN ---\\n\\nlet md = `# Product Backlog Oficial\\\\n\\\\n`;\\nmd += `**Fecha de generación:** ${new Date().toLocaleDateString()}\\\\n`;\\nmd += `**Total de Historias:** ${backlog.length}\\\\n\\\\n`;\\n\\n// Encabezado de la Tabla\\nmd += `| ID | Título | Historia de Usuario | Estimación (SP) |\\\\n`;\\nmd += `|:---:|---|---|:---:|\\\\n`; // Alineación: ID y SP centrados\\n\\n// Filas de la Tabla\\nif (backlog.length > 0) {\\n    backlog.forEach(item => {\\n        // Extraemos valores asegurando que existan\\n        const id = clean(item.id);\\n        const titulo = clean(item.titulo);\\n        const historia = clean(item.historia_usuario);\\n        const sp = item.estimacion_sp || item.estimacion || 0;\\n\\n        md += `| **${id}** | ${titulo} | ${historia} | ${sp} |\\\\n`;\\n    });\\n} else {\\n    md += `| - | No se encontraron historias ordenadas | - | - |\\\\n`;\\n}\\n\\n// --- 4. RETORNAR RESULTADO ---\\nreturn [{\\n  json: {\\n    nombre_archivo: \\\"Product_Backlog_Oficial.md\\\",\\n    contenido_markdown: md\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -848,
        688
      ],
      \"id\": \"24e3fe69-e692-483b-a4ff-3ea2393172ee\",
      \"name\": \"Generar documento markdown1\"
    },
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -4240,
        480
      ],
      \"id\": \"49075b49-f063-4119-89b4-6b64a6fe8e27\",
      \"name\": \"When clicking ‘Execute workflow’\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.content.parts[0].text;\\n\\n// 2. Sanitizar: Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -3152,
        480
      ],
      \"id\": \"bf65c221-4e27-44ed-87cf-fc8fdfaa84af\",
      \"name\": \"Sanitizar paso 2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.content.parts[0].text;\\n\\n// 2. Sanitizar: Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2368,
        480
      ],
      \"id\": \"77f481d0-c36a-4e02-a4dd-d948d16b76e3\",
      \"name\": \"Sanitizar paso 3\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.content.parts[0].text;\\n\\n// 2. Sanitizar: Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1536,
        480
      ],
      \"id\": \"af46b37b-797a-44ed-b394-ca34387b1edb\",
      \"name\": \"Sanitizar paso 4\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. OBTENER DATOS DE LOS NODOS SANITIZADOS ---\\n// Ajusta los nombres si tus nodos se llaman diferente\\nconst dataBacklog = $('Sanitizar paso 3').first().json; \\nconst dataMapping = $('Sanitizar paso 4').first().json;\\n\\n// Extraemos las listas (con validación por si vienen vacías)\\n// Nota: Usamos spread operator [...] para crear copias y no mutar los originales\\nconst backlogOriginal = [...(dataBacklog.backlog_refinado || [])];\\nconst sprints = dataMapping.sprint_mapping || [];\\n\\n// --- 2. CREAR EL \\\"INDICE MAESTRO\\\" DE ORDEN ---\\n// Recorremos los sprints en orden y extraemos los IDs de sus historias\\nconst orderMap = new Map();\\nlet globalIndex = 0;\\n\\nsprints.forEach(sprint => {\\n    const historias = sprint.lista_hus || [];\\n    historias.forEach(hu => {\\n        // Guardamos el ID y su posición absoluta (0, 1, 2...)\\n        // Usamos trim() para evitar errores por espacios invisibles\\n        if (hu.id) {\\n            orderMap.set(hu.id.toString().trim(), globalIndex++);\\n        }\\n    });\\n});\\n\\n// --- 3. REORDENAR EL BACKLOG ---\\nbacklogOriginal.sort((a, b) => {\\n    const idA = (a.id || '').toString().trim();\\n    const idB = (b.id || '').toString().trim();\\n\\n    // Obtenemos la posición deseada del mapa\\n    // Si no existe (no asignada a sprint), le damos un número gigante (Infinity) para que vaya al final\\n    const indexA = orderMap.has(idA) ? orderMap.get(idA) : Infinity;\\n    const indexB = orderMap.has(idB) ? orderMap.get(idB) : Infinity;\\n\\n    return indexA - indexB;\\n});\\n\\n// --- 4. RESULTADO ---\\n// Devolvemos el mismo objeto de backlog pero con la lista ya ordenada\\nreturn [{\\n    json: {\\n        ...dataBacklog, // Mantenemos otros datos como 'objetivo_release'\\n        backlog_ordenado: backlogOriginal,\\n        debug_info: `Se reordenaron ${backlogOriginal.length} historias según el Sprint Mapping.`\\n    }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1312,
        480
      ],
      \"id\": \"30f8e031-f198-4ebc-af39-1fc1d09081d7\",
      \"name\": \"Ordenar PB\"
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendQuery\": true,
        \"queryParameters\": {
          \"parameters\": [
            {
              \"name\": \"path\",
              \"value\": \"/Scrum automatización/Release Planning Version/Release-Planning-Refinament-4.0\"
            },
            {
              \"name\": \"api-version\",
              \"value\": \"7.1\"
            }
          ]
        },
        \"sendBody\": true,
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.contenido_markdown }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -608,
        304
      ],
      \"id\": \"948ec060-a244-46df-9508-594eefa99a4f\",
      \"name\": \"5. Guardar borrador product planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendQuery\": true,
        \"queryParameters\": {
          \"parameters\": [
            {
              \"name\": \"path\",
              \"value\": \"/Scrum automatización/Release Planning Version/Product-Backlog-Refinament-3.0\"
            },
            {
              \"name\": \"api-version\",
              \"value\": \"7.1\"
            }
          ]
        },
        \"sendBody\": true,
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.contenido_markdown }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -640,
        688
      ],
      \"id\": \"7503a5f3-8a1a-4ab7-bf44-643566df71da\",
      \"name\": \"6. Guardar borrador product backlog\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    }
  ],
  \"connections\": {
    \"1. Cargar documento product planning\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo release planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo release planning\": {
      \"main\": [
        [
          {
            \"node\": \"Cambiar etiqueta de identificación\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Cambiar etiqueta de identificación\": {
      \"main\": [
        [
          {
            \"node\": \"2. Calcular fechas del release y el rango de story points\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"2. Calcular fechas del release y el rango de story points\": {
      \"main\": [
        [
          {
            \"node\": \"Sanitizar paso 2\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo release planning1\": {
      \"main\": [
        [
          {
            \"node\": \"Cambiar etiqueta de identificación1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Cambiar etiqueta de identificación1\": {
      \"main\": [
        [
          {
            \"node\": \"3. Refinar PB, seleccionar MRF y priorizar PB\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo release planning2\": {
      \"main\": [
        [
          {
            \"node\": \"Cambiar etiqueta de identificación2\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Cambiar etiqueta de identificación2\": {
      \"main\": [
        [
          {
            \"node\": \"4. Crear el sprint mapping\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"3. Refinar PB, seleccionar MRF y priorizar PB\": {
      \"main\": [
        [
          {
            \"node\": \"Sanitizar paso 3\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"4. Crear el sprint mapping\": {
      \"main\": [
        [
          {
            \"node\": \"Sanitizar paso 4\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar documento markdown\": {
      \"main\": [
        [
          {
            \"node\": \"5. Guardar borrador product planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar documento markdown1\": {
      \"main\": [
        [
          {
            \"node\": \"6. Guardar borrador product backlog\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"When clicking ‘Execute workflow’\": {
      \"main\": [
        [
          {
            \"node\": \"1. Cargar documento product planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Sanitizar paso 2\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo release planning1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Sanitizar paso 3\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo release planning2\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Sanitizar paso 4\": {
      \"main\": [
        [
          {
            \"node\": \"Ordenar PB\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Ordenar PB\": {
      \"main\": [
        [
          {
            \"node\": \"Generar documento markdown\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Generar documento markdown1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"templateCredsSetupCompleted\": true,
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

Salida esperada: JSON completo del flujo actualizado, modificaciones al agente supervisor 

```

---

### Navegación

[← Prompt 029](/04-orquestacion-productiva/029/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 031 →](/04-orquestacion-productiva/031/)
{% endraw %}
