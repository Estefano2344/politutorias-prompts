---
layout: default
title: '005. Ahora con este: { ''name'': ''Release Planning (Before Discovery)'',…'
parent: Orquestación n8n productiva
nav_order: 5
permalink: /04-orquestacion-productiva/005/
---

{% raw %}

# Prompt 005
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 26,442 caracteres &middot; **Posición en la conversación:** 5 de 103

---

```
Ahora con este:



{
  \"name\": \"Release Planning (Before Discovery)\",
  \"nodes\": [
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
        -512,
        -128
      ],
      \"id\": \"cec68b2f-963b-44dc-966e-28120384614f\",
      \"name\": \"1. Cargar documento product planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"2glS9mPeOxQS206h\",
          \"name\": \"Unnamed credential\"
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
        -272,
        -128
      ],
      \"id\": \"30173a99-082c-400d-8859-c9a6a994d40c\",
      \"name\": \"Obtener ejemplo release planning\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -64,
        -128
      ],
      \"id\": \"fc11a7ea-e60c-4409-b798-51315304a2e5\",
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
        \"text\": \"=Actúa como un Product Owner.\\n\\n1. CONTEXTO (INPUTS):\\n- Fecha Inicio: 25 de diciembre 2025\\n- Fecha Fin: 19 de febrero 2025\\n- Duración Sprint: 2 semanas (solo días laborables. Empiezan los días jueves y terminan los días jueves)\\n- Cantidad de sprints para el release 1: 4 \\n- Velocidad Baja: 31 SP/Sprint\\n- Velocidad Alta: 42 SP/Sprint\\n\\n2. TAREA (CALCULAR RANGOS):\\nAnaliza la estructura de las secciones \\\"1. Release de fecha fija\\\", \\\"2. Rango de velocidad\\\" y \\\"3. Rango de story points\\\" del PDF adjunto.\\nRealiza los cálculos matemáticos exactos para el nuevo proyecto:\\n- Define las fechas exactas de cada Sprint (Sprint 1, Sprint 2, etc.).\\n- Calcula el Total de Story Points (Rango bajo y alto).\\n\\nResponde ESTRICTAMENTE en JSON:\\n{\\n  \\\"fechas_release\\\": { \\\"inicio\\\": \\\"...\\\", \\\"fin\\\": \\\"...\\\" },\\n  \\\"sprints\\\": [\\n    { \\\"nombre\\\": \\\"Sprint 1\\\", \\\"fechas\\\": \\\"Del X al Y\\\" },\\n    { \\\"nombre\\\": \\\"Sprint 2\\\", \\\"fechas\\\": \\\"...\\\" }\\n  ],\\n  \\\"velocidad\\\": { \\\"baja\\\": , \\\"alta\\\":  },\\n  \\\"rango_total_sp\\\": {\\n     \\\"calculo_bajo\\\": \\\"Cantidad Sprints * Velocidad baja = \\\",\\n     \\\"calculo_alto\\\": \\\"Cantidad Sprints * Velocidad alta = \\\",\\n     \\\"min\\\": ,\\n     \\\"max\\\": \\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        176,
        -128
      ],
      \"id\": \"de0fe0df-87af-4b6e-9952-530c4d66f44a\",
      \"name\": \"2. Calcular fechas del release y el rango de story points\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"gDkYzkArCQuZNWo4\",
          \"name\": \"Google Gemini(PaLM) Api account\"
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
        400,
        -128
      ],
      \"id\": \"c57b4dd5-5f9d-4069-b3bd-6a8f70d20c79\",
      \"name\": \"Obtener ejemplo release planning1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        592,
        -128
      ],
      \"id\": \"bfc8027d-068c-440b-9a46-f1e5393abe57\",
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
        1008,
        -128
      ],
      \"id\": \"c6349023-7c4d-4e46-a87f-e6866f7537c9\",
      \"name\": \"Obtener ejemplo release planning2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1200,
        -128
      ],
      \"id\": \"d77008fc-bc01-48b8-9cbe-ca594d3535c3\",
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
        \"text\": \"=Actúa como **Product Owner y Equipo de Desarrollo**.\\n\\n1. INPUT 1: CONTEXTO DEL PRODUCTO (Desde Azure DevOps)\\nAnaliza el documento \\\"Product Planning\\\" actual:\\n>>> {{ $('1. Cargar documento product planning').item.json.content }} <<<\\n\\n2. INPUT 2: GUÍA DE ESTILO Y FORMATO (PDF ADJUNTO)\\nAnaliza el archivo PDF adjunto (\\\"Ejemplo Release Planning\\\").\\nPresta especial atención a la **\\\"Sección 5. Conjunto de MRF\\\"** y a la tabla de priorización. Debes replicar esas columnas y esa lógica de agrupación (Must have, Will have,Might have, Won't have.).\\n\\n3. INPUT 3: RESTRICCIONES TÉCNICAS \\nSe ha calculado el rango de story points que el equipo puede completar durante un release. Usa este dato para no exceder el límite de Story Points:\\n>>> {{ $('2. Calcular fechas del release y el rango de story points').item.json.content.parts[0].text }} <<<\\n\\n4. TAREA (REFINAMIENTO Y PRIORIZACIÓN):\\nBasado en los Epics del Input 1 y respetando el límite del Input 3:\\n1.  **Desglosa** los Epics en Historias de Usuario (HUs) detalladas.\\n2.  **Estima** cada HU en Story Points (Serie Modificada de Fibonacci: 1, 2, 3, 5, 8, 13).\\n* *Nota:* La suma total de SP del will have debe ser <= que rango bajo SP del release. Mientras que el suma total de SP del Might have debe ser <= que el rango alto de SP del release. Todo lo que supere el ranto alto es el won't have\\n3.  **Aplica MoSCoW:** Clasifica cada historia en \\\"Must have\\\", \\\"Will have\\\", \\\"Might have\\\" o \\\"Won't have\\\".\\n4.  **Define MRF:** Las historias \\\"Must have\\\" conforman el \\\"Must-Release Features\\\".\\n5.  **Objetivo:** Redacta el \\\"Objetivo del Release\\\" basado en las Features seleccionadas.\\n\\nResponde ESTRICTAMENTE en formato JSON con esta estructura:\\n{\\n  \\\"objetivo_release\\\": \\\"Resumen del objetivo...\\\",\\n  \\\"backlog_refinado\\\": [\\n    { \\n      \\\"id\\\": \\\"HU01\\\", \\n      \\\"titulo\\\": \\\"Nombre corto de la historia\\\", \\n      \\\"estimacion\\\": 13, \\n      \\\"moscow\\\": \\\"Must have\\\" \\n    },\\n    { \\n      \\\"id\\\": \\\"HU02\\\", \\n      \\\"titulo\\\": \\\"Otra historia...\\\", \\n      \\\"estimacion\\\": 8, \\n      \\\"moscow\\\": \\\"Should have\\\" \\n    }\\n    // Genera suficientes historias para llenar la capacidad del equipo\\n  ],\\n  \\\"analisis_mrf\\\": {\\n    \\\"total_sp_estimado\\\": 0, // Suma total de todas las HUs\\n    \\\"total_sp_mrf\\\": 0,      // Suma solo de las 'Must have'\\n    \\\"porcentaje_mrf\\\": \\\"0%\\\"  // Cálculo (MRF / Total) * 100\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        800,
        -128
      ],
      \"id\": \"3d9bd18b-4002-4f50-8bfe-0696e34b80c7\",
      \"name\": \"3. Refinar PB, seleccionar MRF y priorizar PB\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"gDkYzkArCQuZNWo4\",
          \"name\": \"Google Gemini(PaLM) Api account\"
        }
      }
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
        1440,
        -128
      ],
      \"id\": \"604da77e-9755-4b11-b91a-f55f81698b0b\",
      \"name\": \"4. Crear el sprint mapping\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"gDkYzkArCQuZNWo4\",
          \"name\": \"Google Gemini(PaLM) Api account\"
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
        1632,
        -304
      ],
      \"id\": \"08d4a541-0a87-4138-aea6-e6750569c17b\",
      \"name\": \"Generar documento markdown\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN HELPER ---\\nconst getJson = (nombreNodo) => {\\n    try {\\n        const node = $(nombreNodo).first();\\n        if (!node) return {};\\n        let text = node.json.content?.parts?.[0]?.text || node.json.candidates?.[0]?.content?.parts?.[0]?.text || node.json.text || \\\"\\\";\\n        return JSON.parse(text.replace(/```json|```/g, '').trim());\\n    } catch (e) { return {}; }\\n};\\n\\n// --- 2. OBTENER DATOS ---\\nconst mapData = getJson('4. Crear el sprint mapping');                 // Tiene el ORDEN\\nconst poData = getJson('3. Refinar PB, seleccionar MRF y priorizar PB'); // Tiene los PUNTOS (SP)\\n\\n// --- 3. CREAR DICCIONARIO DE PUNTOS (Solo para rellenar la columna SP) ---\\nconst spMap = {};\\n(poData.backlog_refinado || []).forEach(item => {\\n    spMap[item.id] = item.estimacion;\\n});\\n\\n// --- 4. CONSTRUIR MARKDOWN (SOLO 3 COLUMNAS) ---\\n// Título del archivo\\nlet md = `# Product Backlog Maestro (V1.0)\\\\n\\\\n`;\\nmd += `> Backlog ordenado por prioridad de ejecución (Sprint 1 -> Sprint 4).\\\\n\\\\n`;\\n\\n// Encabezado de la tabla (ID | Título | SP)\\nmd += `| ID | Título | SP |\\\\n`;\\nmd += `|---|---|---|\\\\n`;\\n\\nif (mapData.sprint_mapping) {\\n    // Recorremos los sprints en el orden que vienen en el JSON (1, 2, 3...)\\n    mapData.sprint_mapping.forEach(sprint => {\\n        const lista = sprint.lista_hus || [];\\n\\n        // Recorremos las HUs de ese sprint\\n        lista.forEach(hu => {\\n            // Buscamos el SP en el diccionario (o ponemos \\\"-\\\" si no existe)\\n            const sp = spMap[hu.id] || \\\"-\\\";\\n            \\n            // Escribimos la fila limpia\\n            md += `| ${hu.id} | ${hu.titulo} | ${sp} |\\\\n`;\\n        });\\n    });\\n}\\n\\n// --- 5. RETORNO ---\\nreturn {\\n    json: {\\n        wiki_content: md,\\n        page_title: \\\"Product Backlog Master\\\"\\n    }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1664,
        32
      ],
      \"id\": \"22d89390-add6-4105-956b-0836d61b7784\",
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
        1872,
        -304
      ],
      \"id\": \"93e7aee3-e7c0-45ed-94a7-f5084967adac\",
      \"name\": \"6. Guardar borrador product planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"2glS9mPeOxQS206h\",
          \"name\": \"Unnamed credential\"
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
        1872,
        32
      ],
      \"id\": \"1551e62a-f6a4-41dd-b699-92da53aad9c7\",
      \"name\": \"6. Guardar borrador product backlog\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"2glS9mPeOxQS206h\",
          \"name\": \"Unnamed credential\"
        }
      }
    },
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -720,
        -128
      ],
      \"id\": \"a5dbd42f-8c25-42fb-94bf-69663019688d\",
      \"name\": \"When clicking ‘Execute workflow’\"
    }
  ],
  \"pinData\": {},
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
            \"node\": \"Obtener ejemplo release planning2\",
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
    }
  },
  \"active\": false,
  \"settings\": {
    \"executionOrder\": \"v1\"
  },
  \"versionId\": \"0dcad41b-580f-4250-8067-45f3b7071655\",
  \"meta\": {
    \"templateCredsSetupCompleted\": true,
    \"instanceId\": \"deeb413f1c292c6c5c5d22cd010da5a710f0fa1cd12c1cd1bcb7dbd8da7a6ea8\"
  },
  \"id\": \"mppmEqZRgWl8qaWo\",
  \"tags\": []
}
```

---

### Navegación

[← Prompt 004](/04-orquestacion-productiva/004/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 006 →](/04-orquestacion-productiva/006/)
{% endraw %}
