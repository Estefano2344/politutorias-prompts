---
layout: default
title: '025. Okay, estoy hasta aca con el agente: { ''nodes'': [ { ''parameters..…'
parent: Orquestación n8n productiva
nav_order: 25
permalink: /04-orquestacion-productiva/025/
---

{% raw %}

# Prompt 025
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 40,565 caracteres &middot; **Posición en la conversación:** 25 de 103

---

```
Okay, estoy hasta aca con el agente:

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
          \"systemMessage\": \"=Eres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC).\\n\\n### TU OBJETIVO ACTUAL (FASE 1: PLANNING)\\nPara iniciar el proyecto con `tool_product_planning_initial`, NECESITAS recolectar obligatoriamente 3 datos del usuario. \\n\\n### REGLAS DE ENTREVISTA (STRICT MODE):\\nRevisa el historial de la conversación y determina qué datos te faltan. \\n**NO PIDAS MÚLTIPLES DATOS A LA VEZ. Pregunta UNO POR UNO en este orden estricto:**\\n\\n1. **¿Falta la IDEA DEL PROYECTO?** \\n   - Si NO la tienes -> Pregunta: \\\"¡Hola! Soy tu Supervisor. Para comenzar, cuéntame: ¿Qué proyecto vamos a construir hoy?\\\"\\n   - Si YA la tienes -> Pasa al siguiente paso.\\n\\n2. **¿Falta el HORIZONTE DE TIEMPO?**\\n   - Si NO lo tienes -> Pregunta: \\\"Entendido. ¿Cuál es el horizonte de tiempo para este desarrollo? (Ej: 2 meses, 1 año)\\\"\\n   - Si YA lo tienes -> Pasa al siguiente paso.\\n\\n3. **¿Falta el PRESUPUESTO O EQUIPO?**\\n   - Si NO lo tienes -> Pregunta: \\\"Perfecto. Por último, ¿con qué presupuesto o recursos humanos contamos? (Ej: Equipo de 6 personas, Presupuesto bajo)\\\"\\n   - Si YA lo tienes -> Pasa al siguiente paso.\\n\\n4. **EJECUCIÓN:**\\n   - SOLO cuando tengas los 3 datos (Idea, Horizonte, Presupuesto), deja de preguntar y EJECUTA la herramienta `tool_product_planning_initial` pasando los valores recolectados.\\n\\n### HERRAMIENTAS DISPONIBLES:\\n- `tool_product_planning_initial`: (Requiere: idea_negocio, horizonte, presupuesto)\\n- `tool_release_planning_initial`\\n- `tool_discovery_inicial`\\n- `tool_dcu_protocolo`\\n- `tool_dcu_interpretacion`\\n- `tool_product_planning_final`\\n- `tool_release_planning_final`\\n- `tool_sprint_planning`\\n- `tool_front_1_split`\\n- `tool_front_2_frames`\\n- `tool_front_3_comm`\\n- `tool_front_4_seq`\\n- `tool_front_5_endp`\\n- `tool_front_6_tasks`\\n- `tool_front_7_notify`\\n- `tool_front_8_prompts`\"
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
        \"description\": \"Genera el Backlog. Inputs OBLIGATORIOS: 'idea_negocio', 'horizonte', 'presupuesto'.1\",
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
        \"description\": \"Paso 2: Release Planning Inicial (Before Discovery).\",
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
        \"description\": \"Paso 3: Flujo DCU V3 (Discovery). Genera Personas, StoryMap, Journey.\",
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
        \"description\": \"Paso 4: Protocolo de Evaluación DCU.\",
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
        \"description\": \"Paso 5: Interpretación de Resultados DCU.\",
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
        \"name\": \"tool_product_planning_final\",
        \"description\": \"Paso 6: Product Planning Final (After Discovery).\",
        \"workflowId\": \"Bs9hgdz11lF2zFJ3\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        -320,
        224
      ],
      \"id\": \"3979a0ff-d60d-467d-a124-9486ba37f07f\",
      \"name\": \"6. Product Plan (Final)\"
    },
    {
      \"parameters\": {
        \"name\": \"tool_release_planning_final\",
        \"description\": \"Paso 7: Release Planning Final (After Discovery).\",
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
        \"description\": \"Paso 8: Sprint Planning (Borrador). Define HUs del Sprint 1.\",
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
        \"description\": \"Paso 9 Frontend: Separar HUs. Divide el Sprint Backlog en archivos.\",
        \"workflowId\": \"gEBtGN5LxDieFeN1\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        -320,
        416
      ],
      \"id\": \"5d597e34-e6fa-43d2-8707-fbd12f25f036\",
      \"name\": \"9. Front: Separar HUs\"
    },
    {
      \"parameters\": {
        \"name\": \"tool_front_2_frames\",
        \"description\": \"Paso 10 Frontend: Mapear Frames. Asocia imágenes a las HUs.\",
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
    },
    {
      \"parameters\": {
        \"name\": \"tool_front_4_seq\",
        \"description\": \"Paso 12 Frontend: Crear Diagramas Secuencia.\",
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
        \"description\": \"Paso 13 Frontend: Crear Endpoints. Documenta la API.\",
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
    },
    {
      \"parameters\": {
        \"name\": \"tool_front_7_notify\",
        \"description\": \"Paso 15 Frontend: Notificar al Scrum Master.\",
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
        \"description\": \"Paso 16 Frontend: Crear Prompts para IA de código y doc DevOps.\",
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
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

Ya responde bien el primer flujo ahora, esa URL debe pasar al siguiente flujo:

{
  \"nodes\": [
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Release%20Planning.pdf\",
        \"options\": {
          \"response\": {
            \"response\": {
              \"responseFormat\": \"file\",
              \"outputPropertyName\": \"Ejemplo_Release_Planning.pdf\"
            }
          }
        }
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -1984,
        -192
      ],
      \"id\": \"bd4f174d-5c49-4ba5-99f2-48b231d4387e\",
      \"name\": \"Obtener ejemplo release planning\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1760,
        -192
      ],
      \"id\": \"a8fed026-18fa-4c65-a812-f9ff72b13e6f\",
      \"name\": \"Cambiar etiqueta de identificación\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-3-flash-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-3-flash-preview\"
        },
        \"text\": \"=Actúa como un Product Owner.\\n\\n1. CONTEXTO (INPUTS):\\n- Fecha Inicio: {{ $('Configurar Parametros').item.json.fecha_inicio }}\\n- Fecha Fin: {{ $('Configurar Parametros').item.json.fecha_fin }}\\n- Duración Sprint: {{ $('Configurar Parametros').item.json.duracion_sprint }} (solo días laborables. Empiezan los días jueves y terminan los días jueves)\\n- Cantidad de sprints para el release 1: {{ $('Configurar Parametros').item.json.cantidad_sprints }} \\n- Velocidad Baja: {{ $('Configurar Parametros').item.json.velocidad_baja }} SP/Sprint\\n- Velocidad Alta: {{ $('Configurar Parametros').item.json.velocidad_alta }} SP/Sprint\\n\\n2. TAREA (CALCULAR RANGOS):\\nAnaliza la estructura de las secciones \\\"1. Release de fecha fija\\\", \\\"2. Rango de velocidad\\\" y \\\"3. Rango de story points\\\" del PDF adjunto.\\nRealiza los cálculos matemáticos exactos para el nuevo proyecto:\\n- Define las fechas exactas de cada Sprint (Sprint 1, Sprint 2, etc.).\\n- Calcula el Total de Story Points (Rango bajo y alto).\\n\\nResponde ESTRICTAMENTE en JSON:\\n{\\n  \\\"fechas_release\\\": { \\\"inicio\\\": \\\"...\\\", \\\"fin\\\": \\\"...\\\" },\\n  \\\"sprints\\\": [\\n    { \\\"nombre\\\": \\\"Sprint 1\\\", \\\"fechas\\\": \\\"Del X al Y\\\" },\\n    { \\\"nombre\\\": \\\"Sprint 2\\\", \\\"fechas\\\": \\\"...\\\" }\\n  ],\\n  \\\"velocidad\\\": { \\\"baja\\\": 0, \\\"alta\\\": 0 },\\n  \\\"rango_total_sp\\\": {\\n     \\\"calculo_bajo\\\": \\\"Cantidad Sprints * Velocidad baja = \\\",\\n     \\\"calculo_alto\\\": \\\"Cantidad Sprints * Velocidad alta = \\\",\\n     \\\"min\\\": 0,\\n     \\\"max\\\": 0\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -1536,
        -192
      ],
      \"id\": \"1f215c24-e396-4097-855e-42cc6519a910\",
      \"name\": \"2. Calcular fechas del release y el rango de story points\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Release%20Planning.pdf\",
        \"options\": {
          \"response\": {
            \"response\": {
              \"responseFormat\": \"file\",
              \"outputPropertyName\": \"Ejemplo_Release_Planning.pdf\"
            }
          }
        }
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -1312,
        -192
      ],
      \"id\": \"4b382ab5-802a-4dde-b59e-5d879dd9ccb7\",
      \"name\": \"Obtener ejemplo release planning1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1088,
        -192
      ],
      \"id\": \"d8b0d970-460d-445b-a6fe-56f5bcd981aa\",
      \"name\": \"Cambiar etiqueta de identificación1\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-3-flash-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-3-flash-preview\"
        },
        \"text\": \"=Actúa como **Product Owner y Equipo de Desarrollo**.\\n\\n1. INPUT 1: CONTEXTO DEL PRODUCTO (Desde Azure DevOps)\\nAnaliza el documento \\\"Product Planning\\\" actual:\\n>>> {{ $('1. Cargar documento product planning').item.json.content }} <<<\\n\\n2. INPUT 2: GUÍA DE ESTILO Y FORMATO (PDF ADJUNTO)\\nAnaliza el archivo PDF adjunto (\\\"Ejemplo Release Planning\\\").\\nPresta especial atención a la **\\\"Sección 5. Conjunto de MRF\\\"** y a la tabla de priorización. Debes replicar esas columnas y esa lógica de agrupación (Must have, Will have,Might have, Won't have.).\\n\\n3. INPUT 3: RESTRICCIONES TÉCNICAS \\nSe ha calculado el rango de story points que el equipo puede completar durante un release. Usa este dato para no exceder el límite de Story Points:\\n>>> {{ $('2. Calcular fechas del release y el rango de story points').item.json.content.parts[0].text }} <<<\\n\\n4. TAREA (REFINAMIENTO Y PRIORIZACIÓN):\\nBasado en los Epics del Input 1 y respetando el límite del Input 3:\\n1.  **Desglosa** los Epics en Historias de Usuario (HUs) detalladas.\\n2.  **Estima** cada HU en Story Points (Serie Modificada de Fibonacci: 1, 2, 3, 5, 8, 13).\\n* *Nota:* La suma total de SP del will have debe ser <= que rango bajo SP del release. Mientras que el suma total de SP del Might have debe ser <= que el rango alto de SP del release. Todo lo que supere el ranto alto es el won't have\\n3.  **Aplica MoSCoW:** Clasifica cada historia en \\\"Must have\\\", \\\"Will have\\\", \\\"Might have\\\" o \\\"Won't have\\\".\\n4.  **Define MRF:** Las historias \\\"Must have\\\" conforman el \\\"Must-Release Features\\\".\\n5.  **Objetivo:** Redacta el \\\"Objetivo del Release\\\" basado en las Features seleccionadas.\\n\\nResponde ESTRICTAMENTE en formato JSON con esta estructura:\\n{\\n  \\\"objetivo_release\\\": \\\"Resumen del objetivo...\\\",\\n  \\\"backlog_refinado\\\": [\\n    { \\n      \\\"id\\\": \\\"HU01\\\", \\n      \\\"titulo\\\": \\\"Nombre corto de la historia\\\", \\n      \\\"estimacion\\\": 13, \\n      \\\"moscow\\\": \\\"Must have\\\" \\n    }\\n  ],\\n  \\\"analisis_mrf\\\": {\\n    \\\"total_sp_estimado\\\": 0,\\n    \\\"total_sp_mrf\\\": 0,\\n    \\\"porcentaje_mrf\\\": \\\"0%\\\"\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Release_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -880,
        -192
      ],
      \"id\": \"25130002-5849-4162-887f-87babc48ba80\",
      \"name\": \"3. Refinar PB, seleccionar MRF y priorizar PB\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Release%20Planning.pdf\",
        \"options\": {
          \"response\": {
            \"response\": {
              \"responseFormat\": \"file\",
              \"outputPropertyName\": \"Ejemplo_Product_Planning.pdf\"
            }
          }
        }
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -656,
        -192
      ],
      \"id\": \"19e9e17c-6f77-488d-919e-f80c50666215\",
      \"name\": \"Obtener ejemplo release planning2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -432,
        -192
      ],
      \"id\": \"8066729b-aeaa-4a63-9642-7302d02a95f8\",
      \"name\": \"Cambiar etiqueta de identificación2\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-3-flash-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-3-flash-preview\"
        },
        \"text\": \"=Actúa como el **Equipo Scrum**.\\n\\n1. INPUT 1: BACKLOG PRIORIZADO (HUs y MoSCoW)\\n>>> {{ $('3. Refinar PB, seleccionar MRF y priorizar PB').item.json.content.parts[0].text }} <<<\\n\\n2. INPUT 2: ESTRUCTURA DE SPRINTS (Fechas del SM)\\n>>> {{ $('2. Calcular fechas del release y el rango de story points').item.json.content.parts[0].text }} <<<\\n\\n3. INPUT 3: ESTILO VISUAL (PDF ADJUNTO)\\nAnaliza la **\\\"Sección 6. Sprint mapping\\\"** del PDF adjunto.\\nFormato visual requerido:\\n- Arriba: Lista limpia con el Objetivo Comercial.\\n- Abajo: Tabla detallada por Sprint.\\n\\n4. TAREA (MAPPING ESTRATÉGICO CON PRIORIZACIÓN ESTRICTA):\\nTu misión es distribuir las Historias de Usuario (HUs) en los 4 sprints para asegurar que el MVP (Minimum Viable Product) se entregue lo antes posible.\\n\\nResponde ESTRICTAMENTE en JSON con este formato:\\n{\\n  \\\"sprint_mapping\\\": [\\n    {\\n      \\\"sprint_name\\\": \\\"Sprint 1\\\",\\n      \\\"objetivo_comercial\\\": \\\"...\\\",\\n      \\\"lista_hus\\\": [\\n        { \\\"id\\\": \\\"HU01\\\", \\\"titulo\\\": \\\"Ofrecer un producto\\\" }\\n      ]\\n    }\\n  ]\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -208,
        -192
      ],
      \"id\": \"bb0526ff-8f57-4ae0-a01f-a7b879389ca2\",
      \"name\": \"4. Crear el sprint mapping\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN HELPER ---\\nconst getJson = (nombreNodo) => {\\n    try {\\n        const node = $(nombreNodo).first();\\n        if (!node) return {};\\n        let text = node.json.content?.parts?.[0]?.text || node.json.candidates?.[0]?.content?.parts?.[0]?.text || node.json.text || \\\"\\\";\\n        return JSON.parse(text.replace(/```json|```/g, '').trim());\\n    } catch (e) { return {}; }\\n};\\n\\n// --- 2. OBTENER DATOS ---\\nconst smData = getJson('2. Calcular fechas del release y el rango de story points'); \\nconst poData = getJson('3. Refinar PB, seleccionar MRF y priorizar PB');\\nconst mapData = getJson('4. Crear el sprint mapping');\\n\\n// --- 3. PROCESAMIENTO ---\\nconst backlog = poData.backlog_refinado || [];\\n// (Lógica de ordenamiento simplificada para markdown)\\n\\n// --- 4. CONSTRUIR MARKDOWN ---\\nlet md = `# Release Planning - Release 1 - V1.0\\\\n\\\\n`;\\nmd += `## 1. Release de fecha fija\\\\n`;\\nmd += `* **Fecha inicio:** ${smData.fechas_release?.inicio || \\\"Pendiente\\\"}\\\\n`;\\nmd += `* **Fecha fin:** ${smData.fechas_release?.fin || \\\"Pendiente\\\"}\\\\n`;\\n\\nmd += `\\\\n## 3. Objetivo del Release\\\\n${poData.objetivo_release || \\\"Pendiente\\\"}\\\\n`;\\n\\nmd += `\\\\n## 4. Conjunto de MRF\\\\n`;\\nmd += `| Prioridad | ID | Título | SP |\\\\n|---|---|---|---|\\\\n`;\\nbacklog.forEach(i => {\\n    md += `| **${i.moscow}** | ${i.id} | ${i.titulo} | ${i.estimacion} |\\\\n`;\\n});\\n\\nmd += `\\\\n## 6. Sprint mapping\\\\n`;\\nif (mapData.sprint_mapping) {\\n    mapData.sprint_mapping.forEach(m => {\\n        md += `* **${m.sprint_name}:** ${m.objetivo_comercial}\\\\n`;\\n    });\\n}\\n\\nreturn {\\n    json: {\\n        wiki_content: md,\\n        page_title: \\\"Release Planning - Release 1 - V1.0\\\"\\n    }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        0,
        -320
      ],
      \"id\": \"d7dcf8db-4dfb-4b18-9bfa-46c53dd1e15d\",
      \"name\": \"Generar documento markdown\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. HELPER ---\\nconst getJson = (nombreNodo) => {\\n    try {\\n        const node = $(nombreNodo).first();\\n        if (!node) return {};\\n        let text = node.json.content?.parts?.[0]?.text || node.json.candidates?.[0]?.content?.parts?.[0]?.text || node.json.text || \\\"\\\";\\n        return JSON.parse(text.replace(/```json|```/g, '').trim());\\n    } catch (e) { return {}; }\\n};\\n\\nconst mapData = getJson('4. Crear el sprint mapping');\\nconst poData = getJson('3. Refinar PB, seleccionar MRF y priorizar PB');\\nconst spMap = {};\\n(poData.backlog_refinado || []).forEach(item => spMap[item.id] = item.estimacion);\\n\\nlet md = `# Product Backlog Maestro (V1.0)\\\\n\\\\n| ID | Título | SP |\\\\n|---|---|---|\\\\n`;\\nif (mapData.sprint_mapping) {\\n    mapData.sprint_mapping.forEach(sprint => {\\n        (sprint.lista_hus || []).forEach(hu => {\\n            md += `| ${hu.id} | ${hu.titulo} | ${spMap[hu.id] || \\\"-\\\"} |\\\\n`;\\n        });\\n    });\\n}\\n\\nreturn {\\n    json: {\\n        wiki_content: md,\\n        page_title: \\\"Product Backlog Master\\\"\\n    }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        0,
        -16
      ],
      \"id\": \"214c13dd-2f2c-491b-b649-529bfada8ef0\",
      \"name\": \"Generar documento markdown1\"
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Release-Planning-V1.0&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendBody\": true,
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.wiki_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        224,
        -320
      ],
      \"id\": \"611cbf91-0759-4a96-b898-b66809ffec73\",
      \"name\": \"6. Guardar borrador product planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Product-Backlog-V1.0&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendBody\": true,
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.wiki_content }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        224,
        -16
      ],
      \"id\": \"1cfdc289-1bdf-4dd6-8f31-a7e133a3d53e\",
      \"name\": \"6. Guardar borrador product backlog\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"mode\": \"wait\"
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3,
      \"position\": [
        448,
        -192
      ],
      \"id\": \"c842d01d-4aa3-428b-811a-26aeb7623edc\",
      \"name\": \"Merge Final\"
    },
    {
      \"parameters\": {
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.set\",
      \"typeVersion\": 3.4,
      \"position\": [
        672,
        -192
      ],
      \"id\": \"02fe7656-deb1-443e-979b-859edaa2914d\",
      \"name\": \"Respuesta al Orquestador\"
    },
    {
      \"parameters\": {},
      \"id\": \"29c291fa-2525-4063-835d-7c4230e29d2c\",
      \"name\": \"Execute Workflow Trigger\",
      \"type\": \"n8n-nodes-base.executeWorkflowTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -2656,
        -304
      ]
    },
    {
      \"parameters\": {},
      \"id\": \"073922b6-58e7-468e-9ce6-75ff527c2ba3\",
      \"name\": \"Manual Trigger\",
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -2656,
        -96
      ]
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO DE CONFIGURACIÓN INTELIGENTE\\nconst input = $input.first().json;\\n\\n// 1. Extraer o Definir Fechas (Inputs del Agente)\\nconst fechaInicio = input.fecha_inicio || '2025-12-25';\\nconst fechaFin = input.fecha_fin || '2026-02-19';\\n\\n// 2. Lógica para obtener el documento previo (Product Planning)\\n// El Agente nos manda la URL completa de la Wiki.\\n// Nosotros necesitamos extraer el \\\"path\\\" para la API de Azure.\\n// Ejemplo URL: ...?pagePath=%2FProduct-Planning-V1.0\\n\\nlet wikiPath = \\\"/Product-Planning-V1.0\\\"; // Default por seguridad\\n\\nif (input.wiki_url) {\\n  try {\\n    // Intentamos extraer el parámetro pagePath de la URL\\n    const urlObj = new URL(input.wiki_url);\\n    const pathParam = urlObj.searchParams.get(\\\"pagePath\\\");\\n    if (pathParam) {\\n      wikiPath = pathParam;\\n    }\\n  } catch (e) {\\n    // Si falla el parseo, usamos el default\\n    console.log(\\\"Error parseando URL, usando default\\\");\\n  }\\n}\\n\\nreturn {\\n  json: {\\n    // Parámetros de Fechas\\n    fecha_inicio: fechaInicio,\\n    fecha_fin: fechaFin,\\n    duracion_sprint: input.duracion_sprint || '2 semanas',\\n    cantidad_sprints: input.cantidad_sprints || 4,\\n    velocidad_baja: input.velocidad_baja || 31,\\n    velocidad_alta: input.velocidad_alta || 42,\\n    \\n    // Parámetro para buscar el documento fuente\\n    wiki_path_source: wikiPath\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2416,
        -192
      ],
      \"id\": \"b271836e-6a85-4d14-8dea-1ca649c865b7\",
      \"name\": \"Configurar Parametros\"
    },
    {
      \"parameters\": {
        \"url\": \"=https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path={{ $json.wiki_path_source }}&includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -2176,
        -192
      ],
      \"id\": \"078c8503-b272-49b4-8761-1e09b8239156\",
      \"name\": \"1. Cargar documento product planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    }
  ],
  \"connections\": {
    \"Obtener ejemplo release planning\": {
      \"main\": [
        [
          {
            \"node\": \"Cambiar etiqueta de identificación\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Cambiar etiqueta de identificación\": {
      \"main\": [
        [
          {
            \"node\": \"2. Calcular fechas del release y el rango de story points\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"2. Calcular fechas del release y el rango de story points\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo release planning1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo release planning1\": {
      \"main\": [
        [
          {
            \"node\": \"Cambiar etiqueta de identificación1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Cambiar etiqueta de identificación1\": {
      \"main\": [
        [
          {
            \"node\": \"3. Refinar PB, seleccionar MRF y priorizar PB\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"3. Refinar PB, seleccionar MRF y priorizar PB\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo release planning2\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo release planning2\": {
      \"main\": [
        [
          {
            \"node\": \"Cambiar etiqueta de identificación2\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Cambiar etiqueta de identificación2\": {
      \"main\": [
        [
          {
            \"node\": \"4. Crear el sprint mapping\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"4. Crear el sprint mapping\": {
      \"main\": [
        [
          {
            \"node\": \"Generar documento markdown\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Generar documento markdown1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar documento markdown\": {
      \"main\": [
        [
          {
            \"node\": \"6. Guardar borrador product planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar documento markdown1\": {
      \"main\": [
        [
          {
            \"node\": \"6. Guardar borrador product backlog\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"6. Guardar borrador product planning\": {
      \"main\": [
        [
          {
            \"node\": \"Merge Final\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"6. Guardar borrador product backlog\": {
      \"main\": [
        [
          {
            \"node\": \"Merge Final\",
            \"type\": \"main\",
            \"index\": 1
          }
        ]
      ]
    },
    \"Merge Final\": {
      \"main\": [
        [
          {
            \"node\": \"Respuesta al Orquestador\",
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
            \"node\": \"Configurar Parametros\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Manual Trigger\": {
      \"main\": [
        [
          {
            \"node\": \"Configurar Parametros\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Configurar Parametros\": {
      \"main\": [
        [
          {
            \"node\": \"1. Cargar documento product planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"1. Cargar documento product planning\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo release planning\",
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

Pero para eso el agente debe preguntarme si pasamos a generar el realese planning

```

---

### Navegación

[← Prompt 024](/04-orquestacion-productiva/024/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 026 →](/04-orquestacion-productiva/026/)
{% endraw %}
