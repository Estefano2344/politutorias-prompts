---
layout: default
title: '002. En base a eso edita el agente supervisor: { ''nodes'': [ { ''par...'
parent: PoC n8n local
nav_order: 2
permalink: /02-poc-n8n-local/002/
---

{% raw %}

# Prompt 002
{: .no_toc }

**Sección:** PoC n8n local &middot; **Longitud:** 15,046 caracteres &middot; **Posición en la conversación:** 2 de 2

---

```
En base a eso edita el agente supervisor:




{

  "nodes": [

    {

      "parameters": {

        "options": {}

      },

      "type": "@n8n/n8n-nodes-langchain.chatTrigger",

      "typeVersion": 1.1,

      "position": [

        -1024,

        48

      ],

      "id": "6a652169-5c58-4d02-b871-266887adc4b6",

      "name": "Chat con Supervisor",

      "webhookId": "67dfb020-df95-444d-bcc0-725b8f70ddfc"

    },

    {

      "parameters": {

        "modelName": "models/gemini-2.0-flash",

        "options": {

          "temperature": 0.3

        }

      },

      "type": "@n8n/n8n-nodes-langchain.lmChatGoogleGemini",

      "typeVersion": 1,

      "position": [

        -704,

        288

      ],

      "id": "c5fb9d56-c6ba-4297-9330-84d8b07d05ee",

      "name": "Google Gemini Chat Model",

      "credentials": {

        "googlePalmApi": {

          "id": "tN2HeGeNbppUpSjJ",

          "name": "Gemini DevOps"

        }

      }

    },

    {

      "parameters": {

        "contextWindowLength": 20

      },

      "type": "@n8n/n8n-nodes-langchain.memoryBufferWindow",

      "typeVersion": 1.3,

      "position": [

        -528,

        288

      ],

      "id": "7561ceeb-d2cb-4a24-829f-cf1f5ef1e8aa",

      "name": "Memoria de Corto Plazo"

    },

    {

      "parameters": {

        "promptType": "define",

        "text": "={{ $json.chatInput }}",

        "options": {

          "systemMessage": "=Eres el **Supervisor de Ingeniería de Software (AI Architect)**.\nTu misión es orquestar el ciclo de vida del software (SDLC) paso a paso.\n\n### ESTADO ACTUAL Y TRANSICIONES (LEE ESTO PRIMERO):\n\nRevisa el historial de mensajes para saber en qué punto estamos:\n\n**ESTADO 1: INICIO (Product Planning)**\n- Si NO tienes la `Idea`, `Horizonte` y `Presupuesto`: Pregunta por ellos UNO POR UNO (No pidas todos juntos).\n- Si YA tienes los 3 datos: EJECUTA `tool_product_planning_initial`.\n\n**ESTADO 2: TRANSICIÓN A RELEASE PLANNING**\n- **CRÍTICO:** Si la herramienta `tool_product_planning_initial` acaba de ejecutarse (verás un mensaje de \"Output\" o \"Response\" con un ✅ o \"Completado\" o una URL), TU TRABAJO EN ESA FASE TERMINÓ.\n- **ACCIÓN:** Informa al usuario: \"¡Excelente! El Product Planning está listo. He generado la Visión y el Backlog. ¿Procedemos ahora con el Release Planning Inicial?\"\n- Si el usuario dice \"Sí\", EJECUTA `tool_release_planning_initial`.\n\n**ESTADO 3: DISCOVERY (DCU)**\n- Si el Release Planning termina: Pregunta si desea iniciar la investigación de usuarios (Discovery).\n- Si acepta, ejecuta `tool_discovery_inicial`.\n\n### LISTA DE HERRAMIENTAS:\n- `tool_product_planning_initial`: (Requiere: idea_negocio, horizonte, presupuesto)\n- `tool_release_planning_initial`: (Sin inputs extra, usa el contexto del proyecto)\n- `tool_discovery_inicial`\n- `tool_dcu_protocolo`\n- `tool_dcu_interpretacion`\n- `tool_product_planning_final`\n- `tool_release_planning_final`\n- `tool_sprint_planning`\n- `tool_front_1_split`\n- `tool_front_2_frames`\n- `tool_front_3_comm`\n- `tool_front_4_seq`\n- `tool_front_5_endp`\n- `tool_front_6_tasks`\n- `tool_front_7_notify`\n- `tool_front_8_prompts`\n\n### REGLA DE ORO:\n¡NO TE QUEDES ATASCADO! Si una herramienta devuelve un texto que dice \"Completado\" o muestra un enlace, asume éxito total y propón INMEDIATAMENTE la siguiente fase."

        }

      },

      "type": "@n8n/n8n-nodes-langchain.agent",

      "typeVersion": 1.7,

      "position": [

        -320,

        48

      ],

      "id": "4f1db038-8592-4112-94d4-dc50aa9430ed",

      "name": "Agente Supervisor"

    },

    {

      "parameters": {

        "name": "tool_product_planning_initial",

        "description": "Genera el Backlog. Inputs OBLIGATORIOS: 'idea_negocio', 'horizonte', 'presupuesto'.",

        "workflowId": "ZhezxyqBaf8lyhER"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        48,

        -288

      ],

      "id": "dd97e0bb-568c-45f9-80cb-1e14f2a2d82e",

      "name": "1. Product Plan (Initial)"

    },

    {

      "parameters": {

        "name": "tool_release_planning_initial",

        "description": "Paso 2: Release Planning Inicial (Before Discovery).",

        "workflowId": "JcJaYWxG3YU5E8AO"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        208,

        -288

      ],

      "id": "5a135216-0cbe-467f-b559-cb92611ab8b7",

      "name": "2. Release Plan (Initial)"

    },

    {

      "parameters": {

        "name": "tool_discovery_inicial",

        "description": "Paso 3: Flujo DCU V3 (Discovery). Genera Personas, StoryMap, Journey.",

        "workflowId": "CPE7Bf8xQTu5pwhk"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        368,

        -288

      ],

      "id": "3c4aaabf-8397-4a72-b61b-12a49a4ccc2b",

      "name": "3. Discovery (DCU)"

    },

    {

      "parameters": {

        "name": "tool_dcu_protocolo",

        "description": "Paso 4: Protocolo de Evaluación DCU.",

        "workflowId": "anO4tEz9NcUVNC3S"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        528,

        -288

      ],

      "id": "c5cee9db-9492-4e49-a594-624b76128fd4",

      "name": "4. DCU Protocolo"

    },

    {

      "parameters": {

        "name": "tool_dcu_interpretacion",

        "description": "Paso 5: Interpretación de Resultados DCU.",

        "workflowId": "cPQHxhfVL0waZJ2L"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        688,

        -288

      ],

      "id": "815b1168-bbfe-4579-b51e-fc0f0b62aa6f",

      "name": "5. DCU Resultados"

    },

    {

      "parameters": {

        "name": "tool_product_planning_final",

        "description": "Paso 6: Product Planning Final (After Discovery).",

        "workflowId": "Bs9hgdz11lF2zFJ3"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        48,

        -80

      ],

      "id": "b7fa73e9-728e-4c4e-8094-927d4ace4861",

      "name": "6. Product Plan (Final)"

    },

    {

      "parameters": {

        "name": "tool_release_planning_final",

        "description": "Paso 7: Release Planning Final (After Discovery).",

        "workflowId": "BV4FTwoDezhLiCbK"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        208,

        -80

      ],

      "id": "3144c727-3682-44ab-9843-b96736242ae7",

      "name": "7. Release Plan (Final)"

    },

    {

      "parameters": {

        "name": "tool_sprint_planning",

        "description": "Paso 8: Sprint Planning (Borrador). Define HUs del Sprint 1.",

        "workflowId": "L4QphkDkDvBPmu2L"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        368,

        -80

      ],

      "id": "953e92b9-6c28-4522-9776-3063d5ab1dfe",

      "name": "8. Sprint Planning"

    },

    {

      "parameters": {

        "name": "tool_front_1_split",

        "description": "Paso 9 Frontend: Separar HUs. Divide el Sprint Backlog en archivos.",

        "workflowId": "gEBtGN5LxDieFeN1"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        48,

        112

      ],

      "id": "3323976d-7e2c-46a4-a7fb-5299debe0a08",

      "name": "9. Front: Separar HUs"

    },

    {

      "parameters": {

        "name": "tool_front_2_frames",

        "description": "Paso 10 Frontend: Mapear Frames. Asocia imágenes a las HUs.",

        "workflowId": "OnVdCNuS5Enzk3yh"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        208,

        112

      ],

      "id": "a71f5446-9787-48fa-a1fa-46a6cea943d5",

      "name": "10. Front: Map Frames"

    },

    {

      "parameters": {

        "name": "tool_front_3_comm",

        "description": "Paso 11 Frontend: Crear Diagramas Comunicación.",

        "workflowId": "nmH8oOsWTjnkm0VP"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        368,

        112

      ],

      "id": "c4dc1a25-3847-45a6-ac68-bbbf80dca47a",

      "name": "11. Front: Diag Comm"

    },

    {

      "parameters": {

        "name": "tool_front_4_seq",

        "description": "Paso 12 Frontend: Crear Diagramas Secuencia.",

        "workflowId": "EboZx2i90SXK5jbs"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        528,

        112

      ],

      "id": "44b4f033-74a3-4325-8854-031c9e5f80e6",

      "name": "12. Front: Diag Seq"

    },

    {

      "parameters": {

        "name": "tool_front_5_endp",

        "description": "Paso 13 Frontend: Crear Endpoints. Documenta la API.",

        "workflowId": "jt1RNLkaDIX6FbDI"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        688,

        112

      ],

      "id": "15f01bd8-d312-4e09-ae84-49477a31ff80",

      "name": "13. Front: Endpoints"

    },

    {

      "parameters": {

        "name": "tool_front_6_tasks",

        "description": "Paso 14 Frontend: Crear Tareas de Desarrollo detalladas.",

        "workflowId": "QZCzCONtjV9Vjdc3"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        48,

        320

      ],

      "id": "bb06101e-47f7-4aa5-a923-f493919ac303",

      "name": "14. Front: Tareas"

    },

    {

      "parameters": {

        "name": "tool_front_7_notify",

        "description": "Paso 15 Frontend: Notificar al Scrum Master.",

        "workflowId": "m3WWFcoUYOSPzYLJ"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        208,

        320

      ],

      "id": "dc978a32-2667-4928-b3bb-29e04b511e87",

      "name": "15. Front: Notificar"

    },

    {

      "parameters": {

        "name": "tool_front_8_prompts",

        "description": "Paso 16 Frontend: Crear Prompts para IA de código y doc DevOps.",

        "workflowId": "NYJdAk8cSmuevJzK"

      },

      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",

      "typeVersion": 1.1,

      "position": [

        368,

        320

      ],

      "id": "e48f92a0-2902-495a-a19c-6612ad560942",

      "name": "16. Front: Prompts"

    }

  ],

  "connections": {

    "Chat con Supervisor": {

      "main": [

        [

          {

            "node": "Agente Supervisor",

            "type": "main",

            "index": 0

          }

        ]

      ]

    },

    "Google Gemini Chat Model": {

      "ai_languageModel": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_languageModel",

            "index": 0

          }

        ]

      ]

    },

    "Memoria de Corto Plazo": {

      "ai_memory": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_memory",

            "index": 0

          }

        ]

      ]

    },

    "1. Product Plan (Initial)": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "2. Release Plan (Initial)": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "3. Discovery (DCU)": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "4. DCU Protocolo": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "5. DCU Resultados": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "6. Product Plan (Final)": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "7. Release Plan (Final)": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "8. Sprint Planning": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "9. Front: Separar HUs": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "10. Front: Map Frames": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "11. Front: Diag Comm": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "12. Front: Diag Seq": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "13. Front: Endpoints": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "14. Front: Tareas": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "15. Front: Notificar": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    },

    "16. Front: Prompts": {

      "ai_tool": [

        [

          {

            "node": "Agente Supervisor",

            "type": "ai_tool",

            "index": 0

          }

        ]

      ]

    }

  },

  "pinData": {},

  "meta": {

    "instanceId": "2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf"

  }

}




Para que acepte mis respuestas
```

---

### Navegación

[← Prompt 001](/02-poc-n8n-local/001/) &middot; [Volver a PoC n8n local](/02-poc-n8n-local/)
{% endraw %}
