---
layout: default
title: '071. No, esa parte si esta bien, debe ser estos nodos: { ''nodes'': [ {…'
parent: Orquestación n8n productiva
nav_order: 71
permalink: /04-orquestacion-productiva/071/
---

{% raw %}

# Prompt 071
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 5,163 caracteres &middot; **Posición en la conversación:** 71 de 103

---

```
No, esa parte si esta bien, debe ser estos nodos:
{
  \"nodes\": [
    {
      \"parameters\": {
        \"jsCode\": \"// NODO 2: Preparar PDFs y contexto para Gemini\\nconst items = $input.all();\\nconst firstItem = items[0];\\nconst jsonInputs = firstItem.json;\\n\\n// 1. OBTENER DATOS (Formulario o Agente)\\nconst objetivoSprint = jsonInputs[\\\"Objetivo del Sprint\\\"] || jsonInputs[\\\"objetivo_sprint\\\"];\\nconst tipoPrueba = jsonInputs[\\\"Tipo de Prueba\\\"] || jsonInputs[\\\"tipo_prueba\\\"] || \\\"Prueba de Usuario\\\";\\n\\nif (!objetivoSprint) {\\n  throw new Error(\\\"Falta el objetivo del sprint.\\\");\\n}\\n\\n// 2. BUSCAR BINARIOS (Lógica Híbrida)\\nlet pdfEstudiante = null;\\nlet pdfTutor = null;\\n\\n// Estrategia A: Buscar en propiedades binarias (Servidor / Agente)\\n// Iteramos sobre todos los items por si vienen separados\\nfor (const item of items) {\\n    if (item.binary) {\\n        if (item.binary[\\\"Transcripción Evaluación Estudiante\\\"]) \\n            pdfEstudiante = item.binary[\\\"Transcripción Evaluación Estudiante\\\"];\\n        \\n        if (item.binary[\\\"Transcripción Evaluación Tutor\\\"]) \\n            pdfTutor = item.binary[\\\"Transcripción Evaluación Tutor\\\"];\\n    }\\n}\\n\\n// Estrategia B: Buscar en JSON (Formulario antiguo que devuelve array de objetos)\\n// Solo si la estrategia A falló\\nif (!pdfEstudiante && jsonInputs[\\\"Transcripción Evaluación Estudiante\\\"]) {\\n    // Nota: El formulario no devuelve el binario en JSON, devuelve metadatos.\\n    // El binario real siempre está en 'item.binary'.\\n    // Si llegamos aquí, es probable que el mapeo del formulario no esté pasando el binario correctamente al nodo Code.\\n    // Pero asumiremos que si existe en binary, ya lo capturamos arriba.\\n}\\n\\nif (!pdfEstudiante && !pdfTutor) {\\n    // Si es una prueba del Agente y falló la lectura, lanzamos error claro\\n    throw new Error(\\\"No se encontraron los archivos PDF en los datos binarios. Verifica que los nodos 'Leer PDF' se ejecutaron correctamente.\\\");\\n}\\n\\n// 3. CONSTRUIR PROMPT\\nconst systemPrompt = `Eres un experto en DCU... (Tu prompt original)...`;\\n\\n// 4. PROCESAR A BASE64\\nconst parts = [{ text: systemPrompt }];\\n\\nasync function addPdfToParts(binaryObj) {\\n    if (!binaryObj) return;\\n    \\n    // Si viene del nodo ReadFile, 'data' es el base64\\n    let b64 = binaryObj.data;\\n    \\n    // Si es un buffer (n8n v1), lo convertimos\\n    if (typeof b64 !== 'string') {\\n         // Intentar leer con helper si es referencia\\n         try {\\n             // Esto es complejo en Code Node v2 sin 'await' fuera de bucles\\n             // Pero ReadFile suele entregar base64 directo.\\n         } catch(e) {}\\n    }\\n\\n    parts.push({\\n        inline_data: {\\n            mime_type: \\\"application/pdf\\\",\\n            data: b64\\n        }\\n    });\\n}\\n\\nawait addPdfToParts(pdfEstudiante);\\nawait addPdfToParts(pdfTutor);\\n\\n// 5. RETORNAR\\nreturn {\\n    json: {\\n        geminiBody: { contents: [{ parts: parts }] },\\n        metadatos: {\\n            objetivo_sprint: objetivoSprint,\\n            tipo_prueba: tipoPrueba,\\n            cantidad_pdfs: parts.length - 1\\n        }\\n    }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        2192,
        400
      ],
      \"id\": \"a2f3b306-607b-49e7-9be4-f5c34f63b37a\",
      \"name\": \"Preparar PDFs para Gemini\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO NORMALIZADOR DE INPUTS + PDFS\\n\\nconst items = $input.all();\\nconst firstItem = items[0];\\nconst jsonData = firstItem.json;\\n\\n// 1. Obtener Datos de Texto\\n// Soporta nombres del Formulario (\\\"Objetivo del Sprint\\\") y claves simples del Agente (\\\"objetivo_sprint\\\")\\nconst objetivo = jsonData.objetivo_sprint || jsonData['Objetivo del Sprint'] || 'Análisis de Usabilidad General';\\nconst tipo = jsonData.tipo_prueba || jsonData['Tipo de Prueba'] || 'Prueba de Usuario';\\n\\n// 2. Mapeo de Binarios\\n// El flujo espera binarios con nombres específicos en el item\\n// Si vienen de ReadFile, ya tienen el nombre correcto.\\n// Si vienen de Formulario, también.\\n\\nreturn {\\n  json: {\\n    \\\"Objetivo del Sprint\\\": objetivo,\\n    \\\"Tipo de Prueba\\\": tipo,\\n    source: jsonData.objetivo_sprint ? 'agent' : 'form'\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        2000,
        400
      ],
      \"id\": \"cd11b0cc-8809-4101-b77c-def93c0eb023\",
      \"name\": \"Normalizar Inputs\"
    }
  ],
  \"connections\": {
    \"Preparar PDFs para Gemini\": {
      \"main\": [
        []
      ]
    },
    \"Normalizar Inputs\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar PDFs para Gemini\",
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

Donde ya llegan los PDFs pero no saben como seguir el flujo

```

---

### Navegación

[← Prompt 070](/04-orquestacion-productiva/070/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 072 →](/04-orquestacion-productiva/072/)
{% endraw %}
