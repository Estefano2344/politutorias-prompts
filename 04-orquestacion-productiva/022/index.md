---
layout: default
title: '022. Devuelveme el realese planing refactorizado completo { ''nodes'': […'
parent: Orquestación n8n productiva
nav_order: 22
permalink: /04-orquestacion-productiva/022/
---

{% raw %}

# Prompt 022
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 29,332 caracteres &middot; **Posición en la conversación:** 22 de 103

---

```
Devuelveme el realese planing refactorizado completo

{
  \"nodes\": [
    {
      \"parameters\": {},
      \"id\": \"4a8e3cc7-6ccc-412c-9f77-39e9d4050b6c\",
      \"name\": \"Execute Workflow Trigger\",
      \"type\": \"n8n-nodes-base.executeWorkflowTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -2448,
        -240
      ]
    },
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -2448,
        -32
      ],
      \"id\": \"7cad9f7d-6e01-4454-b761-6cfae2fc9f1b\",
      \"name\": \"Manual Trigger\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO DE CONFIGURACIÓN\\n// Define los parámetros del proyecto (Fechas, Sprints, Velocidad)\\n// Si el Agente los envía, los usa. Si no, usa los DEFAULTS de la Tesis.\\n\\nconst input = $input.first().json;\\n\\nreturn {\\n  json: {\\n    // Fechas del Release 1\\n    fecha_inicio: input.fecha_inicio || '2025-12-25',\\n    fecha_fin: input.fecha_fin || '2026-02-19',\\n    \\n    // Configuración Scrum\\n    duracion_sprint: input.duracion_sprint || '2 semanas',\\n    cantidad_sprints: input.cantidad_sprints || 4,\\n    \\n    // Velocidad del Equipo\\n    velocidad_baja: input.velocidad_baja || 31,\\n    velocidad_alta: input.velocidad_alta || 42\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2208,
        -144
      ],
      \"id\": \"f062c202-fcf8-4a2c-b111-1cdcbfd195fe\",
      \"name\": \"Configurar Parametros\"
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/111?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -1968,
        -144
      ],
      \"id\": \"2dafba72-cacc-4e95-b42a-ee4c76f1380a\",
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
        -1744,
        -144
      ],
      \"id\": \"2250c38b-b712-41b1-aee4-10eb9ea56718\",
      \"name\": \"Obtener ejemplo release planning\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1536,
        -144
      ],
      \"id\": \"ab41274c-b0b5-499d-b4af-ae8c70243f79\",
      \"name\": \"Cambiar etiqueta de identificación\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-3-flash-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-3-flash-preview\"
        },
        \"text\": \"=Actúa como un Product Owner.\\n\\n1. CONTEXTO (INPUTS):\\n- Fecha Inicio: {{ $('Configurar Parametros').item.json.fecha_inicio }}\\n- Fecha Fin: {{ $('Configurar Parametros').item.json.fecha_fin }}\\n- Duración Sprint: {{ $('Configurar Parametros').item.json.duracion_sprint }} (solo días laborables. Empiezan los días jueves y terminan los días jueves)\\n- Cantidad de sprints para el release 1: {{ $('Configurar Parametros').item.json.cantidad_sprints }} \\n- Velocidad Baja: {{ $('Configurar Parametros').item.json.velocidad_baja }} SP/Sprint\\n- Velocidad Alta: {{ $('Configurar Parametros').item.json.velocidad_alta }} SP/Sprint\\n\\n2. TAREA (CALCULAR RANGOS):\\nAnaliza la estructura de las secciones \\\"1. Release de fecha fija\\\", \\\"2. Rango de velocidad\\\" y \\\"3. Rango de story points\\\" del PDF adjunto.\\nRealiza los cálculos matemáticos exactos para el nuevo proyecto:\\n- Define las fechas exactas de cada Sprint (Sprint 1, Sprint 2, etc.).\\n- Calcula el Total de Story Points (Rango bajo y alto).\\n\\nResponde ESTRICTAMENTE en JSON:\\n{\\n  \\\"fechas_release\\\": { \\\"inicio\\\": \\\"...\\\", \\\"fin\\\": \\\"...\\\" },\\n  \\\"sprints\\\": [\\n    { \\\"nombre\\\": \\\"Sprint 1\\\", \\\"fechas\\\": \\\"Del X al Y\\\" },\\n    { \\\"nombre\\\": \\\"Sprint 2\\\", \\\"fechas\\\": \\\"...\\\" }\\n  ],\\n  \\\"velocidad\\\": { \\\"baja\\\": , \\\"alta\\\":  },\\n  \\\"rango_total_sp\\\": {\\n     \\\"calculo_bajo\\\": \\\"Cantidad Sprints * Velocidad baja = \\\",\\n     \\\"calculo_alto\\\": \\\"Cantidad Sprints * Velocidad alta = \\\",\\n     \\\"min\\\": ,\\n     \\\"max\\\": \\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -1328,
        -144
      ],
      \"id\": \"300e871d-4d23-4722-b571-10d748efeca6\",
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
        -1104,
        -144
      ],
      \"id\": \"cc370116-919e-43b4-9c6e-9e0686913c62\",
      \"name\": \"Obtener ejemplo release planning1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -896,
        -144
      ],
      \"id\": \"f957682e-207c-4098-bbfe-4fe105581819\",
      \"name\": \"Cambiar etiqueta de identificación1\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-3-flash-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-3-flash-preview\"
        },
        \"text\": \"=Actúa como **Product Owner y Equipo de Desarrollo**.\\n\\n1. INPUT 1: CONTEXTO DEL PRODUCTO (Desde Azure DevOps)\\nAnaliza el documento \\\"Product Planning\\\" actual:\\n>>> {{ $('1. Cargar documento product planning').item.json.content }} <<<\\n\\n2. INPUT 2: GUÍA DE ESTILO Y FORMATO (PDF ADJUNTO)\\nAnaliza el archivo PDF adjunto (\\\"Ejemplo Release Planning\\\").\\nPresta especial atención a la **\\\"Sección 5. Conjunto de MRF\\\"** y a la tabla de priorización. Debes replicar esas columnas y esa lógica de agrupación (Must have, Will have,Might have, Won't have.).\\n\\n3. INPUT 3: RESTRICCIONES TÉCNICAS \\nSe ha calculado el rango de story points que el equipo puede completar durante un release. Usa este dato para no exceder el límite de Story Points:\\n>>> {{ $('2. Calcular fechas del release y el rango de story points').item.json.content.parts[0].text }} <<<\\n\\n4. TAREA (REFINAMIENTO Y PRIORIZACIÓN):\\nBasado en los Epics del Input 1 y respetando el límite del Input 3:\\n1.  **Desglosa** los Epics en Historias de Usuario (HUs) detalladas.\\n2.  **Estima** cada HU en Story Points (Serie Modificada de Fibonacci: 1, 2, 3, 5, 8, 13).\\n* *Nota:* La suma total de SP del will have debe ser <= que rango bajo SP del release. Mientras que el suma total de SP del Might have debe ser <= que el rango alto de SP del release. Todo lo que supere el ranto alto es el won't have\\n3.  **Aplica MoSCoW:** Clasifica cada historia en \\\"Must have\\\", \\\"Will have\\\", \\\"Might have\\\" o \\\"Won't have\\\".\\n4.  **Define MRF:** Las historias \\\"Must have\\\" conforman el \\\"Must-Release Features\\\".\\n5.  **Objetivo:** Redacta el \\\"Objetivo del Release\\\" basado en las Features seleccionadas.\\n\\nResponde ESTRICTAMENTE en formato JSON con esta estructura:\\n{\\n  \\\"objetivo_release\\\": \\\"Resumen del objetivo...\\\",\\n  \\\"backlog_refinado\\\": [\\n    { \\n      \\\"id\\\": \\\"HU01\\\", \\n      \\\"titulo\\\": \\\"Nombre corto de la historia\\\", \\n      \\\"estimacion\\\": 13, \\n      \\\"moscow\\\": \\\"Must have\\\" \\n    },\\n    { \\n      \\\"id\\\": \\\"HU02\\\", \\n      \\\"titulo\\\": \\\"Otra historia...\\\", \\n      \\\"estimacion\\\": 8, \\n      \\\"moscow\\\": \\\"Should have\\\" \\n    }\\n    // Genera suficientes historias para llenar la capacidad del equipo\\n  ],\\n  \\\"analisis_mrf\\\": {\\n    \\\"total_sp_estimado\\\": 0, // Suma total de todas las HUs\\n    \\\"total_sp_mrf\\\": 0,      // Suma solo de las 'Must have'\\n    \\\"porcentaje_mrf\\\": \\\"0%\\\"  // Cálculo (MRF / Total) * 100\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -688,
        -144
      ],
      \"id\": \"28e7179c-22ee-44d4-a03a-a2a7b6c9a2bb\",
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
        -464,
        -144
      ],
      \"id\": \"9962bbbc-d879-46db-ac37-ee068a2f5900\",
      \"name\": \"Obtener ejemplo release planning2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -240,
        -144
      ],
      \"id\": \"985fb321-28ed-4256-9436-72eaee00dbfe\",
      \"name\": \"Cambiar etiqueta de identificación2\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-3-flash-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-3-flash-preview\"
        },
        \"text\": \"=Actúa como el **Equipo Scrum**.\\n\\n1. INPUT 1: BACKLOG PRIORIZADO (HUs y MoSCoW)\\n>>> {{ $('3. Refinar PB, seleccionar MRF y priorizar PB').item.json.content.parts[0].text }} <<<\\n\\n2. INPUT 2: ESTRUCTURA DE SPRINTS (Fechas del SM)\\n>>> {{ $('2. Calcular fechas del release y el rango de story points').item.json.content.parts[0].text }} <<<\\n\\n3. INPUT 3: ESTILO VISUAL (PDF ADJUNTO)\\nAnaliza la **\\\"Sección 6. Sprint mapping\\\"** del PDF adjunto.\\nFormato visual requerido:\\n- Arriba: Lista limpia con el Objetivo Comercial.\\n- Abajo: Tabla detallada por Sprint.\\n\\n4. TAREA (MAPPING ESTRATÉGICO CON PRIORIZACIÓN ESTRICTA):\\nTu misión es distribuir las Historias de Usuario (HUs) en los 4 sprints para asegurar que el MVP (Minimum Viable Product) se entregue lo antes posible.\\n\\nREGLAS DE ORO PARA LA DISTRIBUCIÓN:\\n1. **Prioridad Absoluta al MRF (Must Have):** El **Sprint 1** y el **Sprint 2** deben estar ocupados casi exclusivamente por historias etiquetadas como **\\\"Must Have\\\"**.\\n2. **Prohibición de Relleno:** NO incluyas historias \\\"Will Have\\\" o \\\"Might Have\\\" en los primeros sprints a menos que sean un prerequisito técnico indispensable para un \\\"Must Have\\\".\\n3. **Cascada de Valor:**\\n   - Sprint 1 y 2: Núcleo Crítico (Must Have).\\n   - Sprint 3: Funcionalidades Importantes (Will Have).\\n   - Sprint 4: Deseables y Cierre (Might Have).\\n4. **Objetivo Comercial:** Define qué logra el negocio al final de cada sprint (Ej: \\\"Validar el núcleo transaccional\\\").\\n\\nResponde ESTRICTAMENTE en JSON con este formato:\\n{\\n  \\\"sprint_mapping\\\": [\\n    {\\n      \\\"sprint_name\\\": \\\"Sprint 1\\\",\\n      \\\"objetivo_comercial\\\": \\\"Texto del objetivo comercial (Ej: Habilitar registro para validar adquisición).\\\",\\n      \\\"lista_hus\\\": [\\n        { \\\"id\\\": \\\"HU01\\\", \\\"titulo\\\": \\\"Ofrecer un producto\\\" },\\n        { \\\"id\\\": \\\"HU02\\\", \\\"titulo\\\": \\\"Ver mis productos\\\" }\\n      ]\\n    },\\n    {\\n      \\\"sprint_name\\\": \\\"Sprint 2\\\",\\n      \\\"objetivo_comercial\\\": \\\"...\\\",\\n      \\\"lista_hus\\\": [\\n         { \\\"id\\\": \\\"HU03\\\", \\\"titulo\\\": \\\"...\\\" }\\n      ]\\n    }\\n  ]\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -16,
        -144
      ],
      \"id\": \"3ca55229-b1f7-457d-ba74-42a69b0df069\",
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
        \"jsCode\": \"// --- 1. FUNCIÓN HELPER ---\\nconst getJson = (nombreNodo) => {\\n    try {\\n        const node = $(nombreNodo).first();\\n        if (!node) return {};\\n        let text = node.json.content?.parts?.[0]?.text || node.json.candidates?.[0]?.content?.parts?.[0]?.text || node.json.text || \\\"\\\";\\n        return JSON.parse(text.replace(/```json|```/g, '').trim());\\n    } catch (e) { return {}; }\\n};\\n\\n// --- 2. OBTENER DATOS ---\\nconst smData = getJson('2. Calcular fechas del release y el rango de story points'); \\nconst poData = getJson('3. Refinar PB, seleccionar MRF y priorizar PB');\\nconst mapData = getJson('4. Crear el sprint mapping');\\n\\n// --- 3. PROCESAMIENTO: ORDENAR BACKLOG POR SPRINT ---\\n\\n// A. Mapa de Sprint: { \\\"HU01\\\": 1, \\\"HU05\\\": 2 }\\nconst huSprintMap = {};\\nif (mapData.sprint_mapping) {\\n    mapData.sprint_mapping.forEach((sprint, index) => {\\n        const numeroSprint = index + 1;\\n        const lista = sprint.lista_hus || sprint.lista_hus_id || [];\\n        \\n        lista.forEach(item => {\\n            const id = (typeof item === 'object') ? item.id : item;\\n            huSprintMap[id] = numeroSprint;\\n        });\\n    });\\n}\\n\\n// B. Asignar Sprint al Backlog\\nconst backlog = poData.backlog_refinado || [];\\nbacklog.forEach(item => {\\n    item.sprintAsignado = huSprintMap[item.id] || 99; // 99 si no tiene sprint\\n});\\n\\n// C. Orden Prioridad MoSCoW\\nconst ordenPrioridad = { \\n    \\\"must have\\\": 1, \\\"will have\\\": 2, \\\"should have\\\": 2, \\n    \\\"might have\\\": 3, \\\"could have\\\": 3, \\\"won't have\\\": 4 \\n};\\n\\n// D. ORDENAMIENTO (Sprint Ascendente -> Prioridad Ascendente)\\nbacklog.sort((a, b) => {\\n    // 1. Ordena cronológicamente por Sprint\\n    if (a.sprintAsignado !== b.sprintAsignado) {\\n        return a.sprintAsignado - b.sprintAsignado;\\n    }\\n    // 2. Ordena por importancia dentro del mismo Sprint\\n    const pA = ordenPrioridad[a.moscow?.toLowerCase()] || 9;\\n    const pB = ordenPrioridad[b.moscow?.toLowerCase()] || 9;\\n    return pA - pB;\\n});\\n\\n\\n// --- 4. CONSTRUIR MARKDOWN ---\\nlet md = `# Release Planning - Release 1 - V1.0\\\\n\\\\n`;\\n\\n// === SECCIONES 1-4 ===\\nmd += `## 1. Release de fecha fija\\\\n`;\\nmd += `* **Fecha inicio:** ${smData.fechas_release?.inicio || \\\"Pendiente\\\"}\\\\n`;\\nmd += `* **Fecha fin:** ${smData.fechas_release?.fin || \\\"Pendiente\\\"}\\\\n`;\\nif (smData.sprints) smData.sprints.forEach(s => md += `* **${s.nombre}:** ${s.fechas}\\\\n`);\\n\\nmd += `\\\\n## 2. Rango de velocidad\\\\n`;\\nmd += `* Alta: ${smData.velocidad?.alta || 0} SP | Baja: ${smData.velocidad?.baja || 0} SP\\\\n`;\\n\\nmd += `\\\\n## 3. Objetivo del Release\\\\n${poData.objetivo_release || \\\"Pendiente\\\"}\\\\n`;\\n\\n// === SECCIÓN 5: MRF (ORDENADA PERO SIN COLUMNA SPRINT) ===\\nmd += `\\\\n## 4. Conjunto de MRF\\\\n`;\\n// Se eliminó la columna \\\"Sprint\\\" del encabezado\\nmd += `| Prioridad | ID | Título | SP |\\\\n|---|---|---|---|\\\\n`;\\n\\nbacklog.forEach(i => {\\n    // Se eliminó la variable ${sprintLabel} de la fila\\n    md += `| **${i.moscow}** | ${i.id} | ${i.titulo} | ${i.estimacion} |\\\\n`;\\n});\\n\\n\\n// === SECCIÓN 6: SPRINT MAPPING ===\\nmd += `\\\\n## 6. Sprint mapping\\\\n`;\\n\\nif (mapData.sprint_mapping) {\\n    // Lista Narrativa\\n    mapData.sprint_mapping.forEach(m => {\\n        md += `* **${m.sprint_name}:** ${m.objetivo_comercial || m.contenido_narrativo}\\\\n`;\\n    });\\n    md += `\\\\n`; \\n\\n    // Tabla Detallada\\n    md += `| Sprint | ID | Título | Estimación (SP) |\\\\n|---|---|---|---|\\\\n`;\\n\\n    const diccSP = {};\\n    backlog.forEach(b => diccSP[b.id] = b.estimacion);\\n\\n    mapData.sprint_mapping.forEach(m => {\\n        const hus = m.lista_hus || []; \\n        hus.forEach((hu, index) => {\\n            const sp = diccSP[hu.id] || \\\"-\\\";\\n            const celdaSprint = (index === 0) ? `**${m.sprint_name}**` : \\\"\\\";\\n            md += `| ${celdaSprint} | ${hu.id} | ${hu.titulo} | ${sp} |\\\\n`;\\n        });\\n    });\\n} else {\\n    md += \\\"_No se generó información de Sprint Mapping._\\\\n\\\";\\n}\\n\\n// --- RETORNO ---\\nreturn {\\n    json: {\\n        wiki_content: md,\\n        page_title: \\\"Release Planning - Release 1 - V1.0\\\"\\n    },\\n    binary: {\\n        data: {\\n            data: Buffer.from(md).toString('base64'),\\n            mimeType: 'text/markdown',\\n            fileName: \\\"Release Planning.md\\\",\\n            fileExtension: 'md'\\n        }\\n    }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        192,
        -256
      ],
      \"id\": \"8c94b812-5d03-4116-8304-e025e64683fb\",
      \"name\": \"Generar documento markdown\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN HELPER ---\\nconst getJson = (nombreNodo) => {\\n    try {\\n        const node = $(nombreNodo).first();\\n        if (!node) return {};\\n        let text = node.json.content?.parts?.[0]?.text || node.json.candidates?.[0]?.content?.parts?.[0]?.text || node.json.text || \\\"\\\";\\n        return JSON.parse(text.replace(/```json|```/g, '').trim());\\n    } catch (e) { return {}; }\\n};\\n\\n// --- 2. OBTENER DATOS ---\\nconst mapData = getJson('4. Crear el sprint mapping');                 // Tiene el ORDEN\\nconst poData = getJson('3. Refinar PB, seleccionar MRF y priorizar PB'); // Tiene los PUNTOS (SP)\\n\\n// --- 3. CREAR DICCIONARIO DE PUNTOS (Solo para rellenar la columna SP) ---\\nconst spMap = {};\\n(poData.backlog_refinado || []).forEach(item => {\\n    spMap[item.id] = item.estimacion;\\n});\\n\\n// --- 4. CONSTRUIR MARKDOWN (SOLO 3 COLUMNAS) ---\\n// Título del archivo\\nlet md = `# Product Backlog Maestro (V1.0)\\\\n\\\\n`;\\nmd += `> Backlog ordenado por prioridad de ejecución (Sprint 1 -> Sprint 4).\\\\n\\\\n`;\\n\\n// Encabezado de la tabla (ID | Título | SP)\\nmd += `| ID | Título | SP |\\\\n`;\\nmd += `|---|---|---|\\\\n`;\\n\\nif (mapData.sprint_mapping) {\\n    // Recorremos los sprints en el orden que vienen en el JSON (1, 2, 3...)\\n    mapData.sprint_mapping.forEach(sprint => {\\n        const lista = sprint.lista_hus || [];\\n\\n        // Recorremos las HUs de ese sprint\\n        lista.forEach(hu => {\\n            // Buscamos el SP en el diccionario (o ponemos \\\"-\\\" si no existe)\\n            const sp = spMap[hu.id] || \\\"-\\\";\\n            \\n            // Escribimos la fila limpia\\n            md += `| ${hu.id} | ${hu.titulo} | ${sp} |\\\\n`;\\n        });\\n    });\\n}\\n\\n// --- 5. RETORNO ---\\nreturn {\\n    json: {\\n        wiki_content: md,\\n        page_title: \\\"Product Backlog Master\\\"\\n    }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        192,
        48
      ],
      \"id\": \"e41058a3-6a53-4790-a02a-a5101fa0151f\",
      \"name\": \"Generar documento markdown1\"
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Release-Planning-V1.0&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendBody\": true,
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.wiki_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        416,
        -256
      ],
      \"id\": \"3c383634-4ef4-4a9b-a0ca-97eeae96b476\",
      \"name\": \"6. Guardar borrador product planning\",
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
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Product-Backlog-V1.0&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendBody\": true,
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.wiki_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        416,
        48
      ],
      \"id\": \"321d4896-d0dd-4ec5-b88e-35b2bc2ba9e2\",
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
        \"mode\": \"wait\"
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3,
      \"position\": [
        640,
        -144
      ],
      \"id\": \"fe66f1b7-5300-4942-a753-4eb477c883e2\",
      \"name\": \"Merge Final\"
    },
    {
      \"parameters\": {
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.set\",
      \"typeVersion\": 3.4,
      \"position\": [
        864,
        -144
      ],
      \"id\": \"ce14daa5-6d14-46ba-b781-e9495a81a929\",
      \"name\": \"Respuesta al Orquestador\"
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
            \"node\": \"Obtener ejemplo release planning1\",
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
    \"3. Refinar PB, seleccionar MRF y priorizar PB\": {
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
    \"4. Crear el sprint mapping\": {
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
    \"Generar documento markdown\": {
      \"main\": [
        [
          {
            \"node\": \"6. Guardar borrador product planning\",
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
    \"6. Guardar borrador product planning\": {
      \"main\": [
        [
          {
            \"node\": \"Merge Final\",
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
            \"node\": \"Merge Final\",
            \"type\": \"main\",
            \"index\": 1
          }
        ]
      ]
    },
    \"Merge Final\": {
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
```

---

### Navegación

[← Prompt 021](/04-orquestacion-productiva/021/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 023 →](/04-orquestacion-productiva/023/)
{% endraw %}
