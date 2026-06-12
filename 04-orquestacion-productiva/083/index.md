---
layout: default
title: '083. Siguiente fase: { ''nodes'': [ { ''parameters'': { ''formTit...'
parent: Orquestación n8n productiva
nav_order: 83
permalink: /04-orquestacion-productiva/083/
---

{% raw %}

# Prompt 083
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 12,574 caracteres &middot; **Posición en la conversación:** 83 de 103

---

```
Siguiente fase:
{
  \"nodes\": [
    {
      \"parameters\": {
        \"formTitle\": \"Crear Tareas\",
        \"formDescription\": \"Este formulario recopila información de las carpetas donde se alojan las HUs del Sprint e información necesaria para crear las tareas de implementación de cada HU\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldName\": \"hus_folder_id\",
              \"fieldLabel\": \"HUs Folder ID\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"cd_folder_id\",
              \"fieldLabel\": \"CD Folder ID\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"sd_folder_id\",
              \"fieldLabel\": \"SD Folder ID\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"endpoints_folder_id\",
              \"fieldLabel\": \"Endpoinst Folder ID\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"tasks_folder_id\",
              \"fieldLabel\": \"Tasks Folder ID\",
              \"requiredField\": true
            }
          ]
        },
        \"options\": {
          \"buttonLabel\": \"Crear Tareas\"
        }
      },
      \"type\": \"n8n-nodes-base.formTrigger\",
      \"typeVersion\": 2.4,
      \"position\": [
        -4864,
        1888
      ],
      \"id\": \"00ed797f-eeaa-4742-a388-dc4c8f78faff\",
      \"name\": \"Configurar Entradas1\",
      \"webhookId\": \"77b902b0-39c5-4a3c-bb7a-2ce1f5d21c4f\",
      \"alwaysOutputData\": true
    },
    {
      \"parameters\": {
        \"resource\": \"fileFolder\",
        \"searchMethod\": \"query\",
        \"queryString\": \"='{{ $json.hus_folder_id }}' in parents and mimeType='text/markdown'\",
        \"returnAll\": true,
        \"filter\": {},
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.googleDrive\",
      \"typeVersion\": 3,
      \"position\": [
        -4224,
        1760
      ],
      \"id\": \"ebf3e556-9d31-4121-85c7-d95daf4c2a5d\",
      \"name\": \"Listar HUs\"
    },
    {
      \"parameters\": {
        \"url\": \"=https://www.googleapis.com/drive/v3/files/{{ $json.hus_folder_id }}\",
        \"authentication\": \"predefinedCredentialType\",
        \"nodeCredentialType\": \"googleDriveOAuth2Api\",
        \"sendQuery\": true,
        \"queryParameters\": {
          \"parameters\": [
            {
              \"name\": \"fields\",
              \"value\": \"name\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -4224,
        2080
      ],
      \"id\": \"02fa2908-22a3-4ef2-a0c0-318d630bec34\",
      \"name\": \"HTTP Request\"
    },
    {
      \"parameters\": {
        \"resource\": \"fileFolder\",
        \"searchMethod\": \"query\",
        \"queryString\": \"='{{ $json.cd_folder_id }}' in parents\",
        \"returnAll\": true,
        \"filter\": {},
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.googleDrive\",
      \"typeVersion\": 3,
      \"position\": [
        -4224,
        1424
      ],
      \"id\": \"7ca349c6-c9f3-4bfe-9ded-242aea509b0d\",
      \"name\": \"Listar Diagramas de Comunicación\"
    },
    {
      \"parameters\": {
        \"resource\": \"fileFolder\",
        \"searchMethod\": \"query\",
        \"queryString\": \"='{{ $json.sd_folder_id }}' in parents\",
        \"returnAll\": true,
        \"filter\": {},
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.googleDrive\",
      \"typeVersion\": 3,
      \"position\": [
        -4224,
        1072
      ],
      \"id\": \"a14fcbc2-9d1c-4b9a-a51f-4cc264a485d7\",
      \"name\": \"Listar Diagramas de Secuencia\"
    },
    {
      \"parameters\": {
        \"resource\": \"fileFolder\",
        \"searchMethod\": \"query\",
        \"queryString\": \"='{{ $json.endpoints_folder_id }}' in parents\",
        \"returnAll\": true,
        \"filter\": {},
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.googleDrive\",
      \"typeVersion\": 3,
      \"position\": [
        -4240,
        736
      ],
      \"id\": \"d46bea5a-6ae6-433c-837f-5ca91c220b3e\",
      \"name\": \"Listar Endpoints\"
    }
  ],
  \"connections\": {
    \"Configurar Entradas1\": {
      \"main\": [
        [
          {
            \"node\": \"Listar HUs\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"HTTP Request\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Listar Diagramas de Secuencia\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Listar Diagramas de Comunicación\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Listar Endpoints\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Listar HUs\": {
      \"main\": [
        []
      ]
    },
    \"HTTP Request\": {
      \"main\": [
        []
      ]
    },
    \"Listar Diagramas de Comunicación\": {
      \"main\": [
        []
      ]
    },
    \"Listar Diagramas de Secuencia\": {
      \"main\": [
        []
      ]
    },
    \"Listar Endpoints\": {
      \"main\": [
        []
      ]
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"templateCredsSetupCompleted\": true,
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

{
  \"nodes\": [
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"={{ $json.chatInput }}\",
        \"options\": {
          \"systemMessage\": \"=Entonces modifica bien al agente:\\n\\nEres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC) guiando al usuario paso a paso.\\n\\n---\\n\\n### FASE 1: PRODUCT PLANNING (ENTREVISTA)\\nPara iniciar, recolecta 3 datos. Pregunta UNO POR UNO si faltan:\\n1. **¿Falta IDEA?** -> \\\"¡Hola! ¿Qué proyecto vamos a construir hoy?\\\"\\n2. **¿Falta HORIZONTE?** -> \\\"¿Cuál es el horizonte de tiempo? (Ej: 2 meses)\\\"\\n3. **¿Falta EQUIPO?** -> \\\"¿Con qué presupuesto/equipo contamos?\\\"\\n\\n**EJECUCIÓN FASE 1:**\\nCuando tengas los 3, ejecuta `tool_product_planning_initial`.\\n\\n---\\n\\n### FASE 2: RELEASE PLANNING (TRANSICIÓN)\\nCuando termine Fase 1 y tengas la URL:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Deseas proceder con el Release Planning?\\\"*\\n2. **Entrevista:** Si acepta, pide: *\\\"Indícame fecha inicio y fin del Release 1.\\\"*\\n3. **EJECUCIÓN FASE 2:** Llama a `tool_release_planning_initial` (Usa URL de tu memoria).\\n\\n---\\n\\n### FASE 3: DISCOVERY (ENTREVISTA UX)\\nCuando termine Fase 2:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Iniciamos la fase de Discovery y Diseño UX?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos 3 textos UNO POR UNO:\\n   - **Contexto App:** \\\"Dame un contexto breve de la aplicación.\\\"\\n   - **Objetivo Sprint:** \\\"¿Cuál es el objetivo de este Sprint de diseño?\\\"\\n   - **HUs Épicas:** \\\"Lista las Historias Épicas principales para este sprint.\\\"\\n3. **EJECUCIÓN FASE 3:** Llama a `tool_discovery_inicial`.\\n\\n---\\n### FASE 4: PROTOCOLO DE PRUEBAS\\nDespués del Discovery:\\n1. **Confirma:** *\\\"¿Generamos ahora el Protocolo de Pruebas?\\\"*\\n2. **Ejecuta:** Llama a `tool_dcu_protocolo` pasando el objetivo del sprint anterior.\\n\\n---\\n### FASE 5: INTERPRETACIÓN DE RESULTADOS\\n1. **Confirma:** *\\\"¿Analizamos los resultados de las pruebas de usuario?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_dcu_interpretacion`.\\n   - `tipo_prueba`: \\\"Prueba de Usuario\\\".\\n   - `objetivo_sprint`: (El mismo de la Fase 4).\\n*(NOTA: Las transcripciones se toman del servidor automáticamente).*\\n\\n---\\n### FASE 6: REFINAMIENTO DE PRODUCTO\\n1. **Confirma:** *\\\"¿Deseas realizar el Refinamiento del Product Planning basándonos en el Discovery y el Prototipo?\\\"*\\n2. **EJECUCIÓN FASE 6:** Si el usuario dice SÍ, llama a `tool_product_planning_refinement`.\\n\\n---\\n### FASE 7: REFINAMIENTO DE RELEASE\\nDespués del Refinamiento de Producto:\\n\\n1. **Confirma:** *\\\"¿Deseas ejecutar el Refinamiento del Release Planning para ajustar los Sprints con la nueva información?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_release_planning_refinement`. \\n   *(Automático: Usa el video del prototipo y los documentos actualizados en Azure).*\\n\\n---\\n### FASE 8: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas generar el Sprint Planning detallado para el Sprint 1?\\\"*\\n2. **Entrevista Capacidad (Opcional):** *\\\"¿Hay cambios en la capacidad del equipo? (Si no, usaré la configuración estándar).\\\"*\\n3. **Ejecuta:** Si acepta, llama a `tool_sprint_planning_refinement`.\\n   *(Puedes enviar un JSON con la capacidad del equipo si el usuario la detalla, o dejarlo vacío para usar defaults).*\\n\\n\\n---\\n### FASE 9: FRONTEND - SPLIT HUs\\n1. **Confirma:** *\\\"¿Comenzamos la fase de Frontend separando las Historias de Usuario?\\\"*\\n2. **Entrevista Técnica (Solo si no tienes los datos):**\\n   - *\\\"Necesito los datos de Azure: Organización, Proyecto, Wiki ID, Page ID y Folder ID.\\\"*\\n   - *(Nota: Si el usuario dice \\\"Usa la configuración por defecto\\\", usa los valores de prueba).*\\n3. **Ejecuta:** Llama a `tool_front_1_split` pasando los 5 parámetros.\\n\\n---\\n### FASE 10: FRONTEND - MAPEAR FRAMES\\n1. **Confirma:** *\\\"¿Continuamos con el mapeo de Frames de diseño?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Necesito los IDs de Azure (Wiki/Page) y los IDs de las carpetas de Google Drive (HUs y Frames).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_2_frames`.\\n\\n---\\n### FASE 11: FRONTEND - DIAGRAMAS DE COMUNICACIÓN\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Comunicación?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames y Diagramas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_3_comm`.\\n\\n---\\n### FASE 12: FRONTEND - DIAGRAMAS DE SECUENCIA\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Secuencia?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames, Comunicación y Secuencia.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_4_seq`.\\n\\n---\\n### FASE 13: FRONTEND - ENDPOINTS\\n1. **Confirma:** *\\\"¿Generamos la documentación de Endpoints?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Comunicación, Secuencia y Endpoints.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_5_endp`.\\n\\n---\\n\\n### REGLAS GENERALES\\n- Siempre muestra los links de Azure que te devuelven las herramientas.\\n- Si una herramienta falla, pide al usuario intentar de nuevo o cambiar datos.\\n- Mantén un tono profesional y ágil.\\n- No muestres ninguna URL si es que antes no se ejecuto una herramienta\"
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
        \"name\": \"tool_front_6_tasks\",
        \"description\": \"Paso 14 Frontend: Crear Tareas de Desarrollo detalladas.\",
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
    }
  ],
  \"connections\": {
    \"14. Front: Tareas\": {
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
```

---

### Navegación

[← Prompt 082](/04-orquestacion-productiva/082/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 084 →](/04-orquestacion-productiva/084/)
{% endraw %}
