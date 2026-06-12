---
layout: default
title: '054. Listo, ahora sigamos con los cambios quirujicos: { ''nodes'': [ {..…'
parent: Orquestación n8n productiva
nav_order: 54
permalink: /04-orquestacion-productiva/054/
---

{% raw %}

# Prompt 054
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 48,945 caracteres &middot; **Posición en la conversación:** 54 de 103

---

```
Listo, ahora sigamos con los cambios quirujicos:



{
  \"nodes\": [
    {
      \"parameters\": {
        \"formTitle\": \"Fase 4 DCU - Protocolo de Evaluación\",
        \"formDescription\": \"Sube aquí las capturas generadas por Magic Patterns para crear el Protocolo de Pruebas.\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldLabel\": \"Objetivo del Sprint\",
              \"placeholder\": \"Ingresa el nombre del sprint \",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Captura Vista Estudiante\",
              \"fieldType\": \"file\",
              \"acceptFileTypes\": \".jpg, .png\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Captura Vista Tutor\",
              \"fieldType\": \"file\",
              \"acceptFileTypes\": \".jpg, .png\",
              \"requiredField\": true
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.formTrigger\",
      \"typeVersion\": 2.3,
      \"position\": [
        -2880,
        -96
      ],
      \"id\": \"12d993ab-82be-42ac-ab2b-40ee4150dfeb\",
      \"name\": \"Formulario Carga Captura Prototipo\",
      \"webhookId\": \"2894a3b7-1614-4282-807e-adf44433190b\"
    },
    {
      \"parameters\": {
        \"modelName\": \"models/gemini-2.5-pro\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.lmChatGoogleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -2464,
        144
      ],
      \"id\": \"a723e351-8651-4f85-9700-a51a632344fc\",
      \"name\": \"Google Gemini Chat Model\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"jzQmB3SLyBHRcVz9\",
          \"name\": \"Gemini Discovery\"
        }
      }
    },
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"=# PROMPT MEJORADO PARA GENERAR PROTOCOLOS DE EVALUACIÓN DE USUARIO (FASE 4 DCU)\\n\\nEres un experto en **Diseño Centrado en el Usuario (DCU)** especializado en **Evaluación de Usabilidad** y protocolos de testing con usuarios reales siguiendo estándares de UX Research.\\n\\n---\\n\\n##  INSTRUCCIONES CRÍTICAS - LEE PRIMERO\\n\\n**IMPORTANTE:** Este prompt contiene ejemplos de FORMATO únicamente. Tu trabajo es:\\n\\n1.  **ANALIZAR** el objetivo del sprint y las capturas de pantalla proporcionadas\\n2.  **GENERAR** contenido completamente nuevo basado en lo que ves en las imágenes\\n3.  **USAR** los ejemplos solo como referencia de estructura y formato\\n4.  **NO COPIAR** nombres, situaciones, tareas o datos de los ejemplos\\n5.  **NO INVENTAR** funcionalidades que no aparezcan en las capturas\\n\\n**Si copias literalmente los ejemplos (Pedro Ramírez, María López, etc.), estarás fallando en la tarea.**\\n\\n---\\n\\n##  LISTA DE NOMBRES Y TÉRMINOS PROHIBIDOS (NO USAR NUNCA)\\n\\n**IMPORTANTE:** Los siguientes nombres, materias y datos son SOLO ejemplos de formato. NO los uses en tu respuesta:\\n\\n### Nombres prohibidos:\\n-  Pedro Ramírez\\n-  María López\\n-  Laura Campos\\n-  Cualquier variación de estos nombres (Pedro, María, Laura, Ramírez, López, Campos)\\n\\n### Materias/cursos prohibidos:\\n-  Física Fundamental\\n-  Cálculo Integral\\n-  Matemáticas (usa el nombre real que veas en las capturas)\\n\\n### Calificaciones/comentarios prohibidos:\\n-  \\\"4 estrellas\\\"\\n-  \\\"5 estrellas\\\" (a menos que sea relevante para las capturas)\\n-  \\\"Buena clase, pero el internet falló un poco\\\"\\n-  \\\"Excelente explicación, muy clara y paciente\\\"\\n-  Cualquier comentario similar a los ejemplos\\n\\n** EN SU LUGAR, debes:**\\n- Crear nombres COMPLETAMENTE DIFERENTES (ej: Carlos Mendoza, Ana Ruiz, Diego Torres)\\n- Usar las materias/servicios que REALMENTE veas en las capturas\\n- Inventar comentarios NUEVOS apropiados para el contexto\\n- Usar calificaciones relevantes al escenario real\\n\\n**Si usas algún término de la lista prohibida, tu respuesta será RECHAZADA.**\\n\\n---\\n\\n## CONTEXTO DEL PROYECTO\\n\\n**Objetivo del Sprint:**\\n\\n```\\n{{ $json.objetivo_sprint }}\\n```\\n\\n**Capturas de Pantalla del Prototipo:**\\n\\n**Vista Estudiante (Usuario Buscador):**\\n\\n- Total de capturas: {{ $json.total_capturas_estudiante }}\\n- Pantallas disponibles: [Las imágenes adjuntas representan el flujo del estudiante/usuario buscador en el prototipo]\\n\\n**Vista Tutor (Usuario Ofertante):**\\n\\n- Total de capturas: {{ $json.total_capturas_tutor }}\\n- Pantallas disponibles: [Las imágenes adjuntas representan el flujo del tutor/usuario ofertante en el prototipo]\\n\\n---\\n\\n## PROCESO DE TRABAJO\\n\\n**PASO 1:** Observa detenidamente TODAS las capturas de pantalla\\n\\n- ¿Qué pantallas hay?\\n- ¿Qué elementos UI ves? (botones, formularios, listas, etc.)\\n- ¿Qué acciones puede realizar el usuario?\\n- ¿Qué flujo de navegación siguen?\\n\\n**PASO 2:** Relaciona lo que ves con el objetivo del sprint\\n\\n- ¿Qué funcionalidad específica se está probando?\\n- ¿Qué problema de usuario se está resolviendo?\\n\\n**PASO 3:** Genera protocolos basándote ÚNICAMENTE en los pasos 1 y 2\\n\\n- Crea escenarios realistas para LAS FUNCIONALIDADES QUE VES\\n- Define tareas que SE PUEDAN COMPLETAR con las pantallas mostradas\\n- Usa nombres y situaciones DIFERENTES a los ejemplos\\n\\n---\\n\\n---\\n\\n## GUÍA DE ANÁLISIS VISUAL DE CAPTURAS\\n\\n**IMPORTANTE:** No te limites a leer el texto de las pantallas. Analiza VISUALMENTE:\\n\\n### **1. ARQUITECTURA DE INFORMACIÓN**\\n- ¿Qué elementos están en la parte superior? (navegación, títulos, búsqueda)\\n- ¿Qué es lo más prominente visualmente? (tamaño, color, posición)\\n- ¿Cómo está organizada la información? (listas, grids, cards, tablas)\\n- ¿Qué flujo de lectura visual sugiere el diseño? (F-pattern, Z-pattern)\\n\\n### **2. ELEMENTOS INTERACTIVOS**\\n- **Botones primarios:** ¿Qué acciones principales puede hacer el usuario? (color destacado, tamaño grande)\\n- **Botones secundarios:** ¿Qué acciones opcionales hay? (outline, colores neutros)\\n- **Formularios:** ¿Qué campos de entrada hay? ¿Son obligatorios u opcionales?\\n- **Navegación:** ¿Hay tabs, menú lateral, breadcrumbs?\\n- **Filtros/Búsqueda:** ¿Cómo puede refinar resultados el usuario?\\n\\n### **3. CONTENIDO Y DATOS**\\n- **Cards/Listas:** ¿Qué información muestra cada elemento? (foto, nombre, rating, precio, etc.)\\n- **Estados:** ¿Hay indicadores visuales de estado? (pendiente, completado, activo)\\n- **Feedback visual:** ¿Hay badges, iconos de verificación, alertas?\\n- **Jerarquía de datos:** ¿Qué datos son primarios vs secundarios? (negrita, tamaño, color)\\n\\n### **4. FLUJO DE USUARIO**\\n- ¿Qué acciones puede realizar en ESTA pantalla específica?\\n- Si hay un botón, ¿a dónde lleva? (modal, nueva pantalla, acción inline)\\n- ¿Qué pasos visuales debe seguir para completar una tarea?\\n- ¿Hay validaciones o confirmaciones visuales? (modales de confirmación)\\n\\n### **5. PATRONES DE DISEÑO USADOS**\\n- **Cards:** Contenedores de información discretos con acciones\\n- **Modales:** Dialogs superpuestos para acciones focalizadas\\n- **Tabs:** Cambio de vistas sin recargar\\n- **Dropdowns:** Menús desplegables para opciones\\n- **Calendarios:** Selección de fechas/horarios\\n- **Stepper/Wizard:** Flujos multipaso\\n\\n---\\n\\n## EJEMPLO DE ANÁLISIS VISUAL CORRECTO\\n\\n**MAL (solo leer texto):**\\n \\\"Veo que dice 'Buscar tutor' y hay un listado de tutores con nombres...\\\"\\n\\n**BIEN (análisis visual):**\\n \\\"La pantalla tiene un **buscador prominente en la parte superior** (indica que la búsqueda es la acción principal). Debajo hay un **grid de 3 columnas con cards** de tutores. Cada card tiene una **estructura visual clara**: foto circular arriba a la izquierda, nombre en bold, **estrellas de rating en amarillo prominentes** (elemento de trust building), precio destacado en azul a la derecha, y un **botón CTA azul al final** que dice 'Ver Perfil'. Esto sugiere que el flujo es: Buscar → Escanear cards → Hacer clic en card o botón para ver detalle.\\\"\\n\\n---\\n\\n## CHECKLIST DE ANÁLISIS VISUAL ANTES DE CREAR TAREAS\\n\\nAntes de definir las tareas del protocolo, responde:\\n\\n- [ ] ¿Qué es lo PRIMERO que llama la atención visualmente en cada pantalla?\\n- [ ] ¿Qué botones/elementos parecen \\\"clickeables\\\"? (color, hover states visibles)\\n- [ ] ¿Hay formularios? ¿Cuántos campos? ¿Qué tipo de inputs? (text, select, date, file)\\n- [ ] ¿Hay modales o popups? ¿Qué accionan y qué opciones dan?\\n- [ ] ¿El flujo requiere múltiples pantallas? ¿En qué orden?\\n- [ ] ¿Hay elementos de navegación hacia atrás? (breadcrumbs, botón \\\"volver\\\")\\n- [ ] ¿Qué datos específicos debe ingresar el usuario? (visible en placeholders, labels)\\n\\n**Si no puedes responder estas preguntas mirando las capturas, NO inventes. Analiza más detenidamente.**\\n\\n---\\n\\n## ESTRUCTURA DEL PROTOCOLO (GENERAR UNO PARA ESTUDIANTE Y OTRO PARA TUTOR)\\n\\n### **Evaluación de Usuario -- [Estudiante/Tutor]**\\n\\n---\\n\\n#### **1. OBJETIVO**\\n\\n**QUÉ HACER:**\\nBasándote en el objetivo del sprint Y las pantallas visibles en las capturas, escribe un objetivo específico.\\n\\n**FORMATO DE REFERENCIA (NO COPIAR):**\\n\\n```\\n\\\"Evaluar si [tipo de usuario] puede [acción visible en las capturas] y [resultado relacionado con el objetivo del sprint].\\\"\\n```\\n\\n**EJEMPLO ILUSTRATIVO (USAR SOLO COMO REFERENCIA DE FORMATO):**\\n❌ NO copies: \\\"Evaluar si los estudiantes pueden localizar una tutoría finalizada en su historial y completar el proceso de calificación y reseña del tutor.\\\"\\n\\n✅ SÍ genera algo como: \\\"Evaluar si [el tipo de usuario de TU proyecto] puede [hacer lo que se ve en TUS capturas] para [lograr el objetivo de TU sprint].\\\"\\n\\n---\\n\\n#### **2. RECLUTAR PARTICIPANTES**\\n\\n**QUÉ HACER:**\\nDefine el perfil del participante basándote en:\\n\\n- El rol que estás evaluando (Estudiante o Tutor)\\n- El tipo de aplicación que se ve en las capturas\\n- Las características demográficas relevantes para tu proyecto\\n\\n**Perfil del participante:**\\n\\n- **Rol:** [Basándote en tu proyecto: ¿es estudiante/tutor o tiene otro nombre?]\\n- **Edad:** [Rango apropiado según el contexto visible en las capturas]\\n- **Ocupación:** [Según el rol específico de tu aplicación]\\n- **Experiencia con tecnología:** [Nivel apropiado para tu aplicación]\\n- **Características específicas:**\\n  - [Lista 2-3 características relevantes basadas en lo que hace este usuario en TU aplicación]\\n\\n**Cantidad recomendada:** 5 participantes por perfil\\n\\n**Método de reclutamiento:**\\n[Define métodos apropiados para TU público objetivo]\\n\\n---\\n\\n#### **3. SELECCIONAR ESCENARIO Y TAREAS**\\n\\n##### **ESCENARIO**\\n\\n**QUÉ HACER:**\\nCrea UN escenario completamente nuevo que:\\n\\n- Sea realista para el contexto de TU aplicación\\n- Motive al usuario a realizar las acciones que ves en las capturas\\n- Use nombres y situaciones DIFERENTES a los ejemplos\\n\\n**ESTRUCTURA (NO el contenido):**\\n\\\"[Situación inicial]. [Contexto temporal]. [Estado previo]. [Motivación para usar la app].\\\"\\n\\n**EJEMPLO ILUSTRATIVO - SOLO FORMATO (NO COPIAR CONTENIDO):**\\n\\n🚫 **LO QUE NO DEBES HACER:**\\n\\\"Acabas de terminar una tutoría de 'Física Fundamental' con el tutor Pedro Ramírez...\\\"\\n\\n✅ **LO QUE SÍ DEBES HACER:**\\nObservar TUS capturas y crear un escenario que tenga sentido para lo que ves. Por ejemplo, si ves pantallas de reservación, crea un escenario sobre reservar. Si ves pantallas de historial, crea uno sobre revisar historial. Usa nombres DIFERENTES.\\n\\n---\\n\\n##### **TAREAS**\\n\\n**QUÉ HACER:**\\nDefine 1-3 tareas que:\\n\\n- Se puedan completar con las pantallas que ves en TUS capturas\\n- No incluyan funcionalidades inventadas\\n- Tengan criterios de éxito medibles\\n\\n**PROCESO PARA CREAR TAREAS:**\\n\\n1. Mira las capturas: ¿Qué botones/formularios/elementos hay?\\n2. Identifica el flujo: ¿Qué secuencia de pasos debe seguir el usuario?\\n3. Define la tarea: ¿Qué acción específica debe completar?\\n\\n**FORMATO:**\\n\\n```\\n- **Tarea [número]:** [Acción específica basada en TUS capturas]\\n  - **Objetivo:** [Qué debe lograr]\\n  - **Datos específicos:** [Si hay formularios en tus capturas, qué debe ingresar]\\n  - **Criterio de éxito:** [Cómo saber que completó la tarea]\\n```\\n\\n**REFERENCIA DE ESTRUCTURA (CREA TU PROPIO CONTENIDO):**\\n\\n🚫 NO copies: \\\"Reseña al tutor Pedro Ramírez... Calificación: 4 estrellas...\\\"\\n\\n✅ SÍ crea: Una tarea basada en lo que VES en tus capturas, con datos apropiados para TU contexto\\n\\n---\\n\\n#### **4. VARIABLES POR MEDIR**\\n\\n**INSTRUCCIÓN:** Copia esta tabla exactamente como está (esta parte SÍ debe ser idéntica):\\n\\n| **Dimensión**    | **Datos**                             | **Cómo medir**                                                  |\\n| ---------------- | ------------------------------------- | --------------------------------------------------------------- |\\n| **Eficacia**     | Tarea completa (Sí/No)                | (# usuarios que completaron la tarea / Total de usuarios) × 100 |\\n| **Eficiencia**   | Tiempo en realizar una tarea          | Σ(tiempo individual de la tarea) / Total usuarios               |\\n| **Satisfacción** | Entrevista de satisfacción de usuario | Entrevista al finalizar las tareas                              |\\n\\n---\\n\\n#### **5. PROTOCOLO DE EJECUCIÓN**\\n\\n##### **5.1 Mensaje de Bienvenida**\\n\\n**QUÉ HACER:**\\nAdapta el guion reemplazando [Objetivo] con el objetivo real que escribiste en el punto 1.\\n\\n**GUION (Adaptar, no copiar literalmente):**\\n\\n\\\"Buenos días/tardes, espero que te encuentres bien. Mi nombre es [Nombre del evaluador].\\n\\nQuiero empezar agradeciéndote por haber accedido a asistir a esta prueba de usuario. El objetivo de la prueba es: **'[INSERTAR AQUÍ EL OBJETIVO DEL PUNTO 1]'**, por lo que **esta no es una prueba para evaluar tus habilidades o conocimientos**. Queremos probar la aplicación, no a ti.\\n\\nAsí que no hay respuestas correctas o incorrectas, y cualquier dificultad que tengas será muy útil para mejorar el diseño.\\\"\\n\\n---\\n\\n##### **5.2 Explicación del Contexto de la Prueba**\\n\\n**QUÉ HACER:**\\nDescribe las 2-3 pantallas principales que VES en TUS capturas. No inventes pantallas.\\n\\n**Tour de la aplicación:**\\n\\n\\\"Antes de comenzar la prueba, te mostraré rápidamente algunas pantallas de la aplicación, para que tengas una noción de la app. Simplemente quiero que observes.\\n\\n**(Basándote en TUS capturas, lista las pantallas principales que mostrarás):**\\n\\n- [Nombre de la primera pantalla que ves en tus capturas]: [Breve descripción de qué muestra y qué permite hacer]\\n- [Nombre de la segunda pantalla]: [Descripción]\\n- [Nombre de la tercera pantalla si aplica]: [Descripción]\\n\\n¿Me confirmas si estás viendo mi pantalla?\\n\\nA continuación, voy a enviar el link a la prueba. Me confirmas cuando hayas accedido, por favor.\\n\\nAyúdame compartiendo tu pantalla.\\n\\nYo te voy a guiar por la prueba. Presiona en 'Get started' para comenzar.\\\"\\n\\n---\\n\\n**Contexto de la prueba:**\\n\\n\\\"Continuando con la prueba, la cual consta de [1/varios] escenario(s) con [número] tarea(s), quiero que te sitúes en el siguiente escenario:\\n\\n**'[INSERTAR AQUÍ EL ESCENARIO COMPLETO DEL PUNTO 3]'**\\n\\nPresiona 'Continue' para avanzar, por favor. Esperemos a que cargue.\\n\\nTu tarea es:\\n\\n[INSERTAR AQUÍ LAS TAREAS DEL PUNTO 3 CON TODOS SUS DETALLES]\\n\\nCuando estés listo/a, presiona el botón 'Ok. Got it!'. En caso de que quieras volver a ver la instrucción de la tarea, presiona el ícono de la lista.\\n\\n**Algo adicional:** Voy a pedirte que **digas en voz alta todo lo que piensas** mientras realizas la tarea. Esto nos ayuda a entender tu proceso de pensamiento.\\\"\\n\\n---\\n\\n##### **5.3 Durante la Prueba (Respuestas Estandarizadas)**\\n\\n**INSTRUCCIÓN:** Copia estas respuestas exactamente (esta sección SÍ debe ser idéntica):\\n\\n**Si el participante deja de pensar en voz alta:**\\n\\\"Por favor, no olvides decir en voz alta todo lo que piensas.\\\"\\n\\n**Si el participante termina la tarea:**\\n\\\"Presiona 'Continue', por favor. Ya puedes dejar de compartir tu pantalla.\\\"\\n\\n**Si solicita repetir alguna parte:**\\n[Leer textualmente el escenario o tarea tal cual está en el protocolo]\\n\\n**Si no cumple la tarea (después de 2 minutos sin avance):**\\n\\\"No te preocupes, no es una evaluación hacia ti sino al aplicativo. Por favor, presiona el ícono de la flecha en la parte inferior central y luego presiona el botón de 'Skip task' para finalizar la tarea.\\\"\\n\\n**Si solicita ayuda:**\\n\\\"Gracias por preguntar, entiendo perfectamente tu duda, pero ya que mi objetivo es observar cómo funciona la aplicación desde la perspectiva de los usuarios, no puedo guiarte directamente. Recuerda que no hay respuestas correctas o incorrectas.\\\"\\n\\n---\\n\\n##### **5.4 Ejecutar la Prueba**\\n\\n**INSTRUCCIÓN:** Copia esta sección exactamente:\\n\\n**Herramienta recomendada:** Useberry, Maze o UserTesting\\n\\n**Configuración:**\\n\\n- Subir el prototipo interactivo (Figma, Marvel, InVision)\\n- Configurar las tareas del punto 3\\n- Habilitar grabación de pantalla y audio\\n- Activar registro de clics y tiempo\\n\\n---\\n\\n##### **5.5 Post-Evaluación (Entrevista de Satisfacción)**\\n\\n**INSTRUCCIÓN:** Copia estas preguntas exactamente:\\n\\n\\\"Para finalizar con la prueba, te voy a realizar algunas preguntas sobre tu experiencia usando el prototipo:\\\"\\n\\n1. ¿Qué fue lo que más te gustó de la experiencia?\\n2. ¿Hubo algo que te resultara frustrante o que no te gustara?\\n3. ¿Hubo algún momento en el que te sentiste perdido/a o no supiste qué hacer a continuación?\\n4. ¿Qué parte del proceso te pareció más sencilla de completar? ¿Y cuál fue la más complicada?\\n5. ¿Qué te pareció el diseño visual de la aplicación (colores, tipografía, iconos)?\\n6. Si pudieras cambiar una sola cosa de la aplicación, ¿cuál sería?\\n7. ¿Hay alguna función que no viste y que te encantaría tener?\\n8. Para terminar, ¿hay algo más que quieras comentar sobre tu experiencia o alguna sugerencia que nos quieras dar?\\n\\n**Cierre:**\\n\\\"Esas serían todas las preguntas. Gracias por tomarte el tiempo de participar en esta prueba. El equipo realmente lo aprecia. Tus comentarios permitirán mejorar el diseño del prototipo.\\\"\\n\\n---\\n\\n#### **6. CRITERIOS DE ÉXITO**\\n\\n**QUÉ HACER:**\\nAdapta las métricas al número y complejidad de las tareas que definiste en el punto 3.\\n\\n**Eficacia:**\\n\\n- Mínimo aceptable: 80% de usuarios completan todas las tareas\\n- Ideal: 100% de usuarios completan todas las tareas\\n\\n**Eficiencia:**\\n\\n- Tiempo promedio esperado por tarea: [Estima según la complejidad de TUS tareas - simple: 30-60s, media: 1-2 min, compleja: 2-4 min]\\n- Máximo aceptable: [Tiempo estimado + 50%]\\n\\n**Satisfacción:**\\n\\n- Puntuación mínima en preguntas clave: 4/5\\n- Sin reportes de frustraciones mayores\\n- Al menos 70% reporta experiencia positiva general\\n\\n---\\n\\n#### **7. PLAN DE CONTINGENCIA**\\n\\n**INSTRUCCIÓN:** Copia esta sección exactamente:\\n\\n**Problemas técnicos:**\\n\\n- **Prototipo no carga:** Tener versión de respaldo en PDF o video grabado\\n- **Usuario no puede compartir pantalla:** Usar grabación local o solicitar que grabe con su teléfono\\n- **Herramienta de testing falla:** Cambiar a sesión moderada por videollamada con observación directa\\n\\n**Participante con dificultades:**\\n\\n- **Se frustra excesivamente:** Recordar que es el prototipo lo que se prueba, no él/ella. Ofrecer pausa breve\\n- **Abandona la tarea:** Anotar punto de abandono, preguntar qué lo llevó a eso, agradecer participación\\n- **Completa muy rápido sin pensar:** Pedirle que repita más despacio verbalizando su proceso\\n\\n**Casos especiales:**\\n\\n- **Usuario demasiado experimentado:** Pedirle que actúe como un usuario promedio\\n- **Usuario nunca usó apps similares:** Dar contexto adicional breve sin revelar soluciones\\n\\n---\\n\\n## CHECKLIST DE VALIDACIÓN ANTES DE ENTREGAR\\n\\nAntes de generar los protocolos finales, verifica:\\n\\n- [ ] ¿Analicé TODAS las capturas de pantalla adjuntas?\\n- [ ] ¿El objetivo del punto 1 refleja lo que veo en LAS CAPTURAS, no en los ejemplos?\\n- [ ] ¿El escenario del punto 3 usa situaciones y nombres DIFERENTES a \\\"Pedro Ramírez\\\", \\\"María López\\\", etc.?\\n- [ ] ¿Las tareas se pueden completar con las pantallas que veo en LAS CAPTURAS?\\n- [ ] ¿No inventé funcionalidades que no aparecen en las imágenes?\\n- [ ] ¿El tour de la aplicación describe las pantallas que VEO, no las del ejemplo?\\n- [ ] ¿Ambos protocolos (Estudiante y Tutor) son diferentes y apropiados para cada rol?\\n\\n**Si respondiste NO a alguna pregunta, REVISA antes de entregar.**\\n\\n---\\n\\n## FORMATO DE SALIDA\\n\\nDevuelve DOS documentos markdown separados:\\n\\n**Documento 1:**\\n\\n```markdown\\n# Protocolo de Evaluación de Usuario - [Rol Específico Usuario 1]\\n\\n[Toda la estructura completa del punto 1 al 7]\\n```\\n\\n**Documento 2:**\\n\\n```markdown\\n# Protocolo de Evaluación de Usuario - [Rol Específico Usuario 2]\\n\\n[Toda la estructura completa del punto 1 al 7]\\n```\\n\\n---\\n\\n## RECORDATORIO FINAL\\n\\n🎯 **TU MISIÓN:**\\n\\n- Analizar el objetivo del sprint + capturas de pantalla\\n- Generar protocolos NUEVOS basados en lo que ves\\n- Usar los ejemplos solo como guía de formato\\n\\n❌ **LO QUE NUNCA DEBES HACER:**\\n\\n- Copiar \\\"Pedro Ramírez\\\", \\\"María López\\\", \\\"Laura Campos\\\" o cualquier nombre del ejemplo\\n- Copiar \\\"Física Fundamental\\\", \\\"Cálculo Integral\\\" o materias específicas del ejemplo\\n- Copiar calificaciones o comentarios específicos de los ejemplos (\\\"4 estrellas\\\", \\\"Excelente explicación, muy clara y paciente\\\")\\n- Inventar funcionalidades no visibles en las capturas\\n- Copiar las descripciones de pantallas del ejemplo\\n\\n✅ **LO QUE SIEMPRE DEBES HACER:**\\n\\n- Crear nombres COMPLETAMENTE NUEVOS y DIFERENTES a los ejemplos (Carlos Vega, Diana Morales, etc.)\\n- Usar las materias/servicios que REALMENTE aparecen en las capturas\\n- Describir las pantallas que REALMENTE ves en las capturas\\n- Definir tareas que se puedan hacer con las pantallas mostradas\\n- Mantener el formato profesional del protocolo\\n\\n---\\n\\n## 🔍 AUTO-VALIDACIÓN OBLIGATORIA ANTES DE RESPONDER\\n\\nAntes de entregar tu respuesta, verifica que NO contenga NINGUNO de estos términos:\\n\\n**BÚSQUEDA PROHIBIDA:**\\n```\\n\\\"Pedro\\\", \\\"Ramírez\\\", \\\"María\\\", \\\"López\\\", \\\"Laura\\\", \\\"Campos\\\", \\n\\\"Física Fundamental\\\", \\\"Cálculo Integral\\\", \\\"4 estrellas\\\", \\n\\\"internet falló\\\", \\\"Buena clase\\\", \\\"muy clara y paciente\\\"\\n```\\n\\n**Si encuentras CUALQUIERA de estos términos en tu respuesta:**\\n1. ❌ DETENTE inmediatamente\\n2. 🔄 REESCRIBE completamente esa sección con datos NUEVOS\\n3. ✅ VERIFICA nuevamente antes de entregar\\n\\n**Recuerda:** El objetivo es demostrar que puedes analizar contenido real y generar protocolos personalizados, no copiar plantillas.\\n\\n---\",
        \"options\": {
          \"systemMessage\": \"Eres un experto en Diseño Centrado en el Usuario (DCU) especializado en Evaluación de Usabilidad y protocolos de testing con usuarios reales siguiendo estándares de UX Research como Nielsen Norman Group y ISO 9241-11.\\n\\nGeneras protocolos de evaluación detallados, estructurados y listos para ser ejecutados por evaluadores sin necesidad de información adicional.\\n\\nTu especialidad es crear escenarios realistas, tareas medibles y guiones palabra por palabra para moderadores de pruebas de usabilidad.\"
        }
      },
      \"type\": \"@n8n/n8n-nodes-langchain.agent\",
      \"typeVersion\": 3,
      \"position\": [
        -2464,
        -96
      ],
      \"id\": \"8f73ac10-7972-4891-a99a-5e12a3a4ead3\",
      \"name\": \"Generación del Protocolo de Evaluación\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// ==================================================================\\n// NODO: Preparar Input para IA Agent \\n// ==================================================================\\n\\nconst formData = $input.first().json;\\nconst items = $input.all();\\n\\n// 1. EXTRAER OBJETIVO DEL SPRINT\\nconst objetivoSprint = formData['Objetivo del Sprint'] || '';\\n\\nif (!objetivoSprint) {\\n  throw new Error('❌ Falta el \\\"Objetivo del Sprint\\\" en el formulario.');\\n}\\n\\n// 2. FUNCIÓN PARA CONVERTIR BINARIO A BASE64\\nasync function obtenerImagenBase64(baseName, index) {\\n  const posiblesNombres = [\\n    `${baseName}_${index}`,\\n    `data_${baseName}_${index}`\\n  ];\\n  \\n  for (const nombreBinario of posiblesNombres) {\\n    // Buscar en todos los items\\n    for (const item of items) {\\n      if (item.binary && item.binary[nombreBinario]) {\\n        const binario = item.binary[nombreBinario];\\n        \\n        // Obtener el buffer real\\n        let imageData;\\n        \\n        if (binario.data instanceof Buffer) {\\n          // Si ya es un Buffer\\n          imageData = binario.data.toString('base64');\\n        } else if (typeof binario.data === 'string' && binario.data !== 'filesystem-v2') {\\n          // Si ya es base64\\n          imageData = binario.data;\\n        } else {\\n          // Si es una referencia al filesystem, usar el helper de n8n\\n          try {\\n            const buffer = await this.helpers.getBinaryDataBuffer(item.index || 0, nombreBinario);\\n            imageData = buffer.toString('base64');\\n          } catch (error) {\\n            console.warn(` Error leyendo ${nombreBinario}:`, error.message);\\n            continue;\\n          }\\n        }\\n        \\n        return {\\n          inline_data: {\\n            mime_type: binario.mimeType || 'image/png',\\n            data: imageData\\n          }\\n        };\\n      }\\n    }\\n  }\\n  \\n  console.warn(` No se encontró imagen: ${baseName}_${index}`);\\n  return null;\\n}\\n\\n// 3. PROCESAR CAPTURAS ESTUDIANTE\\nconst capturasEstudianteRaw = formData['Captura Vista Estudiante'];\\nlet capturasEstudianteBase64 = [];\\n\\nif (capturasEstudianteRaw && Array.isArray(capturasEstudianteRaw)) {\\n  for (let i = 0; i < capturasEstudianteRaw.length; i++) {\\n    const imagen = await obtenerImagenBase64('Captura_Vista_Estudiante', i);\\n    if (imagen) {\\n      capturasEstudianteBase64.push(imagen);\\n    }\\n  }\\n}\\n\\n// 4. PROCESAR CAPTURAS TUTOR\\nconst capturasTutorRaw = formData['Captura Vista Tutor'];\\nlet capturasTutorBase64 = [];\\n\\nif (capturasTutorRaw && Array.isArray(capturasTutorRaw)) {\\n  for (let i = 0; i < capturasTutorRaw.length; i++) {\\n    const imagen = await obtenerImagenBase64('Captura_Vista_Tutor', i);\\n    if (imagen) {\\n      capturasTutorBase64.push(imagen);\\n    }\\n  }\\n}\\n\\n// 5. VALIDAR\\nconst totalImagenes = capturasEstudianteBase64.length + capturasTutorBase64.length;\\n\\nif (totalImagenes === 0) {\\n  throw new Error(' No se detectaron imágenes válidas.');\\n}\\n\\nconsole.log(` ${totalImagenes} imágenes procesadas correctamente`);\\nconsole.log(`   - Vista Estudiante: ${capturasEstudianteBase64.length}`);\\nconsole.log(`   - Vista Tutor: ${capturasTutorBase64.length}`);\\n\\n// Verificar que los datos no sean \\\"filesystem-v2\\\"\\nconst primeraImagen = capturasEstudianteBase64[0];\\nif (primeraImagen.inline_data.data === 'filesystem-v2') {\\n  throw new Error(' Error: Las imágenes siguen como \\\"filesystem-v2\\\". El método de lectura no funcionó.');\\n}\\n\\nconsole.log(`Longitud del primer base64: ${primeraImagen.inline_data.data.substring(0, 50)}...`);\\n\\n// 6. RETORNAR\\nreturn {\\n  json: {\\n    objetivo_sprint: objetivoSprint,\\n    total_capturas_estudiante: capturasEstudianteBase64.length,\\n    total_capturas_tutor: capturasTutorBase64.length,\\n    imagenes_estudiante: capturasEstudianteBase64,\\n    imagenes_tutor: capturasTutorBase64,\\n    metadata: {\\n      fecha_preparacion: new Date().toISOString(),\\n      total_imagenes: totalImagenes\\n    }\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2672,
        -96
      ],
      \"id\": \"d73c377b-e952-481c-b6ef-17715460cfb4\",
      \"name\": \"Preparar input para IA Agent\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO: Split Protocolos (VERSIÓN MEJORADA Y ROBUSTA)\\n\\nconst textoCompleto = $json.protocolos_completos;\\n\\n// Validación inicial\\nif (!textoCompleto || textoCompleto.length < 500) {\\n  throw new Error('El texto de protocolos está vacío o es demasiado corto. Verifica el output del AI Agent.');\\n}\\n\\n// Regex que captura diferentes nombres de roles\\nconst regexProtocolo = /^#\\\\s+Protocolo de Evaluación de Usuario\\\\s*[-–—]\\\\s*(.+?)$/gim;\\n\\n// Encontrar todos los protocolos\\nconst matches = [...textoCompleto.matchAll(regexProtocolo)];\\n\\nconsole.log(` Protocolos encontrados: ${matches.length}`);\\n\\nif (matches.length === 0) {\\n  throw new Error(' No se encontró ningún protocolo con el formato esperado. Verifica que el AI Agent esté generando los encabezados correctos.');\\n}\\n\\nif (matches.length === 1) {\\n  console.warn(' Solo se encontró UN protocolo. Se esperaban dos (uno por cada rol).');\\n}\\n\\n// Extraer los protocolos\\nconst protocolos = [];\\n\\nfor (let i = 0; i < matches.length; i++) {\\n  const match = matches[i];\\n  const inicioProtocolo = match.index;\\n  const finProtocolo = matches[i + 1]?.index || textoCompleto.length;\\n  \\n  const contenidoProtocolo = textoCompleto.substring(inicioProtocolo, finProtocolo).trim();\\n  const nombreRol = match[1].trim(); // Captura el nombre del rol (Estudiante, Tutor, etc.)\\n  \\n  // Validar que el protocolo tiene contenido mínimo\\n  if (contenidoProtocolo.length < 1000) {\\n    throw new Error(` El protocolo \\\"${nombreRol}\\\" es demasiado corto (${contenidoProtocolo.length} caracteres). Probablemente el AI Agent no generó el contenido completo.`);\\n  }\\n  \\n  // Validar secciones requeridas\\n  const seccionesRequeridas = [\\n    'OBJETIVO',\\n    'RECLUTAR PARTICIPANTES',\\n    'ESCENARIO',\\n    'TAREAS',\\n    'VARIABLES POR MEDIR',\\n    'PROTOCOLO DE EJECUCIÓN'\\n  ];\\n  \\n  const seccionesFaltantes = seccionesRequeridas.filter(seccion => \\n    !contenidoProtocolo.toUpperCase().includes(seccion)\\n  );\\n  \\n  if (seccionesFaltantes.length > 0) {\\n    console.warn(` Advertencia: El protocolo \\\"${nombreRol}\\\" no contiene las siguientes secciones: ${seccionesFaltantes.join(', ')}`);\\n  }\\n  \\n  // Detectar el tipo de rol\\n  const nombreRolLower = nombreRol.toLowerCase();\\n  let tipoRol = 'desconocido';\\n  \\n  if (nombreRolLower.includes('estudiante') || nombreRolLower.includes('alumno') || nombreRolLower.includes('buscador')) {\\n    tipoRol = 'estudiante';\\n  } else if (nombreRolLower.includes('tutor') || nombreRolLower.includes('profesor') || nombreRolLower.includes('ofertante')) {\\n    tipoRol = 'tutor';\\n  } else {\\n    console.warn(`No se pudo clasificar automáticamente el rol \\\"${nombreRol}\\\". Se usará como tipo: ${i === 0 ? 'rol1' : 'rol2'}`);\\n    tipoRol = i === 0 ? 'rol1' : 'rol2';\\n  }\\n  \\n  // Generar nombre de archivo seguro\\n  const nombreArchivo = nombreRol\\n    .replace(/[^a-zA-Z0-9\\\\s]/g, '') // Elimina caracteres especiales\\n    .replace(/\\\\s+/g, '_') // Reemplaza espacios con guiones bajos\\n    .substring(0, 50); // Limita longitud\\n  \\n  protocolos.push({\\n    json: {\\n      tipo: tipoRol,\\n      rol_nombre: nombreRol,\\n      protocolo_markdown: contenidoProtocolo,\\n      titulo: `Protocolo_Evaluacion_${nombreArchivo}`,\\n      longitud: contenidoProtocolo.length,\\n      secciones_faltantes: seccionesFaltantes,\\n      es_valido: seccionesFaltantes.length === 0,\\n      // Metadata útil\\n      primer_linea: contenidoProtocolo.split('\\\\n')[0],\\n      numero_lineas: contenidoProtocolo.split('\\\\n').length\\n    }\\n  });\\n}\\n\\n// Si solo encontró un protocolo, duplicarlo con advertencia\\nif (protocolos.length === 1) {\\n  console.warn('Solo se generó un protocolo. Duplicando con advertencia...');\\n  protocolos.push({\\n    json: {\\n      tipo: 'error',\\n      rol_nombre: 'FALTA_SEGUNDO_PROTOCOLO',\\n      protocolo_markdown: '# ERROR: El AI Agent solo generó un protocolo\\\\n\\\\nSe esperaban dos protocolos (uno por cada tipo de usuario).\\\\n\\\\nPor favor, revisa:\\\\n1. El prompt del AI Agent\\\\n2. Las imágenes adjuntas\\\\n3. El objetivo del sprint\\\\n\\\\nY vuelve a ejecutar el flujo.',\\n      titulo: 'ERROR_Falta_Segundo_Protocolo',\\n      longitud: 0,\\n      secciones_faltantes: [],\\n      es_valido: false\\n    }\\n  });\\n}\\n\\n// Log resumen\\nconsole.log('\\\\n Resumen de protocolos separados:');\\nprotocolos.forEach((p, i) => {\\n  console.log(`   ${i + 1}. ${p.json.rol_nombre} (${p.json.longitud} caracteres) - Válido: ${p.json.es_valido}`);\\n});\\n\\nreturn protocolos;\\n\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1888,
        -96
      ],
      \"id\": \"a4a0d9da-fb15-42e0-98d8-c874f52584fe\",
      \"name\": \"Split Protocolos\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO: Extraer y Validar Output del AI Agent\\n\\nconst aiOutput = $input.first().json;\\n\\n// 1. EXTRAER EL TEXTO (de cualquier campo posible)\\nlet protocolosTexto = '';\\n\\nif (aiOutput.output) {\\n  protocolosTexto = aiOutput.output;\\n} else if (aiOutput.text) {\\n  protocolosTexto = aiOutput.text;\\n} else if (aiOutput.content) {\\n  protocolosTexto = aiOutput.content;\\n} else if (aiOutput.response) {\\n  protocolosTexto = aiOutput.response;\\n} else {\\n  protocolosTexto = JSON.stringify(aiOutput);\\n}\\n\\n// Verificar si es string\\nif (typeof protocolosTexto !== 'string') {\\n  protocolosTexto = JSON.stringify(protocolosTexto);\\n}\\n\\n// 2. LIMPIAR BLOQUES MARKDOWN (solo si envuelven todo el contenido)\\nprotocolosTexto = protocolosTexto.trim();\\n\\nif (protocolosTexto.startsWith('```markdown') && protocolosTexto.endsWith('```')) {\\n  protocolosTexto = protocolosTexto\\n    .replace(/^```markdown\\\\s*/i, '')\\n    .replace(/\\\\s*```$/, '')\\n    .trim();\\n} else if (protocolosTexto.startsWith('```') && protocolosTexto.endsWith('```')) {\\n  protocolosTexto = protocolosTexto\\n    .replace(/^```\\\\s*/, '')\\n    .replace(/\\\\s*```$/, '')\\n    .trim();\\n}\\n\\n// 2.5. ELIMINAR PREÁMBULO EXPLICATIVO (como \\\"Claro, como experto...\\\")\\nconst primerProtocoloIndex = protocolosTexto.indexOf('# Protocolo de Evaluación');\\n\\nif (primerProtocoloIndex > 0) {\\n  const preambulo = protocolosTexto.substring(0, primerProtocoloIndex).trim();\\n  console.log(' Se detectó preámbulo explicativo, eliminándolo...');\\n  console.log(`Preámbulo: \\\"${preambulo.substring(0, 100)}...\\\"`);\\n  protocolosTexto = protocolosTexto.substring(primerProtocoloIndex).trim();\\n}\\n\\n// 3. VALIDAR LONGITUD MÍNIMA\\nif (!protocolosTexto || protocolosTexto.length < 100) {\\n  throw new Error(' El output del AI Agent está vacío o es demasiado corto.');\\n}\\n\\n// 4. VALIDAR TÉRMINOS PROHIBIDOS (detectar si copió ejemplos)\\n// SOLO buscar combinaciones específicas, NO nombres genéricos sueltos\\nconst terminosProhibidos = [\\n  'Pedro Ramírez',\\n  'Pedro Ramirez',\\n  'María López',\\n  'Maria López',\\n  'Maria Lopez',\\n  'Laura Campos',\\n  'Física Fundamental',\\n  'Fisica Fundamental',\\n  'Cálculo Integral',\\n  'Calculo Integral',\\n  'internet falló',\\n  'internet fallo',\\n  'Buena clase, pero',\\n  'muy clara y paciente',\\n  'Totalmente recomendada',\\n  'explicó muy bien',\\n  'explico muy bien'\\n];\\n\\nconst terminosEncontrados = [];\\nconst textoLower = protocolosTexto.toLowerCase();\\n\\nterminosProhibidos.forEach(termino => {\\n  if (textoLower.includes(termino.toLowerCase())) {\\n    terminosEncontrados.push(termino);\\n  }\\n});\\n\\n// Si encontró términos prohibidos, lanzar error\\nif (terminosEncontrados.length > 0) {\\n  throw new Error(\\n    ` ERROR: El AI Agent copió ${terminosEncontrados.length} término(s) de los ejemplos.\\\\n\\\\n` +\\n    `Términos copiados: ${terminosEncontrados.join(', ')}\\\\n\\\\n` +\\n    `SOLUCIÓN:\\\\n` +\\n    `1. Aumenta la \\\"temperature\\\" del modelo a 0.9-1.0\\\\n` +\\n    `2. Revisa que las imágenes se adjuntaron correctamente\\\\n` +\\n    `3. Verifica el prompt del AI Agent\\\\n` +\\n    `4. Vuelve a ejecutar el flujo\\\\n\\\\n` +\\n    `El protocolo debe generar nombres y datos NUEVOS, no copiar los ejemplos.`\\n  );\\n}\\n\\n// 5. VALIDAR SECCIONES REQUERIDAS\\nconst seccionesRequeridas = [\\n  'OBJETIVO',\\n  'RECLUTAR PARTICIPANTES',\\n  'ESCENARIO',\\n  'TAREAS',\\n  'VARIABLES POR MEDIR',\\n  'PROTOCOLO DE EJECUCIÓN'\\n];\\n\\nconst seccionesFaltantes = seccionesRequeridas.filter(seccion => \\n  !protocolosTexto.toUpperCase().includes(seccion)\\n);\\n\\nif (seccionesFaltantes.length > 0) {\\n  console.warn(' Advertencia: Faltan las siguientes secciones:', seccionesFaltantes.join(', '));\\n}\\n\\n// 6. VALIDAR NÚMERO DE PROTOCOLOS\\nconst regexProtocolos = /# Protocolo de Evaluación de Usuario/gi;\\nconst numeroProtocolos = (protocolosTexto.match(regexProtocolos) || []).length;\\n\\nif (numeroProtocolos < 2) {\\n  console.warn(` Advertencia: Solo se encontró ${numeroProtocolos} protocolo(s). Se esperaban 2.`);\\n}\\n\\n// 7. LOG DE ÉXITO\\nconsole.log(' Validación exitosa - No se encontraron términos prohibidos');\\nconsole.log(` Estadísticas:`);\\nconsole.log(`  - Longitud total: ${protocolosTexto.length} caracteres`);\\nconsole.log(`  - Protocolos encontrados: ${numeroProtocolos}`);\\nconsole.log(`  - Secciones completas: ${seccionesRequeridas.length - seccionesFaltantes.length}/${seccionesRequeridas.length}`);\\n\\n// 8. RETORNAR OUTPUT LIMPIO Y VALIDADO\\nreturn {\\n  json: {\\n    protocolos_completos: protocolosTexto,\\n    fecha_generacion: new Date().toISOString(),\\n    longitud_total: protocolosTexto.length,\\n    numero_protocolos: numeroProtocolos,\\n    secciones_faltantes: seccionesFaltantes,\\n    validacion_exitosa: true,\\n    terminos_prohibidos_encontrados: [],\\n    primer_linea: protocolosTexto.split('\\\\n')[0].substring(0, 100),\\n    ultima_linea: protocolosTexto.split('\\\\n').slice(-1)[0].substring(0, 100)\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2096,
        -96
      ],
      \"id\": \"37548e1b-26e5-40e7-a16f-57c8ec3a8c07\",
      \"name\": \"Extraer y Validar Output AI Agent\"
    },
    {
      \"parameters\": {
        \"mode\": \"runOnceForEachItem\",
        \"jsCode\": \"// NODO: Preparar Protocolos para Azure Wiki\\n\\nconst protocolo = $json.protocolo_markdown;\\nconst tipoUsuario = $json.tipo;\\nconst titulo = $json.titulo;\\nconst rolNombre = $json.rol_nombre;\\n\\n// Validar contenido\\nif (!protocolo || protocolo.length < 1000) {\\n  throw new Error(` El protocolo del ${tipoUsuario} está vacío o incompleto.`);\\n}\\n\\n// ========================================\\n// GENERAR METADATA YAML (Opcional)\\n// ========================================\\nconst fechaActual = new Date();\\nconst fechaISO = fechaActual.toISOString().split('T')[0];\\n\\nconst metadataYAML = `---\\ntitle: ${titulo.replace(/_/g, ' ')}\\ndescription: Protocolo de evaluación de usabilidad - Usuario ${rolNombre}\\nauthor: Sistema Automatizado DCU\\ndate: ${fechaISO}\\nversion: 1.0\\nfase: fase-4\\nrol: ${tipoUsuario}\\ntags: [dcu, evaluacion-usabilidad, testing, ${tipoUsuario}, fase-4]\\n---\\n\\n`;\\n\\n// Documento completo con metadata\\nconst documentoCompleto = metadataYAML + protocolo;\\n\\n// ========================================\\n// PREPARAR DATOS PARA HTTP REQUEST\\n// ========================================\\n\\n// Nombre del archivo sin extensión (Azure agrega .md automáticamente)\\nconst nombreArchivo = titulo;\\n\\n// Path relativo donde se guardará en el Wiki\\n// Ajusta esta ruta según la estructura de tu Wiki\\nconst pathEnWiki = `/Protocolos-Evaluacion/Fase-4/${nombreArchivo}`;\\n\\n// Body que se enviará al API de Azure (formato JSON)\\nconst bodyParaAzure = {\\n  content: documentoCompleto\\n};\\n\\n// ========================================\\n// LOGGING\\n// ========================================\\nconsole.log(` Preparando: ${titulo}`);\\nconsole.log(`   Rol: ${rolNombre}`);\\nconsole.log(`   Path: ${pathEnWiki}`);\\nconsole.log(`   Tamaño: ${documentoCompleto.length} caracteres`);\\n\\n// ========================================\\n// OUTPUT PARA EL HTTP REQUEST\\n// ========================================\\nreturn {\\n  json: {\\n    path: pathEnWiki,\\n    \\n    content: documentoCompleto,\\n    \\n    nombre_archivo: nombreArchivo,\\n    tipo_usuario: tipoUsuario,\\n    rol_nombre: rolNombre,\\n    fecha_generacion: fechaISO,\\n    longitud: documentoCompleto.length,\\n    \\n    preview: documentoCompleto.substring(0, 200) + '...'\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1632,
        -96
      ],
      \"id\": \"db1c397f-32c8-4b19-8e50-c3b583c960a0\",
      \"name\": \"Preparar Protocolos para Azure\"
    },
    {
      \"parameters\": {
        \"conditions\": {
          \"options\": {
            \"caseSensitive\": true,
            \"leftValue\": \"\",
            \"typeValidation\": \"strict\",
            \"version\": 3
          },
          \"conditions\": [
            {
              \"id\": \"355a1dbc-eac3-41b4-9921-27ac90c395a9\",
              \"leftValue\": \"={{ $json.tipo_usuario }}\",
              \"rightValue\": \"estudiante\",
              \"operator\": {
                \"type\": \"string\",
                \"operation\": \"equals\",
                \"name\": \"filter.operator.equals\"
              }
            }
          ],
          \"combinator\": \"and\"
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.filter\",
      \"typeVersion\": 2.3,
      \"position\": [
        -1312,
        -192
      ],
      \"id\": \"85135ce5-a008-4c36-bb3c-ae41757eeb44\",
      \"name\": \"Filtro Protocolo Estudiante\"
    },
    {
      \"parameters\": {
        \"conditions\": {
          \"options\": {
            \"caseSensitive\": true,
            \"leftValue\": \"\",
            \"typeValidation\": \"strict\",
            \"version\": 3
          },
          \"conditions\": [
            {
              \"id\": \"355a1dbc-eac3-41b4-9921-27ac90c395a9\",
              \"leftValue\": \"={{ $json.tipo_usuario }}\",
              \"rightValue\": \"tutor\",
              \"operator\": {
                \"type\": \"string\",
                \"operation\": \"equals\",
                \"name\": \"filter.operator.equals\"
              }
            }
          ],
          \"combinator\": \"and\"
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.filter\",
      \"typeVersion\": 2.3,
      \"position\": [
        -1312,
        0
      ],
      \"id\": \"6aee88d7-e619-46db-a786-35399c4d5b1f\",
      \"name\": \"Filtro Protocolo Tutor\"
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
              \"value\": \"={{ $json.content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -816,
        -192
      ],
      \"id\": \"e616fa0c-f5b7-4882-a4af-1065a761e74c\",
      \"name\": \"Subir a Wikis de Azure Protocolo E\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"rtbOVHBu7hA242gh\",
          \"name\": \"Azure Discovery\"
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
              \"value\": \"={{ $json.content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -816,
        0
      ],
      \"id\": \"b14687f5-d17c-4f30-96f4-478de78af07b\",
      \"name\": \"Subir a Wikis de Azure Protocolo T\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"rtbOVHBu7hA242gh\",
          \"name\": \"Azure Discovery\"
        }
      }
    },
    {
      \"parameters\": {
        \"amount\": 10
      },
      \"type\": \"n8n-nodes-base.wait\",
      \"typeVersion\": 1.1,
      \"position\": [
        -1072,
        0
      ],
      \"id\": \"5549ef94-2a58-473b-9bae-ae96feef2615\",
      \"name\": \"Wait\",
      \"webhookId\": \"8a7545f1-14ce-4bf6-9ca1-c46b0ad406fb\"
    }
  ],
  \"connections\": {
    \"Formulario Carga Captura Prototipo\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar input para IA Agent\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Google Gemini Chat Model\": {
      \"ai_languageModel\": [
        [
          {
            \"node\": \"Generación del Protocolo de Evaluación\",
            \"type\": \"ai_languageModel\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generación del Protocolo de Evaluación\": {
      \"main\": [
        [
          {
            \"node\": \"Extraer y Validar Output AI Agent\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Preparar input para IA Agent\": {
      \"main\": [
        [
          {
            \"node\": \"Generación del Protocolo de Evaluación\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Split Protocolos\": {
      \"main\": [
        [
          {
            \"node\": \"Preparar Protocolos para Azure\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Extraer y Validar Output AI Agent\": {
      \"main\": [
        [
          {
            \"node\": \"Split Protocolos\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Preparar Protocolos para Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Filtro Protocolo Estudiante\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Filtro Protocolo Tutor\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Filtro Protocolo Estudiante\": {
      \"main\": [
        [
          {
            \"node\": \"Subir a Wikis de Azure Protocolo E\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Filtro Protocolo Tutor\": {
      \"main\": [
        [
          {
            \"node\": \"Wait\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Wait\": {
      \"main\": [
        [
          {
            \"node\": \"Subir a Wikis de Azure Protocolo T\",
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

[← Prompt 053](/04-orquestacion-productiva/053/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 055 →](/04-orquestacion-productiva/055/)
{% endraw %}
