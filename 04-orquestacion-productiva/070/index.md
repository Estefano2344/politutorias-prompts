---
layout: default
title: '070. Error: No se encontraron los archivos PDF en los datos binarios.…'
parent: Orquestación n8n productiva
nav_order: 70
permalink: /04-orquestacion-productiva/070/
---

{% raw %}

# Prompt 070
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 19,608 caracteres &middot; **Posición en la conversación:** 70 de 103

---

```

Error: No se encontraron los archivos PDF en los datos binarios. Verifica que los nodos 'Leer PDF' se ejecutaron correctamente. at VmCodeWrapper (evalmachine.<anonymous>:41:11) at evalmachine.<anonymous>:87:2 at Script.runInContext (node:vm:149:12) at runInContext (node:vm:301:6) at result (/usr/local/lib/node_modules/n8n/node_modules/.pnpm/@n8n+task-runner@file+packages+@n8n+task-runner_@opentelemetry+api@1.9.0_@opentelemetry_eb51b38615a039445701c88b088f88d0/node_modules/@n8n/task-runner/dist/js-task-runner/js-task-runner.js:185:61) at new Promise (<anonymous>) at JsTaskRunner.runForAllItems (/usr/local/lib/node_modules/n8n/node_modules/.pnpm/@n8n+task-runner@file+packages+@n8n+task-runner_@opentelemetry+api@1.9.0_@opentelemetry_eb51b38615a039445701c88b088f88d0/node_modules/@n8n/task-runner/dist/js-task-runner/js-task-runner.js:178:34) at JsTaskRunner.executeTask (/usr/local/lib/node_modules/n8n/node_modules/.pnpm/@n8n+task-runner@file+packages+@n8n+task-runner_@opentelemetry+api@1.9.0_@opentelemetry_eb51b38615a039445701c88b088f88d0/node_modules/@n8n/task-runner/dist/js-task-runner/js-task-runner.js:128:26) at process.processTicksAndRejections (node:internal/process/task_queues:105:5) at async Object.waitingForSettings (/usr/local/lib/node_modules/n8n/node_modules/.pnpm/@n8n+task-runner@file+packages+@n8n+task-runner_@opentelemetry+api@1.9.0_@opentelemetry_eb51b38615a039445701c88b088f88d0/node_modules/@n8n/task-runner/dist/task-runner.js:256:17)
Problem in node ‘Preparar PDFs para Gemini‘
No se encontraron lo

En el flujo:

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
        \"jsCode\": \"// NODO: Extraer y Validar Output de Gemini API\\n\\nconst geminiResponse = $input.first().json;\\n\\n// IMPORTANTE: Obtener metadatos del nodo \\\"Preparar PDFs para Gemini\\\"\\nconst metadatos = $('Preparar PDFs para Gemini').first()?.json?.metadatos || {};\\n\\n// 1. VALIDAR QUE GEMINI RESPONDIÓ CORRECTAMENTE\\nif (geminiResponse.error) {\\n  throw new Error(` Error de Gemini API: ${geminiResponse.error.message}`);\\n}\\n\\nif (!geminiResponse.candidates || geminiResponse.candidates.length === 0) {\\n  throw new Error(\\\" Gemini no devolvió ningún candidato de respuesta.\\\");\\n}\\n\\n// 2. EXTRAER EL TEXTO DEL ANÁLISIS\\nlet analisisTexto = \\\"\\\";\\n\\ntry {\\n  if (!geminiResponse.candidates?.[0]?.content?.parts?.[0]?.text) {\\n    console.error(\\\" Estructura recibida:\\\", JSON.stringify(geminiResponse, null, 2).substring(0, 500));\\n    throw new Error(\\\"Estructura de respuesta inesperada\\\");\\n  }\\n  analisisTexto = geminiResponse.candidates[0].content.parts[0].text;\\n} catch (error) {\\n  throw new Error(` No se pudo extraer el texto: ${error.message}`);\\n}\\n\\nif (!analisisTexto || analisisTexto.trim().length === 0) {\\n  throw new Error(\\\" El análisis generado está vacío.\\\");\\n}\\n\\n// 3. LIMPIAR BLOQUES MARKDOWN WRAPPER\\nanalisisTexto = analisisTexto.trim()\\n  .replace(/^```markdown\\\\s*\\\\n?/, \\\"\\\")\\n  .replace(/^```\\\\s*\\\\n?/, \\\"\\\")\\n  .replace(/\\\\n?```\\\\s*$/, \\\"\\\")\\n  .trim();\\n\\nconsole.log(\\\" Análisis extraído:\\\", analisisTexto.length, \\\"caracteres\\\");\\n\\n// 4. VALIDAR LONGITUD MÍNIMA\\nif (analisisTexto.length < 2000) {\\n  throw new Error(\\n    ` El análisis es demasiado corto (${analisisTexto.length} caracteres). Mínimo esperado: 2000 caracteres.`\\n  );\\n}\\n\\n// 5. VALIDAR SECCIONES REQUERIDAS\\nconst seccionesRequeridas = [\\n  \\\"PROBLEMAS DE USABILIDAD\\\",\\n  \\\"FEEDBACK\\\",\\n  \\\"HISTORIAS DE USUARIO\\\",\\n  \\\"RECOMENDACIONES\\\",\\n  \\\"PATRONES\\\",\\n  \\\"CITAS TEXTUALES\\\",\\n  \\\"DECISIÓN\\\"\\n];\\n\\nconst seccionesFaltantes = seccionesRequeridas.filter(\\n  seccion => !analisisTexto.toUpperCase().includes(seccion)\\n);\\n\\nif (seccionesFaltantes.length > 0) {\\n  console.warn(\\\" Secciones faltantes:\\\", seccionesFaltantes.join(\\\", \\\"));\\n}\\n\\n// 6. CONTAR HISTORIAS DE USUARIO, ISSUES Y PROBLEMAS\\nconst husEncontradas = analisisTexto.match(/\\\\*\\\\*HU-(\\\\d+):/g) || [];\\nconst issuesEncontrados = analisisTexto.match(/### Issue #(\\\\d+):/g) || [];\\nconst problemasEncontrados = analisisTexto.match(/### Problema \\\\d+:/g) || [];\\nconst problemasCriticos = analisisTexto.match(/\\\\*\\\\*Severidad:\\\\*\\\\*\\\\s*Crítica/gi) || [];\\n\\nconst cantidadHUs = husEncontradas.length;\\nconst cantidadIssues = issuesEncontrados.length;\\nconst cantidadProblemas = problemasEncontrados.length;\\nconst cantidadCriticos = problemasCriticos.length;\\n\\nconsole.log(` Análisis completado:`);\\nconsole.log(`   - Problemas identificados: ${cantidadProblemas} (${cantidadCriticos} críticos)`);\\nconsole.log(`   - HUs identificadas: ${cantidadHUs}`);\\nconsole.log(`   - Issues identificados: ${cantidadIssues}`);\\n\\n// 7. EXTRAER LA DECISIÓN DE REDISEÑO\\nlet decisionRediseno = \\\"NO ESPECIFICADA\\\";\\nconst matchDecision = analisisTexto.match(/\\\\*\\\\*Decisión:\\\\*\\\\*\\\\s*(SÍ|NO|SI)/i);\\nif (matchDecision) {\\n  decisionRediseno = matchDecision[1].toUpperCase().replace(\\\"SI\\\", \\\"SÍ\\\");\\n}\\n\\nconsole.log(` Decisión de rediseño: ${decisionRediseno}`);\\n\\n// 8. GENERAR NOMBRE DE ARCHIVO CON TIMESTAMP\\nconst ahora = new Date();\\nconst fecha = ahora.toISOString().split('T')[0];\\nconst hora = ahora.toTimeString().split(' ')[0].replace(/:/g, '-');\\nconst nombreArchivo = `Analisis_Pruebas_Usuario_${fecha}_${hora}`;\\n\\n// 9. AGREGAR ENCABEZADO CON METADATOS\\nconst objetivoSprint = metadatos.objetivo_sprint || \\\"No especificado\\\";\\nconst tipoPrueba = metadatos.tipo_prueba || \\\"No especificada\\\";\\nconst cantidadPDFs = metadatos.cantidad_pdfs || 0;\\n\\nconst encabezado = `# ANÁLISIS DE PRUEBAS DE USUARIO\\n\\n**Fecha del análisis:** ${ahora.toLocaleString('es-EC', { timeZone: 'America/Guayaquil' })}\\n**Objetivo del Sprint:** ${objetivoSprint}\\n**Tipo de Prueba:** ${tipoPrueba}\\n**Documentos analizados:** ${cantidadPDFs} PDF(s)\\n\\n---\\n\\n`;\\n\\nconst analisisFinal = encabezado + analisisTexto;\\n\\n// 10. ESTADÍSTICAS DE TOKENS\\nconst tokensUsados = geminiResponse.usageMetadata?.totalTokenCount || 0;\\nconst tokensPrompt = geminiResponse.usageMetadata?.promptTokenCount || 0;\\nconst tokensRespuesta = geminiResponse.usageMetadata?.candidatesTokenCount || 0;\\nconst modeloGemini = geminiResponse.modelVersion || \\\"desconocido\\\";\\n\\nconsole.log(` Tokens: ${tokensUsados} (Prompt: ${tokensPrompt}, Respuesta: ${tokensRespuesta})`);\\nconsole.log(` Modelo: ${modeloGemini}`);\\n\\n// 11. RETORNAR DATOS VALIDADOS Y ESTRUCTURADOS\\nreturn {\\n  json: {\\n    // Contenido principal\\n    analisis_markdown: analisisFinal,\\n    nombre_archivo: nombreArchivo,\\n    \\n    // Validación y métricas\\n    validacion: {\\n      tiene_problemas_usabilidad: cantidadProblemas > 0,\\n      tiene_problemas_criticos: cantidadCriticos > 0,\\n      tiene_nuevas_hus: cantidadHUs > 0,\\n      tiene_issues: cantidadIssues > 0,\\n      cantidad_problemas: cantidadProblemas,\\n      cantidad_criticos: cantidadCriticos,\\n      cantidad_hus: cantidadHUs,\\n      cantidad_issues: cantidadIssues,\\n      decision_rediseno: decisionRediseno,\\n      requiere_rediseno: decisionRediseno === \\\"SÍ\\\",\\n      longitud_caracteres: analisisFinal.length,\\n      secciones_faltantes: seccionesFaltantes,\\n      analisis_completo: seccionesFaltantes.length === 0\\n    },\\n    \\n    // Metadatos del contexto\\n    metadatos: {\\n      fecha_analisis: ahora.toISOString(),\\n      objetivo_sprint: objetivoSprint,\\n      tipo_prueba: tipoPrueba,\\n      cantidad_pdfs: cantidadPDFs,\\n      tokens_usados: tokensUsados,\\n      tokens_prompt: tokensPrompt,\\n      tokens_respuesta: tokensRespuesta,\\n      modelo_gemini: modeloGemini\\n    }\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        2608,
        400
      ],
      \"id\": \"4236bc43-d2fa-4b85-a1f7-726708b1a168\",
      \"name\": \"Extraer y Validar Output de Gemini API\"
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"=https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/106/subpages?path={{ $json.nombre_archivo.replace('.md', '') }}&api-version=7.1\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
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
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.analisis_markdown }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        2832,
        400
      ],
      \"id\": \"4315b40d-9527-4097-93ee-ed27fd66a28c\",
      \"name\": \"Subir a Wikis de Azure\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"rtbOVHBu7hA242gh\",
          \"name\": \"Azure Discovery\"
        }
      }
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
        \"sendBody\": true,
        \"specifyBody\": \"json\",
        \"jsonBody\": \"={{ $json.geminiBody }}\",
        \"options\": {
          \"response\": {
            \"response\": {
              \"responseFormat\": \"json\"
            }
          },
          \"timeout\": 60000
        }
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        2400,
        400
      ],
      \"id\": \"0d7fa850-83c7-4cdb-8269-99018799b5ab\",
      \"name\": \"Consultar a Gemini 2.5 Flash\"
    },
    {
      \"parameters\": {},
      \"id\": \"4c4b9f2b-adfc-4773-8ed3-6bae01e396b0\",
      \"name\": \"Execute Workflow Trigger\",
      \"type\": \"n8n-nodes-base.executeWorkflowTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        1328,
        288
      ]
    },
    {
      \"parameters\": {
        \"filePath\": \"/home/node/.n8n-files/interpretacion/transcripcion_estudiante.pdf\",
        \"dataPropertyName\": \"Transcripción Evaluación Estudiante\"
      },
      \"id\": \"416c784d-b451-44b9-9840-c9e94e4f1654\",
      \"name\": \"Leer PDF Estudiante\",
      \"type\": \"n8n-nodes-base.readBinaryFile\",
      \"typeVersion\": 1,
      \"position\": [
        1552,
        288
      ]
    },
    {
      \"parameters\": {
        \"filePath\": \"/home/node/.n8n-files/interpretacion/transcripcion_tutor.pdf\",
        \"dataPropertyName\": \"Transcripción Evaluación Tutor\"
      },
      \"id\": \"50d32884-6ed7-46ed-899b-ac4d6ed63bf6\",
      \"name\": \"Leer PDF Tutor\",
      \"type\": \"n8n-nodes-base.readBinaryFile\",
      \"typeVersion\": 1,
      \"position\": [
        1776,
        288
      ]
    },
    {
      \"parameters\": {
        \"formTitle\": \"Carga de Resultados Evaluación de Usuario\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldLabel\": \"Objetivo del Sprint\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Tipo de Prueba\",
              \"fieldType\": \"dropdown\",
              \"defaultValue\": \"Prueba de Usuario\",
              \"fieldOptions\": {
                \"values\": [
                  {
                    \"option\": \"Prueba de Usuario\"
                  },
                  {
                    \"option\": \"A/B Testing\"
                  },
                  {
                    \"option\": \"Validación de Concepto\"
                  }
                ]
              },
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Transcripción Evaluación Estudiante\",
              \"fieldType\": \"file\",
              \"acceptFileTypes\": \".pdf\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Transcripción Evaluación Tutor\",
              \"fieldType\": \"file\",
              \"acceptFileTypes\": \".pdf\",
              \"requiredField\": true
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.formTrigger\",
      \"typeVersion\": 2.3,
      \"position\": [
        1776,
        496
      ],
      \"id\": \"4973367a-24a4-4c5d-9ab7-932a9c90c375\",
      \"name\": \"Subida Transcripciones Evalación de Usuario\",
      \"webhookId\": \"50eae22b-8f86-45cc-9218-df5231321b44\"
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
        [
          {
            \"node\": \"Consultar a Gemini 2.5 Flash\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Extraer y Validar Output de Gemini API\": {
      \"main\": [
        [
          {
            \"node\": \"Subir a Wikis de Azure\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Consultar a Gemini 2.5 Flash\": {
      \"main\": [
        [
          {
            \"node\": \"Extraer y Validar Output de Gemini API\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Execute Workflow Trigger\": {
      \"main\": [
        [
          {
            \"node\": \"Leer PDF Estudiante\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Leer PDF Estudiante\": {
      \"main\": [
        [
          {
            \"node\": \"Leer PDF Tutor\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Leer PDF Tutor\": {
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
    \"Subida Transcripciones Evalación de Usuario\": {
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
```

---

### Navegación

[← Prompt 069](/04-orquestacion-productiva/069/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 071 →](/04-orquestacion-productiva/071/)
{% endraw %}
