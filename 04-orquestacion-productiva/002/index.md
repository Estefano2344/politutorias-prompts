---
layout: default
title: '002. Actualmente esta asi el Agente: { ''nodes'': [ { ''parameters'': {...'
parent: Orquestación n8n productiva
nav_order: 2
permalink: /04-orquestacion-productiva/002/
---

{% raw %}

# Prompt 002
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 23,260 caracteres &middot; **Posición en la conversación:** 2 de 103

---

```
Actualmente esta asi el Agente:

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


Primeor hagamos una revision de la primera etapa:
{
  \"nodes\": [
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
    }
  ],
  \"connections\": {
    \"1. Product Plan (Initial)\": {
      \"ai_tool\": [
        []
      ]
    },
    \"2. Release Plan (Initial)\": {
      \"ai_tool\": [
        []
      ]
    },
    \"3. Discovery (DCU)\": {
      \"ai_tool\": [
        []
      ]
    },
    \"4. DCU Protocolo\": {
      \"ai_tool\": [
        []
      ]
    },
    \"5. DCU Resultados\": {
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

Donde a continuacion te indico los flujos actualizados, pero considera que hay problemas porque al yo haberle puesto los triggers ya no tienen las entradas necesarias:

1. Flujo: Product Planning (Before Discovery)
Este flujo está diseñado para ser iniciado mediante un Formulario Web (Form Trigger). No se ejecuta automáticamente, sino cuando alguien llena los campos.

Entradas del Usuario (Campos del Formulario): El nodo 1. Cargar contexto del producto solicita obligatoriamente:

Idea Inicial: La descripción narrativa del producto (Ej: \"Plataforma para tutorías entre estudiantes...\").

Horizonte de Planificación: El tiempo estimado (Ej: \"6 meses\").

Presupuesto / Recursos: Descripción del equipo y recursos disponibles (Ej: \"6 personas, roles Scrum/DevOps...\").

Formato de Visión y Valores: Instrucciones o plantillas específicas para generar la visión (Por defecto tiene cargada la plantilla de Geoffrey Moore).

Entradas del Sistema (Dependencias):

Archivo PDF Base: El flujo descarga automáticamente un PDF de ejemplo desde tu GitHub (Ejemplo Product Planning.pdf).

Conexión a Azure DevOps: Necesita credenciales para crear la página Wiki al final.

2. Flujo: Release Planning (Before Discovery)
Este flujo es diferente. Tiene un Disparador Manual (Manual Trigger), lo que significa que no pide datos al usuario mediante un formulario al iniciar. Toma los datos de fuentes ya existentes o configuraciones internas.

Entradas de Datos (Pre-requisitos):

Documento \"Product Planning\" existente: El nodo 1. Cargar documento product planning busca una página específica en la Wiki de Azure DevOps.

Requisito crítico: Debe existir la Página con ID 111 en el proyecto DTIC-2025-B/PoliTutorias. Si esa página no existe o cambió de ID, el flujo fallará.

Entradas de Configuración (Hardcoded en los Nodos): Actualmente, los parámetros del proyecto están escritos directamente dentro del \"Prompt\" del nodo 2. Calcular fechas del release.... Para ejecutarlo con datos reales, debes editar manualmente este nodo y cambiar:

Fecha Inicio: (Configurado actualmente como \"25 de diciembre 2025\").

Fecha Fin: (Configurado actualmente como \"19 de febrero 2025\" - Nota: Aquí parece haber un error lógico en el año en tu JSON).

Duración del Sprint: (Configurado como \"2 semanas\").

Velocidades: (Baja: 31 SP, Alta: 42 SP).

Entradas del Sistema:

Archivo PDF Base: Descarga Ejemplo Release Planning.pdf desde tu GitHub.


1. Flujo: Fase 4 DCU - Interpretación de resultados
Propósito: Analizar transcripciones de entrevistas de usabilidad y generar un informe de hallazgos.

Entradas del Usuario (Formulario Web):

Objetivo del Sprint: (Texto) ¿Qué se quería validar en esta prueba?

Tipo de Prueba: (Selección) Opciones: \"Prueba de Usuario\" (Default), \"A/B Testing\", \"Validación de Concepto\".

Transcripción Evaluación Estudiante: (Archivo PDF) Documento con las respuestas/diálogo del usuario rol \"Estudiante\".

Transcripción Evaluación Tutor: (Archivo PDF) Documento con las respuestas/diálogo del usuario rol \"Tutor\".

Salidas y Acciones:

Genera un análisis Markdown con problemas de usabilidad, HUs nuevas y métricas.

Sube el reporte a la Wiki de Azure DevOps (Página padre ID: 106).

2. Flujo: Fase 4 DCU - Protocolo de Evaluación
Propósito: Crear el guion paso a paso (protocolo) para realizar pruebas de usabilidad, basado en capturas de pantalla del prototipo.

Entradas del Usuario (Formulario Web):

Objetivo del Sprint: (Texto) El foco de la prueba.

Captura Vista Estudiante: (Archivos .jpg/.png) Screenshots de las pantallas que verá el estudiante.

Captura Vista Tutor: (Archivos .jpg/.png) Screenshots de las pantallas que verá el tutor.

Dependencias Críticas:

Google Gemini (Agent): Requiere que el modelo analice visualmente las imágenes para redactar tareas realistas.

Lógica de Split: El flujo espera generar dos protocolos separados (uno por rol). Si el agente falla y genera uno solo, el flujo podría dar error o advertencia.

3. Flujo: Flujo DCU V3 (Inicio Sprint)
Propósito: El \"Big Bang\" del Sprint. Toma la investigación inicial y genera TODA la documentación de diseño (Personas, Story Map, Journey Map, Mapa Navegacional y Prompt para Magic Patterns).

Entradas del Usuario (Formulario Web):

Contexto_App: (Texto Largo) Descripción general de qué es la aplicación.

Objetivo_Sprint: (Texto Largo) Qué se va a construir en este ciclo.

HUs_Epicas: (Texto Largo) Lista de Épicas del Release para filtrar cuáles entran en este Sprint.

Investigacion_PDF: (Archivo PDF) Transcripciones de entrevistas iniciales o research previo.

Salidas Masivas (Se generan y suben secuencialmente):

User Personas: Markdown en Wiki.

Story Map: Markdown en Wiki (clasificando MVP vs Resto).

Customer Journey Map: Markdown en Wiki.

Mapa Navegacional: Markdown con diagrama Mermaid en Wiki.

Prompt Técnico: Un archivo .txt optimizado para generar la UI en herramientas como Magic Patterns.


```

---

### Navegación

[← Prompt 001](/04-orquestacion-productiva/001/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 003 →](/04-orquestacion-productiva/003/)
{% endraw %}
