---
layout: default
title: '033. { ''nodes'': [ { ''parameters'': {}, ''id'': ''b8fad92c-ba53-4...'
parent: Orquestación n8n productiva
nav_order: 33
permalink: /04-orquestacion-productiva/033/
---

{% raw %}

# Prompt 033
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 36,517 caracteres &middot; **Posición en la conversación:** 33 de 103

---

```
{
  \"nodes\": [
    {
      \"parameters\": {},
      \"id\": \"b8fad92c-ba53-493f-984f-985b16b8de63\",
      \"name\": \"Execute Workflow Trigger\",
      \"type\": \"n8n-nodes-base.executeWorkflowTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -3744,
        -368
      ]
    },
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -3744,
        -160
      ],
      \"id\": \"8bdd737b-9af6-4669-9804-4246def4d35d\",
      \"name\": \"Manual Trigger\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO DE CONFIGURACIÓN HÍBRIDA\\n// Recibe datos del Agente o usa Defaults para pruebas manuales\\n\\nconst input = $input.first().json;\\n\\n// 1. Fechas (Inputs del Agente o Defaults del PDF original)\\nconst fechaInicio = input.fecha_inicio || '2026-01-08';\\nconst fechaFin = input.fecha_fin || '2026-03-05';\\n\\n// 2. Extracción Inteligente del Path de la Wiki\\n// El agente manda la URL completa (https://dev.azure.com/...), Azure pide solo el Path\\nlet wikiPath = \\\"/Scrum automatización/Product Planning Version/Product-Planning-Refinament\\\"; // Default del flujo original\\n\\nif (input.wiki_url) {\\n  try {\\n    // Intentamos extraer el parámetro 'path' o 'pagePath' de la URL\\n    const urlObj = new URL(input.wiki_url);\\n    const params = new URLSearchParams(urlObj.search);\\n    // Azure suele usar 'path' o 'pagePath' en la URL del navegador\\n    const extractedPath = params.get('path') || params.get('pagePath');\\n    if (extractedPath) {\\n      wikiPath = extractedPath;\\n    }\\n  } catch (e) {\\n    // Si falla el parseo, asumimos que viene el path directo o usamos default\\n  }\\n}\\n// Decodificar URI por si viene con %20\\nwikiPath = decodeURIComponent(wikiPath);\\n\\nreturn {\\n  json: {\\n    fecha_inicio: fechaInicio,\\n    fecha_fin: fechaFin,\\n    // Datos fijos del contexto original\\n    duracion_sprint: '2 semanas',\\n    cantidad_sprints: 4,\\n    velocidad_baja: 31,\\n    velocidad_alta: 42,\\n    \\n    // Path calculado para leer el documento previo\\n    target_wiki_path: wikiPath\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -3504,
        -256
      ],
      \"id\": \"a6468b20-9d39-4c80-9c5d-2ed3de2eb647\",
      \"name\": \"Configurar Parametros\"
    },
    {
      \"parameters\": {
        \"url\": \"=https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path={{ $json.target_wiki_path }}&includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -3264,
        -256
      ],
      \"id\": \"29813681-64a4-441e-a25b-ae7ba9de8394\",
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
        -3024,
        -256
      ],
      \"id\": \"1e4591f9-9992-427c-9387-48e7cb254a96\",
      \"name\": \"Obtener ejemplo release planning\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2816,
        -256
      ],
      \"id\": \"4f85cb8f-b920-4df3-bed6-0f30338080d3\",
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
        \"text\": \"=Objetivo: Necesito tu ayuda para definir:\\n\\n- Fecha de inicio y fin del primer release.\\n- Fecha de inicio y fin de los 4 sprints del primer release\\n- Rango de Story Points a completar durante el release\\n\\nRol: Eres un Product Owner que tiene en experiencia planificando releases según la restricción por fecha fija (Fecha y presupuesto fijos, pero alcance flexible).\\n\\nContexto: Lee el Product Planning para tener contexto del Producto (””” {{ $('1. Cargar documento product planning').item.json.content }}”””). Soy un Product Owner Proxy que va a guiar la construcción del nuevo producto PoliTutorías. Mi equipo esta conformado por 6 personas con diferentes roles como: Discovery, Scrum (Mi rol), Agile Testing, Backend, Frontend, DevOps. La planificación del release es por fecha fija con duración de 2 meses total (8 semanas, solo días laborables) que dura desde {{ $('Configurar Parametros').item.json.fecha_inicio }} a {{ $('Configurar Parametros').item.json.fecha_fin }}. El número de sprints en el release son 4 y duran 2 semanas cada uno (Empiezan los jueves y terminan los jueves). El equipo tiene un rango de velocidad histórico de 31 a 42 Story Points. Para realizar estas tareas lee las secciones 1, 2 y 3 del documento \\\"\\\"\\\"Ejemplo_Release_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo.\\n\\nAcción: \\n\\n- Calcular la fecha de inicio de fin de los 4 sprints del primer release utilizando la fecha de inicio y fin del release.\\n- Calcular el rango de story points que el scrum team puede completar todo el release (Multiplicar cada valor de la velocidad por el número de sprints)\\n\\nFormato:\\nResponde ÚNICAMENTE con un objeto JSON válido con esta estructura:\\n{\\n  \\\"fechas_release\\\": { \\\"inicio\\\": \\\"...\\\", \\\"fin\\\": \\\"...\\\" },\\n  \\\"sprints\\\": [\\n    { \\\"nombre\\\": \\\"Sprint 1\\\", \\\"fechas\\\": \\\"Del X al Y\\\" },\\n    { \\\"nombre\\\": \\\"Sprint 2\\\", \\\"fechas\\\": \\\"...\\\" }\\n  ],\\n  \\\"velocidad\\\": { \\\"baja\\\": 31, \\\"alta\\\": 42 },\\n  \\\"rango_total_sp\\\": {\\n     \\\"calculo_bajo\\\": \\\"Cantidad Sprints * Velocidad baja = \\\",\\n     \\\"calculo_alto\\\": \\\"Cantidad Sprints * Velocidad alta = \\\",\\n     \\\"min\\\": 0,\\n     \\\"max\\\": 0\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -2592,
        -256
      ],
      \"id\": \"9e649008-4a70-4a5e-809f-848ff3503fc4\",
      \"name\": \"2. Calcular fechas del release y el rango de story points\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"tN2HeGeNbppUpSjJ\",
          \"name\": \"Gemini DevOps\"
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
        -2384,
        -256
      ],
      \"id\": \"8b573d71-3f6c-457c-92ed-4795099642df\",
      \"name\": \"Obtener ejemplo release planning1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2176,
        -256
      ],
      \"id\": \"2e88b26f-db21-43bb-b862-1c29c32c274b\",
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
        -1584,
        -256
      ],
      \"id\": \"ced6ef3a-b51a-4b18-bc39-86d7b24e9b92\",
      \"name\": \"Obtener ejemplo release planning2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1376,
        -256
      ],
      \"id\": \"5195b51a-79a3-49fc-a215-60beb752e6ba\",
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
        \"text\": \"=Objetivo: Necesito tu ayuda para:\\n\\n- Bajar el nivel de abstracción de épicas a HUs\\n- Definir las funcionalidades mínimas liberables para el primer release (MRFs)\\n- Priorizar el product backlog\\n\\nRol: Eres un Product Owner que tiene en experiencia refinando product backlogs, ordenando y priorizando estratégicamente.\\n\\nContexto: Lee el Product Planning para tener contexto del Producto (”””{{ $('1. Cargar documento product planning').item.json.content }} ”””). Soy un Product Owner Proxy que va a guiar la construcción del nuevo producto PoliTutorías y estoy enfocándome en el planificar el primer release. Mi equipo puede completar durante el release este rango de SP “””{{ JSON.stringify($('Sanitizar paso 2').first().json.rango_total_sp) }} ””” . Para priorizar el product backlog considera que: Must have → MRFs, Will have → Historias que se van a entregar durante el release (Suma SP de HUs ≤ rango bajo SP), Might have → Historias que podrían entregarse si la velocidad lo permite (Suma SP de HUs ≤ rango alto SP), Won’t have → stas funcionalidades no entrarán en este release (Suma SP de HUs > rango alto SP). Para realizar estas tareas lee las sección 5 del documento \\\"\\\"\\\"Ejemplo_Release_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo.\\n\\nAcción: \\n\\n- Desglosar las Épicas de alto nivel en HUs (Nuevo Product Backlog) evitando brechas/inconsistencias entre funcionalidades. Suficientes que superen el rango alto de SP del equipo.\\n- Seleccionar las HUs que se alineen estratégicamente con el objetivo del primer release ().\\n- Ordenar el Product Backlog de manera lógica no colocando HUs dependientes de otra primero, a la par que asegura las HUs (MRFs) se entreguen durante los dos primeros sprints.\\n\\nFormato:\\nResponde ESTRICTAMENTE en formato JSON con esta estructura:\\n{\\n  \\\"objetivo_release\\\": \\\"Copiar el objetivo del primer release del documento\\\",\\n  \\\"backlog_refinado\\\": [\\n    {\\n      \\\"id\\\": \\\"HU01\\\",\\n      \\\"titulo\\\": \\\"Título corto de la historia\\\",\\n      \\\"historia_usuario\\\": \\\"Como [rol] quiero [acción] para [beneficio]\\\",\\n      \\\"estimacion_sp\\\": 13,\\n      \\\"prioridad_moscow\\\": \\\"Must have\\\" \\n    },\\n    { ... }\\n  ],\\n  \\\"analisis_mrf\\\": {\\n    \\\"total_sp_will_have\\\": 0, \\n    \\\"total_sp_mrf\\\": 0,\\n    \\\"formula_calculo\\\": \\\"total_sp_mrf SP / total_sp_will_have SP * 100%\\\",\\n    \\\"porcentaje_mrf\\\": 0,\\n    \\\"conclusion\\\": \\\"...\\\"\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -1952,
        -256
      ],
      \"id\": \"7ad61986-b6fc-409e-928e-9e4506e2218b\",
      \"name\": \"3. Refinar PB, seleccionar MRF y priorizar PB\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"tN2HeGeNbppUpSjJ\",
          \"name\": \"Gemini DevOps\"
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
        \"text\": \"=Objetivo: Necesito tu ayuda para:\\n\\n- Definir objetivos comerciales para los 4 sprints.\\n- Definir las HUs para cada uno de los 4 sprints\\n\\nRol: Eres un Product Owner que tiene en experiencia redactando objetivos comerciales (Nivel Abstracción negocio) y seleccionando HUs de manera estratégica.\\n\\nContexto: Lee el Product Planning para tener contexto del Producto (”””{{ $('1. Cargar documento product planning').item.json.content }} ”””). Soy un Product Owner Proxy que va a guiar la construcción del nuevo producto PoliTutorías y estoy enfocándome en el planificar el primer release por fecha fija. El product backlog actual es: “““{{ JSON.stringify($('Sanitizar paso 3').first().json.backlog_refinado) }} ””” y el objetivo del release es “““{{ JSON.stringify($('Sanitizar paso 3').first().json.objetivo_release) }} ”””.\\n\\nMi equipo tiene una velocidad histórica de “””{{ JSON.stringify($('Sanitizar paso 2').first().json.velocidad) }} ”””.El total de SP del Sprint Mapping debe coincidir con el rango bajo total de SP del release (Will Have: Historias que se van a entregar durante el release ) “””{{ JSON.stringify($('Sanitizar paso 2').first().json.rango_total_sp) }} ”””. Para realizar estas tareas lee las sección 6 del documento \\\"\\\"\\\"Ejemplo_Release_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo.\\n\\nAcción:\\n\\n- Redactar objetivos comerciales para cada uno de los 4 sprints de manera clara y concisa, recordando que dichos objetivos deben ser verificables al finalizar el sprint y definen qué logra el negocio al final de cada sprint. Evita incluir frases como: “Elevar 15% ventas” o cualquier otro dato estadístico.\\n- Seleccionar las HUs que se alineen estratégicamente con cada uno de los objetivos de los 4 sprints.\\n\\nFormato:\\nResponde ESTRICTAMENTE en JSON con este formato:\\n{\\n  \\\"sprint_mapping\\\": [\\n    {\\n      \\\"sprint_name\\\": \\\"Sprint 1\\\",\\n      \\\"objetivo_comercial\\\": \\\"Texto del objetivo comercial.\\\",\\n      \\\"lista_hus\\\": [\\n        { \\\"id\\\": \\\"HU01\\\", \\\"titulo\\\": \\\"\\\", \\\"Estimación (SP)\\\": \\\"\\\" }\\n      ]\\n    },\\n    ...\\n  ]\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -1152,
        -256
      ],
      \"id\": \"03bfb5c4-34dc-4abb-8ae2-672432973a52\",
      \"name\": \"4. Crear el sprint mapping\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"tN2HeGeNbppUpSjJ\",
          \"name\": \"Gemini DevOps\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN SEGURA PARA EXTRAER DATOS ---\\nconst getData = (nodeName) => {\\n  try {\\n    const node = $(nodeName).first();\\n    return node ? node.json : {};\\n  } catch (error) {\\n    return {};\\n  }\\n};\\n\\n// --- 2. RECUPERAR DATOS ---\\nconst dataFechas = getData('Sanitizar paso 2');\\nconst dataBacklog = getData('Sanitizar paso 3'); \\nconst dataMapping = getData('Sanitizar paso 4'); \\n// NUEVO: Recuperamos el backlog ya ordenado del nodo intermedio\\nconst dataOrdenado = getData('Ordenar PB'); \\n\\n// Desestructuración segura\\nconst fechas = dataFechas.fechas_release || {};\\nconst sprints = dataFechas.sprints || [];\\nconst velocidad = dataFechas.velocidad || {};\\nconst rangoSp = dataFechas.rango_total_sp || {};\\n\\nconst objetivo = dataBacklog.objetivo_release || \\\"No definido\\\";\\nconst mrf = dataBacklog.analisis_mrf || {};\\nconst sprintsMapping = dataMapping.sprint_mapping || [];\\n\\n// Usamos el backlog_ordenado si existe; si no, el original\\nconst backlog = dataOrdenado.backlog_ordenado || [];\\n\\n// Función limpieza texto\\nconst clean = (text) => (text || '').toString().replace(/\\\\n/g, ' ').trim();\\n\\n// --- 3. CONSTRUCCIÓN DEL MARKDOWN ---\\n\\nlet md = `# 01_Release Planning\\\\n\\\\n`;\\n\\n// SECCIÓN 1: RELEASE DE FECHA FIJA\\nmd += `## 1. Release de fecha fija\\\\n`;\\nmd += `- **Fecha de inicio:** ${fechas.inicio || 'Pendiente'}\\\\n`;\\nmd += `- **Fecha de fin:** ${fechas.fin || 'Pendiente'}\\\\n`;\\nmd += `- **Duración de cada sprint:** 1 semana (Estándar)\\\\n\\\\n`;\\n\\nif (sprints.length > 0) {\\n    md += `### Cronograma de Sprints:\\\\n`;\\n    sprints.forEach((s, index) => {\\n        const detalle = typeof s === 'string' ? s : `${s.fechas} `;\\n        const nombreSprint = s.nombre || `Sprint ${index + 1}`;\\n        md += `- **${nombreSprint}:** ${detalle}\\\\n`;\\n    });\\n}\\nmd += `\\\\n`;\\n\\n// SECCIÓN 2 Y 3: VELOCIDAD Y RANGO\\nmd += `## 2. Rango de velocidad del equipo\\\\n`;\\nmd += `- **Velocidad Alta:** ${velocidad.alta || '?'} SP/Sprint\\\\n`;\\nmd += `- **Velocidad Baja:** ${velocidad.baja || '?'} SP/Sprint\\\\n\\\\n`;\\n\\nmd += `## 3. Rango de Story Points del Release\\\\n`;\\nif (typeof rangoSp === 'object') {\\n    md += `Se estima que el equipo podrá completar entre **${rangoSp.min || rangoSp.bajo || '?'}** y **${rangoSp.max || rangoSp.alto || '?'}** Story Points.\\\\n\\\\n`;\\n} else {\\n    md += `Rango estimado: **${rangoSp}**\\\\n\\\\n`;\\n}\\n\\n// SECCIÓN 4: OBJETIVO\\nmd += `## 4. Objetivo del Release\\\\n`;\\nmd += `> ${objetivo}\\\\n\\\\n`;\\n\\n// SECCIÓN 5: CONJUNTO DE MRF (TABLA CON ORDEN SPRINT MAPPING)\\nmd += `## 5. Conjunto de MRF (Backlog Priorizado)\\\\n`;\\nmd += `### Detalle de Historias de Usuario\\\\n`;\\nmd += `| ID | Título | Estimación (SP) | Prioridad (MoSCoW) |\\\\n`;\\nmd += `|---|---|---|---|\\\\n`;\\n\\nif (backlog.length > 0) {\\n    backlog.forEach(item => {\\n        md += `| ${clean(item.id)} | ${clean(item.titulo)} | ${item.estimacion_sp || item.estimacion || 0} | **${clean(item.prioridad_moscow || item.moscow)}** |\\\\n`;\\n    });\\n} else {\\n    md += `| - | No hay historias definidas | - | - |\\\\n`;\\n}\\n\\nmd += `\\\\n### Análisis de viabilidad MRF\\\\n`;\\nmd += `- **Total SP Planificado:** ${mrf.total_sp_will_have || 0} SP\\\\n`;\\nmd += `- **Total SP de MRF (Must Have):** ${mrf.total_sp_mrf || 0} SP\\\\n`;\\nif (mrf.porcentaje_mrf) {\\n    md += `- **Proporción de esfuerzo:** ${mrf.porcentaje_mrf}% (Recomendado: 60-70%)\\\\n`;\\n}\\nif (mrf.conclusion) {\\n    md += `\\\\n**Conclusión:** ${mrf.conclusion}\\\\n\\\\n`;\\n} else {\\n    md += `\\\\n\\\\n`;\\n}\\n\\n// SECCIÓN 6: SPRINT MAPPING\\nmd += `## 6. Sprint Mapping\\\\n\\\\n`;\\n\\nif (sprintsMapping.length > 0) {\\n    sprintsMapping.forEach(sprint => {\\n        md += `### 🚩 ${sprint.sprint_name}\\\\n`;\\n        \\n        if (sprint.objetivo_comercial) {\\n            md += `**Objetivo:** *${sprint.objetivo_comercial}*\\\\n\\\\n`;\\n        }\\n\\n        md += `| ID | Título | Estimación (SP) |\\\\n`;\\n        md += `|:---:|---|:---:|\\\\n`; \\n\\n        const hus = sprint.lista_hus || [];\\n        \\n        if (hus.length > 0) {\\n            hus.forEach(hu => {\\n                const sp = hu[\\\"Estimación (SP)\\\"] || hu.estimacion || 0;\\n                md += `| **${clean(hu.id)}** | ${clean(hu.titulo)} | ${sp} |\\\\n`;\\n            });\\n        } else {\\n            md += `| - | Sin historias asignadas | - |\\\\n`;\\n        }\\n        md += `\\\\n---\\\\n`; \\n    });\\n} else {\\n    md += `_No se ha generado la planificación de sprints._\\\\n`;\\n}\\n\\n// --- 4. RETORNAR RESULTADO ---\\nreturn [{\\n  json: {\\n    nombre_archivo: \\\"01_Release_Planning.md\\\",\\n    contenido_markdown: md,\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -272,
        -368
      ],
      \"id\": \"69f2251a-58d3-480c-93f3-a1be3f87aa47\",
      \"name\": \"Generar documento markdown\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN SEGURA PARA EXTRAER DATOS ---\\nconst getData = (nodeName) => {\\n  try {\\n    const node = $(nodeName).first();\\n    return node ? node.json : {};\\n  } catch (error) {\\n    return {};\\n  }\\n};\\n\\n// --- 2. RECUPERAR DATOS DEL NODO ORDENADO ---\\nconst dataOrdenado = getData('Ordenar PB'); \\n\\n// Obtenemos la lista ya priorizada.\\nconst backlog = dataOrdenado.backlog_ordenado || [];\\n\\n// Función para limpiar texto\\nconst clean = (text) => (text || '').toString().replace(/\\\\n/g, ' ').trim();\\n\\n// --- 3. CONSTRUCCIÓN DEL MARKDOWN ---\\n\\nlet md = `# Product Backlog Oficial\\\\n\\\\n`;\\nmd += `**Fecha de generación:** ${new Date().toLocaleDateString()}\\\\n`;\\nmd += `**Total de Historias:** ${backlog.length}\\\\n\\\\n`;\\n\\n// Encabezado de la Tabla\\nmd += `| ID | Título | Historia de Usuario | Estimación (SP) |\\\\n`;\\nmd += `|:---:|---|---|:---:|\\\\n`; \\n\\n// Filas de la Tabla\\nif (backlog.length > 0) {\\n    backlog.forEach(item => {\\n        const id = clean(item.id);\\n        const titulo = clean(item.titulo);\\n        const historia = clean(item.historia_usuario);\\n        const sp = item.estimacion_sp || item.estimacion || 0;\\n\\n        md += `| **${id}** | ${titulo} | ${historia} | ${sp} |\\\\n`;\\n    });\\n} else {\\n    md += `| - | No se encontraron historias ordenadas | - | - |\\\\n`;\\n}\\n\\n// --- 4. RETORNAR RESULTADO ---\\nreturn [{\\n  json: {\\n    nombre_archivo: \\\"Product_Backlog_Oficial.md\\\",\\n    contenido_markdown: md\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -272,
        16
      ],
      \"id\": \"cf87da19-5430-40a6-bedd-1a7e25b23a00\",
      \"name\": \"Generar documento markdown1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.content.parts[0].text;\\n\\n// 2. Sanitizar: Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2560,
        272
      ],
      \"id\": \"cd3f9178-f540-4624-9433-dfa73470a3db\",
      \"name\": \"Sanitizar paso 2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.content.parts[0].text;\\n\\n// 2. Sanitizar: Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1776,
        272
      ],
      \"id\": \"c34191ba-39a2-41de-9e2f-0204b51c0744\",
      \"name\": \"Sanitizar paso 3\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.content.parts[0].text;\\n\\n// 2. Sanitizar: Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -944,
        272
      ],
      \"id\": \"bd190727-7ab4-42c5-ac23-8e4f68814487\",
      \"name\": \"Sanitizar paso 4\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. OBTENER DATOS DE LOS NODOS SANITIZADOS ---\\nconst dataBacklog = $('Sanitizar paso 3').first().json; \\nconst dataMapping = $('Sanitizar paso 4').first().json;\\n\\n// Extraemos las listas\\nconst backlogOriginal = [...(dataBacklog.backlog_refinado || [])];\\nconst sprints = dataMapping.sprint_mapping || [];\\n\\n// --- 2. CREAR EL \\\"INDICE MAESTRO\\\" DE ORDEN ---\\nconst orderMap = new Map();\\nlet globalIndex = 0;\\n\\nsprints.forEach(sprint => {\\n    const historias = sprint.lista_hus || [];\\n    historias.forEach(hu => {\\n        if (hu.id) {\\n            orderMap.set(hu.id.toString().trim(), globalIndex++);\\n        }\\n    });\\n});\\n\\n// --- 3. REORDENAR EL BACKLOG ---\\nbacklogOriginal.sort((a, b) => {\\n    const idA = (a.id || '').toString().trim();\\n    const idB = (b.id || '').toString().trim();\\n\\n    const indexA = orderMap.has(idA) ? orderMap.get(idA) : Infinity;\\n    const indexB = orderMap.has(idB) ? orderMap.get(idB) : Infinity;\\n\\n    return indexA - indexB;\\n});\\n\\n// --- 4. RESULTADO ---\\nreturn [{\\n    json: {\\n        ...dataBacklog,\\n        backlog_ordenado: backlogOriginal,\\n        debug_info: `Se reordenaron ${backlogOriginal.length} historias.`\\n    }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -720,
        272
      ],
      \"id\": \"4821804a-3bb0-4bc6-a9eb-56abc0d43f66\",
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
              \"value\": \"/Scrum automatización T/Release Planning Version/Release-Planning-Refinament-4.0\"
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
        -64,
        -368
      ],
      \"id\": \"e4fe4470-0d82-4a3f-b32f-b696dcaef09c\",
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
              \"value\": \"/Scrum automatización T/Release Planning Version/Product-Backlog-Refinament-3.0\"
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
        -64,
        16
      ],
      \"id\": \"e8683ce7-e885-4f92-9d03-8a5879f5126d\",
      \"name\": \"6. Guardar borrador product backlog\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.set\",
      \"typeVersion\": 3.4,
      \"position\": [
        384,
        -160
      ],
      \"id\": \"63aad4bf-1800-4427-98d9-0a75294968ed\",
      \"name\": \"Respuesta al Orquestador\"
    },
    {
      \"parameters\": {
        \"mode\": \"combine\",
        \"combineBy\": \"combineByPosition\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3.2,
      \"position\": [
        176,
        -160
      ],
      \"id\": \"51494872-379c-4e74-b1a8-ddc1338f82c2\",
      \"name\": \"Merge\"
    }
  ],
  \"connections\": {
    \"Execute Workflow Trigger\": {
      \"main\": [
        [
          {
            \"node\": \"Configurar Parametros\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Manual Trigger\": {
      \"main\": [
        [
          {
            \"node\": \"Configurar Parametros\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Configurar Parametros\": {
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
    },
    \"5. Guardar borrador product planning\": {
      \"main\": [
        [
          {
            \"node\": \"Merge\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"6. Guardar borrador product backlog\": {
      \"main\": [
        [
          {
            \"node\": \"Merge\",
            \"type\": \"main\",
            \"index\": 1
          }
        ]
      ]
    },
    \"Merge\": {
      \"main\": [
        [
          {
            \"node\": \"Respuesta al Orquestador\",
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

No funciona la respuesta de este flujo despues del merge que hicimos
```

---

### Navegación

[← Prompt 032](/04-orquestacion-productiva/032/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 034 →](/04-orquestacion-productiva/034/)
{% endraw %}
