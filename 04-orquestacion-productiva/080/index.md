---
layout: default
title: '080. Ahora la siguiente fase: { ''nodes'': [ { ''parameters'': {...'
parent: Orquestación n8n productiva
nav_order: 80
permalink: /04-orquestacion-productiva/080/
---

{% raw %}

# Prompt 080
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 10,464 caracteres &middot; **Posición en la conversación:** 80 de 103

---

```
Ahora la siguiente fase:
{
  \"nodes\": [
    {
      \"parameters\": {
        \"formTitle\": \"Crear Diagrama de Comunicación\",
        \"formDescription\": \"Este formulario recopila información de las carpetas donde se alojan las HUs del Sprint de los cuales se requiere generar los diagramas de comunicación.\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldName\": \"hus_folder_id\",
              \"fieldLabel\": \"Sprint Folder ID\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"frames_folder_id\",
              \"fieldLabel\": \"Frame Folder ID\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"cd_folder_id\",
              \"fieldLabel\": \"CD Folder ID\",
              \"requiredField\": true
            }
          ]
        },
        \"options\": {
          \"buttonLabel\": \"Crear Diagramas\"
        }
      },
      \"type\": \"n8n-nodes-base.formTrigger\",
      \"typeVersion\": 2.4,
      \"position\": [
        -1632,
        112
      ],
      \"id\": \"7487ffc1-d238-45d7-8273-dccaf678cca0\",
      \"name\": \"Configurar Entradas1\",
      \"webhookId\": \"7ebb9d8c-a4fd-41b5-bb11-3b02aabcc4fc\",
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
        -992,
        -16
      ],
      \"id\": \"e3e20f01-475e-437a-94b1-0572caa7e750\",
      \"name\": \"Listar HUs\"
    },
    {
      \"parameters\": {
        \"operation\": \"download\",
        \"fileId\": {
          \"__rl\": true,
          \"value\": \"={{ $json.id }}\",
          \"mode\": \"id\"
        },
        \"options\": {
          \"googleFileConversion\": {
            \"conversion\": {}
          },
          \"fileName\": \"={{ $json.name }}\"
        }
      },
      \"type\": \"n8n-nodes-base.googleDrive\",
      \"typeVersion\": 3,
      \"position\": [
        -736,
        -16
      ],
      \"id\": \"57235205-fa01-45ff-a86a-bbc9fda63e64\",
      \"name\": \"Descargar HUs\"
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
        -992,
        304
      ],
      \"id\": \"04370a97-5b90-4d43-989e-117e63d58c31\",
      \"name\": \"HTTP Request\"
    },
    {
      \"parameters\": {
        \"mode\": \"combine\",
        \"combineBy\": \"combineByPosition\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3.2,
      \"position\": [
        -736,
        192
      ],
      \"id\": \"b50ddd2c-598b-4482-b8c3-3648936a621b\",
      \"name\": \"Merge4\"
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
            \"node\": \"Merge4\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"HTTP Request\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Listar HUs\": {
      \"main\": [
        [
          {
            \"node\": \"Descargar HUs\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Descargar HUs\": {
      \"main\": [
        []
      ]
    },
    \"HTTP Request\": {
      \"main\": [
        [
          {
            \"node\": \"Merge4\",
            \"type\": \"main\",
            \"index\": 1
          }
        ]
      ]
    },
    \"Merge4\": {
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
          \"systemMessage\": \"=Entonces modifica bien al agente:\\n\\nEres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC) guiando al usuario paso a paso.\\n\\n---\\n\\n### FASE 1: PRODUCT PLANNING (ENTREVISTA)\\nPara iniciar, recolecta 3 datos. Pregunta UNO POR UNO si faltan:\\n1. **¿Falta IDEA?** -> \\\"¡Hola! ¿Qué proyecto vamos a construir hoy?\\\"\\n2. **¿Falta HORIZONTE?** -> \\\"¿Cuál es el horizonte de tiempo? (Ej: 2 meses)\\\"\\n3. **¿Falta EQUIPO?** -> \\\"¿Con qué presupuesto/equipo contamos?\\\"\\n\\n**EJECUCIÓN FASE 1:**\\nCuando tengas los 3, ejecuta `tool_product_planning_initial`.\\n\\n---\\n\\n### FASE 2: RELEASE PLANNING (TRANSICIÓN)\\nCuando termine Fase 1 y tengas la URL:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Deseas proceder con el Release Planning?\\\"*\\n2. **Entrevista:** Si acepta, pide: *\\\"Indícame fecha inicio y fin del Release 1.\\\"*\\n3. **EJECUCIÓN FASE 2:** Llama a `tool_release_planning_initial` (Usa URL de tu memoria).\\n\\n---\\n\\n### FASE 3: DISCOVERY (ENTREVISTA UX)\\nCuando termine Fase 2:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Iniciamos la fase de Discovery y Diseño UX?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos 3 textos UNO POR UNO:\\n   - **Contexto App:** \\\"Dame un contexto breve de la aplicación.\\\"\\n   - **Objetivo Sprint:** \\\"¿Cuál es el objetivo de este Sprint de diseño?\\\"\\n   - **HUs Épicas:** \\\"Lista las Historias Épicas principales para este sprint.\\\"\\n3. **EJECUCIÓN FASE 3:** Llama a `tool_discovery_inicial`.\\n\\n---\\n### FASE 4: PROTOCOLO DE PRUEBAS\\nDespués del Discovery:\\n1. **Confirma:** *\\\"¿Generamos ahora el Protocolo de Pruebas?\\\"*\\n2. **Ejecuta:** Llama a `tool_dcu_protocolo` pasando el objetivo del sprint anterior.\\n\\n---\\n### FASE 5: INTERPRETACIÓN DE RESULTADOS\\n1. **Confirma:** *\\\"¿Analizamos los resultados de las pruebas de usuario?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_dcu_interpretacion`.\\n   - `tipo_prueba`: \\\"Prueba de Usuario\\\".\\n   - `objetivo_sprint`: (El mismo de la Fase 4).\\n*(NOTA: Las transcripciones se toman del servidor automáticamente).*\\n\\n---\\n### FASE 6: REFINAMIENTO DE PRODUCTO\\n1. **Confirma:** *\\\"¿Deseas realizar el Refinamiento del Product Planning basándonos en el Discovery y el Prototipo?\\\"*\\n2. **EJECUCIÓN FASE 6:** Si el usuario dice SÍ, llama a `tool_product_planning_refinement`.\\n\\n---\\n### FASE 7: REFINAMIENTO DE RELEASE\\nDespués del Refinamiento de Producto:\\n\\n1. **Confirma:** *\\\"¿Deseas ejecutar el Refinamiento del Release Planning para ajustar los Sprints con la nueva información?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_release_planning_refinement`. \\n   *(Automático: Usa el video del prototipo y los documentos actualizados en Azure).*\\n\\n---\\n### FASE 8: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas generar el Sprint Planning detallado para el Sprint 1?\\\"*\\n2. **Entrevista Capacidad (Opcional):** *\\\"¿Hay cambios en la capacidad del equipo? (Si no, usaré la configuración estándar).\\\"*\\n3. **Ejecuta:** Si acepta, llama a `tool_sprint_planning_refinement`.\\n   *(Puedes enviar un JSON con la capacidad del equipo si el usuario la detalla, o dejarlo vacío para usar defaults).*\\n\\n\\n---\\n### FASE 9: FRONTEND - SPLIT HUs\\n1. **Confirma:** *\\\"¿Comenzamos la fase de Frontend separando las Historias de Usuario?\\\"*\\n2. **Entrevista Técnica (Solo si no tienes los datos):**\\n   - *\\\"Necesito los datos de Azure: Organización, Proyecto, Wiki ID, Page ID y Folder ID.\\\"*\\n   - *(Nota: Si el usuario dice \\\"Usa la configuración por defecto\\\", usa los valores de prueba).*\\n3. **Ejecuta:** Llama a `tool_front_1_split` pasando los 5 parámetros.\\n\\n---\\n### FASE 10: FRONTEND - MAPEAR FRAMES\\n1. **Confirma:** *\\\"¿Continuamos con el mapeo de Frames de diseño?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Necesito los IDs de Azure (Wiki/Page) y los IDs de las carpetas de Google Drive (HUs y Frames).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_2_frames`.\\n\\n---\\n\\n### REGLAS GENERALES\\n- Siempre muestra los links de Azure que te devuelven las herramientas.\\n- Si una herramienta falla, pide al usuario intentar de nuevo o cambiar datos.\\n- Mantén un tono profesional y ágil.\\n- No muestres ninguna URL si es que antes no se ejecuto una herramienta\"
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
        \"name\": \"tool_front_3_comm\",
        \"description\": \"Paso 11 Frontend: Crear Diagramas Comunicación.\",
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
    }
  ],
  \"connections\": {
    \"11. Front: Diag Comm\": {
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

[← Prompt 079](/04-orquestacion-productiva/079/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 081 →](/04-orquestacion-productiva/081/)
{% endraw %}
