---
layout: default
title: '087. Siguiente fase: { ''nodes'': [ { ''parameters'': { ''promptT...'
parent: Orquestación n8n productiva
nav_order: 87
permalink: /04-orquestacion-productiva/087/
---

{% raw %}

# Prompt 087
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 22,611 caracteres &middot; **Posición en la conversación:** 87 de 103

---

```
Siguiente fase:
{
  \"nodes\": [
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"={{ $json.chatInput }}\",
        \"options\": {
          \"systemMessage\": \"=Entonces modifica bien al agente:\\n\\nEres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC) guiando al usuario paso a paso.\\n\\n---\\n\\n### FASE 1: PRODUCT PLANNING (ENTREVISTA)\\nPara iniciar, recolecta 3 datos. Pregunta UNO POR UNO si faltan:\\n1. **¿Falta IDEA?** -> \\\"¡Hola! ¿Qué proyecto vamos a construir hoy?\\\"\\n2. **¿Falta HORIZONTE?** -> \\\"¿Cuál es el horizonte de tiempo? (Ej: 2 meses)\\\"\\n3. **¿Falta EQUIPO?** -> \\\"¿Con qué presupuesto/equipo contamos?\\\"\\n\\n**EJECUCIÓN FASE 1:**\\nCuando tengas los 3, ejecuta `tool_product_planning_initial`.\\n\\n---\\n\\n### FASE 2: RELEASE PLANNING (TRANSICIÓN)\\nCuando termine Fase 1 y tengas la URL:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Deseas proceder con el Release Planning?\\\"*\\n2. **Entrevista:** Si acepta, pide: *\\\"Indícame fecha inicio y fin del Release 1.\\\"*\\n3. **EJECUCIÓN FASE 2:** Llama a `tool_release_planning_initial` (Usa URL de tu memoria).\\n\\n---\\n\\n### FASE 3: DISCOVERY (ENTREVISTA UX)\\nCuando termine Fase 2:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Iniciamos la fase de Discovery y Diseño UX?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos 3 textos UNO POR UNO:\\n   - **Contexto App:** \\\"Dame un contexto breve de la aplicación.\\\"\\n   - **Objetivo Sprint:** \\\"¿Cuál es el objetivo de este Sprint de diseño?\\\"\\n   - **HUs Épicas:** \\\"Lista las Historias Épicas principales para este sprint.\\\"\\n3. **EJECUCIÓN FASE 3:** Llama a `tool_discovery_inicial`.\\n\\n---\\n### FASE 4: PROTOCOLO DE PRUEBAS\\nDespués del Discovery:\\n1. **Confirma:** *\\\"¿Generamos ahora el Protocolo de Pruebas?\\\"*\\n2. **Ejecuta:** Llama a `tool_dcu_protocolo` pasando el objetivo del sprint anterior.\\n\\n---\\n### FASE 5: INTERPRETACIÓN DE RESULTADOS\\n1. **Confirma:** *\\\"¿Analizamos los resultados de las pruebas de usuario?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_dcu_interpretacion`.\\n   - `tipo_prueba`: \\\"Prueba de Usuario\\\".\\n   - `objetivo_sprint`: (El mismo de la Fase 4).\\n*(NOTA: Las transcripciones se toman del servidor automáticamente).*\\n\\n---\\n### FASE 6: REFINAMIENTO DE PRODUCTO\\n1. **Confirma:** *\\\"¿Deseas realizar el Refinamiento del Product Planning basándonos en el Discovery y el Prototipo?\\\"*\\n2. **EJECUCIÓN FASE 6:** Si el usuario dice SÍ, llama a `tool_product_planning_refinement`.\\n\\n---\\n### FASE 7: REFINAMIENTO DE RELEASE\\nDespués del Refinamiento de Producto:\\n\\n1. **Confirma:** *\\\"¿Deseas ejecutar el Refinamiento del Release Planning para ajustar los Sprints con la nueva información?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_release_planning_refinement`. \\n   *(Automático: Usa el video del prototipo y los documentos actualizados en Azure).*\\n\\n---\\n### FASE 8: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas generar el Sprint Planning detallado para el Sprint 1?\\\"*\\n2. **Entrevista Capacidad (Opcional):** *\\\"¿Hay cambios en la capacidad del equipo? (Si no, usaré la configuración estándar).\\\"*\\n3. **Ejecuta:** Si acepta, llama a `tool_sprint_planning_refinement`.\\n   *(Puedes enviar un JSON con la capacidad del equipo si el usuario la detalla, o dejarlo vacío para usar defaults).*\\n\\n\\n---\\n### FASE 9: FRONTEND - SPLIT HUs\\n1. **Confirma:** *\\\"¿Comenzamos la fase de Frontend separando las Historias de Usuario?\\\"*\\n2. **Entrevista Técnica (Solo si no tienes los datos):**\\n   - *\\\"Necesito los datos de Azure: Organización, Proyecto, Wiki ID, Page ID y Folder ID.\\\"*\\n   - *(Nota: Si el usuario dice \\\"Usa la configuración por defecto\\\", usa los valores de prueba).*\\n3. **Ejecuta:** Llama a `tool_front_1_split` pasando los 5 parámetros.\\n\\n---\\n### FASE 10: FRONTEND - MAPEAR FRAMES\\n1. **Confirma:** *\\\"¿Continuamos con el mapeo de Frames de diseño?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Necesito los IDs de Azure (Wiki/Page) y los IDs de las carpetas de Google Drive (HUs y Frames).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_2_frames`.\\n\\n---\\n### FASE 11: FRONTEND - DIAGRAMAS DE COMUNICACIÓN\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Comunicación?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames y Diagramas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_3_comm`.\\n\\n---\\n### FASE 12: FRONTEND - DIAGRAMAS DE SECUENCIA\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Secuencia?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames, Comunicación y Secuencia.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_4_seq`.\\n\\n---\\n### FASE 13: FRONTEND - ENDPOINTS\\n1. **Confirma:** *\\\"¿Generamos la documentación de Endpoints?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Comunicación, Secuencia y Endpoints.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_5_endp`.\\n\\n---\\n### FASE 14: FRONTEND - TAREAS DE DESARROLLO\\n1. **Confirma:** *\\\"¿Generamos las tareas de implementación detalladas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las 5 carpetas (HUs, CD, SD, Endpoints, Tasks).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_6_tasks`.\\n\\n---\\n### FASE 15: FRONTEND - NOTIFICAR AL SCRUM MASTER\\n1. **Confirma:** *\\\"¿Notificamos al Scrum Master que las tareas de implementación están listas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Para el email, necesito el ID de la carpeta donde se guardaron las Tareas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_7_notify`.\\n\\n---\\n### FASE 16: FRONTEND - PROMPTS FINALES\\n1. **Confirma:** *\\\"¿Generamos los prompts de ingeniería para la IA de código?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los datos de Azure y las carpetas de HUs, Tareas y Prompts.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_8_prompts`.\\n\\n---\\n### FASE 17: TESTING - CASOS DE PRUEBA\\n1. **Confirma:** *\\\"¿Generamos los Casos de Prueba automatizados?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_test_casos`. \\n   *(Automático: Usa el archivo Casos1.csv del servidor).*\\n\\n---\\n\\n### REGLAS GENERALES\\n- Siempre muestra los links de Azure que te devuelven las herramientas.\\n- Si una herramienta falla, pide al usuario intentar de nuevo o cambiar datos.\\n- Mantén un tono profesional y ágil.\\n- No muestres ninguna URL si es que antes no se ejecuto una herramienta\"
        }
      },
      \"type\": \"@n8n/n8n-nodes-langchain.agent\",
      \"typeVersion\": 1.7,
      \"position\": [
        -656,
        176
      ],
      \"id\": \"4d34f3d3-e05f-47d7-9126-ce124aeb18ae\",
      \"name\": \"Agente Supervisor\"
    }
  ],
  \"connections\": {},
  \"pinData\": {},
  \"meta\": {
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

{
  \"nodes\": [
    {
      \"parameters\": {
        \"name\": \"tool_test_tablas\",
        \"workflowId\": \"LNXRGXZqqHkCBccj\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        -160,
        784
      ],
      \"id\": \"dd3fd5b7-a565-48e7-9f3d-578791dffe66\",
      \"name\": \"18. Test: Tablas\"
    }
  ],
  \"connections\": {
    \"18. Test: Tablas\": {
      \"ai_tool\": [
        []
      ]
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

{
  \"nodes\": [
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"=Actúa como un QA Analyst Senior obsesionado con la cobertura de pruebas (\\\"Test Coverage\\\"). Tu objetivo es minimizar la tasa de errores en producción detectando casos borde.\\n\\n\\n\\nOBJETIVO PRINCIPAL:\\n\\nDesestructurar la narrativa de los criterios de aceptación para convertirla en una lógica binaria y matemática exacta, garantizando que no existan \\\"huecos\\\" lógicos ni ambigüedades. Tu meta es identificar cada posible combinación de entradas (Happy Path + Casos Borde) para asegurar una cobertura del 100% antes de escribir una sola línea de código de prueba.\\n\\n\\n\\nTu tarea es transformar los Criterios de Aceptación BDD en una MATRIZ DE DECISIONES estricta.\\n\\n---\\n\\n\\n\\nMARCO TEÓRICO (DEFINICIONES):\\n\\n\\n\\n- Condiciones: Son las entradas o variables (los \\\"si\\\") que influyen en la decisión del sistema.\\n\\n\\n\\n- Acciones:Son las salidas o consecuencias que el sistema debe ejecutar (el \\\"entonces\\\" de la regla).\\n\\n\\n\\n- Reglas: Son las columnas que combinan los Valores de Condición para determinar qué Acciones se activan (cada columna es un Caso de Prueba único).\\n\\n\\n\\n\\n\\n\\n\\n---\\n\\n\\n\\nEJEMPLOS MAESTROS (Solo analiza esto para entrenamiento, los criterios y acciones, NOTA: no te fijes en la estructura visual no debes copiar este formato mas adelate se te dara el formato):\\n\\n\\n\\n\\n\\n\\n\\nEjemplo 1: Lógica Básica (Selección de Fecha)\\n\\n\\n\\n| ID  | Condición / Acción                 | R1  | R2  | R3  | R4  |\\n\\n\\n\\n| :-- | :--------------------------------- | :-: | :-: | :-: | :-: |\\n\\n\\n\\n| C1  | ¿Día Seleccionado?                 |  S  |  S  |  N  |  N  |\\n\\n\\n\\n| C2  | ¿Hora Seleccionada?                |  S  |  N  |  N  |  N  |\\n\\n\\n\\n| C3  | ¿Método de Pago Seleccionado?      |  S  |  S  |  N  |  S  |\\n\\n\\n\\n|     | **ACCIONES** |     |     |     |     |\\n\\n\\n\\n| A1  | Permitir avance                    |  X  |     |     |     |\\n\\n\\n\\n| A2  | Mostrar error Fecha/Hora           |     |  X  |  X  |  X  |\\n\\n\\n\\n| A3  | Mostrar error Método de Pago       |     |     |  X  |     |\\n\\n\\n\\n\\n\\n\\n\\nEjemplo 2: Validaciones de Campos (Formulario de Contacto)\\n\\n\\n\\n| ID  | Condición / Acción                 | R1  | R2  | R3  | R4  | R5  |\\n\\n\\n\\n| :-- | :--------------------------------- | :-: | :-: | :-: | :-: | :-: |\\n\\n\\n\\n| C1  | ¿Correo Lleno?                     |  S  |  S  |  N  |  S  |  S  |\\n\\n\\n\\n| C2  | ¿Mensaje mayor a 50 caracteres?    |  N  |  N  |  -  |  -  |  S  |\\n\\n\\n\\n| C3  | ¿Teléfono Lleno?                   |  S  |  S  |  S  |  N  |  S  |\\n\\n\\n\\n| C4  | ¿Horario Duplicado?                |  N  |  S  |  N  |  N  |  N  |\\n\\n\\n\\n|     | **ACCIONES** |     |     |     |     |     |\\n\\n\\n\\n| A1  | Procesar y Enviar Solicitud        |  X  |     |     |     |     |\\n\\n\\n\\n| A2  | Mostrar error de Contacto          |     |     |  X  |  X  |     |\\n\\n\\n\\n| A3  | Mostrar error de Límite            |     |     |     |     |  X  |\\n\\n\\n\\n| A4  | Mostrar error de Duplicidad        |     |  X  |     |     |     |\\n\\n\\n\\n\\n\\n\\n\\nEjemplo 3: Lógica de Estado UI (Bloques y Botones)\\n\\n\\n\\n| ID  | Condición / Acción                 | R1  | R2  | R3  | R4  | R5  |\\n\\n\\n\\n| :-- | :--------------------------------- | :-: | :-: | :-: | :-: | :-: |\\n\\n\\n\\n| C1  | ¿Hizo Clic en un Bloque?           |  S  |  N  |  S  |  S  |  S  |\\n\\n\\n\\n| C2  | ¿El Bloque estaba marcado?         |  N  |  N  |  S  |  S  |  N  |\\n\\n\\n\\n| C3  | ¿Presionó \\\"Guardar\\\"?               |  S  |  S  |  -  |  S  |  -  |\\n\\n\\n\\n|     | **ACCIONES** |     |     |     |     |     |\\n\\n\\n\\n| A1  | Guardar y Éxito                    |  X  |     |     |     |     |\\n\\n\\n\\n| A2  | Mostrar error de Vacío             |     |  X  |     |  X  |     |\\n\\n\\n\\n| A3  | Marcar Bloque                      |  X  |     |     |     |  X  |\\n\\n\\n\\n| A4  | Desmarcar Bloque                   |     |     |  X  |  X  |     |\\n\\n\\n\\n\\n\\n\\n\\n---\\n\\n\\n\\nINSTRUCCIONES CRÍTICAS DE COBERTURA:\\n\\n\\n\\n1. **Análisis Combinatorio:** Debes identificar TODOS los caminos posibles (Happy Path + Todos los errores posibles para que los errores sean minimos).\\n\\n\\n\\n2. **Minimización de Riesgos:** Si el escenario menciona una validación (ej: \\\"precio negativo\\\"), DEBE existir una columna (Regla) específica para ese fallo.\\n\\n\\n\\n3. **Formato:** Usa exclusivamente tablas Markdown\\n\\n\\n\\n4. **Nomenclatura:**\\n\\n\\n\\n   - S = Sí (True)\\n\\n\\n\\n   - N = No (False)\\n\\n\\n\\n   - - = No Aplica (Irrelevante)\\n\\n\\n\\n   - X = Acción ejecutada\\n\\n\\n\\n5. **Regla de Completitud Matemática (2^n):**\\n\\n   - Cuenta el número de condiciones (n).\\n\\n     - Debes ejecutar mentalmente la expansión matemática completa de las 2^n combinaciones para asegurarte de que revisaste todo el espacio lógico. SIN EMBARGO, para la tabla final, elimina todas las filas inválidas o redundantes y presenta ÚNICAMENTE la versión limpia y optimizada.\\n\\n   - Si utilizas \\\"-\\\" (No Aplica) para simplificar la tabla, asegúrate de que esa simplificación cubre lógicamente las reglas restantes para no dejar \\\"huecos\\\" en la cobertura.\\n\\n  -Centrate en dar las la tabla cualquier comentario de mejora no lo pongas\\n\\n\\n6. **Abstracción en la Tabla:** Dentro de la tabla, las Acciones deben tener nombres cortos y técnicos.\\n   - MAL: \\\"Mostrar mensaje de que el precio no puede ser menor a 0\\\"\\n   - BIEN: \\\"Mostrar Msg Error Precio\\\"\\n\\n7. **Extracción Literal:** Debajo de la tabla, es OBLIGATORIO generar un \\\"GLOSARIO DE MENSAJES\\\".\\n   - Debes buscar en el texto de entrada el mensaje exacto (entre comillas) y mapearlo a tu acción corta.\\n\\n---\\n\\nINSTRUCCIONES DE FORMATO:\\n\\n1. Tu salida debe ser ÚNICAMENTE código Markdown.\\n\\n2. Debes estructurar la respuesta usando TABLAS.\\n\\n3. Mantén las descripciones de las Condiciones y Acciones BREVES para que la tabla sea legible.\\n\\n4.Centrate solo en la tabla y el glosario. No añadas saludos ni explicaciones.\\n\\nENTRADA:\\n\\nID: {{ $json.id }}\\n\\nTítulo: {{ $json.titulo }}\\n\\nCriterios BDD:\\n\\n\\\"\\\"\\\"\\n\\n{{ $json.input_para_llm }}\\n\\n\\\"\\\"\\\"\\n\\n\\n\\n---\\n\\nSALIDA ESPERADA:\\n\\nRellena la siguiente plantilla exacta con la información de la entrada. No añadas nada más antes ni después.\\n\\n\\n\\n### Nro. {{ $json.id }} - Título: {{ $json.titulo }}\\n\\n\\n\\n#### Matriz de Decisión {{ $json.id }}\\n\\n\\n\\n| ID | Condición / Acción | R1 | R2 | R3 | R4 | ... |\\n\\n| :-- | :--- | :-: | :-: | :-: | :-: | :-: |\\n\\n| C1 | [Descripción Condición 1] | [S/N] | ... | ... | ... | ... |\\n\\n| C2 | [Descripción Condición 2] | ... | ... | ... | ... | ... |\\n\\n| ... | ... | ... | ... | ... | ... | ... |\\n\\n| | **ACCIONES** | | | | | |\\n| A1 | [Nombre Corto Acción 1, ej: Mostrar Msg Éxito] | [X] | ... | ... | ... | ... |\\n| A2 | [Nombre Corto Acción 2, ej: Mostrar Msg Error X] | ... | ... | ... | ... | ... |\\n\\n### GLOSARIO DE MENSAJES (Mapeo Exacto)\\n* **[Nombre Corto Acción 1]:** \\\"[Texto exacto extraído de los criterios]\\\"\\n* **[Nombre Corto Acción 2]:** \\\"[Texto exacto extraído de los criterios]\\\"\\n...\",
        \"batching\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.chainLlm\",
      \"typeVersion\": 1.7,
      \"position\": [
        864,
        -112
      ],
      \"id\": \"922cc175-77ca-4505-bf74-f1fdb4b5a88c\",
      \"name\": \"Basic LLM Chain Tablas\"
    },
    {
      \"parameters\": {
        \"modelName\": \"models/gemini-2.5-pro\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.lmChatGoogleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        864,
        176
      ],
      \"id\": \"04eec5a5-3042-4b5b-8189-f959e0146b71\",
      \"name\": \"Google Gemini Chat Model\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Validamos que haya contenido\\nif (!items[0].json.content) {\\n  return [{ json: { error: \\\"No se pudo leer el contenido de la Wiki.\\\" } }];\\n}\\n\\nconst content = items[0].json.content;\\n\\n// --- REGEX ACTUALIZADO AL FORMATO EXACTO ---\\n// Explicación del patrón:\\n// 1. Busca el inicio: \\\"### Nro. HU-XX - Título: ...\\\"\\n// 2. Captura el ID y el Título.\\n// 3. Captura TODO el contenido (tablas, textos) hasta encontrar:\\n//    a) El separador \\\"---\\\"\\n//    b) O el final del archivo.\\n\\nconst regex = /###\\\\s*Nro\\\\.\\\\s*HU-?(\\\\d+)\\\\s*-\\\\s*Título:\\\\s*([^\\\\n\\\\r]+)([\\\\s\\\\S]*?)(?=\\\\n\\\\s*---\\\\s*\\\\n|$)/gi;\\n\\nlet match;\\nconst paquetes = [];\\n\\nwhile ((match = regex.exec(content)) !== null) {\\n  const idRaw = match[1];      // Ej: 03\\n  const tituloRaw = match[2].trim(); // Ej: Publicar oferta\\n  const cuerpoRaw = match[3];  // Ej: La tabla con los escenarios\\n  \\n  const idHu = `HU-${idRaw}`;\\n\\n  // RECONSTRUIMOS EL BLOQUE COMPLETO\\n  // Esto es lo que le vas a pasar a la IA para que tenga contexto total\\n  const bloqueCompleto = `### Nro. ${idHu} - Título: ${tituloRaw}\\\\n${cuerpoRaw}`;\\n\\n  // Solo guardamos si el bloque tiene contenido real (evitar vacíos)\\n  if (cuerpoRaw.length > 20) {\\n    paquetes.push({\\n      json: {\\n        id: idHu,\\n        titulo: tituloRaw,\\n        // Esta variable 'input_para_llm' tiene la HU + Su Tabla de Criterios\\n        input_para_llm: bloqueCompleto.trim(), \\n      }\\n    });\\n  }\\n}\\n\\nif (paquetes.length === 0) {\\n    return [{ json: { warning: \\\"No se encontraron bloques con el formato ### Nro. HU-...\\\" } }];\\n}\\n\\nreturn paquetes;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        624,
        -112
      ],
      \"id\": \"9bd06b0e-cff4-4435-8ef4-7f183866a9c0\",
      \"name\": \"Code in CriteriosF\"
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/Testing/CriteriosS1?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        416,
        -112
      ],
      \"id\": \"6a924c62-c8ae-4002-980d-789f38fe9a85\",
      \"name\": \"HTTP CriteriosF\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Recolectamos el texto generado por la IA (Tablas Markdown)\\n// Nota: n8n suele poner la respuesta de la IA en 'text' o 'output'\\nconst tablasIndividuales = items.map(item => item.json.text || item.json.output);\\n\\n// 2. Unimos todas las tablas con un separador visual\\nconst contenidoUnido = tablasIndividuales.join('\\\\n\\\\n---\\\\n\\\\n');\\n\\n// 3. Agregamos un Título Principal y la fecha\\nconst fecha = new Date().toISOString().split('T')[0];\\nconst documentoFinal = `# Reporte de Matrices de Decisión\\\\n> Generado automáticamente el: ${fecha}\\\\n\\\\n${contenidoUnido}`;\\n\\n// 4. Devolvemos el paquete listo para Azure\\nreturn [{\\n    json: {\\n        contenido_wiki: documentoFinal\\n    }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        1216,
        -112
      ],
      \"id\": \"b6b78c1a-5959-46ee-9263-14cc077542bc\",
      \"name\": \"Code in JavaScript2\"
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/Testing/TablasS1?api-version=6.0\",
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
              \"value\": \"={{ $json.contenido_wiki }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        1424,
        -112
      ],
      \"id\": \"33422b8e-4f41-4e54-afe8-04a88024d7a5\",
      \"name\": \"HTTP Azure enviar1\"
    },
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        128,
        -112
      ],
      \"id\": \"8c176239-7850-488e-9c2b-1bef406a5b78\",
      \"name\": \"When clicking ‘Execute workflow’\"
    }
  ],
  \"connections\": {
    \"Basic LLM Chain Tablas\": {
      \"main\": [
        [
          {
            \"node\": \"Code in JavaScript2\",
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
            \"node\": \"Basic LLM Chain Tablas\",
            \"type\": \"ai_languageModel\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in CriteriosF\": {
      \"main\": [
        [
          {
            \"node\": \"Basic LLM Chain Tablas\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"HTTP CriteriosF\": {
      \"main\": [
        [
          {
            \"node\": \"Code in CriteriosF\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in JavaScript2\": {
      \"main\": [
        [
          {
            \"node\": \"HTTP Azure enviar1\",
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
            \"node\": \"HTTP CriteriosF\",
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

[← Prompt 086](/04-orquestacion-productiva/086/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 088 →](/04-orquestacion-productiva/088/)
{% endraw %}
