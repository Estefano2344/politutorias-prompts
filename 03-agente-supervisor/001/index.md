---
layout: default
title: '001. { ''nodes'': [ { ''parameters'': { ''options'': {}...'
parent: Agente supervisor
nav_order: 1
permalink: /03-agente-supervisor/001/
---

{% raw %}

# Prompt 001
{: .no_toc }

**Sección:** Agente supervisor &middot; **Longitud:** 26,566 caracteres &middot; **Posición en la conversación:** 1 de 3

---

```
{

  \"nodes\": [

    {

      \"parameters\": {

        \"options\": {}

      },

      \"type\": \"@n8n/n8n-nodes-langchain.chatTrigger\",

      \"typeVersion\": 1.1,

      \"position\": [

        -1360,

        176

      ],

      \"id\": \"b3dae79e-d3f0-4ec9-8a86-c47e5e3c3e2b\",

      \"name\": \"Chat con Supervisor\",

      \"webhookId\": \"6d14369e-82bc-4112-822c-0d485f480d6d\"

    },

    {

      \"parameters\": {

        \"modelName\": \"models/gemini-2.0-flash\",

        \"options\": {

          \"temperature\": 0.3

        }

      },

      \"type\": \"@n8n/n8n-nodes-langchain.lmChatGoogleGemini\",

      \"typeVersion\": 1,

      \"position\": [

        -1040,

        416

      ],

      \"id\": \"d6f9d9e9-9857-44cd-917c-bb9ba6a1fd9e\",

      \"name\": \"Google Gemini Chat Model\",

      \"credentials\": {

        \"googlePalmApi\": {

          \"id\": \"tN2HeGeNbppUpSjJ\",

          \"name\": \"Gemini DevOps\"

        }

      }

    },

    {

      \"parameters\": {

        \"contextWindowLength\": 20

      },

      \"type\": \"@n8n/n8n-nodes-langchain.memoryBufferWindow\",

      \"typeVersion\": 1.3,

      \"position\": [

        -864,

        416

      ],

      \"id\": \"4a558381-d7d6-4969-9f09-496d139df80f\",

      \"name\": \"Memoria de Corto Plazo\"

    },

    {

      \"parameters\": {

        \"promptType\": \"define\",

        \"text\": \"={{ $json.chatInput }}\",

        \"options\": {

          \"systemMessage\": \"=Entonces modifica bien al agente:\\n\\nEres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC) guiando al usuario paso a paso.\\n\\n---\\n\\n### FASE 1: PRODUCT PLANNING (ENTREVISTA)\\nPara iniciar, recolecta 3 datos. Pregunta UNO POR UNO si faltan:\\n1. **¿Falta IDEA?** -> \\\"¡Hola! ¿Qué proyecto vamos a construir hoy?\\\"\\n2. **¿Falta HORIZONTE?** -> \\\"¿Cuál es el horizonte de tiempo? (Ej: 2 meses)\\\"\\n3. **¿Falta EQUIPO?** -> \\\"¿Con qué presupuesto/equipo contamos?\\\"\\n\\n**EJECUCIÓN FASE 1:**\\nCuando tengas los 3, ejecuta `tool_product_planning_initial`.\\n\\n---\\n\\n### FASE 2: RELEASE PLANNING (TRANSICIÓN)\\nCuando termine Fase 1 y tengas la URL:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Deseas proceder con el Release Planning?\\\"*\\n2. **Entrevista:** Si acepta, pide: *\\\"Indícame fecha inicio y fin del Release 1.\\\"*\\n3. **EJECUCIÓN FASE 2:** Llama a `tool_release_planning_initial` (Usa URL de tu memoria).\\n\\n---\\n\\n### FASE 3: DISCOVERY (ENTREVISTA UX)\\nCuando termine Fase 2:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Iniciamos la fase de Discovery y Diseño UX?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos 3 textos UNO POR UNO:\\n   - **Contexto App:** \\\"Dame un contexto breve de la aplicación.\\\"\\n   - **Objetivo Sprint:** \\\"¿Cuál es el objetivo de este Sprint de diseño?\\\"\\n   - **HUs Épicas:** \\\"Lista las Historias Épicas principales para este sprint.\\\"\\n3. **EJECUCIÓN FASE 3:** Llama a `tool_discovery_inicial`.\\n\\n---\\n### FASE 4: PROTOCOLO DE PRUEBAS\\nDespués del Discovery:\\n1. **Confirma:** *\\\"¿Generamos ahora el Protocolo de Pruebas?\\\"*\\n2. **Ejecuta:** Llama a `tool_dcu_protocolo` pasando el objetivo del sprint anterior.\\n\\n---\\n### FASE 5: INTERPRETACIÓN DE RESULTADOS\\n1. **Confirma:** *\\\"¿Analizamos los resultados de las pruebas de usuario?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_dcu_interpretacion`.\\n   - `tipo_prueba`: \\\"Prueba de Usuario\\\".\\n   - `objetivo_sprint`: (El mismo de la Fase 4).\\n*(NOTA: Las transcripciones se toman del servidor automáticamente).*\\n\\n---\\n### FASE 6: REFINAMIENTO DE PRODUCTO\\n1. **Confirma:** *\\\"¿Deseas realizar el Refinamiento del Product Planning basándonos en el Discovery y el Prototipo?\\\"*\\n2. **EJECUCIÓN FASE 6:** Si el usuario dice SÍ, llama a `tool_product_planning_refinement`.\\n\\n---\\n### FASE 7: REFINAMIENTO DE RELEASE\\nDespués del Refinamiento de Producto:\\n\\n1. **Confirma:** *\\\"¿Deseas ejecutar el Refinamiento del Release Planning para ajustar los Sprints con la nueva información?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_release_planning_refinement`. \\n   *(Automático: Usa el video del prototipo y los documentos actualizados en Azure).*\\n\\n---\\n### FASE 8: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas generar el Sprint Planning detallado para el Sprint 1?\\\"*\\n2. **Entrevista Capacidad (Opcional):** *\\\"¿Hay cambios en la capacidad del equipo? (Si no, usaré la configuración estándar).\\\"*\\n3. **Ejecuta:** Si acepta, llama a `tool_sprint_planning_refinement`.\\n   *(Puedes enviar un JSON con la capacidad del equipo si el usuario la detalla, o dejarlo vacío para usar defaults).*\\n\\n\\n---\\n### FASE 9: FRONTEND - SPLIT HUs\\n1. **Confirma:** *\\\"¿Comenzamos la fase de Frontend separando las Historias de Usuario?\\\"*\\n2. **Entrevista Técnica (Solo si no tienes los datos):**\\n   - *\\\"Necesito los datos de Azure: Organización, Proyecto, Wiki ID, Page ID y Folder ID.\\\"*\\n   - *(Nota: Si el usuario dice \\\"Usa la configuración por defecto\\\", usa los valores de prueba).*\\n3. **Ejecuta:** Llama a `tool_front_1_split` pasando los 5 parámetros.\\n\\n---\\n### FASE 10: FRONTEND - MAPEAR FRAMES\\n1. **Confirma:** *\\\"¿Continuamos con el mapeo de Frames de diseño?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Necesito los IDs de Azure (Wiki/Page) y los IDs de las carpetas de Google Drive (HUs y Frames).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_2_frames`.\\n\\n---\\n### FASE 11: FRONTEND - DIAGRAMAS DE COMUNICACIÓN\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Comunicación?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames y Diagramas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_3_comm`.\\n\\n---\\n### FASE 12: FRONTEND - DIAGRAMAS DE SECUENCIA\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Secuencia?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames, Comunicación y Secuencia.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_4_seq`.\\n\\n---\\n### FASE 13: FRONTEND - ENDPOINTS\\n1. **Confirma:** *\\\"¿Generamos la documentación de Endpoints?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Comunicación, Secuencia y Endpoints.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_5_endp`.\\n\\n---\\n### FASE 14: FRONTEND - TAREAS DE DESARROLLO\\n1. **Confirma:** *\\\"¿Generamos las tareas de implementación detalladas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las 5 carpetas (HUs, CD, SD, Endpoints, Tasks).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_6_tasks`.\\n\\n---\\n### FASE 15: FRONTEND - NOTIFICAR AL SCRUM MASTER\\n1. **Confirma:** *\\\"¿Notificamos al Scrum Master que las tareas de implementación están listas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Para el email, necesito el ID de la carpeta donde se guardaron las Tareas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_7_notify`.\\n\\n---\\n### FASE 16: FRONTEND - PROMPTS FINALES\\n1. **Confirma:** *\\\"¿Generamos los prompts de ingeniería para la IA de código?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los datos de Azure y las carpetas de HUs, Tareas y Prompts.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_8_prompts`.\\n\\n---\\n### FASE 17: TESTING - CASOS DE PRUEBA\\n1. **Confirma:** *\\\"¿Generamos los Casos de Prueba automatizados?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_test_casos`. \\n   *(Automático: Usa el archivo Casos1.csv del servidor).*\\n\\n---\\n### FASE 18: TESTING - TABLAS DE DECISIÓN\\n1. **Confirma:** *\\\"¿Generamos las Tablas de Decisión basadas en los Criterios de Aceptación?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_test_tablas`.\\n\\n---\\n### FASE 19: TESTING - CRITERIOS DE ACEPTACIÓN\\n1. **Confirma:** *\\\"¿Generamos los Criterios de Aceptación detallados (BDD)?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_test_criterios`.\\n\\n---\\n\\n### REGLAS GENERALES\\n- Siempre muestra los links de Azure que te devuelven las herramientas.\\n- Si una herramienta falla, pide al usuario intentar de nuevo o cambiar datos.\\n- Mantén un tono profesional y ágil.\\n- No muestres ninguna URL si es que antes no se ejecuto una herramienta\"

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

    },

    {

      \"parameters\": {

        \"name\": \"tool_product_planning_initial\",

        \"description\": \"Genera Visión, Backlog y Roadmap. \\nInputs requeridos (JSON):\\n- idea: (String) Descripción detallada de la idea del producto.\\n- horizonte: (String) Tiempo estimado (ej: 2 meses).\\n- presupuesto: (String) Equipo y recursos.\\n- formato: (String, Opcional) Plantilla de visión.\",

        \"workflowId\": \"ZhezxyqBaf8lyhER\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -272,

        16

      ],

      \"id\": \"ceed8001-b63c-49d6-adee-ef61f2dbf54c\",

      \"name\": \"1. Product Plan (Initial)\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_release_planning_initial\",

        \"description\": \"Planifica los sprints. \\nArgumentos requeridos (JSON):\\n- fecha_inicio: (String YYYY-MM-DD) Fecha de inicio del Release.\\n- fecha_fin: (String YYYY-MM-DD) Fecha fin del Release.\\n- wiki_url: (String) La URL del Product Planning generado en el paso anterior (búscala en tu memoria).\",

        \"workflowId\": \"JcJaYWxG3YU5E8AO\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -160,

        16

      ],

      \"id\": \"64e2dbff-e052-42e3-961e-20b3cad4dccd\",

      \"name\": \"2. Release Plan (Initial)\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_discovery_inicial\",

        \"description\": \"Ejecuta el flujo de Discovery DCU.\\nInputs requeridos (JSON):\\n- contexto: (String) Contexto de la app.\\n- objetivo: (String) Objetivo del sprint.\\n- epicas: (String) HUs épicas.\",

        \"workflowId\": \"CPE7Bf8xQTu5pwhk\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        0,

        16

      ],

      \"id\": \"15978762-48cd-4cfb-bb9c-e1b8423eb79b\",

      \"name\": \"3. Discovery (DCU)\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_dcu_protocolo\",

        \"description\": \"Genera guiones de prueba basados en prototipos.\\nInput requerido:\\n- objetivo_sprint: (String)\",

        \"workflowId\": \"anO4tEz9NcUVNC3S\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        160,

        16

      ],

      \"id\": \"0cd9f5d9-2176-4c36-b707-31907123318a\",

      \"name\": \"4. DCU Protocolo\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_dcu_interpretacion\",

        \"description\": \"Analiza transcripciones de pruebas.\\nInputs:\\n- objetivo_sprint: (String)\\n- tipo_prueba: (String)\",

        \"workflowId\": \"cPQHxhfVL0waZJ2L\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        320,

        16

      ],

      \"id\": \"c361a371-4394-4e55-a50b-de176e8d7508\",

      \"name\": \"5. DCU Resultados\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_release_planning_refinement\",

        \"description\": \"Ejecuta el refinamiento de Sprints y Backlog final.\\nInputs: Ninguno.\",

        \"workflowId\": \"BV4FTwoDezhLiCbK\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -160,

        224

      ],

      \"id\": \"6ddcc480-0192-41ea-bcb3-54c86888e672\",

      \"name\": \"7. Release Plan (Final)\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_sprint_planning\",

        \"description\": \"Genera el Sprint Goal y Backlog del Sprint 1.\\nInputs (Opcional):\\n- equipo: (Array de Objetos) Estructura [{nombre, dias_disponibles, dias_scrum, horas_min, horas_max}]\",

        \"workflowId\": \"L4QphkDkDvBPmu2L\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        0,

        224

      ],

      \"id\": \"c3ea12b1-a440-4d59-a373-ea9aea7cb9ad\",

      \"name\": \"8. Sprint Planning\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_front_1_split\",

        \"description\": \"Divide las HUs.\\nInputs requeridos (JSON):\\n- org_name: (String) Organización Azure.\\n- project_name: (String) Proyecto.\\n- wiki_id: (String) ID de la Wiki.\\n- page_id: (String) ID de la página del Sprint Planning.\\n- hus_folder_id: (String) ID del folder destino.\",

        \"workflowId\": \"gEBtGN5LxDieFeN1\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -288,

        416

      ],

      \"id\": \"5d597e34-e6fa-43d2-8707-fbd12f25f036\",

      \"name\": \"9. Front: Separar HUs\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_front_2_frames\",

        \"description\": \"Mapea Frames a HUs.\\nInputs requeridos (JSON):\\n- org_name: (String)\\n- project_name: (String)\\n- wiki_id: (String)\\n- page_id: (String)\\n- hus_folder_id: (String) Carpeta de HUs.\\n- frames_folder_id: (String) Carpeta de imágenes.\",

        \"workflowId\": \"OnVdCNuS5Enzk3yh\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -160,

        416

      ],

      \"id\": \"f0b5765f-5ed3-4ea6-8dcd-80084172fc32\",

      \"name\": \"10. Front: Map Frames\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_front_3_comm\",

        \"description\": \"Genera diagramas de comunicación.\\nInputs requeridos (JSON):\\n- hus_folder_id: (String)\\n- frames_folder_id: (String)\\n- cd_folder_id: (String) Carpeta destino.\",

        \"workflowId\": \"nmH8oOsWTjnkm0VP\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        0,

        416

      ],

      \"id\": \"d2fb074d-38ef-4ffa-b065-504631bd4294\",

      \"name\": \"11. Front: Diag Comm\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_front_4_seq\",

        \"description\": \"Genera diagramas de secuencia.\\nInputs requeridos (JSON):\\n- hus_folder_id: (String)\\n- frames_folder_id: (String)\\n- cd_folder_id: (String)\\n- sd_folder_id: (String) Carpeta destino Secuencia.\",

        \"workflowId\": \"EboZx2i90SXK5jbs\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        160,

        416

      ],

      \"id\": \"86ee3d9d-e9fd-4d97-b3f9-31787a7ac93b\",

      \"name\": \"12. Front: Diag Seq\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_front_5_endp\",

        \"description\": \"Genera endpoints.\\nInputs requeridos (JSON):\\n- hus_folder_id: (String)\\n- cd_folder_id: (String)\\n- sd_folder_id: (String)\\n- endpoints_folder_id: (String) Carpeta destino Endpoints.\",

        \"workflowId\": \"jt1RNLkaDIX6FbDI\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        320,

        416

      ],

      \"id\": \"0732d2b8-155d-4d55-a51f-f3866dc6587a\",

      \"name\": \"13. Front: Endpoints\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_front_6_tasks\",

        \"description\": \"Genera tareas de desarrollo.\\nInputs requeridos (JSON):\\n- hus_folder_id: (String)\\n- cd_folder_id: (String)\\n- sd_folder_id: (String)\\n- endpoints_folder_id: (String)\\n- tasks_folder_id: (String) Carpeta destino Tareas.\",

        \"workflowId\": \"QZCzCONtjV9Vjdc3\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -320,

        624

      ],

      \"id\": \"bc16d8bb-bf84-4f30-932a-d52747be6d58\",

      \"name\": \"14. Front: Tareas\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_front_7_notify\",

        \"description\": \"Notifica al Scrum Master por email.\\nInputs requeridos (JSON):\\n- tasks_folder_id: (String) ID de la carpeta de Tareas.\",

        \"workflowId\": \"m3WWFcoUYOSPzYLJ\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -160,

        624

      ],

      \"id\": \"51696359-1d1a-4800-a28e-e8b13e4b0f64\",

      \"name\": \"15. Front: Notificar\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_front_8_prompts\",

        \"description\": \"Genera prompts finales.\\nInputs requeridos (JSON):\\n- org_name: (String)\\n- project_name: (String)\\n- wiki_id: (String)\\n- page_id: (String)\\n- hus_folder_id: (String)\\n- tasks_folder_id: (String)\\n- prompts_folder_id: (String) Carpeta destino Prompts.\",

        \"workflowId\": \"NYJdAk8cSmuevJzK\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        0,

        624

      ],

      \"id\": \"593102fb-a27e-486a-aa7c-cbc0c28f24fc\",

      \"name\": \"16. Front: Prompts\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_product_planning_refinement\",

        \"description\": \"=Ejecuta el refinamiento del product planning.\",

        \"workflowId\": \"Bs9hgdz11lF2zFJ3\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -288,

        224

      ],

      \"id\": \"bd0d81c7-a776-469a-ac7a-6a40d136d6fc\",

      \"name\": \"6. Product Plan (Final)\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_test_casos\",

        \"description\": \"Genera casos de prueba.\\nInputs: Ninguno (Automático).\",

        \"workflowId\": \"LNXRGXZqqHkCBccj\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        -320,

        784

      ],

      \"id\": \"c67238a0-0a61-4fef-a97f-9ba1c5e780e5\",

      \"name\": \"17. Testing: Casos\"

    },

    {

      \"parameters\": {

        \"name\": \"tool_test_tablas\",

        \"description\": \"Genera tablas de decisión.\\nInputs: Ninguno (Automático desde Azure).\",

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

    },

    {

      \"parameters\": {

        \"name\": \"tool_test_criterios\",

        \"description\": \"Genera criterios de aceptación.\\nInputs: Ninguno (Automático desde Azure).\",

        \"workflowId\": \"LNXRGXZqqHkCBccj\"

      },

      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",

      \"typeVersion\": 1.1,

      \"position\": [

        0,

        784

      ],

      \"id\": \"a42db258-32eb-4488-8fbb-f5d4add6e8dc\",

      \"name\": \"19. Test: Criterios\"

    }

  ],

  \"connections\": {

    \"Chat con Supervisor\": {

      \"main\": [

        [

          {

            \"node\": \"Agente Supervisor\",

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

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_languageModel\",

            \"index\": 0

          }

        ]

      ]

    },

    \"Memoria de Corto Plazo\": {

      \"ai_memory\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_memory\",

            \"index\": 0

          }

        ]

      ]

    },

    \"1. Product Plan (Initial)\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"2. Release Plan (Initial)\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"3. Discovery (DCU)\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"4. DCU Protocolo\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"5. DCU Resultados\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"7. Release Plan (Final)\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"8. Sprint Planning\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"9. Front: Separar HUs\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"10. Front: Map Frames\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"11. Front: Diag Comm\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"12. Front: Diag Seq\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"13. Front: Endpoints\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"14. Front: Tareas\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"15. Front: Notificar\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"16. Front: Prompts\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"6. Product Plan (Final)\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"17. Testing: Casos\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"18. Test: Tablas\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

            \"index\": 0

          }

        ]

      ]

    },

    \"19. Test: Criterios\": {

      \"ai_tool\": [

        [

          {

            \"node\": \"Agente Supervisor\",

            \"type\": \"ai_tool\",

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


Docker compose:
version: '3.8'

services:
  n8n:
    image: docker.n8n.io/n8nio/n8n
    restart: always
    ports:
      - \"5678:5678\"
    environment:
      - N8N_HOST=localhost
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - NODE_ENV=production
      - WEBHOOK_URL=http://localhost:5678/
      - GENERIC_TIMEZONE=America/Guayaquil
      - N8N_FILESYSTEM_ALLOWLIST=/home/node/.n8n-files

    volumes:
      - n8n_data:/home/node/.n8n
      - C:\\n8n-archivos:/home/node/.n8n-files

    depends_on:
      - postgres

  postgres:
    image: postgres:11
    restart: always
    environment:
      - POSTGRES_USER=n8n
      - POSTGRES_PASSWORD=<REDACTADO>
      - POSTGRES_DB=n8n
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  n8n_data:
  postgres_data:



Para mantener este orquestador y que todos mis compañeros de tesis puedan acceder en AWS cuanto aproximadamente deberia costar para replicar todo lo que esta haciendo ahorita, por ejemplo las carpetas que estan vinculadas a mi maquina ahora deberia vincular a una carpeta en aws o algo similar
```

---

### Navegación

[Volver a Agente supervisor](/03-agente-supervisor/) &middot; [Prompt 002 →](/03-agente-supervisor/002/)
{% endraw %}
