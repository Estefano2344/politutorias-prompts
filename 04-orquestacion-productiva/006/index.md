---
layout: default
title: '006. Ahora que esta el inicial de SCRUM pasemos al de DISCOVERY { ''nam…'
parent: Orquestación n8n productiva
nav_order: 6
permalink: /04-orquestacion-productiva/006/
---

{% raw %}

# Prompt 006
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 91,277 caracteres &middot; **Posición en la conversación:** 6 de 103

---

```
Ahora que esta el inicial de SCRUM pasemos al de DISCOVERY



{
  \"name\": \"Flujo DCU V3\",
  \"nodes\": [
    {
      \"parameters\": {
        \"formTitle\": \"Inicio Sprint DCU\",
        \"formDescription\": \"Inicio de la toma de información relacionada al contexto inicial de la aplicación\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldLabel\": \"Contexto_App\",
              \"fieldType\": \"textarea\",
              \"placeholder\": \"Describe el contexto de la app\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Objetivo_Sprint\",
              \"fieldType\": \"textarea\",
              \"placeholder\": \"Indica el objetivo del Sprint\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"HUs_Epicas\",
              \"fieldType\": \"textarea\",
              \"placeholder\": \"Coloca las HUs épicas correspondientes al Release\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Investigacion_PDF\",
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
        0,
        0
      ],
      \"id\": \"bbc0aa1d-8813-4faa-b5e1-fcf30707142c\",
      \"name\": \"Contexto de la App + Fase 1 DCU\",
      \"webhookId\": \"bca8f3c9-77fa-4ae4-99b8-1813d2223c60\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. OBTENCIÓN DE DATOS\\nconst item = $input.first();\\nconst jsonInputs = item.json;\\nconst binaryInputs = item.binary;\\nconst contexto = jsonInputs.Contexto_App || \\\"No especificado\\\";\\nconst objetivo = jsonInputs.Objetivo_Sprint || \\\"No especificado\\\";\\nconst epicas = jsonInputs.HUs_Epicas || \\\"No especificadas\\\";\\n\\n// 2. PROMPT \\nconst systemPrompt = `\\nROL: Lead UX Researcher & Senior Product Designer experto en User Story Mapping y análisis cualitativo de investigación de usuarios.\\n\\nINPUTS: \\n- Contexto del Producto: \\\"${contexto}\\\"\\n- Objetivo del Sprint Actual: \\\"${objetivo}\\\"\\n- Épicas respectivas al Release: \\\"${epicas}\\\"\\n\\n## TAREA CRÍTICA:\\n\\nAnaliza las transcripciones de las entrevistas (PDFs adjuntos) y:\\n\\n1. **Extrae personas reales** de los entrevistados (nombres, edades, comportamientos, frustraciones)\\n2. **Identifica insights, pain points y necesidades** mencionadas explícitamente\\n3. **Genera HUs basadas ÚNICAMENTE en lo que dijeron los usuarios** en las entrevistas\\n4. **Filtra las épicas** para incluir SOLO las que corresponden al objetivo del Sprint actual\\n5. **Crea el Story Map** con HUs derivadas de la investigación\\n\\n## ALCANCE DEL SPRINT:\\n\\n**REGLA CRÍTICA:** Solo trabaja con las épicas que están relacionadas con el objetivo del Sprint.\\n\\n**Proceso de filtrado:**\\n1. Lee el objetivo del Sprint: \\\"${objetivo}\\\"\\n2. Identifica qué épicas contribuyen directamente a ese objetivo\\n3. SOLO esas épicas van en el story_map\\n4. Las épicas que NO están en el objetivo del Sprint NO deben aparecer en el JSON\\n\\n**Ejemplo:**\\n- Objetivo: \\\"Ofertar tutorías por tutores y descubrir tutorías por estudiantes\\\"\\n- Épicas incluidas: EP01 (Oferta tutorías), EP02 (Encontrar tutorías)\\n- Épicas EXCLUIDAS: EP03 (Reputación) → NO aparece en el JSON\\n\\n## ANÁLISIS DE TRANSCRIPCIONES:\\n\\n**PROHIBIDO inventar HUs genéricas.** Todas las HUs deben surgir de:\\n\\n**Pain points mencionados** por los usuarios\\n**Necesidades expresadas** en las entrevistas\\n**Comportamientos observados** al describir su experiencia\\n**Frustraciones** con soluciones actuales\\n**Deseos o expectativas** que compartieron\\n\\n**Proceso:**\\n1. Lee las transcripciones completas de los PDFs\\n2. Identifica frases clave donde el usuario expresa problemas o necesidades\\n3. Por cada insight, genera la HU correspondiente\\n4. Anota mentalmente la cita que justifica cada HU (para research_synthesis)\\n\\n**Ejemplo de derivación:**\\n- Usuario dice: \\\"Me da desconfianza contratar a alguien si no veo las estrellas ni comentarios\\\"\\n- → HU: \\\"Ver calificación promedio del tutor\\\"\\n- → HU: \\\"Ver reseñas de otros estudiantes\\\"\\n\\n## ESTRUCTURA DEL BACKBONE:\\n\\nPara cada épica del Sprint, descompón el journey del usuario en los pasos que sean necesarios.\\n\\n**Cada paso = Una actividad o etapa del flujo del usuario**\\n\\n**NO HAY LÍMITE en la cantidad de pasos:**\\n- Si el journey tiene 3 pasos → crea 3 pasos\\n- Si el journey tiene 7 pasos → crea 7 pasos\\n- La cantidad la determina el flujo real que describió el usuario en la entrevista\\n\\n**Ejemplos de pasos (solo referencias, no límites):**\\n\\nPara EP02 (Encontrar tutorías) podría tener:\\n1. \\\"Explorar ofertas disponibles\\\"\\n2. \\\"Buscar por criterios específicos\\\"\\n3. \\\"Evaluar confiabilidad del tutor\\\"\\n4. \\\"Comparar opciones\\\"\\n5. \\\"Solicitar tutoría\\\"\\n6. \\\"Dar seguimiento a la solicitud\\\"\\n7. \\\"Confirmar o cancelar\\\"\\n\\nO podría tener solo 4 pasos si el usuario describió un flujo más simple.\\n\\n**IMPORTANTE:** Cada paso debe:\\n- Representar una actividad diferente y clara\\n- Tener sentido como etapa independiente\\n- Estar basado en el journey que los usuarios describieron en las entrevistas\\n- NO agrupar múltiples actividades en un solo paso si son distintas\\n\\n## CLASIFICACIÓN MVP vs RESTO:\\n\\n**MVP (historias_mvp) = HUs MEDIADORAS:**\\nUna HU es mediadora si:\\n- Sin ella, el usuario NO puede completar el paso del Backbone\\n- Es indispensable para que el flujo sea funcional\\n- Responde \\\"NO\\\" a: \\\"¿Puede el usuario completar este paso SIN esta HU?\\\"\\n\\n**RESTO (historias_resto) = HUs COMPLEMENTARIAS:**\\n- Mejoras de experiencia (filtros avanzados, ordenamiento)\\n- Información adicional (biografías, estadísticas)\\n- Funcionalidades opcionales (notificaciones, favoritos)\\n- Features \\\"nice to have\\\"\\n\\n**NO HAY LÍMITE de HUs en MVP:**\\n- Si un paso necesita 3 HUs para funcionar → las 3 van al MVP\\n- Si solo necesita 1 → solo 1 va al MVP\\n- La cantidad la determina qué tan crítica es cada HU para el paso\\n\\n**Ejemplo de clasificación:**\\n\\nPaso: \\\"Evaluar confiabilidad del tutor\\\"\\n\\nAnálisis de la transcripción:\\n- Usuario mencionó: \\\"No confío si no veo calificaciones\\\"\\n- Usuario mencionó: \\\"Leo los comentarios antes de decidir\\\"\\n\\nClasificación:\\n- MVP: \\\"Ver calificación del tutor\\\" (mediadora - sin esto no hay confianza)\\n- MVP: \\\"Ver reseñas de estudiantes\\\" (mediadora - necesaria para decidir)\\n- Resto: \\\"Ver biografía detallada del tutor\\\" (complementaria)\\n- Resto: \\\"Ver estadísticas de tutorías completadas\\\" (complementaria)\\n\\n## GENERACIÓN DE PERSONAS REALES:\\n\\n**PROHIBIDO inventar personas ficticias.**\\n\\n1. **Identifica a los entrevistados** en los PDFs (nombres, roles)\\n2. **Extrae datos demográficos** mencionados (edad, carrera, año de estudio)\\n3. **Captura sus citas textuales** más reveladoras\\n4. **Construye el perfil** basándote en lo que dijeron\\n\\nSi hay 2 PDFs (estudiante + tutor) → crea 2 personas reales.\\n\\n**Usa información real:**\\n- Nombre: del PDF o genera uno coherente con el contexto\\n- Edad, carrera, dispositivos: de lo mencionado en la entrevista\\n- Bio: narrativa basada en su historia contada\\n- Frase cita: literal del PDF\\n- Motivaciones/frustraciones: de sus propias palabras\\n\\n## SALIDA REQUERIDA (JSON):\\n\\n{\\n  \\\"personas\\\": [\\n    {\\n      \\\"rol_usuario\\\": \\\"[Rol del entrevistado: Estudiante/Tutor]\\\",\\n      \\\"perfil_demografico\\\": {\\n        \\\"nombre_completo\\\": \\\"[Nombre real o generado contextualmente]\\\",\\n        \\\"edad\\\": \\\"[De la transcripción]\\\",\\n        \\\"ubicacion\\\": \\\"Quito, Ecuador\\\",\\n        \\\"rol_ocupacion\\\": \\\"[Carrera y nivel mencionados]\\\",\\n        \\\"dispositivos\\\": [\\\"[Mencionados o inferidos]\\\"],\\n        \\\"apps_mas_usadas\\\": [\\\"[Mencionadas en la entrevista]\\\"]\\n      },\\n      \\\"bio\\\": \\\"[Narrativa de 40+ palabras basada en lo que contó en la entrevista]\\\",\\n      \\\"frase_cita\\\": \\\"[Cita textual literal del PDF que capture su mentalidad]\\\",\\n      \\\"columnas_clave\\\": {\\n        \\\"motivaciones\\\": [\\\"[De la transcripción]\\\", \\\"...\\\"],\\n        \\\"objetivos\\\": [\\\"[De la transcripción]\\\", \\\"...\\\"],\\n        \\\"frustraciones\\\": [\\\"[De la transcripción]\\\", \\\"...\\\"]\\n      },\\n      \\\"personalidad_sliders\\\": {\\n        \\\"introvertido_extrovertido\\\": 5,\\n        \\\"analitico_creativo\\\": 5,\\n        \\\"impaciente_paciente\\\": 5,\\n        \\\"desordenado_organizado\\\": 5\\n      },\\n      \\\"adjetivos_clave\\\": [\\\"[Basados en comportamiento/tono en entrevista]\\\"]\\n    }\\n  ],\\n  \\\"story_map\\\": {\\n    \\\"epicas\\\": [\\n      // SOLO épicas del Sprint actual (filtradas por objetivo)\\n      {\\n        \\\"numero\\\": 1,\\n        \\\"titulo\\\": \\\"Oferta tutorías\\\",\\n        \\\"persona_asociada\\\": \\\"Tutor\\\",\\n        \\\"descripcion_user_story\\\": \\\"COMO tutor QUIERO ofertar tutorías PARA conectar con estudiantes\\\",\\n        \\\"pasos_backbone\\\": [\\n          // Tantos pasos como sean necesarios según el journey real\\n          {\\n            \\\"nombre_paso\\\": \\\"Crear perfil de tutor\\\",\\n            \\\"historias_mvp\\\": [\\n              {\\\"hu_id\\\": \\\"HU01\\\", \\\"titulo\\\": \\\"Registrar nombre y materias que domino\\\"}\\n            ],\\n            \\\"historias_resto\\\": [\\n              {\\\"hu_id\\\": \\\"HU02\\\", \\\"titulo\\\": \\\"Añadir foto de perfil\\\"},\\n              {\\\"hu_id\\\": \\\"HU03\\\", \\\"titulo\\\": \\\"Escribir biografía detallada\\\"}\\n            ]\\n          },\\n          {\\n            \\\"nombre_paso\\\": \\\"Definir disponibilidad horaria\\\",\\n            \\\"historias_mvp\\\": [\\n              {\\\"hu_id\\\": \\\"HU04\\\", \\\"titulo\\\": \\\"Marcar bloques de horario disponibles\\\"}\\n            ],\\n            \\\"historias_resto\\\": [\\n              {\\\"hu_id\\\": \\\"HU05\\\", \\\"titulo\\\": \\\"Configurar disponibilidad recurrente\\\"}\\n            ]\\n          }\\n          // ... más pasos según el journey del usuario\\n        ]\\n      }\\n    ]\\n  },\\n  \\\"research_synthesis\\\": {\\n    \\\"hallazgos_clave\\\": [\\n      \\\"[Insight específico extraído de las transcripciones]\\\",\\n      \\\"[Patrón de comportamiento observado]\\\",\\n      \\\"[Pain point recurrente mencionado]\\\"\\n    ],\\n    \\\"citas_textuales\\\": [\\n      \\\"[Cita literal del PDF de estudiante que evidencia un problema]\\\",\\n      \\\"[Cita literal del PDF de tutor sobre su experiencia]\\\",\\n      \\\"[Cita que fundamenta una HU crítica]\\\"\\n    ]\\n  },\\n  \\\"atomic_hints\\\": {\\n    \\\"paleta_de_colores\\\": [\\\"#3B82F6 (azul confianza)\\\", \\\"#10B981 (verde éxito)\\\", \\\"#F59E0B (amarillo atención)\\\"],\\n    \\\"tipografia_sugerida\\\": \\\"Inter o System UI (moderna, legible)\\\",\\n    \\\"estilo_visual\\\": \\\"Limpio, profesional, inspirador de confianza\\\"\\n  }\\n}\\n\\n## VALIDACIONES FINALES:\\n\\nAntes de devolver el JSON, verifica:\\n\\n1. ✅ **Alcance:** Solo épicas relacionadas con el objetivo del Sprint están incluidas\\n2. ✅ **Trazabilidad:** Cada HU puede vincularse a un insight de las transcripciones\\n3. ✅ **Personas reales:** Los perfiles se basan en los entrevistados, no son ficticios\\n4. ✅ **MVP correcto:** Solo HUs mediadoras en historias_mvp (sin límite artificial)\\n5. ✅ **Backbone completo:** Cada épica tiene los pasos necesarios según el journey real\\n6. ✅ **Research synthesis:** Contiene citas literales de los PDFs\\n7. ✅ **Pasos del Backbone:** Cada paso es una actividad diferenciada, no están agrupados artificialmente\\n\\n## RESTRICCIONES:\\n\\n- ❌ NO usar emojis en el JSON\\n- ❌ NO incluir épicas fuera del Sprint actual\\n- ❌ NO inventar personas ficticias genéricas\\n- ❌ NO generar HUs sin base en la investigación\\n- ❌ NO limitar artificialmente la cantidad de pasos del Backbone\\n- ❌ NO limitar artificialmente la cantidad de HUs en MVP\\n- ❌ NO envolver en bloques de código markdown\\n- ❌ NO agregar texto explicativo adicional\\n\\nDevuelve SOLO el JSON válido.\\n`;\\n\\n// 3. PROCESAMIENTO\\nconst parts = [];\\nparts.push({ text: systemPrompt });\\n\\nif (binaryInputs) {\\n  for (const key of Object.keys(binaryInputs)) {\\n    const buffer = await this.helpers.getBinaryDataBuffer(0, key);\\n    const base64String = buffer.toString('base64');\\n    parts.push({ \\n      inline_data: { \\n        mime_type: \\\"application/pdf\\\", \\n        data: base64String \\n      } \\n    });\\n  }\\n}\\n\\nreturn { \\n  json: { \\n    geminiBody: { \\n      contents: [{ parts: parts }] \\n    } \\n  } \\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        224,
        0
      ],
      \"id\": \"75e2f06e-468e-403c-90d2-2cd743ff9d44\",
      \"name\": \"Preparar Prompt + PDFs\"
    },
    {
      \"parameters\": {
        \"method\": \"POST\",
        \"url\": \"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-pro:generateContent\",
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
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        480,
        0
      ],
      \"id\": \"00b87fca-0224-4bb8-ac1b-f69f9e656c5b\",
      \"name\": \"Consultar Gemini Pro\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. OBTENCIÓN DE TEXTO (Robusta)\\nconst inputJson = $input.first().json;\\nlet rawText = \\\"\\\";\\n\\n// Buscamos el texto donde sea que el modelo lo haya puesto\\nif (inputJson.candidates && inputJson.candidates[0].content) {\\n    rawText = inputJson.candidates[0].content.parts[0].text;\\n} else if (inputJson.text) {\\n    rawText = inputJson.text;\\n} else {\\n    throw new Error(\\\"No se encontró texto en la respuesta de Gemini.\\\");\\n}\\n\\n// 2. EXTRACCIÓN (Técnica del Cirujano)\\nconst firstBrace = rawText.indexOf('{');\\nconst lastBrace = rawText.lastIndexOf('}');\\n\\nif (firstBrace === -1 || lastBrace === -1) {\\n    throw new Error(\\\"La IA no devolvió un JSON válido (faltan llaves {}).\\\");\\n}\\n\\nlet cleanJsonString = rawText.substring(firstBrace, lastBrace + 1);\\n\\n// 3. LIMPIEZA AVANZADA\\n// Eliminamos comentarios // y bloques markdown\\ncleanJsonString = cleanJsonString\\n    .replace(/\\\\s\\\\/\\\\/.*$/gm, \\\"\\\") \\n    .replace(/```json/gi, '') \\n    .replace(/```/g, '')\\n    .trim();\\n\\ntry {\\n    // 4. PARSEO\\n    const parsedData = JSON.parse(cleanJsonString);\\n    \\n    // 5. NORMALIZACIÓN DE DATOS\\n    \\n    // A. Personas: Convertimos lo que llegue en una lista estándar\\n    let personasList = [];\\n    if (parsedData.personas && Array.isArray(parsedData.personas)) {\\n        personasList = parsedData.personas; // Estructura Nueva\\n    } else if (parsedData.persona_data) {\\n        personasList = [parsedData.persona_data]; // Estructura Vieja (Fallback)\\n    }\\n    \\n    // B. Story Map: Buscamos el nombre nuevo O el viejo y validamos estructura\\n    let storyMapData = parsedData.story_map || parsedData.story_map_foundation || {};\\n    \\n    // Validar que el story_map tenga la estructura correcta con épicas\\n    if (storyMapData && !storyMapData.epicas) {\\n        // Si tiene la estructura vieja, intentamos adaptarla\\n        if (storyMapData.backbone || storyMapData.historias) {\\n            console.log(\\\"Detectada estructura vieja de Story Map, adaptando...\\\");\\n            storyMapData = {\\n                epicas: storyMapData.epicas || []\\n            };\\n        }\\n    }\\n    \\n    // Validar que cada épica tenga pasos_backbone\\n    if (storyMapData.epicas && Array.isArray(storyMapData.epicas)) {\\n        storyMapData.epicas.forEach((epica, idx) => {\\n            // Asegurar que pasos_backbone existe y es un array\\n            if (!epica.pasos_backbone || !Array.isArray(epica.pasos_backbone)) {\\n                console.log(`Épica ${idx + 1}: pasos_backbone no es un array válido`);\\n                epica.pasos_backbone = [];\\n            }\\n            \\n            // Validar cada paso del backbone\\n            epica.pasos_backbone.forEach((paso, pIdx) => {\\n                if (!paso.historias_mvp) paso.historias_mvp = [];\\n                if (!paso.historias_resto) paso.historias_resto = [];\\n                \\n                // Limpiar prioridades si existen (no deberían estar)\\n                paso.historias_mvp = paso.historias_mvp.map(hu => {\\n                    const { prioridad, ...cleanHu } = hu;\\n                    return cleanHu;\\n                });\\n                \\n                paso.historias_resto = paso.historias_resto.map(hu => {\\n                    const { prioridad, ...cleanHu } = hu;\\n                    return cleanHu;\\n                });\\n            });\\n        });\\n    }\\n    \\n    // C. Research Synthesis\\n    const researchData = parsedData.research_synthesis || parsedData.sintesis || {};\\n    \\n    // D. Atomic Hints: Buscamos el nombre nuevo O el viejo\\n    const atomicData = parsedData.atomic_hints || parsedData.atomic_design_hints || {};\\n    \\n    // 6. SALIDA ESTRUCTURADA\\n    return {\\n        json: {\\n            // Lista completa (para el PDF de Personas con múltiples páginas)\\n            personas_list: personasList,\\n            \\n            // Usuario Principal (para Journey Map y Story Map que esperan uno solo)\\n            persona_data: personasList[0] || {}, \\n            \\n            // Story Map validado y normalizado\\n            story_map: storyMapData,\\n            \\n            // Research synthesis\\n            sintesis: researchData,\\n            \\n            // Atomic hints\\n            atomic_hints: atomicData,\\n            \\n            // Metadata para debugging\\n            _metadata: {\\n                total_personas: personasList.length,\\n                total_epicas: storyMapData.epicas?.length || 0,\\n                estructura_validada: true\\n            }\\n        }\\n    };\\n    \\n} catch (error) {\\n    // INTENTO DE RECUPERACIÓN (Si falla por saltos de línea)\\n    console.log(\\\"Primer intento de parseo falló, intentando recuperación...\\\");\\n    \\n    try {\\n        const fixedString = cleanJsonString.replace(/\\\\n/g, \\\" \\\"); \\n        const parsedDataFixed = JSON.parse(fixedString);\\n        \\n        // Repetimos la lógica de normalización en el fallback\\n        let personasListFixed = [];\\n        if (parsedDataFixed.personas && Array.isArray(parsedDataFixed.personas)) {\\n            personasListFixed = parsedDataFixed.personas;\\n        } else if (parsedDataFixed.persona_data) {\\n            personasListFixed = [parsedDataFixed.persona_data];\\n        }\\n        \\n        let storyMapFixed = parsedDataFixed.story_map || parsedDataFixed.story_map_foundation || {};\\n        \\n        // Validación básica en el fallback\\n        if (storyMapFixed.epicas && Array.isArray(storyMapFixed.epicas)) {\\n            storyMapFixed.epicas.forEach(epica => {\\n                if (!epica.pasos_backbone) epica.pasos_backbone = [];\\n            });\\n        }\\n        \\n        return {\\n            json: {\\n                personas_list: personasListFixed,\\n                persona_data: personasListFixed[0] || {},\\n                story_map: storyMapFixed,\\n                sintesis: parsedDataFixed.research_synthesis || {},\\n                atomic_hints: parsedDataFixed.atomic_hints || {},\\n                _warning: \\\"JSON recuperado tras limpieza profunda\\\",\\n                _metadata: {\\n                    total_personas: personasListFixed.length,\\n                    total_epicas: storyMapFixed.epicas?.length || 0,\\n                    recuperacion_aplicada: true\\n                }\\n            }\\n        };\\n        \\n    } catch (e2) {\\n        return {\\n            json: {\\n                error: \\\"Error Fatal: JSON corrupto e irremediable.\\\",\\n                details: error.message,\\n                recovery_details: e2.message,\\n                clean_attempt: cleanJsonString.substring(0, 500) + \\\"...\\\",\\n                raw_preview: rawText.substring(0, 200) + \\\"...\\\"\\n            }\\n        };\\n    }\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        688,
        0
      ],
      \"id\": \"284f12f3-b6bf-4961-a28d-781a087db3c5\",
      \"name\": \"Limpiar Datos DCU\"
    },
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"=Actúa como Senior Service Designer.\\n\\nINPUTS:\\n1. Lista de Personas Detectadas: {{ JSON.stringify($input.first().json.personas_list) }}\\n2. Contexto del Proyecto (Story Map): {{ JSON.stringify($input.first().json.story_map) }}\\n\\nTAREA:\\nAnaliza el Story Map y el perfil de CADA usuario en la lista. \\nDebes generar un Customer Journey Map DETALLADO por cada perfil persona detectado.\\n\\nRESTRICCIONES:\\n- Usa emojis ÚNICAMENTE en el campo 'emocion_emoji'.\\n- El resto de los textos deben ser técnicos y formales.\\n\\nFORMATO DE SALIDA (JSON PURO):\\n{\\n  \\\"journeys\\\": [\\n    {\\n      \\\"rol_usuario\\\": \\\"Nombre del rol (ej: Karen Borja - Estudiante)\\\",\\n      \\\"fases\\\": [\\n        {\\n          \\\"nombre_fase\\\": \\\"Nombre de la etapa\\\",\\n          \\\"acciones_usuario\\\": \\\"Qué hace el usuario\\\",\\n          \\\"pensamientos\\\": \\\"Cita textual en primera persona\\\",\\n          \\\"emocion_emoji\\\": \\\"🤩\\\",\\n          \\\"estado_emocional_texto\\\": \\\"Adjetivo breve\\\",\\n          \\\"puntos_contacto\\\": \\\"Touchpoints\\\",\\n          \\\"puntos_dolor\\\": \\\"Frustraciones específicas\\\",\\n          \\\"oportunidades_mejora\\\": \\\"Ideas de diseño\\\"\\n        }\\n      ]\\n    }\\n  ]\\n}\",
        \"batching\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.chainLlm\",
      \"typeVersion\": 1.7,
      \"position\": [
        1040,
        608
      ],
      \"id\": \"e630934e-92be-459e-8682-e1859d6a62ed\",
      \"name\": \"Generar Journey Map\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Obtener el texto crudo de Gemini\\nconst input = $input.first().json;\\nlet rawText = '';\\n\\n// Intentar múltiples formas de extraer el texto\\nif (input.text) {\\n  rawText = input.text;\\n} else if (input.candidates && input.candidates[0]) {\\n  rawText = input.candidates[0].content.parts[0].text;\\n} else if (input.message) {\\n  rawText = input.message;\\n} else {\\n  rawText = JSON.stringify(input);\\n}\\n\\n// Limpiar el texto\\nlet cleanText = rawText\\n  .replace(/```json/gi, '')\\n  .replace(/```/g, '')\\n  .trim();\\n\\n// Intentar parsear\\nlet parsedData;\\ntry {\\n  parsedData = JSON.parse(cleanText);\\n} catch (e) {\\n  // Si falla, intentar extraer JSON del texto\\n  const jsonMatch = cleanText.match(/\\\\{[\\\\s\\\\S]*\\\\}/);\\n  if (jsonMatch) {\\n    parsedData = JSON.parse(jsonMatch[0]);\\n  } else {\\n    throw new Error('No se pudo extraer JSON válido: ' + e.message);\\n  }\\n}\\n\\n// Validar estructura\\nif (!parsedData.mapa_navegacional) {\\n  throw new Error('Estructura JSON inválida: falta mapa_navegacional');\\n}\\n\\nreturn {\\n  json: {\\n    nav_map: parsedData.mapa_navegacional\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1360,
        800
      ],
      \"id\": \"004d1e7d-d2c1-4c9a-bd1c-bc386dd1da9b\",
      \"name\": \"Limpiar Mapa Navegacional\"
    },
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"=const systemPrompt = `\\nROL: Senior UX Architect especializado en User Flows y arquitectura de información.\\n\\nINPUTS:\\n- Story Map Completo: ${JSON.stringify($json.story_map)}\\n- Objetivo del Sprint: \\\"${jsonInputs.Objetivo_Sprint || 'No especificado'}\\\"\\n\\n## TAREA CRÍTICA:\\n\\nGenera un mapa navegacional que represente el flujo completo del Sprint actual basado EXCLUSIVAMENTE en las HUs del Story Map.\\n\\n## ALCANCE DEL MAPEO:\\n\\n**REGLA:** El mapa debe reflejar TODAS las HUs del Story Map, pero NO todas las HUs son pantallas completas.\\n\\n**Tipos de manifestación de HUs:**\\n\\n1. **Pantalla completa**: HU requiere vista dedicada (ej: \\\"Explorar tutorías\\\", \\\"Crear perfil\\\")\\n2. **Modal/Dialog**: HU es acción puntual sobre contexto existente (ej: \\\"Confirmar solicitud\\\", \\\"Cancelar tutoría\\\")\\n3. **Componente en pantalla**: HU es funcionalidad dentro de vista mayor (ej: \\\"Filtrar por materia\\\", \\\"Ver calificación\\\")\\n4. **Acción del sistema**: HU no tiene UI directa (ej: \\\"Validar credenciales\\\", \\\"Enviar notificación\\\")\\n\\n**Proceso de derivación:**\\n1. Lee todas las épicas del Story Map (ya filtradas por Sprint)\\n2. Para cada HU, pregúntate:\\n   - ¿Necesita una pantalla completa nueva? → tipo: \\\"pantalla\\\"\\n   - ¿Es un modal/popup sobre pantalla existente? → tipo: \\\"modal\\\"\\n   - ¿Es un componente dentro de otra pantalla? → Agrúpala en la pantalla padre (hu_relacionadas)\\n   - ¿Es acción del sistema sin UI propia? → tipo: \\\"accion\\\"\\n3. Agrupa HUs relacionadas en la misma pantalla cuando compartan contexto\\n\\n**Ejemplo de derivación:**\\n\\nPantalla \\\"Explorar Tutorias\\\" puede incluir:\\n- HU01: \\\"Ver ofertas disponibles\\\" (funcionalidad principal)\\n- HU02: \\\"Buscar por materia\\\" (componente: barra búsqueda)\\n- HU03: \\\"Filtrar por precio\\\" (componente: filtros laterales)\\n- HU04: \\\"Ver calificación del tutor\\\" (componente: en card)\\n\\nModal \\\"Confirmar Solicitud\\\" activado desde \\\"Explorar Tutorias\\\":\\n- HU15: \\\"Solicitar tutoría\\\" (trigger del modal)\\n- HU16: \\\"Seleccionar horario disponible\\\" (componente en modal)\\n- HU17: \\\"Confirmar solicitud\\\" (botón de acción)\\n\\n## COBERTURA COMPLETA:\\n\\n**Incluye TODAS las HUs del Sprint:**\\n- Historias MVP (críticas para el flujo)\\n- Historias Resto (mejoras y complementos)\\n\\n**NO incluyas:**\\n- Pantallas de épicas fuera del Sprint\\n- Funcionalidades no mencionadas en las HUs\\n- Flujos genéricos sin base en el Story Map\\n\\n## ESTRUCTURA DE NODOS:\\n\\n**Tipos de nodos con colores específicos:**\\n- \\\\`inicio\\\\`: Punto de entrada (Login, Splash, Home) - COLOR: #10B981 (verde)\\n- \\\\`pantalla\\\\`: Vista completa del usuario - COLOR: #3B82F6 (azul)\\n- \\\\`modal\\\\`: Dialog/popup sobre contexto existente - COLOR: #8B5CF6 (morado)\\n- \\\\`decision\\\\`: Bifurcación por elección/condición - COLOR: #F59E0B (amarillo)\\n- \\\\`accion\\\\`: Proceso del sistema sin UI propia - COLOR: #6B7280 (gris)\\n- \\\\`fin\\\\`: Completado exitoso de flujo crítico - COLOR: #EF4444 (rojo)\\n\\n**Nombres de nodos (max 30 caracteres):**\\n- Claros y accionables\\n- Sin caracteres especiales (/-*@#)\\n- Ejemplos: \\\"Login\\\", \\\"Crear Perfil\\\", \\\"Explorar Tutorias\\\", \\\"Modal Confirmar\\\"\\n\\n## CONSTRUCCIÓN DE FLUJOS:\\n\\n**Tipos de flujo:**\\n- \\\\`principal\\\\`: Secuencia normal entre pantallas\\n- \\\\`condicional\\\\`: Depende de una decisión (Si/No, Rol A/Rol B)\\n- \\\\`alternativo\\\\`: Flujo de error, cancelación o regreso\\n- \\\\`modal\\\\`: Abre modal desde pantalla (ida y vuelta)\\n\\n**DOCUMENTACIÓN DE ACCIONES DEL USUARIO:**\\n\\nPara cada flujo, especifica QUÉ acción específica realiza el usuario para ejecutar la transición:\\n\\n- **Botón específico**: \\\"Presionar boton Crear Perfil\\\", \\\"Hacer clic en Confirmar\\\"\\n- **Interacción**: \\\"Seleccionar card de tutoria\\\", \\\"Hacer scroll hasta el final\\\"\\n- **Formulario**: \\\"Completar y enviar formulario\\\", \\\"Ingresar credenciales\\\"\\n- **Gesto**: \\\"Deslizar hacia derecha\\\", \\\"Hacer tap en notificacion\\\"\\n- **Navegación**: \\\"Regresar con boton atras\\\", \\\"Cerrar modal con X\\\"\\n- **Condición del sistema**: \\\"Si autenticacion exitosa\\\", \\\"Si hay error de red\\\"\\n\\n**Ejemplo detallado:**\\n\\n\\\\`\\\\`\\\\`\\nFlujo F1:\\n- Desde: N1 (Inicio App)\\n- Hacia: N2 (Login)\\n- Etiqueta visual: \\\"Abrir app\\\"\\n- Acción usuario: \\\"Usuario abre la aplicacion desde el icono\\\"\\n- Tipo: principal\\n\\nFlujo F2:\\n- Desde: N2 (Login)\\n- Hacia: A1 (Validar Credenciales)\\n- Etiqueta visual: \\\"Ingresar\\\"\\n- Acción usuario: \\\"Completar email y password, presionar boton Ingresar\\\"\\n- Tipo: principal\\n\\nFlujo F3:\\n- Desde: D1 (Decision: Rol)\\n- Hacia: N3 (Dashboard Tutor)\\n- Etiqueta visual: \\\"Soy Tutor\\\"\\n- Acción usuario: \\\"Seleccionar opcion Continuar como Tutor\\\"\\n- Tipo: condicional\\n\\nFlujo F4:\\n- Desde: N5 (Explorar Tutorias)\\n- Hacia: M1 (Modal Confirmar)\\n- Etiqueta visual: \\\"Solicitar\\\"\\n- Acción usuario: \\\"Hacer clic en boton Solicitar Tutoria en la card del tutor\\\"\\n- Tipo: modal\\n\\\\`\\\\`\\\\`\\n\\n**Principios de diseño:**\\n1. **Agrupa HUs relacionadas**: Si 5 HUs ocurren en la misma vista, no crees 5 pantallas\\n2. **Modales para acciones puntuales**: Confirmaciones, formularios cortos, alertas\\n3. **Decisiones claras**: Solo usa nodos \\\"decision\\\" cuando haya bifurcación real\\n4. **Acciones específicas**: No uses \\\"navegar a\\\", especifica el botón/interacción exacta\\n\\n## VALIDACIÓN DE TRAZABILIDAD:\\n\\nAntes de devolver el JSON, verifica:\\n\\n1.  **Cobertura completa**: Cada HU del Story Map está representada (en pantalla, modal o como acción)\\n2.  **Agrupación lógica**: HUs del mismo contexto están en la misma pantalla (hu_relacionadas)\\n3.  **Modales apropiados**: Acciones puntuales son modales, no pantallas completas\\n4.  **Flujos documentados**: Cada flujo tiene su acción de usuario específica\\n5.  **Colores asignados**: Cada nodo tiene su color según tipo\\n6.  **Roles diferenciados**: Si hay Tutor y Estudiante, sus flujos están claros\\n\\n## FORMATO DE SALIDA (JSON PURO):\\n\\n{\\n  \\\"mapa_navegacional\\\": {\\n    \\\"metadata\\\": {\\n      \\\"nombre_proyecto\\\": \\\"[Extraído del contexto]\\\",\\n      \\\"objetivo_sprint\\\": \\\"${jsonInputs.Objetivo_Sprint || 'No especificado'}\\\",\\n      \\\"total_pantallas\\\": 0,\\n      \\\"total_modales\\\": 0,\\n      \\\"roles_contemplados\\\": [\\\"Tutor\\\", \\\"Estudiante\\\"]\\n    },\\n    \\\"leyenda_colores\\\": {\\n      \\\"inicio\\\": \\\"#10B981\\\",\\n      \\\"pantalla\\\": \\\"#3B82F6\\\",\\n      \\\"modal\\\": \\\"#8B5CF6\\\",\\n      \\\"decision\\\": \\\"#F59E0B\\\",\\n      \\\"accion\\\": \\\"#6B7280\\\",\\n      \\\"fin\\\": \\\"#EF4444\\\"\\n    },\\n    \\\"nodos\\\": [\\n      {\\n        \\\"id\\\": \\\"N1\\\",\\n        \\\"nombre\\\": \\\"Inicio App\\\",\\n        \\\"tipo\\\": \\\"inicio\\\",\\n        \\\"color\\\": \\\"#10B981\\\",\\n        \\\"descripcion\\\": \\\"Pantalla inicial de bienvenida\\\",\\n        \\\"hu_relacionadas\\\": []\\n      },\\n      {\\n        \\\"id\\\": \\\"N2\\\",\\n        \\\"nombre\\\": \\\"Explorar Tutorias\\\",\\n        \\\"tipo\\\": \\\"pantalla\\\",\\n        \\\"color\\\": \\\"#3B82F6\\\",\\n        \\\"descripcion\\\": \\\"Vista principal para buscar y filtrar ofertas de tutorias\\\",\\n        \\\"hu_relacionadas\\\": [\\\"HU01\\\", \\\"HU02\\\", \\\"HU03\\\", \\\"HU04\\\"]\\n      },\\n      {\\n        \\\"id\\\": \\\"M1\\\",\\n        \\\"nombre\\\": \\\"Modal Confirmar\\\",\\n        \\\"tipo\\\": \\\"modal\\\",\\n        \\\"color\\\": \\\"#8B5CF6\\\",\\n        \\\"descripcion\\\": \\\"Dialog de confirmacion de solicitud de tutoria\\\",\\n        \\\"hu_relacionadas\\\": [\\\"HU15\\\", \\\"HU16\\\"]\\n      },\\n      {\\n        \\\"id\\\": \\\"D1\\\",\\n        \\\"nombre\\\": \\\"Seleccion Rol\\\",\\n        \\\"tipo\\\": \\\"decision\\\",\\n        \\\"color\\\": \\\"#F59E0B\\\",\\n        \\\"descripcion\\\": \\\"Usuario elige continuar como Tutor o Estudiante\\\",\\n        \\\"hu_relacionadas\\\": []\\n      },\\n      {\\n        \\\"id\\\": \\\"A1\\\",\\n        \\\"nombre\\\": \\\"Enviar Notificacion\\\",\\n        \\\"tipo\\\": \\\"accion\\\",\\n        \\\"color\\\": \\\"#6B7280\\\",\\n        \\\"descripcion\\\": \\\"Sistema notifica al tutor sobre nueva solicitud\\\",\\n        \\\"hu_relacionadas\\\": [\\\"HU17\\\"]\\n      }\\n    ],\\n    \\\"flujos\\\": [\\n      {\\n        \\\"id\\\": \\\"F1\\\",\\n        \\\"desde\\\": \\\"N1\\\",\\n        \\\"hacia\\\": \\\"N2\\\",\\n        \\\"etiqueta\\\": \\\"Abrir app\\\",\\n        \\\"accion_usuario\\\": \\\"Usuario abre la aplicacion desde el icono del dispositivo\\\",\\n        \\\"tipo\\\": \\\"principal\\\"\\n      },\\n      {\\n        \\\"id\\\": \\\"F2\\\",\\n        \\\"desde\\\": \\\"N2\\\",\\n        \\\"hacia\\\": \\\"M1\\\",\\n        \\\"etiqueta\\\": \\\"Solicitar\\\",\\n        \\\"accion_usuario\\\": \\\"Hacer clic en boton Solicitar Tutoria en la card del tutor seleccionado\\\",\\n        \\\"tipo\\\": \\\"modal\\\"\\n      },\\n      {\\n        \\\"id\\\": \\\"F3\\\",\\n        \\\"desde\\\": \\\"M1\\\",\\n        \\\"hacia\\\": \\\"A1\\\",\\n        \\\"etiqueta\\\": \\\"Confirmar\\\",\\n        \\\"accion_usuario\\\": \\\"Presionar boton Confirmar Solicitud en el modal\\\",\\n        \\\"tipo\\\": \\\"principal\\\"\\n      },\\n      {\\n        \\\"id\\\": \\\"F4\\\",\\n        \\\"desde\\\": \\\"M1\\\",\\n        \\\"hacia\\\": \\\"N2\\\",\\n        \\\"etiqueta\\\": \\\"Cancelar\\\",\\n        \\\"accion_usuario\\\": \\\"Hacer clic en X o boton Cancelar para cerrar el modal\\\",\\n        \\\"tipo\\\": \\\"alternativo\\\"\\n      },\\n      {\\n        \\\"id\\\": \\\"F5\\\",\\n        \\\"desde\\\": \\\"D1\\\",\\n        \\\"hacia\\\": \\\"N3\\\",\\n        \\\"etiqueta\\\": \\\"Soy Tutor\\\",\\n        \\\"accion_usuario\\\": \\\"Seleccionar opcion Continuar como Tutor\\\",\\n        \\\"tipo\\\": \\\"condicional\\\"\\n      }\\n    ]\\n  }\\n}\\n\\n## RESTRICCIONES:\\n\\n-  NO usar emojis\\n-  NO crear pantallas innecesarias (agrupa HUs relacionadas)\\n-  NO incluir pantallas de épicas fuera del Sprint\\n-  NO inventar funcionalidades sin HU correspondiente\\n-  NO usar acciones vagas (\\\"navegar\\\", \\\"ir a\\\") - especifica el botón/interacción\\n-  NO envolver en bloques markdown\\n-  NO agregar texto explicativo adicional\\n\\nDevuelve SOLO el JSON válido.\\n`;\",
        \"batching\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.chainLlm\",
      \"typeVersion\": 1.7,
      \"position\": [
        1040,
        800
      ],
      \"id\": \"37b52c40-7155-4a5d-bc03-2c7a8640c552\",
      \"name\": \"Generar Mapa Navegacional\"
    },
    {
      \"parameters\": {
        \"modelName\": \"models/gemini-2.5-pro\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.lmChatGoogleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        848,
        800
      ],
      \"id\": \"ab27d7f9-d553-40a5-a829-1e4fdf499f5e\",
      \"name\": \"Gemini 2.5 Pro\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"kAiQwRY1veWQMgkM\",
          \"name\": \"Google Gemini(PaLM) Api account\"
        }
      }
    },
    {
      \"parameters\": {
        \"operation\": \"toText\",
        \"sourceProperty\": \"text\",
        \"options\": {
          \"fileName\": \"magic_patterns_prompt.txt\"
        }
      },
      \"type\": \"n8n-nodes-base.convertToFile\",
      \"typeVersion\": 1.1,
      \"position\": [
        3184,
        432
      ],
      \"id\": \"3cd829a6-00c7-49c9-9d33-84ae3f7b3d4a\",
      \"name\": \"Generar TXT del Prompt\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Obtener el texto de la respuesta de Gemini\\nconst geminiResponse = $input.first().json;\\nconst textoOriginal = geminiResponse.candidates?.[0]?.content?.parts?.[0]?.text;\\n\\n// Validar que existe el texto\\nif (!textoOriginal) {\\n  throw new Error(\\\"No se pudo extraer el texto de la respuesta de Gemini. Estructura recibida: \\\" + JSON.stringify(geminiResponse).substring(0, 500));\\n}\\n\\nlet limpio = textoOriginal;\\n\\n// 1. Eliminar source citations de Gemini\\nlimpio = limpio.replace(/\\\\[fuente:.*?\\\\]/gi, \\\"\\\");\\nlimpio = limpio.replace(/\\\\[source:.*?\\\\]/gi, \\\"\\\");\\nlimpio = limpio.replace(/【\\\\d+:\\\\d+†source】/g, \\\"\\\");\\n\\n// 2. Eliminar SOLO los bloques de código markdown que ENVUELVEN todo el prompt\\n// (NO los bloques internos que son ejemplos de código)\\nlimpio = limpio.replace(/^```(?:markdown|text|prompt)?\\\\n/i, \\\"\\\");\\nlimpio = limpio.replace(/\\\\n```\\\\s*$/i, \\\"\\\");\\n\\n// 3. NO eliminar comentarios // - son parte de los ejemplos de código\\n\\n// 4. Si hay texto explicativo ANTES del prompt, eliminarlo\\nconst inicioRole = limpio.indexOf('# ROLE:');\\nif (inicioRole > 0) {\\n  limpio = limpio.substring(inicioRole);\\n}\\n\\n// 5. Limpiar líneas vacías excesivas (máximo 2 consecutivas)\\nlimpio = limpio.replace(/\\\\n{3,}/g, \\\"\\\\n\\\\n\\\");\\n\\n// 6. Eliminar espacios en blanco al final de líneas\\nlimpio = limpio.replace(/[ \\\\t]+$/gm, \\\"\\\");\\n\\n// 7. Trim general\\nlimpio = limpio.trim();\\n\\n// 8. Validación: verificar que el prompt tenga contenido mínimo\\nif (limpio.length < 3000) {\\n  throw new Error(`Prompt demasiado corto (${limpio.length} caracteres). Se esperaban al menos 3000.\\\\n\\\\nPrimeros 500 caracteres:\\\\n${limpio.substring(0, 500)}`);\\n}\\n\\n// 9. Validación de formato\\nif (!limpio.startsWith('# ROLE:')) {\\n  console.warn(`⚠️ Advertencia: Prompt no comienza con \\\"# ROLE:\\\". Inicio: ${limpio.substring(0, 200)}`);\\n}\\n\\n// 10. Generar nombre de archivo\\nconst fecha = new Date().toISOString().split('T')[0];\\n\\nreturn {\\n  json: {\\n    text: limpio,\\n    nombre_archivo: `MagicPatterns_Prompt_${fecha}.txt`,\\n    longitud_caracteres: limpio.length,\\n    longitud_lineas: limpio.split('\\\\n').length,\\n    preview: limpio.substring(0, 300) + \\\"...\\\"\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        2960,
        432
      ],
      \"id\": \"3af09795-19f3-4a45-8d71-5989cbb90f0b\",
      \"name\": \"Limpiar Prompt Prototipo\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. OBTENCIÓN DE DATOS\\nconst inputJson = $input.first().json;\\nlet personasList = [];\\n\\nif (inputJson.personas_list && Array.isArray(inputJson.personas_list)) {\\n    personasList = inputJson.personas_list;\\n} else if (inputJson.persona_data) {\\n    personasList = [inputJson.persona_data];\\n} else if (inputJson.personas) {\\n    personasList = inputJson.personas;\\n} else {\\n    throw new Error('No se encontraron datos de personas en el input');\\n}\\n\\nif (personasList.length === 0 || !personasList[0].rol_usuario) {\\n    throw new Error('Los datos de personas están vacíos o son inválidos');\\n}\\n\\n// 2. FUNCIÓN PARA RENDERIZAR SLIDERS EN MARKDOWN\\nfunction renderSliderMarkdown(leftLabel, rightLabel, value) {\\n    const val = value !== undefined && value !== null ? value : 5;\\n    const blocks = Math.round(val); // 0-10\\n    const filled = '█'.repeat(blocks);\\n    const empty = '░'.repeat(10 - blocks);\\n    \\n    return `**${leftLabel}** ${filled}${empty} **${rightLabel}** (${val}/10)`;\\n}\\n\\n// 3. FUNCIÓN HELPER: Renderizar lista en Markdown\\nfunction renderListMarkdown(items, prefix = '-') {\\n    if (!items || !Array.isArray(items) || items.length === 0) {\\n        return `${prefix} _No especificado_`;\\n    }\\n    return items.map(item => `${prefix} ${item}`).join('\\\\n');\\n}\\n\\n// 4. GENERAR MARKDOWN PARA CADA PERSONA\\nlet markdownContent = '# User Personas\\\\n\\\\n';\\nmarkdownContent += `> **Fecha de generación:** ${new Date().toLocaleDateString('es-EC', { \\n    year: 'numeric', \\n    month: 'long', \\n    day: 'numeric' \\n})}\\\\n\\\\n`;\\n\\nmarkdownContent += '---\\\\n\\\\n';\\n\\npersonasList.forEach((data, index) => {\\n    const perfil = data.perfil_demografico || {};\\n    const cols = data.columnas_clave || {};\\n    const sliders = data.personalidad_sliders || {};\\n    const adjetivos = data.adjetivos_clave || [];\\n    \\n    const rolUsuario = data.rol_usuario || 'Usuario';\\n    const nombreCompleto = perfil.nombre_completo || 'Nombre no especificado';\\n    const rolOcupacion = perfil.rol_ocupacion || perfil.rol || 'Ocupación no especificada';\\n    const ubicacion = perfil.ubicacion || 'N/A';\\n    const edad = perfil.edad || 'N/A';\\n    const dispositivos = Array.isArray(perfil.dispositivos) && perfil.dispositivos.length > 0\\n        ? perfil.dispositivos.join(', ')\\n        : 'No especificado';\\n    const appsUsadas = Array.isArray(perfil.apps_mas_usadas) && perfil.apps_mas_usadas.length > 0\\n        ? perfil.apps_mas_usadas.join(', ')\\n        : 'No especificado';\\n    const fraseCita = data.frase_cita || 'Sin cita disponible';\\n    const bio = data.bio || 'Biografía no disponible';\\n    const adjetivosTexto = adjetivos.length > 0 \\n        ? adjetivos.join(' • ')\\n        : 'Adjetivos no especificados';\\n\\n    // Generar Markdown para esta persona\\n    markdownContent += `## ${nombreCompleto}\\\\n\\\\n`;\\n    markdownContent += `**Rol:** ${rolUsuario} | **Ocupación:** ${rolOcupacion}\\\\n\\\\n`;\\n    \\n    // Información demográfica\\n    markdownContent += `### Perfil Demográfico\\\\n\\\\n`;\\n    markdownContent += `| Campo | Valor |\\\\n`;\\n    markdownContent += `|-------|-------|\\\\n`;\\n    markdownContent += `| **Ubicación** | ${ubicacion} |\\\\n`;\\n    markdownContent += `| **Edad** | ${edad} años |\\\\n`;\\n    markdownContent += `| **Dispositivos** | ${dispositivos} |\\\\n`;\\n    markdownContent += `| **Apps más usadas** | ${appsUsadas} |\\\\n\\\\n`;\\n    \\n    // Adjetivos clave\\n    markdownContent += `### Adjetivos Clave\\\\n\\\\n`;\\n    markdownContent += `> ${adjetivosTexto}\\\\n\\\\n`;\\n    \\n    // Cita\\n    markdownContent += `### Frase Característica\\\\n\\\\n`;\\n    markdownContent += `> \\\"${fraseCita}\\\"\\\\n\\\\n`;\\n    \\n    // Biografía\\n    markdownContent += `### Biografía\\\\n\\\\n`;\\n    markdownContent += `${bio}\\\\n\\\\n`;\\n    \\n    // Personalidad (Sliders)\\n    markdownContent += `### Personalidad\\\\n\\\\n`;\\n    markdownContent += renderSliderMarkdown(\\\"Introvertido\\\", \\\"Extrovertido\\\", sliders.introvertido_extrovertido) + '\\\\n\\\\n';\\n    markdownContent += renderSliderMarkdown(\\\"Analítico\\\", \\\"Creativo\\\", sliders.analitico_creativo) + '\\\\n\\\\n';\\n    markdownContent += renderSliderMarkdown(\\\"Impaciente\\\", \\\"Paciente\\\", sliders.impaciente_paciente) + '\\\\n\\\\n';\\n    markdownContent += renderSliderMarkdown(\\\"Desordenado\\\", \\\"Organizado\\\", sliders.desordenado_organizado) + '\\\\n\\\\n';\\n    \\n    // Objetivos\\n    markdownContent += `### Objetivos\\\\n\\\\n`;\\n    markdownContent += renderListMarkdown(cols.objetivos) + '\\\\n\\\\n';\\n    \\n    // Motivaciones\\n    markdownContent += `### Motivaciones\\\\n\\\\n`;\\n    markdownContent += renderListMarkdown(cols.motivaciones) + '\\\\n\\\\n';\\n    \\n    // Frustraciones\\n    markdownContent += `### Frustraciones\\\\n\\\\n`;\\n    markdownContent += renderListMarkdown(cols.frustraciones) + '\\\\n\\\\n';\\n    \\n    // Separador entre personas\\n    if (index < personasList.length - 1) {\\n        markdownContent += '\\\\n---\\\\n\\\\n';\\n    }\\n});\\n\\n// 5. AGREGAR METADATOS AL FINAL\\nmarkdownContent += '\\\\n---\\\\n\\\\n';\\nmarkdownContent += `## Metadatos del Documento\\\\n\\\\n`;\\nmarkdownContent += `- **Total de personas:** ${personasList.length}\\\\n`;\\nmarkdownContent += `- **Generado el:** ${new Date().toISOString()}\\\\n`;\\nmarkdownContent += `- **Formato:** Markdown\\\\n`;\\n\\n// 6. RETORNAR MARKDOWN\\nreturn { \\n    json: { \\n        markdown_content: markdownContent, \\n        fileName: \\\"User_Personas.md\\\",\\n        cantidad_personas: personasList.length\\n    } \\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1040,
        208
      ],
      \"id\": \"0ee110d9-afe1-4202-8225-1ccd349f552e\",
      \"name\": \"Markdown User Persona\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"const storyMap = $input.first().json.story_map || {};\\nconst epicas = storyMap.epicas || [];\\n\\n// Función para renderizar historias en markdown\\nfunction renderHistoriasMarkdown(historias, tipo = 'normal') {\\n    if (!historias || historias.length === 0) {\\n        return '  - _No hay historias_\\\\n';\\n    }\\n    \\n    return historias.map(hu => {\\n        const prefix = tipo === 'mvp' ? '  - **[MVP]**' : '  - [ ]';\\n        return `${prefix} **${hu.hu_id}:** ${hu.titulo}`;\\n    }).join('\\\\n') + '\\\\n';\\n}\\n\\n// Generar contenido markdown\\nlet markdownContent = '# User Story Map & MVP Scope\\\\n\\\\n';\\nmarkdownContent += `> **Fecha de generación:** ${new Date().toLocaleDateString('es-EC', { \\n    year: 'numeric', \\n    month: 'long', \\n    day: 'numeric' \\n})}\\\\n\\\\n`;\\nmarkdownContent += '---\\\\n\\\\n';\\n\\n// Iterar por cada épica\\nepicas.forEach((epica, epicaIndex) => {\\n    // Header de la épica\\n    markdownContent += `## EPICA ${epica.numero}: ${epica.titulo}\\\\n\\\\n`;\\n    markdownContent += `**Persona Asociada:** ${epica.persona_asociada}\\\\n\\\\n`;\\n    markdownContent += `**User Story:**\\\\n> ${epica.descripcion_user_story}\\\\n\\\\n`;\\n    \\n    // Tabla de Story Map\\n    const pasos = epica.pasos_backbone || [];\\n    \\n    if (pasos.length > 0) {\\n        // Generar header de la tabla\\n        markdownContent += `### Story Map\\\\n\\\\n`;\\n        markdownContent += `| Backbone | ` + pasos.map(p => p.nombre_paso).join(' | ') + ' |\\\\n';\\n        markdownContent += `|----------|` + pasos.map(() => '-------').join('|') + '|\\\\n';\\n        \\n        // Fila MVP\\n        markdownContent += `| **MVP** | `;\\n        markdownContent += pasos.map(paso => {\\n            const mvpHUs = (paso.historias_mvp || []).map(hu => `**${hu.hu_id}**`).join('<br>');\\n            return mvpHUs || '_vacío_';\\n        }).join(' | ') + ' |\\\\n';\\n        \\n        // Fila Resto\\n        markdownContent += `| **Resto** | `;\\n        markdownContent += pasos.map(paso => {\\n            const restoHUs = (paso.historias_resto || []).map(hu => `${hu.hu_id}`).join('<br>');\\n            return restoHUs || '_vacío_';\\n        }).join(' | ') + ' |\\\\n\\\\n';\\n        \\n        // Detalle de historias por paso\\n        markdownContent += `### Detalle de Historias\\\\n\\\\n`;\\n        \\n        pasos.forEach((paso, pasoIndex) => {\\n            markdownContent += `#### ${pasoIndex + 1}. ${paso.nombre_paso}\\\\n\\\\n`;\\n            \\n            // Historias MVP\\n            if (paso.historias_mvp && paso.historias_mvp.length > 0) {\\n                markdownContent += `**Historias MVP:**\\\\n\\\\n`;\\n                markdownContent += renderHistoriasMarkdown(paso.historias_mvp, 'mvp');\\n            }\\n            \\n            // Historias Resto\\n            if (paso.historias_resto && paso.historias_resto.length > 0) {\\n                markdownContent += `**Historias Adicionales:**\\\\n\\\\n`;\\n                markdownContent += renderHistoriasMarkdown(paso.historias_resto, 'normal');\\n            }\\n            \\n            if (!paso.historias_mvp?.length && !paso.historias_resto?.length) {\\n                markdownContent += `_No hay historias definidas para este paso_\\\\n\\\\n`;\\n            }\\n        });\\n    } else {\\n        markdownContent += `_No hay pasos del backbone definidos para esta épica_\\\\n\\\\n`;\\n    }\\n    \\n    // Separador entre épicas\\n    if (epicaIndex < epicas.length - 1) {\\n        markdownContent += '\\\\n---\\\\n\\\\n';\\n    }\\n});\\n\\n// Resumen final\\nmarkdownContent += '\\\\n---\\\\n\\\\n';\\nmarkdownContent += `## Resumen del Story Map\\\\n\\\\n`;\\n\\nlet totalMVP = 0;\\nlet totalResto = 0;\\nlet totalPasosBackbone = 0;\\n\\nepicas.forEach(epica => {\\n    (epica.pasos_backbone || []).forEach(paso => {\\n        totalPasosBackbone++;\\n        totalMVP += (paso.historias_mvp || []).length;\\n        totalResto += (paso.historias_resto || []).length;\\n    });\\n});\\n\\nmarkdownContent += `- **Total de épicas:** ${epicas.length}\\\\n`;\\nmarkdownContent += `- **Total de pasos del backbone:** ${totalPasosBackbone}\\\\n`;\\nmarkdownContent += `- **Total de historias MVP:** ${totalMVP}\\\\n`;\\nmarkdownContent += `- **Total de historias adicionales:** ${totalResto}\\\\n`;\\nmarkdownContent += `- **Total de historias:** ${totalMVP + totalResto}\\\\n`;\\n\\n// Metadatos\\nmarkdownContent += `\\\\n---\\\\n\\\\n`;\\nmarkdownContent += `**Generado el:** ${new Date().toISOString()}\\\\n`;\\nmarkdownContent += `**Formato:** Markdown\\\\n`;\\n\\nreturn { \\n    json: { \\n        markdown_content: markdownContent, \\n        fileName: \\\"Story_Map.md\\\",\\n        cantidad_epicas: epicas.length,\\n        cantidad_mvp: totalMVP,\\n        cantidad_total: totalMVP + totalResto\\n    } \\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1040,
        416
      ],
      \"id\": \"b2d6eb41-bdb3-444b-a4a8-232fd85dd5ca\",
      \"name\": \"Markdown Story Map\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// ============================================\\n// NODO: Markdown Journey Map\\n// ============================================\\n\\n// 1. OBTENCIÓN (ya viene limpio y normalizado del nodo anterior)\\nconst journeyData = $input.first().json.journey_map;\\nconst listaJourneys = journeyData.journeys || [];\\n\\n// 2. FUNCIONES HELPER\\nfunction renderEmocion(emocion_emoji, estado_texto) {\\n    return `${emocion_emoji} **${estado_texto}**`;\\n}\\n\\nfunction clasificarEmocion(emoji) {\\n    if (!emoji) return 'neutral';\\n    if (emoji.match(/😡|🤬|😤|😞|😢|😟/)) return 'negativa';\\n    if (emoji.match(/🤩|😍|🙂|😁|✅|😎/)) return 'positiva';\\n    return 'neutral';\\n}\\n\\n// 3. GENERAR MARKDOWN\\nlet markdownContent = '# Customer Journey Map\\\\n\\\\n';\\nmarkdownContent += `> **Service Blueprint: Flujo Principal**\\\\n`;\\nmarkdownContent += `> **Fecha de generación:** ${new Date().toLocaleDateString('es-EC', { \\n    year: 'numeric', \\n    month: 'long', \\n    day: 'numeric' \\n})}\\\\n\\\\n`;\\nmarkdownContent += '---\\\\n\\\\n';\\n\\nlet totalFases = 0;\\nlet totalTouchpoints = 0;\\nlet totalDolores = 0;\\n\\nlistaJourneys.forEach((journey, journeyIndex) => {\\n    const fases = journey.fases || [];\\n    const nombreUsuario = journey.rol_usuario || \\\"Usuario Detectado\\\";\\n    \\n    totalFases += fases.length;\\n\\n    // Header del Journey\\n    markdownContent += `## PERFIL: ${nombreUsuario}\\\\n\\\\n`;\\n\\n    if (fases.length === 0) {\\n        markdownContent += `_No hay fases definidas para este perfil_\\\\n\\\\n`;\\n        return;\\n    }\\n\\n    // Tabla principal del Journey Map\\n    markdownContent += `| Fase | ` + fases.map(f => f.nombre_fase).join(' | ') + ' |\\\\n';\\n    markdownContent += `|------|` + fases.map(() => '------').join('|') + '|\\\\n';\\n\\n    // Fila: ACCIONES\\n    markdownContent += `| **ACCIONES** | `;\\n    markdownContent += fases.map(f => f.acciones_usuario).join(' | ') + ' |\\\\n';\\n\\n    // Fila: PENSAMIENTOS\\n    markdownContent += `| **PENSAMIENTOS** | `;\\n    markdownContent += fases.map(f => `_\\\"${f.pensamientos}\\\"_`).join(' | ') + ' |\\\\n';\\n\\n    // Fila: EMOCIÓN\\n    markdownContent += `| **EMOCIÓN** | `;\\n    markdownContent += fases.map(f => renderEmocion(f.emocion_emoji, f.estado_emocional_texto)).join(' | ') + ' |\\\\n';\\n\\n    // Fila: TOUCHPOINTS\\n    markdownContent += `| **TOUCHPOINTS** | `;\\n    markdownContent += fases.map(f => {\\n        totalTouchpoints++;\\n        return `\\\\`${f.puntos_contacto}\\\\``;\\n    }).join(' | ') + ' |\\\\n';\\n\\n    // Fila: DOLORES\\n    markdownContent += `| **DOLORES** | `;\\n    markdownContent += fases.map(f => {\\n        if (f.puntos_dolor && f.puntos_dolor.trim()) {\\n            totalDolores++;\\n            return `${f.puntos_dolor}`;\\n        }\\n        return '_Sin dolores identificados_';\\n    }).join(' | ') + ' |\\\\n';\\n\\n    // Fila: OPORTUNIDADES\\n    markdownContent += `| **OPORTUNIDAD** | `;\\n    markdownContent += fases.map(f => f.oportunidades_mejora).join(' | ') + ' |\\\\n\\\\n';\\n\\n    // Detalle expandido por fase\\n    markdownContent += `### Detalle por Fase\\\\n\\\\n`;\\n\\n    fases.forEach((fase, faseIndex) => {\\n        markdownContent += `#### ${fase.nombre_fase}\\\\n\\\\n`;\\n\\n        // Sección de Acciones\\n        markdownContent += `**Acciones del Usuario:**\\\\n`;\\n        markdownContent += `${fase.acciones_usuario}\\\\n\\\\n`;\\n\\n        // Pensamientos\\n        markdownContent += `**Pensamientos:**\\\\n`;\\n        markdownContent += `> \\\"${fase.pensamientos}\\\"\\\\n\\\\n`;\\n\\n        // Emoción\\n        const tipoEmocion = clasificarEmocion(fase.emocion_emoji);\\n        const marcadorEmocion = tipoEmocion === 'positiva' ? '✅' : tipoEmocion === 'negativa' ? '❌' : '➖';\\n        markdownContent += `**Estado Emocional:** ${marcadorEmocion} ${fase.emocion_emoji} ${fase.estado_emocional_texto}\\\\n\\\\n`;\\n\\n        // Touchpoint\\n        markdownContent += `**Punto de Contacto:** \\\\`${fase.puntos_contacto}\\\\`\\\\n\\\\n`;\\n\\n        // Dolores\\n        if (fase.puntos_dolor && fase.puntos_dolor.trim()) {\\n            markdownContent += `**Puntos de Dolor:**\\\\n`;\\n            markdownContent += `- ${fase.puntos_dolor}\\\\n\\\\n`;\\n        }\\n\\n        // Oportunidades\\n        markdownContent += `**Oportunidades de Mejora:**\\\\n`;\\n        markdownContent += `- ${fase.oportunidades_mejora}\\\\n\\\\n`;\\n\\n        if (faseIndex < fases.length - 1) {\\n            markdownContent += `---\\\\n\\\\n`;\\n        }\\n    });\\n\\n    // Separador entre journeys\\n    if (journeyIndex < listaJourneys.length - 1) {\\n        markdownContent += '\\\\n---\\\\n\\\\n';\\n    }\\n});\\n\\n// 4. RESUMEN FINAL\\nmarkdownContent += '\\\\n---\\\\n\\\\n';\\nmarkdownContent += `## Resumen del Journey Map\\\\n\\\\n`;\\nmarkdownContent += `- **Total de perfiles:** ${listaJourneys.length}\\\\n`;\\nmarkdownContent += `- **Total de fases:** ${totalFases}\\\\n`;\\nmarkdownContent += `- **Total de touchpoints:** ${totalTouchpoints}\\\\n`;\\nmarkdownContent += `- **Total de puntos de dolor:** ${totalDolores}\\\\n`;\\n\\n// Metadatos\\nmarkdownContent += `\\\\n---\\\\n\\\\n`;\\nmarkdownContent += `**Generado el:** ${new Date().toISOString()}\\\\n`;\\nmarkdownContent += `**Formato:** Markdown\\\\n`;\\n\\nreturn { \\n    json: { \\n        markdown_content: markdownContent, \\n        fileName: \\\"Journey_Map.md\\\",\\n        cantidad_perfiles: listaJourneys.length,\\n        cantidad_fases: totalFases,\\n        cantidad_touchpoints: totalTouchpoints,\\n        cantidad_dolores: totalDolores\\n    } \\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1568,
        608
      ],
      \"id\": \"ef235e20-c360-4595-adbb-6e4d45bca0e2\",
      \"name\": \"Markdown Journey Map\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"const navMap = $input.first().json.nav_map;\\nconst nodos = navMap.nodos || [];\\nconst flujos = navMap.flujos || [];\\nconst metadata = navMap.metadata || {};\\n\\n// Función para limpiar texto de caracteres problemáticos\\nfunction limpiarTexto(texto) {\\n  if (!texto) return 'Nodo';\\n  return String(texto)\\n    .replace(/á/g, 'a').replace(/é/g, 'e').replace(/í/g, 'i')\\n    .replace(/ó/g, 'o').replace(/ú/g, 'u').replace(/ñ/g, 'n')\\n    .replace(/Á/g, 'A').replace(/É/g, 'E').replace(/Í/g, 'I')\\n    .replace(/Ó/g, 'O').replace(/Ú/g, 'U').replace(/Ñ/g, 'N')\\n    .replace(/[^a-zA-Z0-9\\\\s]/g, ' ')\\n    .replace(/\\\\s+/g, ' ')\\n    .trim()\\n    .substring(0, 30);\\n}\\n\\n// Generar nodos Mermaid\\nconst nodosStr = nodos.map(nodo => {\\n  const id = nodo.id;\\n  const nombre = limpiarTexto(nodo.nombre);\\n  \\n  let forma = '';\\n  switch(nodo.tipo) {\\n    case 'inicio':\\n      forma = `${id}((\\\"${nombre}\\\"))`;\\n      break;\\n    case 'fin':\\n      forma = `${id}((\\\"${nombre}\\\"))`;\\n      break;\\n    case 'decision':\\n      forma = `${id}{\\\"${nombre}\\\"}`;\\n      break;\\n    case 'accion':\\n      forma = `${id}(\\\"${nombre}\\\")`;\\n      break;\\n    default:\\n      forma = `${id}[\\\"${nombre}\\\"]`;\\n  }\\n  \\n  return `    ${forma}`;\\n}).join('\\\\n');\\n\\n// Generar conexiones Mermaid\\nconst conexionesStr = flujos.map(flujo => {\\n  const etiqueta = limpiarTexto(flujo.etiqueta || '');\\n  const esCondicional = flujo.tipo === 'condicional' || flujo.tipo === 'alternativo';\\n  \\n  if (etiqueta) {\\n    return esCondicional \\n      ? `    ${flujo.desde} -.->|\\\"${etiqueta}\\\"| ${flujo.hacia}`\\n      : `    ${flujo.desde} -->|\\\"${etiqueta}\\\"| ${flujo.hacia}`;\\n  } else {\\n    return esCondicional\\n      ? `    ${flujo.desde} -.-> ${flujo.hacia}`\\n      : `    ${flujo.desde} --> ${flujo.hacia}`;\\n  }\\n}).join('\\\\n');\\n\\n// Generar clases de estilo\\nconst grupos = {\\n  startEnd: [],\\n  screen: [],\\n  decision: [],\\n  action: []\\n};\\n\\nnodos.forEach(n => {\\n  switch(n.tipo) {\\n    case 'inicio':\\n    case 'fin':\\n      grupos.startEnd.push(n.id);\\n      break;\\n    case 'decision':\\n      grupos.decision.push(n.id);\\n      break;\\n    case 'accion':\\n      grupos.action.push(n.id);\\n      break;\\n    default:\\n      grupos.screen.push(n.id);\\n  }\\n});\\n\\nlet clasesStr = '';\\nif (grupos.startEnd.length > 0) clasesStr += `    class ${grupos.startEnd.join(',')} startEnd\\\\n`;\\nif (grupos.screen.length > 0) clasesStr += `    class ${grupos.screen.join(',')} screen\\\\n`;\\nif (grupos.decision.length > 0) clasesStr += `    class ${grupos.decision.join(',')} decision\\\\n`;\\nif (grupos.action.length > 0) clasesStr += `    class ${grupos.action.join(',')} action`;\\n\\nconst diagramaMermaid = `flowchart LR\\n${nodosStr}\\n\\n${conexionesStr}\\n\\n    classDef startEnd fill:#27ae60,stroke:#1e8449,color:#fff,stroke-width:3px\\n    classDef screen fill:#3498db,stroke:#2980b9,color:#fff,stroke-width:2px\\n    classDef decision fill:#f39c12,stroke:#e67e22,color:#fff,stroke-width:2px\\n    classDef action fill:#9b59b6,stroke:#8e44ad,color:#fff,stroke-width:2px\\n\\n${clasesStr}`;\\n\\n// GENERAR MARKDOWN\\nlet markdownContent = '# Mapa Navegacional Completo\\\\n\\\\n';\\nmarkdownContent += `**Proyecto:** ${metadata.nombre_proyecto || 'Plataforma de Tutorias'}\\\\n\\\\n`;\\nmarkdownContent += `> **Fecha de generación:** ${new Date().toLocaleDateString('es-EC', { \\n    year: 'numeric', \\n    month: 'long', \\n    day: 'numeric' \\n})}\\\\n\\\\n`;\\nmarkdownContent += '---\\\\n\\\\n';\\n\\n// Estadísticas\\nmarkdownContent += `## Estadísticas\\\\n\\\\n`;\\nmarkdownContent += `- **Total de nodos:** ${nodos.length}\\\\n`;\\nmarkdownContent += `- **Total de flujos:** ${flujos.length}\\\\n`;\\nmarkdownContent += `- **Nodos de inicio/fin:** ${grupos.startEnd.length}\\\\n`;\\nmarkdownContent += `- **Pantallas:** ${grupos.screen.length}\\\\n`;\\nmarkdownContent += `- **Puntos de decisión:** ${grupos.decision.length}\\\\n`;\\nmarkdownContent += `- **Acciones:** ${grupos.action.length}\\\\n\\\\n`;\\n\\n// Leyenda\\nmarkdownContent += `## Leyenda\\\\n\\\\n`;\\nmarkdownContent += `| Tipo | Descripción | Color |\\\\n`;\\nmarkdownContent += `|------|-------------|-------|\\\\n`;\\nmarkdownContent += `| **Inicio/Fin** | Puntos de entrada y salida del flujo | Verde |\\\\n`;\\nmarkdownContent += `| **Pantalla** | Vista o interfaz visible para el usuario | Azul |\\\\n`;\\nmarkdownContent += `| **Decisión** | Punto de elección del usuario | Amarillo |\\\\n`;\\nmarkdownContent += `| **Acción** | Proceso o acción del sistema | Morado |\\\\n\\\\n`;\\n\\n// Diagrama Mermaid\\nmarkdownContent += `## Diagrama de Navegación\\\\n\\\\n`;\\nmarkdownContent += '```mermaid\\\\n';\\nmarkdownContent += diagramaMermaid + '\\\\n';\\nmarkdownContent += '```\\\\n\\\\n';\\n\\n// Notas sobre visualización\\nmarkdownContent += `> **Nota:** Este diagrama es interactivo en editores que soporten Mermaid (GitHub, GitLab, VS Code, Obsidian, Notion).\\\\n`;\\nmarkdownContent += `> Si no se visualiza correctamente, puedes copiar el código Mermaid a [Mermaid Live Editor](https://mermaid.live/).\\\\n\\\\n`;\\n\\n// Listado de nodos\\nmarkdownContent += `---\\\\n\\\\n`;\\nmarkdownContent += `## Detalle de Nodos\\\\n\\\\n`;\\n\\nconst nodosPorTipo = {\\n  'inicio': [],\\n  'fin': [],\\n  'pantalla': [],\\n  'decision': [],\\n  'accion': []\\n};\\n\\nnodos.forEach(nodo => {\\n  const tipo = nodo.tipo || 'pantalla';\\n  if (!nodosPorTipo[tipo]) nodosPorTipo[tipo] = [];\\n  nodosPorTipo[tipo].push(nodo);\\n});\\n\\nObject.entries(nodosPorTipo).forEach(([tipo, nodosTipo]) => {\\n  if (nodosTipo.length > 0) {\\n    const tipoLabel = tipo.charAt(0).toUpperCase() + tipo.slice(1);\\n    markdownContent += `### ${tipoLabel}\\\\n\\\\n`;\\n    \\n    nodosTipo.forEach(nodo => {\\n      markdownContent += `- **${nodo.id}:** ${nodo.nombre}`;\\n      if (nodo.descripcion) {\\n        markdownContent += ` - _${nodo.descripcion}_`;\\n      }\\n      markdownContent += '\\\\n';\\n    });\\n    \\n    markdownContent += '\\\\n';\\n  }\\n});\\n\\n// Listado de flujos\\nmarkdownContent += `---\\\\n\\\\n`;\\nmarkdownContent += `## Flujos de Navegación\\\\n\\\\n`;\\n\\nconst flujosPorTipo = {\\n  'principal': [],\\n  'condicional': [],\\n  'alternativo': [],\\n  'otro': []\\n};\\n\\nflujos.forEach(flujo => {\\n  const tipo = flujo.tipo || 'otro';\\n  if (!flujosPorTipo[tipo]) flujosPorTipo[tipo] = [];\\n  flujosPorTipo[tipo].push(flujo);\\n});\\n\\nObject.entries(flujosPorTipo).forEach(([tipo, flujosTipo]) => {\\n  if (flujosTipo.length > 0) {\\n    const tipoLabel = tipo.charAt(0).toUpperCase() + tipo.slice(1);\\n    markdownContent += `### ${tipoLabel}\\\\n\\\\n`;\\n    \\n    flujosTipo.forEach(flujo => {\\n      const etiqueta = flujo.etiqueta ? ` (${flujo.etiqueta})` : '';\\n      const simbolo = tipo === 'condicional' || tipo === 'alternativo' ? '⤏' : '→';\\n      markdownContent += `- ${flujo.desde} ${simbolo} ${flujo.hacia}${etiqueta}\\\\n`;\\n    });\\n    \\n    markdownContent += '\\\\n';\\n  }\\n});\\n\\n// Código Mermaid exportable\\nmarkdownContent += `---\\\\n\\\\n`;\\nmarkdownContent += `## Código Mermaid (Copiable)\\\\n\\\\n`;\\nmarkdownContent += `Para editar o visualizar en otras herramientas:\\\\n\\\\n`;\\nmarkdownContent += '```\\\\n';\\nmarkdownContent += diagramaMermaid + '\\\\n';\\nmarkdownContent += '```\\\\n\\\\n';\\n\\n// Metadatos finales\\nmarkdownContent += `---\\\\n\\\\n`;\\nmarkdownContent += `**Generado el:** ${new Date().toISOString()}\\\\n`;\\nmarkdownContent += `**Formato:** Markdown con Mermaid\\\\n`;\\n\\nreturn { \\n  json: { \\n    markdown_content: markdownContent, \\n    fileName: \\\"Mapa_Navegacional.md\\\",\\n    cantidad_nodos: nodos.length,\\n    cantidad_flujos: flujos.length,\\n    cantidad_pantallas: grupos.screen.length,\\n    cantidad_decisiones: grupos.decision.length\\n  } \\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1568,
        800
      ],
      \"id\": \"3a713eb2-5577-46d4-82e1-00330d040242\",
      \"name\": \"Markdown Mapa Navegacional\"
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
              \"value\": \"={{ $json.markdown_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        1568,
        208
      ],
      \"id\": \"fdd2dad1-c2ab-459c-8470-88186697cb5e\",
      \"name\": \"Subir a Wikis de Azure UP\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"Jp24hmcie3mGrDAX\",
          \"name\": \"Azure DevOps PAT\"
        }
      }
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
              \"value\": \"={{ $json.markdown_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        1568,
        416
      ],
      \"id\": \"c154f0d6-3c4f-4063-81fd-0012c7b17271\",
      \"name\": \"Subir a Wikis de Azure SM\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"Jp24hmcie3mGrDAX\",
          \"name\": \"Azure DevOps PAT\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Preparar User Personas para Azure DevOps Wiki\\nconst markdownContent = $input.first().json.markdown_content;\\nconst cantidadPersonas = $input.first().json.cantidad_personas || 0;\\n\\nif (!markdownContent || markdownContent.trim().length === 0) {\\n  throw new Error('No hay contenido markdown para subir');\\n}\\n\\nconst ahora = new Date();\\nconst fecha = ahora.toISOString().split('T')[0];\\nconst nombreArchivo = `User_Personas_${fecha}`;\\n\\nconsole.log(`Preparando User Personas para Azure Wiki: ${nombreArchivo}`);\\nconsole.log(`   - Personas: ${cantidadPersonas}`);\\nconsole.log(`   - Tamaño: ${(markdownContent.length / 1024).toFixed(2)} KB`);\\n\\nreturn {\\n  json: {\\n    markdown_content: markdownContent,\\n    nombre_archivo: nombreArchivo,\\n    cantidad_personas: cantidadPersonas,\\n    fecha_generacion: ahora.toISOString()\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1360,
        208
      ],
      \"id\": \"44dff386-3262-44c5-8bcb-766989c68275\",
      \"name\": \"Preparar UP para Azure\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Preparar Story Map para Azure DevOps Wiki\\nconst markdownContent = $input.first().json.markdown_content;\\nconst cantidadEpicas = $input.first().json.cantidad_epicas || 0;\\nconst cantidadMVP = $input.first().json.cantidad_mvp || 0;\\n\\nif (!markdownContent || markdownContent.trim().length === 0) {\\n  throw new Error('No hay contenido markdown para subir');\\n}\\n\\nconst ahora = new Date();\\nconst fecha = ahora.toISOString().split('T')[0];\\nconst nombreArchivo = `Story_Map_${fecha}`;\\n\\nconsole.log(`Preparando Story Map para Azure Wiki: ${nombreArchivo}`);\\nconsole.log(`   - Épicas: ${cantidadEpicas}`);\\nconsole.log(`   - HUs MVP: ${cantidadMVP}`);\\n\\nreturn {\\n  json: {\\n    markdown_content: markdownContent,\\n    nombre_archivo: nombreArchivo,\\n    cantidad_epicas: cantidadEpicas,\\n    cantidad_mvp: cantidadMVP,\\n    fecha_generacion: ahora.toISOString()\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1360,
        416
      ],
      \"id\": \"d6605bdb-2f99-4941-beba-ac6760f115ea\",
      \"name\": \"Preparar SM para Azure\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Preparar Journey Map para Azure DevOps Wiki\\nconst markdownContent = $input.first().json.markdown_content;\\nconst cantidadPerfiles = $input.first().json.cantidad_perfiles || 0;\\nconst cantidadFases = $input.first().json.cantidad_fases || 0;\\n\\nif (!markdownContent || markdownContent.trim().length === 0) {\\n  throw new Error('No hay contenido markdown para subir');\\n}\\n\\nconst ahora = new Date();\\nconst fecha = ahora.toISOString().split('T')[0];\\nconst nombreArchivo = `Journey_Map_${fecha}`;\\n\\nconsole.log(`Preparando Journey Map para Azure Wiki: ${nombreArchivo}`);\\nconsole.log(`   - Perfiles: ${cantidadPerfiles}`);\\nconsole.log(`   - Fases: ${cantidadFases}`);\\n\\nreturn {\\n  json: {\\n    markdown_content: markdownContent,\\n    nombre_archivo: nombreArchivo,\\n    cantidad_perfiles: cantidadPerfiles,\\n    cantidad_fases: cantidadFases,\\n    fecha_generacion: ahora.toISOString()\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1760,
        608
      ],
      \"id\": \"29e7a7b6-b1da-4bd3-a1d4-a5ac83e3ef03\",
      \"name\": \"Preparar JM para Azure\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Preparar Mapa Navegacional para Azure DevOps Wiki\\nconst markdownContent = $input.first().json.markdown_content;\\nconst cantidadNodos = $input.first().json.cantidad_nodos || 0;\\nconst cantidadFlujos = $input.first().json.cantidad_flujos || 0;\\n\\nif (!markdownContent || markdownContent.trim().length === 0) {\\n  throw new Error('No hay contenido markdown para subir');\\n}\\n\\nconst ahora = new Date();\\nconst fecha = ahora.toISOString().split('T')[0];\\nconst nombreArchivo = `Mapa_Navegacional_${fecha}`;\\n\\nconsole.log(`Preparando Mapa Navegacional para Azure Wiki: ${nombreArchivo}`);\\nconsole.log(`   - Nodos: ${cantidadNodos}`);\\nconsole.log(`   - Flujos: ${cantidadFlujos}`);\\n\\nreturn {\\n  json: {\\n    markdown_content: markdownContent,\\n    nombre_archivo: nombreArchivo,\\n    cantidad_nodos: cantidadNodos,\\n    cantidad_flujos: cantidadFlujos,\\n    fecha_generacion: ahora.toISOString()\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1760,
        800
      ],
      \"id\": \"2accf45f-2e27-4de7-832f-041ab14921f3\",
      \"name\": \"Preparar MN para Azure\"
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
              \"value\": \"={{ $json.markdown_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        1968,
        608
      ],
      \"id\": \"d3095a2e-977a-4e76-ba66-971f297d16fa\",
      \"name\": \"Subir a Wikis de Azure JM\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"Jp24hmcie3mGrDAX\",
          \"name\": \"Azure DevOps PAT\"
        }
      }
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
              \"value\": \"={{ $json.markdown_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        1968,
        800
      ],
      \"id\": \"41d5bd24-a809-4c72-ba9b-dd62eea1e578\",
      \"name\": \"Subir a Wikis de Azure MN\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"Jp24hmcie3mGrDAX\",
          \"name\": \"Azure DevOps PAT\"
        }
      }
    },
    {
      \"parameters\": {
        \"method\": \"POST\",
        \"url\": \"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-pro:generateContent\",
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
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        2736,
        432
      ],
      \"id\": \"48d5152a-3b6e-4314-8ad7-c3810401dbde\",
      \"name\": \"Consultar Gemini Pro Fase 3\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// ========================================\\n// META-PROMPT: Gemini genera el prompt para Magic Patterns\\n// ========================================\\n\\n// Obtener datos de los nodos anteriores\\nconst journeyData = $('Limpiar Journey Map').first().json;\\nconst mapaNavData = $('Limpiar Mapa Navegacional').first().json;\\nconst dcuData = $('Limpiar Datos DCU').first().json;\\n\\n// Extraer datos limpios\\nconst personasList = dcuData.personas_list || [];\\nconst storyMap = dcuData.story_map || {};\\nconst atomicHints = dcuData.atomic_hints || {};\\nconst sintesis = dcuData.sintesis || {};\\n\\nconst journeyMap = journeyData.journey_map || journeyData;\\nconst navMap = mapaNavData.nav_map || mapaNavData;\\n\\n// ========================================\\n// META-PROMPT: Instruye a Gemini a ESCRIBIR el prompt\\n// ========================================\\n\\nconst metaPrompt = `Actúa como un Senior Product Designer y Prompt Engineer. Tu objetivo es escribir el \\\"Prompt Técnico\\\" perfecto para que una IA generadora de UI (como Magic Patterns) diseñe la interfaz de nuestra plataforma.\\n\\n### 1. CONTEXTO DEL PROYECTO (INPUTS):\\n\\n**Objetivo del Sprint:**\\n${storyMap.objetivo_sprint || \\\"Implementar MVP de plataforma de tutorías\\\"}\\n\\n**Perfiles de Usuario (User Personas):**\\n${JSON.stringify(personasList, null, 2)}\\n\\n**Story Map (Historias de Usuario MVP):**\\n${JSON.stringify(storyMap, null, 2)}\\n\\n**Journey Map (Customer Journeys con Pain Points):**\\n${JSON.stringify(journeyMap, null, 2)}\\n\\n**Mapa de Navegación (Pantallas y Flujos):**\\n${JSON.stringify(navMap, null, 2)}\\n\\n**Guía de Estilo (Atomic Hints):**\\n${JSON.stringify(atomicHints, null, 2)}\\n\\n**Síntesis de Investigación:**\\n${JSON.stringify(sintesis, null, 2)}\\n\\n---\\n\\n### 2. INSTRUCCIONES PARA EL PROMPT FINAL:\\n\\nDebes redactar un prompt en INGLÉS (para máxima compatibilidad técnica con el modelo de generación de código), pero imponiendo reglas estrictas de contenido.\\n\\n**REGLAS OBLIGATORIAS (MANDATORIES):**\\n1. **PLATAFORMA:** Web Application (Desktop-first, responsive). \\n2. **IDIOMA UI:** Todo el texto visible de la interfaz (títulos, botones, placeholders, menús) DEBE ESTAR EN ESPAÑOL.\\n3. **CÓDIGO:** Todo el código (variables, funciones, comentarios) DEBE ESTAR EN INGLÉS.\\n4. **TECNOLOGÍA:** React + Tailwind CSS + Lucide React icons.\\n\\n**ESTRUCTURA DEL PROMPT QUE DEBES GENERAR:**\\n\\n1. **ROLE:** Define el rol del asistente (Senior Product Designer & React Expert)\\n\\n2. **PROJECT CONTEXT:** \\n   - Nombre del producto\\n   - Objetivo del sprint\\n   - Roles de usuario\\n\\n3. **USER RESEARCH FOUNDATION:**\\n   - Para CADA persona, incluye:\\n     - Demographics (age, role, location, devices)\\n     - Bio completa\\n     - Key Quote from Interview (cita textual real)\\n     - Motivations (lista)\\n     - Goals (lista)\\n     - Frustrations (lista con ⚠️ para enfatizar)\\n     - Design Implications\\n\\n4. **RESEARCH INSIGHTS:**\\n   - Key Findings from User Interviews\\n   - Real User Quotes (evidencia directa)\\n   - Pain Points by Role\\n   - Design Opportunities by Role\\n\\n5. **CUSTOMER JOURNEY INSIGHTS:**\\n   - Para cada persona, detalla cada fase del journey:\\n     - What they do\\n     - What they think\\n     - Emotions (con emoji)\\n     - Pain Points (must address in design)\\n     - Opportunities (design solutions)\\n\\n6. **SCREENS TO BUILD:**\\n   - Lista TODAS las pantallas del mapa de navegación\\n   - Para cada pantalla incluye:\\n     - ID y nombre\\n     - Purpose (propósito)\\n     - MVP Features (críticas, deben ser prominentes)\\n     - Enhancement Features (secundarias)\\n     - Design Requirements específicos\\n\\n7. **DESIGN SYSTEM:**\\n   - Visual Identity (brand style, colors, typography)\\n   - Color Usage con clases Tailwind específicas\\n   - Component Library (Atoms, Molecules, Organisms)\\n\\n8. **CRITICAL DESIGN PATTERNS:**\\n   - Patrones específicos para resolver pain points de la investigación\\n\\n9. **EXAMPLE COMPONENT:**\\n   - Un componente de ejemplo completo (TutorCard o similar)\\n   - Con mock data realista en español\\n   - Comentarios explicando decisiones de diseño\\n\\n10. **VALIDATION CHECKLIST:**\\n    - Lista de verificación para asegurar calidad\\n\\n11. **DELIVERABLES:**\\n    - Qué debe generar (archivos .jsx, shared components, etc.)\\n    - Qué NO incluir (package.json, auth logic, etc.)\\n\\n12. **FINAL REMINDER:**\\n    - Recordatorio de que el diseño se basa en investigación REAL\\n    - Goals específicos para cada persona\\n\\n---\\n\\n### 3. FORMATO DE SALIDA:\\n\\nDevuelve SOLAMENTE el texto del prompt técnico completo.\\n\\nEl prompt debe:\\n- Comenzar con \\\"# ROLE:\\\" \\n- Estar en inglés (excepto ejemplos de UI text que van en español)\\n- Ser autocontenido (no referenciar documentos externos)\\n- Tener al menos 5000 palabras de detalle\\n- Incluir TODOS los datos de investigación proporcionados\\n- Terminar con una frase motivacional sobre resolver problemas reales\\n\\nNO incluyas:\\n- Explicaciones previas (\\\"Aquí está el prompt...\\\")\\n- Comentarios posteriores (\\\"Espero que esto ayude...\\\")\\n- Bloques de código markdown (\\\\`\\\\`\\\\`) alrededor del prompt\\n- Texto en español (excepto ejemplos de UI)\\n\\nEl resultado debe estar LISTO para copiar y pegar directamente en Magic Patterns.`;\\n\\n// ========================================\\n// Preparar el body para Gemini\\n// ========================================\\n\\nconst geminiBody = {\\n  contents: [\\n    {\\n      parts: [\\n        { text: metaPrompt }\\n      ]\\n    }\\n  ]\\n};\\n\\n// Metadata para tracking\\nconst metadata = {\\n  tipo: \\\"meta_prompt_magic_patterns\\\",\\n  total_personas: personasList.length,\\n  total_pantallas: navMap.nodos?.length || 0,\\n  fecha_generacion: new Date().toISOString()\\n};\\n\\nreturn {\\n  json: {\\n    geminiBody,\\n    metadata\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        2496,
        432
      ],
      \"id\": \"9e73800d-e363-4744-8590-1ae47c62eda5\",
      \"name\": \"Generar Prompt Magic Patterns\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"const textoOriginal = $input.first().json.text;\\n\\nlet limpio = textoOriginal;\\n\\n// 1. Eliminar bloques de código markdown\\nlimpio = limpio.replace(/```json\\\\n?/gi, \\\"\\\");\\nlimpio = limpio.replace(/```\\\\n?/g, \\\"\\\");\\n\\n// 2. Eliminar source citations de Gemini\\nlimpio = limpio.replace(/\\\\[fuente:.*?\\\\]/gi, \\\"\\\");\\nlimpio = limpio.replace(/\\\\[source:.*?\\\\]/gi, \\\"\\\");\\nlimpio = limpio.replace(/【\\\\d+:\\\\d+†source】/g, \\\"\\\");\\n\\n// 3. NUEVO: Extraer solo el JSON (eliminar texto antes y después)\\n// Buscar el primer '{' o '[' que inicia el JSON\\nconst primerLlave = limpio.indexOf('{');\\nconst primerCorchete = limpio.indexOf('[');\\n\\nlet inicioJSON = -1;\\nif (primerLlave === -1 && primerCorchete === -1) {\\n  throw new Error(\\\"No se encontró JSON en la respuesta de Gemini.\\\\n\\\\nTexto recibido:\\\\n\\\" + limpio.substring(0, 500));\\n} else if (primerLlave === -1) {\\n  inicioJSON = primerCorchete;\\n} else if (primerCorchete === -1) {\\n  inicioJSON = primerLlave;\\n} else {\\n  inicioJSON = Math.min(primerLlave, primerCorchete);\\n}\\n\\n// Buscar el último '}' o ']' que cierra el JSON\\nconst ultimaLlave = limpio.lastIndexOf('}');\\nconst ultimoCorchete = limpio.lastIndexOf(']');\\nconst finJSON = Math.max(ultimaLlave, ultimoCorchete);\\n\\nif (finJSON <= inicioJSON) {\\n  throw new Error(\\\"JSON malformado: no se encontró cierre válido.\\\\n\\\\nTexto recibido:\\\\n\\\" + limpio.substring(0, 500));\\n}\\n\\n// Extraer solo el JSON\\nlimpio = limpio.substring(inicioJSON, finJSON + 1);\\n\\n// 4. Limpiar espacios\\nlimpio = limpio.trim();\\n\\n// 5. Parsear el JSON\\nlet jsonParsed;\\ntry {\\n  jsonParsed = JSON.parse(limpio);\\n} catch (error) {\\n  throw new Error(`Error al parsear JSON del Journey Map: ${error.message}\\\\n\\\\nTexto recibido:\\\\n${limpio.substring(0, 500)}`);\\n}\\n\\n// 6. Normalizar estructura: envolver en \\\"journey_map\\\" si viene directo\\nlet jsonNormalizado;\\nif (jsonParsed.journeys) {\\n  jsonNormalizado = { journey_map: jsonParsed };\\n} else if (jsonParsed.journey_map) {\\n  jsonNormalizado = jsonParsed;\\n} else {\\n  throw new Error(\\\"Estructura de Journey Map inválida: no se encontró 'journeys' ni 'journey_map'\\\");\\n}\\n\\n// 7. Validar estructura mínima\\nif (!jsonNormalizado.journey_map.journeys || !Array.isArray(jsonNormalizado.journey_map.journeys)) {\\n  throw new Error(\\\"Estructura inválida: 'journeys' debe ser un array\\\");\\n}\\n\\nif (jsonNormalizado.journey_map.journeys.length === 0) {\\n  throw new Error(\\\"Journey Map vacío: no se encontraron journeys\\\");\\n}\\n\\n// 8. Validar que cada journey tenga las propiedades necesarias\\njsonNormalizado.journey_map.journeys.forEach((journey, i) => {\\n  if (!journey.rol_usuario) {\\n    throw new Error(`Journey ${i+1} no tiene 'rol_usuario'`);\\n  }\\n  if (!journey.fases || !Array.isArray(journey.fases)) {\\n    throw new Error(`Journey ${i+1} no tiene 'fases' o no es un array`);\\n  }\\n});\\n\\nreturn {\\n  json: jsonNormalizado\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1360,
        608
      ],
      \"id\": \"3c5010f9-3407-46d3-8efa-12ad43e33b6b\",
      \"name\": \"Limpiar Journey Map\"
    },
    {
      \"parameters\": {
        \"numberInputs\": 4
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3.2,
      \"position\": [
        2304,
        400
      ],
      \"id\": \"930aee49-1663-4d0f-b5d4-8e2eafc048d5\",
      \"name\": \"Merge\"
    }
  ],
  \"pinData\": {},
  \"connections\": {
    \"Contexto de la App + Fase 1 DCU\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar Prompt + PDFs\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Preparar Prompt + PDFs\": {
      \"main\": [
        [
          {
            \"node\": \"Consultar Gemini Pro\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Consultar Gemini Pro\": {
      \"main\": [
        [
          {
            \"node\": \"Limpiar Datos DCU\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Limpiar Datos DCU\": {
      \"main\": [
        [
          {
            \"node\": \"Markdown User Persona\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Generar Journey Map\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Markdown Story Map\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Generar Mapa Navegacional\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar Journey Map\": {
      \"main\": [
        [
          {
            \"node\": \"Limpiar Journey Map\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Limpiar Mapa Navegacional\": {
      \"main\": [
        [
          {
            \"node\": \"Markdown Mapa Navegacional\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Gemini 2.5 Pro\": {
      \"ai_languageModel\": [
        [
          {
            \"node\": \"Generar Journey Map\",
            \"type\": \"ai_languageModel\",
            \"index\": 0
          },
          {
            \"node\": \"Generar Mapa Navegacional\",
            \"type\": \"ai_languageModel\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar Mapa Navegacional\": {
      \"main\": [
        [
          {
            \"node\": \"Limpiar Mapa Navegacional\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Limpiar Prompt Prototipo\": {
      \"main\": [
        [
          {
            \"node\": \"Generar TXT del Prompt\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Markdown User Persona\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar UP para Azure\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Markdown Story Map\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar SM para Azure\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Markdown Journey Map\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar JM para Azure\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Markdown Mapa Navegacional\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar MN para Azure\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Preparar UP para Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Subir a Wikis de Azure UP\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Preparar SM para Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Subir a Wikis de Azure SM\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Preparar JM para Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Subir a Wikis de Azure JM\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Preparar MN para Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Subir a Wikis de Azure MN\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Subir a Wikis de Azure JM\": {
      \"main\": [
        [
          {
            \"node\": \"Merge\",
            \"type\": \"main\",
            \"index\": 2
          }
        ]
      ]
    },
    \"Subir a Wikis de Azure MN\": {
      \"main\": [
        [
          {
            \"node\": \"Merge\",
            \"type\": \"main\",
            \"index\": 3
          }
        ]
      ]
    },
    \"Consultar Gemini Pro Fase 3\": {
      \"main\": [
        [
          {
            \"node\": \"Limpiar Prompt Prototipo\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar Prompt Magic Patterns\": {
      \"main\": [
        [
          {
            \"node\": \"Consultar Gemini Pro Fase 3\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Limpiar Journey Map\": {
      \"main\": [
        [
          {
            \"node\": \"Markdown Journey Map\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Subir a Wikis de Azure UP\": {
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
    \"Subir a Wikis de Azure SM\": {
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
            \"node\": \"Generar Prompt Magic Patterns\",
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
  \"versionId\": \"3bdab732-5569-4a37-ac9b-2dac938514e8\",
  \"meta\": {
    \"templateCredsSetupCompleted\": true,
    \"instanceId\": \"dd78417110242d2eb4963c4005065e3f0d57bf98172748acf3fb7ccb487e7799\"
  },
  \"id\": \"ZCsxeTHTBLjYfaZe\",
  \"tags\": []
}
```

---

### Navegación

[← Prompt 005](/04-orquestacion-productiva/005/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 007 →](/04-orquestacion-productiva/007/)
{% endraw %}
