---
layout: default
title: '072. { ''nodes'': [ { ''parameters'': {}, ''id'': ''4c4b9f2b-adfc-4...'
parent: Orquestación n8n productiva
nav_order: 72
permalink: /04-orquestacion-productiva/072/
---

{% raw %}

# Prompt 072
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 15,295 caracteres &middot; **Posición en la conversación:** 72 de 103

---

```
{
  \"nodes\": [
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
        \"jsCode\": \"// NODO NORMALIZADOR DE INPUTS + PRESERVAR PDFS\\n\\nconst items = $input.all();\\n\\nreturn items.map(item => {\\n  const jsonData = item.json || {};\\n\\n  const objetivo =\\n    jsonData.objetivo_sprint ||\\n    jsonData['Objetivo del Sprint'] ||\\n    'Análisis de Usabilidad General';\\n\\n  const tipo =\\n    jsonData.tipo_prueba ||\\n    jsonData['Tipo de Prueba'] ||\\n    'Prueba de Usuario';\\n\\n  return {\\n    json: {\\n      ...jsonData, // 🔥 preserva campos del formulario\\n      \\\"Objetivo del Sprint\\\": objetivo,\\n      \\\"Tipo de Prueba\\\": tipo,\\n      source: jsonData.objetivo_sprint ? 'agent' : 'form'\\n    },\\n    binary: item.binary // 🔥🔥🔥 CLAVE: reenviar PDFs\\n  };\\n});\\n\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        2000,
        400
      ],
      \"id\": \"cd11b0cc-8809-4101-b77c-def93c0eb023\",
      \"name\": \"Normalizar Inputs\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO: Preparar PDFs y contexto para Gemini\\n\\nconst items = $input.all();\\nconst jsonInputs = items[0].json;\\n\\n// 1. OBTENER DATOS DEL FORMULARIO\\nconst objetivoSprint = jsonInputs[\\\"Objetivo del Sprint\\\"];\\nconst tipoPrueba = jsonInputs[\\\"Tipo de Prueba\\\"] || \\\"Prueba de Usuario\\\";\\n\\nif (!objetivoSprint) {\\n  throw new Error(\\\" Falta el objetivo del sprint.\\\");\\n}\\n\\n// 2. OBTENER LOS PDFs DEL JSON\\nconst pdfEstudiante = jsonInputs[\\\"Transcripción Evaluación Estudiante\\\"];\\nconst pdfTutor = jsonInputs[\\\"Transcripción Evaluación Tutor\\\"];\\n\\nif (!pdfEstudiante && !pdfTutor) {\\n  throw new Error(\\\" No se encontraron PDFs subidos.\\\");\\n}\\n\\nconsole.log(\\\"📋 Datos del formulario:\\\", {\\n  objetivo: objetivoSprint,\\n  tipo: tipoPrueba,\\n  archivosEstudiante: pdfEstudiante?.length || 0,\\n  archivosTutor: pdfTutor?.length || 0\\n});\\n\\n// 3. CONSTRUIR PROMPT DEL SISTEMA\\nconst systemPrompt = `Eres un experto en Diseño Centrado en el Usuario (DCU) especializado en análisis de pruebas de usabilidad y extracción de insights accionables siguiendo metodologías de UX Research.\\n\\n---\\n\\n## CONTEXTO DEL PROYECTO\\n\\n**Objetivo del Sprint:** ${objetivoSprint}\\n\\n**Tipo de Prueba Realizada:** ${tipoPrueba}\\n\\n**Transcripciones Adjuntas:**\\nA continuación se adjuntan los PDFs con las transcripciones de las entrevistas de usuario. Pueden ser:\\n- Múltiples PDFs de usuarios estudiantes/buscadores\\n- Múltiples PDFs de usuarios tutores/ofertantes\\n\\nAnaliza TODOS los documentos adjuntos.\\n\\n---\\n\\n## TU TAREA\\n\\nAnaliza TODOS los PDFs adjuntos y extrae:\\n\\n### PASO 1: IDENTIFICACIÓN DE PROBLEMAS DE USABILIDAD\\n\\nIdentifica y documenta TODOS los problemas de usabilidad mencionados por los usuarios.\\n\\n**Formato requerido:**\\n\\n## PROBLEMAS DE USABILIDAD IDENTIFICADOS\\n\\n### Problema 1: [Título descriptivo del problema]\\n**Severidad:** [Crítica/Alta/Media/Baja]\\n**Usuario afectado:** [Estudiante/Tutor/Ambos]\\n**Descripción:** [Descripción detallada del problema]\\n**Cita textual:** \\\"[Fragmento de la transcripción que evidencia el problema]\\\"\\n**Impacto:** [Cómo afecta la experiencia del usuario]\\n\\n[Repetir para cada problema identificado]\\n\\n---\\n\\n### PASO 2: FEEDBACK ESPECÍFICO SOBRE EL PROTOTIPO\\n\\nDocumenta el feedback positivo y negativo sobre características específicas.\\n\\n**Formato requerido:**\\n\\n## FEEDBACK SOBRE EL PROTOTIPO\\n\\n### Aspectos Positivos\\n- **[Característica]:** [Comentario del usuario]\\n- [Repetir...]\\n\\n### Aspectos a Mejorar\\n- **[Característica]:** [Comentario del usuario]\\n- [Repetir...]\\n\\n### Sugerencias de los Usuarios\\n- [Sugerencia 1]\\n- [Sugerencia 2]\\n\\n---\\n\\n### PASO 3: EXTRACCIÓN DE NUEVAS HISTORIAS DE USUARIO E ISSUES\\n\\nIdentifica nuevas funcionalidades solicitadas o necesidades expresadas.\\n\\n**Formato requerido:**\\n\\n## NUEVAS HISTORIAS DE USUARIO E ISSUES\\n\\n### Historias de Usuario:\\n\\n#### Formato Completo (cuando hay suficiente información):\\n**HU-001: [Título descriptivo de la funcionalidad]**\\n**Como** [tipo de usuario]\\n**Quiero** [acción/funcionalidad]\\n**Para** [beneficio/objetivo]\\n\\n#### Formato Simplificado (cuando solo se identifica la necesidad):\\n**HU-002: [Título descriptivo]**\\n**Descripción breve:** [1-2 líneas explicando la necesidad identificada]\\n\\n### Issues/Bugs Identificados:\\n\\n## ISSUES/BUGS IDENTIFICADOS\\n\\n### Issue #1: [Título del bug/problema]\\n**Severidad:** [Crítica/Alta/Media/Baja]\\n**Usuario reportante:** [Estudiante/Tutor]\\n**Descripción:** [Qué está fallando]\\n**Pasos para reproducir:** [Si aplica]\\n**Comportamiento esperado:** [Cómo debería funcionar]\\n\\n---\\n\\n### PASO 4: RECOMENDACIONES DE MEJORA\\n\\nProporciona recomendaciones priorizadas basadas en los hallazgos.\\n\\n**Formato requerido:**\\n\\n## RECOMENDACIONES DE MEJORA\\n\\n### Prioridad Alta (Críticas)\\n1. **[Título de recomendación]**\\n   - **Problema que resuelve:** [Descripción]\\n   - **Acción sugerida:** [Qué hacer]\\n   - **Impacto esperado:** [Beneficio]\\n\\n### Prioridad Media (Importantes)\\n[Mismo formato]\\n\\n### Prioridad Baja (Mejoras incrementales)\\n[Mismo formato]\\n\\n---\\n\\n### PASO 5: ANÁLISIS DE PATRONES Y TENDENCIAS\\n\\nIdentifica patrones recurrentes en el comportamiento o feedback.\\n\\n**Formato requerido:**\\n\\n## PATRONES Y TENDENCIAS OBSERVADAS\\n\\n### Patrón 1: [Nombre del patrón]\\n**Frecuencia:** [Mencionado por X usuarios]\\n**Descripción:** [Qué patrón se observó]\\n**Implicaciones:** [Qué significa para el diseño]\\n\\n---\\n\\n### PASO 6: CITAS TEXTUALES DESTACADAS\\n\\nExtrae las citas más reveladoras de los usuarios.\\n\\n**Formato requerido:**\\n\\n## CITAS TEXTUALES DESTACADAS\\n\\n> \\\"[Cita textual del usuario]\\\"\\n> — [Tipo de usuario: Estudiante/Tutor, Documento X]\\n\\n[Incluir 5-8 citas clave]\\n\\n---\\n\\n### PASO 7: DECISIÓN DE REDISEÑO\\n\\nBasándote en la severidad de los problemas encontrados, determina si es necesario regresar al Paso 7 (rediseño).\\n\\n**Formato requerido:**\\n\\n## DECISIÓN: ¿REGRESAR AL PASO 7 (REDISEÑO)?\\n\\n**Decisión:** [SÍ / NO]\\n\\n**Justificación:**\\n[Explicación detallada de por qué sí o no basándote en los problemas críticos encontrados]\\n\\n**Criterios considerados:**\\n- Cantidad de problemas críticos: [X]\\n- Problemas que impiden completar tareas core: [SÍ/NO]\\n- Feedback negativo recurrente: [Descripción]\\n- Nivel de frustración de usuarios: [Alto/Medio/Bajo]\\n\\n**Si la respuesta es SÍ, temáticas sugeridas para el siguiente Sprint:**\\n1. [Temática 1]\\n2. [Temática 2]\\n3. [Temática 3]\\n\\n---\\n\\n## INSTRUCCIONES FINALES:\\n\\n1. **Analiza TODOS los PDFs adjuntos** - No dejes ninguno sin revisar\\n2. **Identifica el rol de cada usuario** - Distingue entre estudiantes y tutores\\n3. **Sé específico** - Cita fragmentos textuales cuando sea posible\\n4. **Identifica diferencias** - Si hay diferencias entre roles, documéntalas\\n5. **Prioriza** - Enfócate en problemas que realmente afectan la experiencia\\n6. **Sé objetivo** - Basa tus conclusiones en evidencia de las transcripciones\\n7. **Output en Markdown limpio** - Sin bloques de código (\\\\`\\\\`\\\\`), sin emojis\\n8. **Profesional** - El análisis debe ser formal y accionable\\n\\n¡Comienza el análisis ahora!`;\\n\\n// 4. PROCESAR LOS PDFs DESDE BINARY DATA\\nconst parts = [{ text: systemPrompt }];\\nconst binaryData = items[0].binary;\\nconst pdfList = [];\\n\\nconsole.log(\\\" Binary data disponible:\\\", Object.keys(binaryData));\\n\\n// Función auxiliar para buscar binary key\\nfunction encontrarBinaryKey(binaryData, pdfInfo, tipoUsuario) {\\n  const filename = pdfInfo.filename;\\n  \\n  // Intentar varias estrategias de búsqueda\\n  return Object.keys(binaryData).find(key => {\\n    const bin = binaryData[key];\\n    \\n    // Estrategia 1: Match exacto por filename\\n    if (bin.fileName === filename) return true;\\n    \\n    // Estrategia 2: El key contiene el tipo de usuario\\n    if (key.toLowerCase().includes(tipoUsuario.toLowerCase())) {\\n      // Y el tamaño coincide (con margen de error)\\n      if (Math.abs(bin.fileSize - pdfInfo.size) < 1000) return true;\\n    }\\n    \\n    return false;\\n  });\\n}\\n\\n// Procesar PDFs de Estudiante\\nif (pdfEstudiante && Array.isArray(pdfEstudiante)) {\\n  for (const pdf of pdfEstudiante) {\\n    const binaryKey = encontrarBinaryKey(binaryData, pdf, \\\"Estudiante\\\");\\n    \\n    if (binaryKey && binaryData[binaryKey]) {\\n      const buffer = await this.helpers.getBinaryDataBuffer(0, binaryKey);\\n      const base64String = buffer.toString('base64');\\n      \\n      parts.push({ \\n        inline_data: { \\n          mime_type: \\\"application/pdf\\\", \\n          data: base64String \\n        } \\n      });\\n      \\n      pdfList.push({\\n        tipo: \\\"Estudiante\\\",\\n        nombre: pdf.filename,\\n        tamaño: `${Math.round(pdf.size / 1024)} KB`\\n      });\\n      \\n      console.log(` PDF Estudiante: ${pdf.filename} (${Math.round(pdf.size / 1024)} KB)`);\\n    } else {\\n      console.warn(` No se encontró binary data para: ${pdf.filename}`);\\n    }\\n  }\\n}\\n\\n// Procesar PDFs de Tutor\\nif (pdfTutor && Array.isArray(pdfTutor)) {\\n  for (const pdf of pdfTutor) {\\n    const binaryKey = encontrarBinaryKey(binaryData, pdf, \\\"Tutor\\\");\\n    \\n    if (binaryKey && binaryData[binaryKey]) {\\n      const buffer = await this.helpers.getBinaryDataBuffer(0, binaryKey);\\n      const base64String = buffer.toString('base64');\\n      \\n      parts.push({ \\n        inline_data: { \\n          mime_type: \\\"application/pdf\\\", \\n          data: base64String \\n        } \\n      });\\n      \\n      pdfList.push({\\n        tipo: \\\"Tutor\\\",\\n        nombre: pdf.filename,\\n        tamaño: `${Math.round(pdf.size / 1024)} KB`\\n      });\\n      \\n      console.log(` PDF Tutor: ${pdf.filename} (${Math.round(pdf.size / 1024)} KB)`);\\n    } else {\\n      console.warn(` No se encontró binary data para: ${pdf.filename}`);\\n    }\\n  }\\n}\\n\\nconst pdfCount = pdfList.length;\\nconsole.log(`📊 Total de PDFs preparados: ${pdfCount}`);\\n\\nif (pdfCount === 0) {\\n  throw new Error(\\\" No se pudieron procesar los PDFs. Verifica los archivos subidos.\\\");\\n}\\n\\n// 5. RETORNAR ESTRUCTURA PARA GEMINI\\nreturn { \\n  json: { \\n    geminiBody: { \\n      contents: [{ parts: parts }] \\n    },\\n    metadatos: {\\n      objetivo_sprint: objetivoSprint,\\n      tipo_prueba: tipoPrueba,\\n      cantidad_pdfs: pdfCount,\\n      pdfs_procesados: pdfList,\\n      fecha_analisis: new Date().toISOString()\\n    }\\n  } \\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        2224,
        400
      ],
      \"id\": \"b14f04c0-c60d-42f1-a946-27f9ee724b5d\",
      \"name\": \"Preparar PDFs para Gemini\"
    }
  ],
  \"connections\": {
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
    },
    \"Preparar PDFs para Gemini\": {
      \"main\": [
        []
      ]
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

Aqui cuando es mnaul funciona pero cuando viene desde el excute trigger no, se quirurjico y dime que cambiar
```

---

### Navegación

[← Prompt 071](/04-orquestacion-productiva/071/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 073 →](/04-orquestacion-productiva/073/)
{% endraw %}
