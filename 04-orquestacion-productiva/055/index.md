---
layout: default
title: '055. Ahora los cambios quirurjicos a: { ''nodes'': [ { ''parameters'': {..…'
parent: Orquestación n8n productiva
nav_order: 55
permalink: /04-orquestacion-productiva/055/
---

{% raw %}

# Prompt 055
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 21,431 caracteres &middot; **Posición en la conversación:** 55 de 103

---

```
Ahora los cambios quirurjicos a:

{
  \"nodes\": [
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
        1056,
        48
      ],
      \"id\": \"5bed4854-82de-49e7-a993-7ef99cdf1a68\",
      \"name\": \"Subida Transcripciones Evalación de Usuario\",
      \"webhookId\": \"29e646d6-7dc4-4e3f-9304-de72e8af9b04\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO: Preparar PDFs y contexto para Gemini\\n\\nconst items = $input.all();\\nconst jsonInputs = items[0].json;\\n\\n// 1. OBTENER DATOS DEL FORMULARIO\\nconst objetivoSprint = jsonInputs[\\\"Objetivo del Sprint\\\"];\\nconst tipoPrueba = jsonInputs[\\\"Tipo de Prueba\\\"] || \\\"Prueba de Usuario\\\";\\n\\nif (!objetivoSprint) {\\n  throw new Error(\\\" Falta el objetivo del sprint.\\\");\\n}\\n\\n// 2. OBTENER LOS PDFs DEL JSON\\nconst pdfEstudiante = jsonInputs[\\\"Transcripción Evaluación Estudiante\\\"];\\nconst pdfTutor = jsonInputs[\\\"Transcripción Evaluación Tutor\\\"];\\n\\nif (!pdfEstudiante && !pdfTutor) {\\n  throw new Error(\\\" No se encontraron PDFs subidos.\\\");\\n}\\n\\nconsole.log(\\\"📋 Datos del formulario:\\\", {\\n  objetivo: objetivoSprint,\\n  tipo: tipoPrueba,\\n  archivosEstudiante: pdfEstudiante?.length || 0,\\n  archivosTutor: pdfTutor?.length || 0\\n});\\n\\n// 3. CONSTRUIR PROMPT DEL SISTEMA\\nconst systemPrompt = `Eres un experto en Diseño Centrado en el Usuario (DCU) especializado en análisis de pruebas de usabilidad y extracción de insights accionables siguiendo metodologías de UX Research.\\n\\n---\\n\\n## CONTEXTO DEL PROYECTO\\n\\n**Objetivo del Sprint:** ${objetivoSprint}\\n\\n**Tipo de Prueba Realizada:** ${tipoPrueba}\\n\\n**Transcripciones Adjuntas:**\\nA continuación se adjuntan los PDFs con las transcripciones de las entrevistas de usuario. Pueden ser:\\n- Múltiples PDFs de usuarios estudiantes/buscadores\\n- Múltiples PDFs de usuarios tutores/ofertantes\\n\\nAnaliza TODOS los documentos adjuntos.\\n\\n---\\n\\n## TU TAREA\\n\\nAnaliza TODOS los PDFs adjuntos y extrae:\\n\\n### PASO 1: IDENTIFICACIÓN DE PROBLEMAS DE USABILIDAD\\n\\nIdentifica y documenta TODOS los problemas de usabilidad mencionados por los usuarios.\\n\\n**Formato requerido:**\\n\\n## PROBLEMAS DE USABILIDAD IDENTIFICADOS\\n\\n### Problema 1: [Título descriptivo del problema]\\n**Severidad:** [Crítica/Alta/Media/Baja]\\n**Usuario afectado:** [Estudiante/Tutor/Ambos]\\n**Descripción:** [Descripción detallada del problema]\\n**Cita textual:** \\\"[Fragmento de la transcripción que evidencia el problema]\\\"\\n**Impacto:** [Cómo afecta la experiencia del usuario]\\n\\n[Repetir para cada problema identificado]\\n\\n---\\n\\n### PASO 2: FEEDBACK ESPECÍFICO SOBRE EL PROTOTIPO\\n\\nDocumenta el feedback positivo y negativo sobre características específicas.\\n\\n**Formato requerido:**\\n\\n## FEEDBACK SOBRE EL PROTOTIPO\\n\\n### Aspectos Positivos\\n- **[Característica]:** [Comentario del usuario]\\n- [Repetir...]\\n\\n### Aspectos a Mejorar\\n- **[Característica]:** [Comentario del usuario]\\n- [Repetir...]\\n\\n### Sugerencias de los Usuarios\\n- [Sugerencia 1]\\n- [Sugerencia 2]\\n\\n---\\n\\n### PASO 3: EXTRACCIÓN DE NUEVAS HISTORIAS DE USUARIO E ISSUES\\n\\nIdentifica nuevas funcionalidades solicitadas o necesidades expresadas.\\n\\n**Formato requerido:**\\n\\n## NUEVAS HISTORIAS DE USUARIO E ISSUES\\n\\n### Historias de Usuario:\\n\\n#### Formato Completo (cuando hay suficiente información):\\n**HU-001: [Título descriptivo de la funcionalidad]**\\n**Como** [tipo de usuario]\\n**Quiero** [acción/funcionalidad]\\n**Para** [beneficio/objetivo]\\n\\n#### Formato Simplificado (cuando solo se identifica la necesidad):\\n**HU-002: [Título descriptivo]**\\n**Descripción breve:** [1-2 líneas explicando la necesidad identificada]\\n\\n### Issues/Bugs Identificados:\\n\\n## ISSUES/BUGS IDENTIFICADOS\\n\\n### Issue #1: [Título del bug/problema]\\n**Severidad:** [Crítica/Alta/Media/Baja]\\n**Usuario reportante:** [Estudiante/Tutor]\\n**Descripción:** [Qué está fallando]\\n**Pasos para reproducir:** [Si aplica]\\n**Comportamiento esperado:** [Cómo debería funcionar]\\n\\n---\\n\\n### PASO 4: RECOMENDACIONES DE MEJORA\\n\\nProporciona recomendaciones priorizadas basadas en los hallazgos.\\n\\n**Formato requerido:**\\n\\n## RECOMENDACIONES DE MEJORA\\n\\n### Prioridad Alta (Críticas)\\n1. **[Título de recomendación]**\\n   - **Problema que resuelve:** [Descripción]\\n   - **Acción sugerida:** [Qué hacer]\\n   - **Impacto esperado:** [Beneficio]\\n\\n### Prioridad Media (Importantes)\\n[Mismo formato]\\n\\n### Prioridad Baja (Mejoras incrementales)\\n[Mismo formato]\\n\\n---\\n\\n### PASO 5: ANÁLISIS DE PATRONES Y TENDENCIAS\\n\\nIdentifica patrones recurrentes en el comportamiento o feedback.\\n\\n**Formato requerido:**\\n\\n## PATRONES Y TENDENCIAS OBSERVADAS\\n\\n### Patrón 1: [Nombre del patrón]\\n**Frecuencia:** [Mencionado por X usuarios]\\n**Descripción:** [Qué patrón se observó]\\n**Implicaciones:** [Qué significa para el diseño]\\n\\n---\\n\\n### PASO 6: CITAS TEXTUALES DESTACADAS\\n\\nExtrae las citas más reveladoras de los usuarios.\\n\\n**Formato requerido:**\\n\\n## CITAS TEXTUALES DESTACADAS\\n\\n> \\\"[Cita textual del usuario]\\\"\\n> — [Tipo de usuario: Estudiante/Tutor, Documento X]\\n\\n[Incluir 5-8 citas clave]\\n\\n---\\n\\n### PASO 7: DECISIÓN DE REDISEÑO\\n\\nBasándote en la severidad de los problemas encontrados, determina si es necesario regresar al Paso 7 (rediseño).\\n\\n**Formato requerido:**\\n\\n## DECISIÓN: ¿REGRESAR AL PASO 7 (REDISEÑO)?\\n\\n**Decisión:** [SÍ / NO]\\n\\n**Justificación:**\\n[Explicación detallada de por qué sí o no basándote en los problemas críticos encontrados]\\n\\n**Criterios considerados:**\\n- Cantidad de problemas críticos: [X]\\n- Problemas que impiden completar tareas core: [SÍ/NO]\\n- Feedback negativo recurrente: [Descripción]\\n- Nivel de frustración de usuarios: [Alto/Medio/Bajo]\\n\\n**Si la respuesta es SÍ, temáticas sugeridas para el siguiente Sprint:**\\n1. [Temática 1]\\n2. [Temática 2]\\n3. [Temática 3]\\n\\n---\\n\\n## INSTRUCCIONES FINALES:\\n\\n1. **Analiza TODOS los PDFs adjuntos** - No dejes ninguno sin revisar\\n2. **Identifica el rol de cada usuario** - Distingue entre estudiantes y tutores\\n3. **Sé específico** - Cita fragmentos textuales cuando sea posible\\n4. **Identifica diferencias** - Si hay diferencias entre roles, documéntalas\\n5. **Prioriza** - Enfócate en problemas que realmente afectan la experiencia\\n6. **Sé objetivo** - Basa tus conclusiones en evidencia de las transcripciones\\n7. **Output en Markdown limpio** - Sin bloques de código (\\\\`\\\\`\\\\`), sin emojis\\n8. **Profesional** - El análisis debe ser formal y accionable\\n\\n¡Comienza el análisis ahora!`;\\n\\n// 4. PROCESAR LOS PDFs DESDE BINARY DATA\\nconst parts = [{ text: systemPrompt }];\\nconst binaryData = items[0].binary;\\nconst pdfList = [];\\n\\nconsole.log(\\\" Binary data disponible:\\\", Object.keys(binaryData));\\n\\n// Función auxiliar para buscar binary key\\nfunction encontrarBinaryKey(binaryData, pdfInfo, tipoUsuario) {\\n  const filename = pdfInfo.filename;\\n  \\n  // Intentar varias estrategias de búsqueda\\n  return Object.keys(binaryData).find(key => {\\n    const bin = binaryData[key];\\n    \\n    // Estrategia 1: Match exacto por filename\\n    if (bin.fileName === filename) return true;\\n    \\n    // Estrategia 2: El key contiene el tipo de usuario\\n    if (key.toLowerCase().includes(tipoUsuario.toLowerCase())) {\\n      // Y el tamaño coincide (con margen de error)\\n      if (Math.abs(bin.fileSize - pdfInfo.size) < 1000) return true;\\n    }\\n    \\n    return false;\\n  });\\n}\\n\\n// Procesar PDFs de Estudiante\\nif (pdfEstudiante && Array.isArray(pdfEstudiante)) {\\n  for (const pdf of pdfEstudiante) {\\n    const binaryKey = encontrarBinaryKey(binaryData, pdf, \\\"Estudiante\\\");\\n    \\n    if (binaryKey && binaryData[binaryKey]) {\\n      const buffer = await this.helpers.getBinaryDataBuffer(0, binaryKey);\\n      const base64String = buffer.toString('base64');\\n      \\n      parts.push({ \\n        inline_data: { \\n          mime_type: \\\"application/pdf\\\", \\n          data: base64String \\n        } \\n      });\\n      \\n      pdfList.push({\\n        tipo: \\\"Estudiante\\\",\\n        nombre: pdf.filename,\\n        tamaño: `${Math.round(pdf.size / 1024)} KB`\\n      });\\n      \\n      console.log(` PDF Estudiante: ${pdf.filename} (${Math.round(pdf.size / 1024)} KB)`);\\n    } else {\\n      console.warn(` No se encontró binary data para: ${pdf.filename}`);\\n    }\\n  }\\n}\\n\\n// Procesar PDFs de Tutor\\nif (pdfTutor && Array.isArray(pdfTutor)) {\\n  for (const pdf of pdfTutor) {\\n    const binaryKey = encontrarBinaryKey(binaryData, pdf, \\\"Tutor\\\");\\n    \\n    if (binaryKey && binaryData[binaryKey]) {\\n      const buffer = await this.helpers.getBinaryDataBuffer(0, binaryKey);\\n      const base64String = buffer.toString('base64');\\n      \\n      parts.push({ \\n        inline_data: { \\n          mime_type: \\\"application/pdf\\\", \\n          data: base64String \\n        } \\n      });\\n      \\n      pdfList.push({\\n        tipo: \\\"Tutor\\\",\\n        nombre: pdf.filename,\\n        tamaño: `${Math.round(pdf.size / 1024)} KB`\\n      });\\n      \\n      console.log(` PDF Tutor: ${pdf.filename} (${Math.round(pdf.size / 1024)} KB)`);\\n    } else {\\n      console.warn(` No se encontró binary data para: ${pdf.filename}`);\\n    }\\n  }\\n}\\n\\nconst pdfCount = pdfList.length;\\nconsole.log(`📊 Total de PDFs preparados: ${pdfCount}`);\\n\\nif (pdfCount === 0) {\\n  throw new Error(\\\" No se pudieron procesar los PDFs. Verifica los archivos subidos.\\\");\\n}\\n\\n// 5. RETORNAR ESTRUCTURA PARA GEMINI\\nreturn { \\n  json: { \\n    geminiBody: { \\n      contents: [{ parts: parts }] \\n    },\\n    metadatos: {\\n      objetivo_sprint: objetivoSprint,\\n      tipo_prueba: tipoPrueba,\\n      cantidad_pdfs: pdfCount,\\n      pdfs_procesados: pdfList,\\n      fecha_analisis: new Date().toISOString()\\n    }\\n  } \\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1264,
        48
      ],
      \"id\": \"f96ea3f6-e821-46fb-a27e-29d7fcfe73af\",
      \"name\": \"Preparar PDFs para Gemini\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO: Extraer y Validar Output de Gemini API\\n\\nconst geminiResponse = $input.first().json;\\n\\n// IMPORTANTE: Obtener metadatos del nodo \\\"Preparar PDFs para Gemini\\\"\\nconst metadatos = $('Preparar PDFs para Gemini').first()?.json?.metadatos || {};\\n\\n// 1. VALIDAR QUE GEMINI RESPONDIÓ CORRECTAMENTE\\nif (geminiResponse.error) {\\n  throw new Error(` Error de Gemini API: ${geminiResponse.error.message}`);\\n}\\n\\nif (!geminiResponse.candidates || geminiResponse.candidates.length === 0) {\\n  throw new Error(\\\" Gemini no devolvió ningún candidato de respuesta.\\\");\\n}\\n\\n// 2. EXTRAER EL TEXTO DEL ANÁLISIS\\nlet analisisTexto = \\\"\\\";\\n\\ntry {\\n  if (!geminiResponse.candidates?.[0]?.content?.parts?.[0]?.text) {\\n    console.error(\\\" Estructura recibida:\\\", JSON.stringify(geminiResponse, null, 2).substring(0, 500));\\n    throw new Error(\\\"Estructura de respuesta inesperada\\\");\\n  }\\n  analisisTexto = geminiResponse.candidates[0].content.parts[0].text;\\n} catch (error) {\\n  throw new Error(` No se pudo extraer el texto: ${error.message}`);\\n}\\n\\nif (!analisisTexto || analisisTexto.trim().length === 0) {\\n  throw new Error(\\\" El análisis generado está vacío.\\\");\\n}\\n\\n// 3. LIMPIAR BLOQUES MARKDOWN WRAPPER\\nanalisisTexto = analisisTexto.trim()\\n  .replace(/^```markdown\\\\s*\\\\n?/, \\\"\\\")\\n  .replace(/^```\\\\s*\\\\n?/, \\\"\\\")\\n  .replace(/\\\\n?```\\\\s*$/, \\\"\\\")\\n  .trim();\\n\\nconsole.log(\\\" Análisis extraído:\\\", analisisTexto.length, \\\"caracteres\\\");\\n\\n// 4. VALIDAR LONGITUD MÍNIMA\\nif (analisisTexto.length < 2000) {\\n  throw new Error(\\n    ` El análisis es demasiado corto (${analisisTexto.length} caracteres). Mínimo esperado: 2000 caracteres.`\\n  );\\n}\\n\\n// 5. VALIDAR SECCIONES REQUERIDAS\\nconst seccionesRequeridas = [\\n  \\\"PROBLEMAS DE USABILIDAD\\\",\\n  \\\"FEEDBACK\\\",\\n  \\\"HISTORIAS DE USUARIO\\\",\\n  \\\"RECOMENDACIONES\\\",\\n  \\\"PATRONES\\\",\\n  \\\"CITAS TEXTUALES\\\",\\n  \\\"DECISIÓN\\\"\\n];\\n\\nconst seccionesFaltantes = seccionesRequeridas.filter(\\n  seccion => !analisisTexto.toUpperCase().includes(seccion)\\n);\\n\\nif (seccionesFaltantes.length > 0) {\\n  console.warn(\\\" Secciones faltantes:\\\", seccionesFaltantes.join(\\\", \\\"));\\n}\\n\\n// 6. CONTAR HISTORIAS DE USUARIO, ISSUES Y PROBLEMAS\\nconst husEncontradas = analisisTexto.match(/\\\\*\\\\*HU-(\\\\d+):/g) || [];\\nconst issuesEncontrados = analisisTexto.match(/### Issue #(\\\\d+):/g) || [];\\nconst problemasEncontrados = analisisTexto.match(/### Problema \\\\d+:/g) || [];\\nconst problemasCriticos = analisisTexto.match(/\\\\*\\\\*Severidad:\\\\*\\\\*\\\\s*Crítica/gi) || [];\\n\\nconst cantidadHUs = husEncontradas.length;\\nconst cantidadIssues = issuesEncontrados.length;\\nconst cantidadProblemas = problemasEncontrados.length;\\nconst cantidadCriticos = problemasCriticos.length;\\n\\nconsole.log(` Análisis completado:`);\\nconsole.log(`   - Problemas identificados: ${cantidadProblemas} (${cantidadCriticos} críticos)`);\\nconsole.log(`   - HUs identificadas: ${cantidadHUs}`);\\nconsole.log(`   - Issues identificados: ${cantidadIssues}`);\\n\\n// 7. EXTRAER LA DECISIÓN DE REDISEÑO\\nlet decisionRediseno = \\\"NO ESPECIFICADA\\\";\\nconst matchDecision = analisisTexto.match(/\\\\*\\\\*Decisión:\\\\*\\\\*\\\\s*(SÍ|NO|SI)/i);\\nif (matchDecision) {\\n  decisionRediseno = matchDecision[1].toUpperCase().replace(\\\"SI\\\", \\\"SÍ\\\");\\n}\\n\\nconsole.log(` Decisión de rediseño: ${decisionRediseno}`);\\n\\n// 8. GENERAR NOMBRE DE ARCHIVO CON TIMESTAMP\\nconst ahora = new Date();\\nconst fecha = ahora.toISOString().split('T')[0];\\nconst hora = ahora.toTimeString().split(' ')[0].replace(/:/g, '-');\\nconst nombreArchivo = `Analisis_Pruebas_Usuario_${fecha}_${hora}`;\\n\\n// 9. AGREGAR ENCABEZADO CON METADATOS\\nconst objetivoSprint = metadatos.objetivo_sprint || \\\"No especificado\\\";\\nconst tipoPrueba = metadatos.tipo_prueba || \\\"No especificada\\\";\\nconst cantidadPDFs = metadatos.cantidad_pdfs || 0;\\n\\nconst encabezado = `# ANÁLISIS DE PRUEBAS DE USUARIO\\n\\n**Fecha del análisis:** ${ahora.toLocaleString('es-EC', { timeZone: 'America/Guayaquil' })}\\n**Objetivo del Sprint:** ${objetivoSprint}\\n**Tipo de Prueba:** ${tipoPrueba}\\n**Documentos analizados:** ${cantidadPDFs} PDF(s)\\n\\n---\\n\\n`;\\n\\nconst analisisFinal = encabezado + analisisTexto;\\n\\n// 10. ESTADÍSTICAS DE TOKENS\\nconst tokensUsados = geminiResponse.usageMetadata?.totalTokenCount || 0;\\nconst tokensPrompt = geminiResponse.usageMetadata?.promptTokenCount || 0;\\nconst tokensRespuesta = geminiResponse.usageMetadata?.candidatesTokenCount || 0;\\nconst modeloGemini = geminiResponse.modelVersion || \\\"desconocido\\\";\\n\\nconsole.log(` Tokens: ${tokensUsados} (Prompt: ${tokensPrompt}, Respuesta: ${tokensRespuesta})`);\\nconsole.log(` Modelo: ${modeloGemini}`);\\n\\n// 11. RETORNAR DATOS VALIDADOS Y ESTRUCTURADOS\\nreturn {\\n  json: {\\n    // Contenido principal\\n    analisis_markdown: analisisFinal,\\n    nombre_archivo: nombreArchivo,\\n    \\n    // Validación y métricas\\n    validacion: {\\n      tiene_problemas_usabilidad: cantidadProblemas > 0,\\n      tiene_problemas_criticos: cantidadCriticos > 0,\\n      tiene_nuevas_hus: cantidadHUs > 0,\\n      tiene_issues: cantidadIssues > 0,\\n      cantidad_problemas: cantidadProblemas,\\n      cantidad_criticos: cantidadCriticos,\\n      cantidad_hus: cantidadHUs,\\n      cantidad_issues: cantidadIssues,\\n      decision_rediseno: decisionRediseno,\\n      requiere_rediseno: decisionRediseno === \\\"SÍ\\\",\\n      longitud_caracteres: analisisFinal.length,\\n      secciones_faltantes: seccionesFaltantes,\\n      analisis_completo: seccionesFaltantes.length === 0\\n    },\\n    \\n    // Metadatos del contexto\\n    metadatos: {\\n      fecha_analisis: ahora.toISOString(),\\n      objetivo_sprint: objetivoSprint,\\n      tipo_prueba: tipoPrueba,\\n      cantidad_pdfs: cantidadPDFs,\\n      tokens_usados: tokensUsados,\\n      tokens_prompt: tokensPrompt,\\n      tokens_respuesta: tokensRespuesta,\\n      modelo_gemini: modeloGemini\\n    }\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1680,
        48
      ],
      \"id\": \"02462f25-89eb-4779-a8cd-e1d9136eefcb\",
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
        1904,
        48
      ],
      \"id\": \"c9278e48-f6f7-4d48-8a7b-f2a6667ca0f8\",
      \"name\": \"Subir a Wikis de Azure\"
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
        1472,
        48
      ],
      \"id\": \"f1b73126-9afd-4d7b-9ff9-a787d823a5af\",
      \"name\": \"Consultar a Gemini 2.5 Flash\"
    }
  ],
  \"connections\": {
    \"Subida Transcripciones Evalación de Usuario\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar PDFs para Gemini\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
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

[← Prompt 054](/04-orquestacion-productiva/054/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 056 →](/04-orquestacion-productiva/056/)
{% endraw %}
