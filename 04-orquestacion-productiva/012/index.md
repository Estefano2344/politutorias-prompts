---
layout: default
title: '012. Ya implementamos el hybrid tool recuerdalo: { ''nodes'': [ { ''para.…'
parent: Orquestación n8n productiva
nav_order: 12
permalink: /04-orquestacion-productiva/012/
---

{% raw %}

# Prompt 012
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 23,343 caracteres &middot; **Posición en la conversación:** 12 de 103

---

```
Ya implementamos el hybrid tool recuerdalo:

{
  \"nodes\": [
    {
      \"parameters\": {},
      \"id\": \"b32cd807-b43f-4d18-8d3f-8b16d559032f\",
      \"name\": \"Execute Workflow Trigger\",
      \"type\": \"n8n-nodes-base.executeWorkflowTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        2400,
        240
      ]
    },
    {
      \"parameters\": {
        \"formTitle\": \"Contexto del producto\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldLabel\": \"Idea Inicial\",
              \"placeholder\": \"La descripción del producto.\",
              \"defaultValue\": \"Plataforma de tutorías académicas PoliTutorias: de estudiantes para estudiantes.\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Horizonte de Planificación\",
              \"placeholder\": \"6 meses o 1 año\",
              \"defaultValue\": \"2 meses (4 sprints)\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Presupuesto / Recursos\",
              \"placeholder\": \"Cantidad de personas\",
              \"defaultValue\": \"Equipo Scrum de 6 personas (DevOps, Front, Back, QA, etc)\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Formato de Visión y Valores\",
              \"placeholder\": \"Define la plantilla para la visión\",
              \"defaultValue\": \"Seguir plantilla de Geoffrey Moore.\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.formTrigger\",
      \"typeVersion\": 2.3,
      \"position\": [
        2400,
        448
      ],
      \"id\": \"b98afd94-59f8-4f09-b50f-4821523fd283\",
      \"name\": \"Formulario Web\",
      \"webhookId\": \"5c5bc3a8-0022-49df-8211-3b6106fcd374\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO NORMALIZADOR\\n// Unifica datos del Agente (JSON) y del Formulario Web\\n\\nconst input = $input.first().json;\\n\\nreturn {\\n  json: {\\n    // Mapeo: Si viene del Agente usa 'idea_negocio', si es form usa 'Idea Inicial'\\n    idea: input.idea_negocio || input['Idea Inicial'] || 'Proyecto de Software Generico',\\n    \\n    horizonte: input.horizonte || input['Horizonte de Planificación'] || '2 meses',\\n    \\n    presupuesto: input.presupuesto || input['Presupuesto / Recursos'] || 'Equipo Scrum',\\n    \\n    formato: input.formato || input['Formato de Visión y Valores'] || ''\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        2672,
        352
      ],
      \"id\": \"ce27d60e-7ca1-40be-ba85-6e65c219fc27\",
      \"name\": \"Normalizar Inputs\"
    },
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Product%20Planning.pdf\",
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
        2912,
        352
      ],
      \"id\": \"a12ad7f7-1e3d-4154-b30b-5ac1d09248ef\",
      \"name\": \"Obtener ejemplo product planning1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        3120,
        352
      ],
      \"id\": \"af42b3f3-453e-4b26-9337-42efcf98256f\",
      \"name\": \"Cambiar etiqueta de identificación\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-2.0-flash\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-2.0-flash\"
        },
        \"text\": \"=Actúa como un Product Owner.\\n\\n### 1. OBJETIVO\\nGenerar la \\\"Visión del Producto\\\" y las \\\"Áreas de Valor\\\" para un NUEVO proyecto, replicando estrictamente la estructura lógica y el nivel de detalle del archivo PDF adjunto (\\\"Ejemplo Product Planning\\\").\\n\\n### 2. ANÁLISIS DEL ARCHIVO ADJUNTO (TU GUÍA DE ESTILO)\\nAnaliza el documento PDF y extrae los siguientes patrones:\\n- **Tabla 1.1 (Áreas de valor):** Nota que tiene exactamente 3 columnas: \\\"Área\\\" (ej: Habilitador), \\\"Subcategoría\\\" (ej: Acceder a un nuevo mercado) y \\\"Justificación\\\".\\n- **Sección 1.2 (Visión):** Nota que la visión NO es un solo párrafo. Está desglosada frase por frase (\\\"Para...\\\", \\\"que necesitan...\\\", \\\"el producto...\\\", etc.)\\n\\n### 3. INPUTS DEL NUEVO PROYECTO\\nUsa estos datos (que vienen del nodo Normalizador) para crear el contenido:\\n- Idea: {{ $('Normalizar Inputs').item.json.idea }}\\n- Horizonte: {{ $('Normalizar Inputs').item.json.horizonte }}\\n- Presupuesto: {{ $('Normalizar Inputs').item.json.presupuesto }}\\n- Instrucciones Extra: {{ $('Normalizar Inputs').item.json.formato }}\\n\\n### 4. INSTRUCCIONES DE SALIDA (JSON)\\nGenera 3 áreas de valor estratégicas y la visión desglosada.\\nTu respuesta debe ser ÚNICAMENTE un objeto JSON válido con esta estructura exacta:\\n\\n{\\n  \\\"areas_valor\\\": [\\n    {\\n      \\\"area\\\": \\\"Nombre del Área (Ej: Habilitador/Diferenciador)\\\",\\n      \\\"subcategoria\\\": \\\"Acción específica\\\",\\n      \\\"justificacion\\\": \\\"Por qué aporta valor según el presupuesto y horizonte\\\"\\n    },\\n    { ... (repetir para área 2) },\\n    { ... (repetir para área 3) }\\n  ],\\n  \\\"vision_desglosada\\\": {\\n    \\\"para_cliente\\\": \\\"Definición del cliente objetivo\\\",\\n    \\\"que_necesitan\\\": \\\"La necesidad o dolor principal\\\",\\n    \\\"el_producto\\\": \\\"Nombre del producto (si no tienes, invéntalo basado en la idea)\\\",\\n    \\\"es_una\\\": \\\"Categoría del producto\\\",\\n    \\\"que_beneficio\\\": \\\"Beneficio clave / Razón para comprar\\\",\\n    \\\"a_diferencia_de\\\": \\\"Alternativa o competencia principal\\\",\\n    \\\"nuestro_producto\\\": \\\"El diferenciador clave\\\"\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        3344,
        352
      ],
      \"id\": \"1ba23701-29b1-4526-9bf9-99ea7473ee3e\",
      \"name\": \"2. Propuesta áreas de valor y visión\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Product%20Planning.pdf\",
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
        3568,
        352
      ],
      \"id\": \"2c5dcce3-2010-41a8-92df-51899a86df13\",
      \"name\": \"Obtener ejemplo product planning\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        3792,
        352
      ],
      \"id\": \"f805a935-483a-4df1-9593-3cfa7b47a477\",
      \"name\": \"Cambiar etiqueta de identificación1\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-2.0-flash\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-2.0-flash\"
        },
        \"text\": \"=Actúa como Product Owner.\\n\\n1. GUÍA DE ESTILO (PDF ADJUNTO):\\nAnaliza la tabla \\\"Product Backlog de alto nivel\\\" del archivo adjunto.\\nImita estrictamente su estructura de columnas: \\\"Nro.\\\", \\\"Título\\\" y \\\"Historia de Usuario\\\".\\nObserva el formato de redacción de la historia: \\\"Como [rol], quiero [acción], para [beneficio]\\\".\\n\\n2. INPUT (VISIÓN DEL PRODUCTO):\\nUsa la siguiente visión y áreas de valor como base para definir las funcionalidades:\\n{{ $json.content.parts[0].text }}\\n\\n3. TAREA:\\nGenera un Product Backlog de Alto Nivel, la cantidad de épicas necesarias para cubrir esta visión.\\n\\nResponde ÚNICAMENTE con un objeto JSON válido con esta estructura:\\n{\\n  \\\"backlog\\\": [\\n    {\\n      \\\"id\\\": \\\"EP01\\\",\\n      \\\"titulo\\\": \\\"Título corto\\\",\\n      \\\"historia_usuario\\\": \\\"Como... quiero... para...\\\"\\n    },\\n    { ... }\\n  ]\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"simplify\": false,
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        4000,
        352
      ],
      \"id\": \"f78a6564-4acc-43c0-8262-fc7aaeb8eb8a\",
      \"name\": \"3. Crear propuesta PB\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Product%20Planning.pdf\",
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
        4224,
        352
      ],
      \"id\": \"55a50d28-4e16-4ef2-90e1-0822e693265b\",
      \"name\": \"Obtener ejemplo product planning2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4448,
        352
      ],
      \"id\": \"a10cd084-c12d-403b-81bc-6a4863fc430a\",
      \"name\": \"Cambiar etiqueta de identificación2\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-2.0-flash\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-2.0-flash\"
        },
        \"text\": \"=Actúa como Product Manager Técnico.\\n\\n1. CONTEXTO:\\nAnaliza la tabla de \\\"Product Roadmap\\\" del PDF adjunto.\\nNota que usa filas como \\\"Market Map\\\", \\\"Feature map\\\" y \\\"Architecture\\\" cruzadas con columnas de Releases.\\n\\n2. INPUTS:\\n- Horizonte: {{ $('Normalizar Inputs').item.json.horizonte }}\\n- Backlog generado: {{ $('3. Crear propuesta PB').item.json.candidates[0].content.parts[0].text }}\\n3. TAREA:\\nGenera una propuesta de Roadmap de 3 Releases siguiendo la estructura exacta de filas y columnas del PDF.\\n\\nResponde ÚNICAMENTE con un JSON válido:\\n{\\n  \\\"releases\\\": [\\n    {\\n      \\\"release_name\\\": \\\"Release 1\\\",\\n      \\\"market_map\\\": \\\"...\\\",\\n      \\\"feature_map\\\": \\\"...\\\",\\n      \\\"architecture\\\": \\\"...\\\"\\n    },\\n    ... (Release 2 y 3)\\n  ]\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"simplify\": false,
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        4672,
        352
      ],
      \"id\": \"582f2bb1-0a99-4c21-bae4-88dbd56875fe\",
      \"name\": \"4. Crear propuesta Product Roadmap\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN SEGURA PARA EXTRAER DATOS ---\\nconst getJson = (nombreNodo) => {\\n    try {\\n        const node = $(nombreNodo).first();\\n        if (!node) return null;\\n\\n        let text = \\\"\\\";\\n        // Buscamos el texto en todas las ubicaciones posibles\\n        if (node.json.content?.parts?.[0]?.text) text = node.json.content.parts[0].text;\\n        else if (node.json.candidates?.[0]?.content?.parts?.[0]?.text) text = node.json.candidates[0].content.parts[0].text;\\n        else if (node.json.text) text = node.json.text;\\n\\n        if (!text) return null;\\n\\n        return JSON.parse(text.replace(/```json|```/g, '').trim());\\n    } catch (e) {\\n        return null; \\n    }\\n};\\n\\n// --- 2. CAPTURA DE DATOS ---\\n\\n// Leemos del NODO NORMALIZADO, no del trigger viejo\\nconst trigger = $('Normalizar Inputs').first();\\nconst ideaCompleta = trigger ? trigger.json.idea : \\\"Proyecto\\\";\\n\\n// Capturamos los JSONs generados por los Agentes\\nconst visionJson = getJson('2. Propuesta áreas de valor y visión') || {};\\nconst backlogJson = getJson('3. Crear propuesta PB') || {};\\nconst roadmapJson = getJson('4. Crear propuesta Product Roadmap') || {};\\n\\n\\n// --- 3. CONSTRUCCIÓN DEL DOCUMENTO (Estructura Limpia) ---\\n\\n// Título exacto solicitado\\nlet md = `# Product Planning V1.0\\\\n\\\\n`; \\n\\n// === SECCIÓN 1: VISIÓN ===\\nmd += `## 1. Visión del producto\\\\n\\\\n`;\\n\\n// 1.1 Áreas de Valor\\nmd += `### 1.1 Áreas de valor\\\\n`;\\nconst areas = visionJson.areas_valor || visionJson.areas || [];\\n\\nif (areas.length > 0) {\\n    md += `| Área | Subcategoría | Justificación |\\\\n|---|---|---|\\\\n`;\\n    areas.forEach(item => {\\n        md += `| ${item.area || item.nombre} | ${item.subcategoria || ''} | ${item.justificacion || item.descripcion} |\\\\n`;\\n    });\\n} else {\\n    md += `_(Pendiente)_\\\\n`;\\n}\\n\\n// 1.2 Visión Narrativa\\nmd += `\\\\n### 1.2 Visión con las áreas de valor\\\\n`;\\nconst v = visionJson.vision_desglosada || visionJson; \\n\\nif (v.para_cliente || v.para) {\\n    // Formato plantilla estándar de Moore (como en el PDF)\\n    md += `**Para** ${v.para_cliente || v.para},\\\\n\\\\n`;\\n    md += `**que** ${v.que_necesitan || v.necesidad || '...'},\\\\n\\\\n`;\\n    md += `**el producto** ${v.el_producto || v.nombre_producto || '...'},\\\\n\\\\n`;\\n    md += `**es un** ${v.es_una || v.categoria || '...'},\\\\n\\\\n`;\\n    md += `**que** ${v.que_beneficio || v.beneficio_clave}.\\\\n\\\\n`;\\n    md += `**A diferencia de** ${v.a_diferencia_de || v.competencia},\\\\n\\\\n`;\\n    md += `**nuestro producto** ${v.nuestro_producto || v.diferenciador}.\\\\n\\\\n`;\\n} else if (visionJson.vision) {\\n    md += `${visionJson.vision}\\\\n`;\\n}\\n\\n\\n// === SECCIÓN 2: BACKLOG ===\\nmd += `\\\\n## 2. Product Backlog de alto nivel\\\\n\\\\n`;\\n\\nconst items = backlogJson.backlog || backlogJson.items || [];\\nif (items.length > 0) {\\n    md += `| Nro. | Título | Historia de Usuario |\\\\n|---|---|---|\\\\n`;\\n    items.forEach((item, index) => {\\n        // Generamos IDs tipo EP01, EP02 si no vienen en el JSON\\n        const id = item.id || item.nro || `EP${String(index + 1).padStart(2, '0')}`;\\n        const titulo = item.titulo || item.feature;\\n        const historia = (item.historia_usuario || item.historia || \\\"\\\").replace(/\\\\n/g, \\\"<br>\\\");\\n        md += `| ${id} | ${titulo} | ${historia} |\\\\n`;\\n    });\\n} else {\\n    md += `_(Pendiente)_\\\\n`;\\n}\\n\\n\\n// === SECCIÓN 3: ROADMAP ===\\nmd += `\\\\n## 3. Product Roadmap\\\\n\\\\n`;\\n\\nconst releases = roadmapJson.releases || roadmapJson.roadmap || [];\\n\\nif (releases.length > 0) {\\n    const r1 = releases[0] || {};\\n    const r2 = releases[1] || {};\\n    const r3 = releases[2] || {};\\n\\n    // Encabezados\\n    md += `| Capa | ${r1.release_name || 'Release 1'} | ${r2.release_name || 'Release 2'} | ${r3.release_name || 'Release 3'} |\\\\n`;\\n    md += `|---|---|---|---|\\\\n`;\\n\\n    // Fila 1: Market Map\\n    md += `| **Market Map** | ${r1.objetivo || r1.market_map || ''} | ${r2.objetivo || r2.market_map || ''} | ${r3.objetivo || r3.market_map || ''} |\\\\n`;\\n\\n    // Fila 2: Feature Map\\n    const formatFeat = (f) => Array.isArray(f) ? f.join('<br>• ') : (f || '');\\n    md += `| **Feature Map** | • ${formatFeat(r1.feature_map)} | • ${formatFeat(r2.feature_map)} | • ${formatFeat(r3.feature_map)} |\\\\n`;\\n\\n    // Fila 3: Architecture\\n    md += `| **Architecture** | ${r1.arquitectura || r1.architecture || ''} | ${r2.arquitectura || r2.architecture || ''} | ${r3.arquitectura || r3.architecture || ''} |\\\\n`;\\n\\n} else {\\n    md += `_(Pendiente)_\\\\n`;\\n}\\n\\n\\n// --- 4. RETORNO PARA LA API ---\\n\\nreturn {\\n    json: {\\n        // Contenido Markdown limpio (solo estructura)\\n        wiki_content: md,\\n        // Título de la página en la Wiki (Corto y único)\\n        page_title: `Product Planning V1.0 - ${ideaCompleta.split(' ').slice(0, 4).join(' ')}`\\n    }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4880,
        352
      ],
      \"id\": \"b5ff4081-f9d2-4cbf-befe-723904366504\",
      \"name\": \"Generar documento Markdown\"
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Product-Planning-V1.0&api-version=6.0\",
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
        5104,
        352
      ],
      \"id\": \"c47dc870-09b1-4307-97be-4278a8fb9a5d\",
      \"name\": \"5. Guardar información generada en el repositorio\",
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
        5328,
        352
      ],
      \"id\": \"5a53e31e-b06a-4bac-a5de-9dd9e3add1cd\",
      \"name\": \"Respuesta al Orquestador\"
    }
  ],
  \"connections\": {
    \"Execute Workflow Trigger\": {
      \"main\": [
        [
          {
            \"node\": \"Normalizar Inputs\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Formulario Web\": {
      \"main\": [
        [
          {
            \"node\": \"Normalizar Inputs\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Normalizar Inputs\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo product planning1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo product planning1\": {
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
            \"node\": \"2. Propuesta áreas de valor y visión\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"2. Propuesta áreas de valor y visión\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo product planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo product planning\": {
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
            \"node\": \"3. Crear propuesta PB\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"3. Crear propuesta PB\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo product planning2\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo product planning2\": {
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
            \"node\": \"4. Crear propuesta Product Roadmap\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"4. Crear propuesta Product Roadmap\": {
      \"main\": [
        [
          {
            \"node\": \"Generar documento Markdown\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar documento Markdown\": {
      \"main\": [
        [
          {
            \"node\": \"5. Guardar información generada en el repositorio\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"5. Guardar información generada en el repositorio\": {
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


Pero ahora cuando inciio un chat deberia consultarme lo que antes se hacia por formulario

```

---

### Navegación

[← Prompt 011](/04-orquestacion-productiva/011/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 013 →](/04-orquestacion-productiva/013/)
{% endraw %}
