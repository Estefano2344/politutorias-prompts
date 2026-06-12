---
layout: default
title: '076. Vamos con la edicion quirurjica de este flujo actualizado: 8. Spr…'
parent: Orquestación n8n productiva
nav_order: 76
permalink: /04-orquestacion-productiva/076/
---

{% raw %}

# Prompt 076
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 20,108 caracteres &middot; **Posición en la conversación:** 76 de 103

---

```
Vamos con la edicion quirurjica de este flujo actualizado: 8. Sprint Planning (Refinament Part 1)

{
  \"nodes\": [
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/430?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -944,
        -112
      ],
      \"id\": \"78811a02-e8f2-4ae8-8b8d-369761cc2941\",
      \"name\": \"1. Cargar el documento release planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/432?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -944,
        160
      ],
      \"id\": \"a9e4c888-5dcd-4850-bc6f-6c7f3f6b358f\",
      \"name\": \"2. Cargar el documento product backlog (Refinado, estimado y priorizado)\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"// ============================================================\\n// 1. INPUT MANUAL (Datos de tu equipo según el PDF)\\n// ============================================================\\nconst equipo = [\\n  { nombre: \\\"David\\\",     dias_disponibles: 11, dias_scrum: 7, horas_min: 2, horas_max: 3 },\\n  { nombre: \\\"Emilio\\\",    dias_disponibles: 11, dias_scrum: 4, horas_min: 2, horas_max: 3 },\\n  { nombre: \\\"José\\\",      dias_disponibles: 11, dias_scrum: 4, horas_min: 2, horas_max: 3 },\\n];\\n\\n// ============================================================\\n// 2. CÁLCULO ESTRICTO (Fórmula: (11 - Scrum) * Horas)\\n// ============================================================\\nlet granTotalMin = 0;\\nlet granTotalMax = 0;\\n\\nconst equipoFormateado = equipo.map(m => {\\n  // PASO A: Calcular días netos para desarrollo\\n  const diasNetos = Math.max(0, m.dias_disponibles - m.dias_scrum);\\n  \\n  // PASO B: Calcular rango de horas (Low - High)\\n  const esfuerzoMin = diasNetos * m.horas_min;\\n  const esfuerzoMax = diasNetos * m.horas_max;\\n\\n  // Acumular totales del equipo\\n  granTotalMin += esfuerzoMin;\\n  granTotalMax += esfuerzoMax;\\n\\n  // PASO C: Retornar objeto listo para la tabla del PDF\\n  return {\\n    persona: m.nombre,\\n    columna_dias_disponibles: m.dias_disponibles,\\n    columna_dias_scrum: m.dias_scrum,\\n    columna_horas_dia: `${m.horas_min} a ${m.horas_max}`,\\n    columna_esfuerzo: `${esfuerzoMin} a ${esfuerzoMax}`\\n  };\\n});\\n\\n// ============================================================\\n// 3. RETORNO (ARREGLO DE OBJETOS)\\n// ============================================================\\nreturn [\\n  {\\n    json: {\\n      tabla_capacidad: equipoFormateado,\\n      resumen_total: {\\n        rango_total_texto: `${granTotalMin} a ${granTotalMax}`,\\n        min_horas: granTotalMin,\\n        max_horas: granTotalMax\\n      }\\n    }\\n  }\\n];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -304,
        32
      ],
      \"id\": \"3b57a6ee-2d80-413c-b3d0-f7f73097a77b\",
      \"name\": \"3. Calcular la capacidad del equipo\"
    },
    {
      \"parameters\": {
        \"method\": \"POST\",
        \"url\": \"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent\",
        \"sendQuery\": true,
        \"queryParameters\": {
          \"parameters\": [
            {
              \"name\": \"key\",
              \"value\": \"<REDACTADO>\"
            }
          ]
        },
        \"sendHeaders\": true,
        \"headerParameters\": {
          \"parameters\": [
            {
              \"name\": \"Content-Type\",
              \"value\": \"application/json\"
            }
          ]
        },
        \"sendBody\": true,
        \"specifyBody\": \"json\",
        \"jsonBody\": \"={{\\n(() => {\\n  // 1. OBTENER DATOS DEL NODO SANITIZADOR\\n  const docs = $('Sanitizar archivos').first().json;\\n  \\n  // 2. EXTRAER VELOCIDAD HISTÓRICA (SP) DEL TEXTO DEL RELEASE PLANNING\\n  // Buscamos patrones como \\\"**Velocidad Baja:** 31\\\" y \\\"**Velocidad Alta:** 42\\\"\\n  const releaseText = docs.contexto_release_planning || \\\"\\\";\\n  const lowVelMatch = releaseText.match(/Velocidad Baja:\\\\*\\\\*\\\\s*(\\\\d+)/i);\\n  const highVelMatch = releaseText.match(/Velocidad Alta:\\\\*\\\\*\\\\s*(\\\\d+)/i);\\n  \\n  // Si encontramos los valores en el texto, los usamos. Si no, ponemos un texto por defecto.\\n  let velocityInfo = \\\"Información no disponible en el texto\\\";\\n  if (lowVelMatch && highVelMatch) {\\n    velocityInfo = `${lowVelMatch[1]} a ${highVelMatch[1]} Story Points`;\\n  }\\n\\n  // 3. CONSTRUIR EL PROMPT\\n  const promptText = `\\nObjetivo: Necesito tu ayuda para:\\n1. Refinar el objetivo del sprint mapping para el sprint 1\\n2. Seleccionar las HUs alineadas a este objetivo comercial refinado\\n\\nRol: Eres un Product Owner que tiene en experiencia redactando objetivos comerciales (Nivel Abstracción negocio) y seleccionando HUs de manera estratégica.\\n\\nContexto: Lee el Release Planning para tener contexto del Producto (””” ${docs.contexto_release_planning || \\\"N/A\\\"} ”””). \\n\\nSoy un Product Owner Proxy que va a guiar la construcción del nuevo producto PoliTutorías y estoy enfocándome en planificar el primer sprint del release 1. Con este rol solo estoy encargado de redactar el objetivo comercial y seleccionar las HUs alineadas a dicho objetivo, yo no tengo que redactar criterios de aceptación ni tampoco tareas de implementación. \\n\\nEl product backlog actual es: “““ ${docs.contexto_product_backlog || \\\"N/A\\\"} ””” \\ny mi equipo tiene una velocidad histórica de “”” ${velocityInfo} ”””.\\n\\nAcción:\\n1. Refinar el objetivo comercial para el primer sprint (Sprint 1). Recuerda que el objetivo comercial es concreto y conciso y no supera las 15 palabras. Sirve para indicar qué gana el negocio con el sprint\\n2. Seleccionar las HUs que se alineen estratégicamente con el objetivo comercial del primer sprint.\\n\\nFormato:\\nResponde ÚNICAMENTE con este objeto JSON válido:\\n{\\n  \\\"sprint_goal\\\": \\\"Objetivo del sprint refinado...\\\",\\n  \\\"sprint_backlog_seleccionado\\\": [\\n    {\\n      \\\"id\\\": \\\"HUxx\\\",\\n      \\\"titulo\\\": \\\"Título de la HU\\\",\\n      \\\"estimacion_sp\\\": \\\"13 SP\\\",\\n      \\\"historia_usuario_texto\\\": \\\"Como [rol], quiero [acción], para [beneficio].\\\"\\n    },\\n    { \\\"id\\\": \\\"HUyy\\\", \\\"titulo\\\": \\\"...\\\", \\\"estimacion_sp\\\": \\\"...\\\", \\\"historia_usuario_texto\\\": \\\"...\\\" }\\n  ]\\n}\\n`;\\n\\n  // 4. RETORNAR PAYLOAD PARA GEMINI\\n  return {\\n    contents: [\\n      {\\n        parts: [\\n          { text: promptText }\\n        ]\\n      }\\n    ]\\n  };\\n})()\\n}}\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -80,
        32
      ],
      \"id\": \"1b572e6f-0b3d-4f68-b349-3c5ee9380121\",
      \"name\": \"4. Refinar el objetivo del sprint y seleccionar las HUs\",
      \"retryOnFail\": false,
      \"waitBetweenTries\": 5000,
      \"notesInFlow\": false
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN SEGURA PARA OBTENER DATOS ---\\nconst getData = (nodeName) => {\\n  try {\\n    const item = $(nodeName).first();\\n    if (!item) return {};\\n    // Si es output crudo de Gemini, intentamos limpiarlo si fuera necesario\\n    if (item.json.candidates) return {}; \\n    return item.json;\\n  } catch (error) {\\n    return {};\\n  }\\n};\\n\\n// --- 2. RECUPERAR DATOS DE LOS NODOS ---\\nconst dataCapacidad = getData('3. Calcular la capacidad del equipo');\\nconst dataSprint = getData('Sanitizar paso 4');\\n\\n// Desestructuración segura\\nconst tablaCapacidad = dataCapacidad.tabla_capacidad || [];\\nconst resumenCapacidad = dataCapacidad.resumen_total || {};\\nconst sprintGoal = dataSprint.sprint_goal || \\\"No definido\\\";\\nconst sprintBacklog = dataSprint.sprint_backlog_seleccionado || [];\\n\\n// Función para limpiar texto\\nconst clean = (text) => (text || '').toString().replace(/(\\\\r\\\\n|\\\\n|\\\\r)/gm, ' ').trim();\\n// Fecha actual\\nconst currentDate = new Date().toLocaleDateString('es-ES');\\n\\n// --- 3. CONSTRUCCIÓN DEL MARKDOWN ---\\n\\nlet md = `# Sprint Planning - Sprint 1 - Overview\\\\n\\\\n`;\\nmd += `**Generado automáticamente:** Borrador Actualizado\\\\n`;\\nmd += `**Fecha:** ${currentDate}\\\\n`;\\nmd += `**Proyecto:** PoliTutorías - Escuela Politécnica Nacional\\\\n\\\\n`;\\n\\n// SECCIÓN 1: SPRINT GOAL\\nmd += `## 1. Sprint Goal\\\\n`;\\nmd += `${sprintGoal}\\\\n\\\\n`;\\n\\n// SECCIÓN 2: CAPACIDAD DEL EQUIPO\\nmd += `## 2. Capacidad del Equipo (Effort-Hours)\\\\n\\\\n`;\\nmd += `| Person | Days Available (Less Personal Time) | Days for Other Scrum Activities | Hours per Day | Available Effort-Hours |\\\\n`;\\nmd += `|---|---|---|---|---|\\\\n`;\\n\\nif (tablaCapacidad.length > 0) {\\n  tablaCapacidad.forEach(p => {\\n    md += `| ${clean(p.persona)} | ${clean(p.columna_dias_disponibles)} | ${clean(p.columna_dias_scrum)} | ${clean(p.columna_horas_dia)} | ${clean(p.columna_esfuerzo)} |\\\\n`;\\n  });\\n}\\n// Fila de Total\\nmd += `| **Total** | | | | **${clean(resumenCapacidad.rango_total_texto)}** |\\\\n\\\\n`;\\n\\n\\n// SECCIÓN 3: SPRINT BACKLOG (DETALLE)\\nmd += `## 3. Sprint Backlog\\\\n\\\\n`;\\n\\nif (sprintBacklog.length > 0) {\\n  sprintBacklog.forEach(hu => {\\n    // Título de la HU\\n    md += `### Nro. ${clean(hu.id)} Título: ${clean(hu.titulo)}\\\\n\\\\n`;\\n    \\n    // Tabla de Detalle\\n    md += `| Sección | Descripción |\\\\n`;\\n    md += `|---|---|\\\\n`;\\n    md += `| **Estimación** | ${clean(hu.estimacion_sp)} |\\\\n`;\\n    md += `| **Historia de Usuario** | ${clean(hu.historia_usuario_texto)} |\\\\n\\\\n`;\\n    \\n    // --- CAMBIO: Tabla vacía para Criterios de Aceptación ---\\n    md += `#### Criterios de aceptación ${clean(hu.id)}\\\\n`;\\n    md += `| Escenario | Descripción |\\\\n`;\\n    md += `|---|---|\\\\n`;\\n    md += `| | |\\\\n\\\\n`; // Fila vacía para que el usuario rellene\\n    \\n    // Tabla vacía para Tareas\\n    md += `#### Tareas ${clean(hu.id)}\\\\n`;\\n    md += `| No. | Tarea | Effort-Hours |\\\\n`;\\n    md += `|---|---|---|\\\\n`;\\n    md += `| | | H |\\\\n\\\\n`; \\n    \\n    md += `---\\\\n\\\\n`;\\n  });\\n} else {\\n  md += `_No hay historias de usuario seleccionadas._\\\\n\\\\n`;\\n}\\n\\n// RESUMEN DEL SPRINT BACKLOG\\nmd += `## Resumen del Sprint Backlog\\\\n\\\\n`;\\nmd += `| Historia de usuario | Título | Story Points (SP) |\\\\n`;\\nmd += `|---|---|---|\\\\n`;\\n\\nlet totalSP = 0;\\n\\nif (sprintBacklog.length > 0) {\\n  sprintBacklog.forEach(hu => {\\n    // Extraer número de SP para la suma (ej: \\\"13 SP\\\" -> 13)\\n    const spString = (hu.estimacion_sp || \\\"0\\\").toString();\\n    const spValue = parseInt(spString.replace(/\\\\D/g, '')) || 0;\\n    totalSP += spValue;\\n    \\n    md += `| ${clean(hu.id)} | ${clean(hu.titulo)} | ${clean(hu.estimacion_sp)} |\\\\n`;\\n  });\\n}\\n\\n// Fila de Suma Total\\nmd += `| **Suma total de SP** | | **${totalSP}** |\\\\n`;\\n\\n// --- 4. RETORNAR EL CONTENIDO ---\\nreturn [{\\n  json: {\\n    wiki_title: \\\"Sprint_Planning_Sprint_1.md\\\",\\n    wiki_content: md\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        320,
        32
      ],
      \"id\": \"8aad9118-8fc7-4bc0-9cc9-ea9470d31667\",
      \"name\": \"Generar documento markdown\"
    },
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3.2,
      \"position\": [
        -704,
        32
      ],
      \"id\": \"f6f543cf-8703-4331-9f9b-81704d555671\",
      \"name\": \"Merge\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Función helper para obtener el contenido de forma segura\\n// Si el nodo falló o no tiene datos, devuelve un string vacío para no romper el flujo\\nconst getWikiContent = (nodeName) => {\\n  try {\\n    const node = $(nodeName).first();\\n    return node ? node.json.content : \\\"\\\";\\n  } catch (error) {\\n    return \\\"\\\";\\n  }\\n};\\n\\nconst getVideoUri = (nodeName) => {\\n  try {\\n    const node = $(nodeName).first();\\n    // Accedemos a file.uri según tu estructura JSON\\n    return node ? node.json.file.uri : null;\\n  } catch (error) {\\n    return null;\\n  }\\n};\\n\\n// --- EXTRAER DATOS LIMPIOS ---\\n\\n// 1. Obtenemos el texto Markdown de las Wikis\\nconst release_planning = getWikiContent('1. Cargar el documento release planning');\\nconst product_backlog = getWikiContent('2. Cargar el documento product backlog (Refinado, estimado y priorizado)');\\n\\n// 2. Obtenemos la URI del video\\nconst videoUri = getVideoUri('Subir video a Google');\\n\\n// --- RETORNAR OBJETO UNIFICADO ---\\nreturn [{\\n  json: {\\n    // Metadatos para tu control\\n    fecha_proceso: new Date().toISOString(),\\n    \\n    // Contexto de Texto combinando todo o separado por claves\\n    contexto_release_planning: release_planning,\\n    contexto_product_backlog: product_backlog,\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -528,
        32
      ],
      \"id\": \"df0e088c-088b-4df8-84d9-26828ac1a025\",
      \"name\": \"Sanitizar archivos\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Iteramos sobre todos los ítems que llegan (por si ejecutas en batch)\\nfor (const item of items) {\\n  try {\\n    // 1. EXTRAER EL TEXTO CRUDO\\n    // Navegamos hasta la propiedad exacta donde Gemini deja la respuesta\\n    const rawContent = item.json.candidates[0].content.parts[0].text;\\n\\n    // 2. LIMPIAR MARKDOWN\\n    // Usamos una expresión regular para quitar \\\"```json\\\" del inicio y \\\"```\\\" del final\\n    // sin importar si hay saltos de línea o espacios extra.\\n    const cleanJsonString = rawContent\\n      .replace(/^```json\\\\s*/i, '') // Quita ```json al inicio (insensible a mayúsculas)\\n      .replace(/^```\\\\s*/i, '')     // Por si acaso solo puso ``` sin \\\"json\\\"\\n      .replace(/\\\\s*```$/, '');     // Quita ``` al final\\n\\n    // 3. PARSEAR A OBJETO\\n    const parsedData = JSON.parse(cleanJsonString);\\n\\n    // 4. SOBREESCRIBIR SALIDA\\n    // Reemplazamos el JSON complejo de Google por tu JSON limpio y útil\\n    item.json = parsedData;\\n\\n  } catch (error) {\\n    // Si algo falla (ej: Gemini alucinó texto plano en vez de JSON),\\n    // guardamos el error pero no rompemos el flujo completamente.\\n    item.json = { \\n      error: \\\"No se pudo sanitizar el JSON de Gemini\\\", \\n      details: error.message,\\n      raw_output: item.json // Mantenemos el original por si acaso\\n    };\\n  }\\n}\\n\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        128,
        32
      ],
      \"id\": \"b3a6b76b-eab1-41cb-ba4a-afad41586e8d\",
      \"name\": \"Sanitizar paso 4\"
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
              \"value\": \"/Scrum automatización/Sprint Planning Version/Sprint-Planning-Part1-Refinament\"
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
              \"value\": \"={{ $json.wiki_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        560,
        32
      ],
      \"id\": \"c9153c5e-9910-4693-a98f-6d05f2b0652d\",
      \"name\": \"5. Guardar borrador sprint planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {},
      \"id\": \"9b057de0-2013-4f94-88a9-e11d66abe3b0\",
      \"name\": \"Execute Workflow Trigger\",
      \"type\": \"n8n-nodes-base.executeWorkflowTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -1216,
        32
      ]
    }
  ],
  \"connections\": {
    \"1. Cargar el documento release planning\": {
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
    \"2. Cargar el documento product backlog (Refinado, estimado y priorizado)\": {
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
    \"3. Calcular la capacidad del equipo\": {
      \"main\": [
        [
          {
            \"node\": \"4. Refinar el objetivo del sprint y seleccionar las HUs\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"4. Refinar el objetivo del sprint y seleccionar las HUs\": {
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
            \"node\": \"5. Guardar borrador sprint planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Merge\": {
      \"main\": [
        [
          {
            \"node\": \"Sanitizar archivos\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Sanitizar archivos\": {
      \"main\": [
        [
          {
            \"node\": \"3. Calcular la capacidad del equipo\",
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
            \"node\": \"Generar documento markdown\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"5. Guardar borrador sprint planning\": {
      \"main\": [
        []
      ]
    },
    \"Execute Workflow Trigger\": {
      \"main\": [
        [
          {
            \"node\": \"1. Cargar el documento release planning\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"2. Cargar el documento product backlog (Refinado, estimado y priorizado)\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

Ya sabes, quirurjicamente, mencionando los cambios que deba hacer en el agenten y el JSON completo de los nodos que deba agregar o actualizar

```

---

### Navegación

[← Prompt 075](/04-orquestacion-productiva/075/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 077 →](/04-orquestacion-productiva/077/)
{% endraw %}
