---
layout: default
title: '011. Esta bien, pensando en esta solucion de aca: { ''nodes'': [ { ''par.…'
parent: Orquestación n8n productiva
nav_order: 11
permalink: /04-orquestacion-productiva/011/
---

{% raw %}

# Prompt 011
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 12,763 caracteres &middot; **Posición en la conversación:** 11 de 103

---

```
Esta bien, pensando en esta solucion de aca:

{
  \"nodes\": [
    {
      \"parameters\": {
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.chatTrigger\",
      \"typeVersion\": 1.1,
      \"position\": [
        -1376,
        176
      ],
      \"id\": \"46d91b01-a0e6-4316-900c-10d2d3858ae5\",
      \"name\": \"Chat Supervisor\",
      \"webhookId\": \"12f0b48f-ca14-47d3-8f5e-962517e0ab37\"
    },
    {
      \"parameters\": {
        \"modelName\": \"models/gemini-2.0-flash\",
        \"options\": {
          \"temperature\": 0.2
        }
      },
      \"type\": \"@n8n/n8n-nodes-langchain.lmChatGoogleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        -976,
        416
      ],
      \"id\": \"4619a6be-ff3d-483a-b3c1-6928f44d44c2\",
      \"name\": \"Gemini Brain\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"tN2HeGeNbppUpSjJ\",
          \"name\": \"Gemini DevOps\"
        }
      }
    },
    {
      \"parameters\": {
        \"contextWindowLength\": 10
      },
      \"type\": \"@n8n/n8n-nodes-langchain.memoryBufferWindow\",
      \"typeVersion\": 1.3,
      \"position\": [
        -784,
        416
      ],
      \"id\": \"b2551537-05be-41f0-915a-f8dc5a71908b\",
      \"name\": \"Memoria Corto Plazo\"
    },
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"={{ $json.chatInput }}\",
        \"options\": {
          \"systemMessage\": \"Eres el **AI Project Manager & Architect** de la tesis \\\"Low-Code con IA Generativa\\\".\\nTu objetivo es orquestar el ciclo de vida de desarrollo de software (SDLC) ejecutando los flujos de trabajo autónomos.\\n\\n### 🧠 TU CEREBRO (MEMORIA Y CONTEXTO)\\n1.  **Archivos del Servidor:** Sabes que los archivos necesarios (PDFs de entrevistas, Capturas de pantalla) YA están cargados en el servidor por el equipo DevOps. NO le pidas al usuario que suba archivos. Simplemente ejecuta la herramienta correspondiente y el sistema los tomará.\\n2.  **Secuencia Lógica:**\\n    -   Fase 1: Planning (Product -> Release)\\n    -   Fase 2: Discovery (Discovery -> Protocolo -> Resultados)\\n\\n### 🕹️ INSTRUCCIONES DE INTERACCIÓN\\n1.  **Analiza la solicitud del usuario.**\\n2.  **Verifica los requisitos:** Antes de llamar a una herramienta, asegúrate de tener los datos de texto necesarios (Idea, Objetivos, etc.). Si faltan, PREGUNTA al usuario.\\n3.  **Ejecuta la herramienta:** Llama a la tool correspondiente pasando los argumentos en formato JSON.\\n4.  **Reporta:** Cuando la herramienta responda con \\\"completed\\\" y una URL, informa al usuario: \\\"✅ Fase completada. Puedes ver el reporte aquí: [URL]. ¿Continuamos con la siguiente fase?\\\".\\n\\n### 🚨 REGLAS DE ORO\\n-   Nunca inventes URLs. Usa las que te devuelven las herramientas.\\n-   Si la herramienta Discovery o DCU requiere archivos, asume que existen. No detengas el flujo pidiendo uploads.\\n-   Mantén un tono profesional, técnico y ágil (Scrum Master).\"
        }
      },
      \"type\": \"@n8n/n8n-nodes-langchain.agent\",
      \"typeVersion\": 1.7,
      \"position\": [
        -576,
        176
      ],
      \"id\": \"aca1a3e5-497d-40b1-b217-077011d44db3\",
      \"name\": \"Agente Supervisor\"
    },
    {
      \"parameters\": {
        \"name\": \"tool_product_planning_initial\",
        \"description\": \"Genera Visión y Backlog. Args: idea_negocio, horizonte, presupuesto.\",
        \"workflowId\": \"ZhezxyqBaf8lyhER\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        -176,
        16
      ],
      \"id\": \"3632c7b9-5820-409a-8011-3a663e9fc51a\",
      \"name\": \"1. Product Planning\"
    },
    {
      \"parameters\": {
        \"name\": \"tool_release_planning_initial\",
        \"description\": \"Planifica Sprints. Args: fecha_inicio (YYYY-MM-DD), fecha_fin.\",
        \"workflowId\": \"JcJaYWxG3YU5E8AO\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        -32,
        16
      ],
      \"id\": \"12185ec2-40d5-4da7-895a-32e359fde4c8\",
      \"name\": \"2. Release Planning\"
    },
    {
      \"parameters\": {
        \"name\": \"tool_discovery_dcu\",
        \"description\": \"Genera Personas y Journey Map. Usa PDFs del servidor. Args: contexto, objetivo, epicas.\",
        \"workflowId\": \"CPE7Bf8xQTu5pwhk\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        112,
        16
      ],
      \"id\": \"eb7c6132-db7e-4724-8def-97cd293e27b5\",
      \"name\": \"3. Discovery DCU\"
    },
    {
      \"parameters\": {
        \"name\": \"tool_dcu_protocolo\",
        \"description\": \"Genera Protocolo de Pruebas. Usa imágenes del servidor. Args: objetivo_sprint.\",
        \"workflowId\": \"anO4tEz9NcUVNC3S\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        256,
        16
      ],
      \"id\": \"b063f4cc-7ca1-4b36-920d-027cd09fc095\",
      \"name\": \"4. DCU Protocolo\"
    },
    {
      \"parameters\": {
        \"name\": \"tool_dcu_interpretacion\",
        \"description\": \"Interpreta resultados de pruebas. Usa PDFs servidor. Args: objetivo_sprint, tipo_prueba.\",
        \"workflowId\": \"cPQHxhfVL0waZJ2L\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        384,
        16
      ],
      \"id\": \"3c4ee93b-9446-4a09-9509-eaa9a7b49894\",
      \"name\": \"5. DCU Resultados\"
    }
  ],
  \"connections\": {
    \"Chat Supervisor\": {
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
    \"Gemini Brain\": {
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
    \"Memoria Corto Plazo\": {
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
    \"1. Product Planning\": {
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
    \"2. Release Planning\": {
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
    \"3. Discovery DCU\": {
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
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

Mi 1. Product Planning tradicional comenzaba con:
{
  \"nodes\": [
    {
      \"parameters\": {
        \"url\": \"https://raw.githubusercontent.com/AnthonyAlejandroMoralesVargas/poc-n8n-tesis-Scrum/main/Ejemplo%20Product%20Planning.pdf\",
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
        1424,
        80
      ],
      \"id\": \"a1a36b6c-a332-4feb-8c61-83647b40ed55\",
      \"name\": \"Obtener ejemplo product planning1\"
    },
    {
      \"parameters\": {
        \"formTitle\": \"Contexto del producto\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldLabel\": \"Idea Inicial\",
              \"placeholder\": \"La descripción del producto.\",
              \"defaultValue\": \"Decidimos hacer un producto pequeño, de tal manera que pueda ser publicable. Entonces, esta es la propuesta: básicamente es un producto software para que los estudiantes de niveles inferiores puedan pedir tutorías a los estudiantes de niveles superiores.\\nDe acuerdo, donde se puedan ver los rankings de los estudiantes, tanto de los tutoriados como de los tutores. Ojo que estoy dando mi necesidad, no... ustedes tienen que descubrir el producto. Donde se puedan ver:\\n•\\tLos rankings\\n•\\tLas horas libres\\n•\\tLas asignaturas\\n•\\tEl expertis\\n•\\tEl cumplimiento\\n•\\tQue se les puede pagar a los tutores\\n•\\tDónde se pueden hacer estas tutorías, si son virtuales\\nSí, entonces tiene un potencial muy grande. ¿Dónde le vamos a cerrar? Básicamente en la visión, en la planificación del producto y en la planificación del release.\\nDe acuerdo, entonces es tutorías. Estábamos pensando llamarle PoliTutorías: de estudiantes para estudiantes.\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Horizonte de Planificación\",
              \"placeholder\": \"6 meses o 1 año\",
              \"defaultValue\": \"El primer release es tiene una duración de 2 meses. Con sprints de 2 semanas, trabajando solo días laborables.\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Presupuesto / Recursos\",
              \"placeholder\": \"Cantidad de personas\",
              \"defaultValue\": \"Somos un grupo conformado por 6 personas. Donde a cada uno le corresponde un componente: Scrum, DevOps, Agile Testing, Discovery, Frontend y Backed. Los responsables del desarrollo son Backend y Frontend, pero dependiendo del sprint algún otro componente puede cooperar con el desarrollo.\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Formato de Visión y Valores\",
              \"placeholder\": \"Define la plantilla para la visión (ej: Moore) y las áreas de valor permitidas\",
              \"defaultValue\": \"Seguir estrictamente la siguiente plantilla de Geoffrey Moore:\\n\\\"Para [cliente objetivo] que [problema que necesita ser resuelto], el [nombre del producto] es un [categoría de producto] que [beneficio clave/razón para comprarlo]. A diferencia de [alternativa(s) de la competencia], nuestro producto [diferencia principal].\\\"\\n\\nSelecciona las 3 áreas de valor más relevantes de la siguiente lista propuesta por el libro de Scrum Essentials:\\n1. Entry conditions (Condiciones de entrada)\\n- Achieve parity with competition\\n- Deliver minimum required features\\n- Get compliant (SOX, FDA, HIPAA)\\n2. Enablement (Habilitación)\\n- Target a new market\\n- Enable sales of other products or services\\n3. Differentiator (Diferenciador)\\n- Differentiate from competitors\\n- Delight the customer\\n4. Spoiler (Saboteador)\\n- Eliminate competitors' differentiator\\n- Raise the parity bar\\n- Redefine the game by changing market focus\\n5. Cost reducer (Reductor de costos)\\n- Shorten time to market\\n- Reduce the number of people or their time allocation\\n- Improve margins\\n- Increase expertise\",
              \"requiredField\": true
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.formTrigger\",
      \"typeVersion\": 2.3,
      \"position\": [
        1200,
        80
      ],
      \"id\": \"041a77a2-a447-4b2b-92b6-d4013d090b30\",
      \"name\": \"1. Cargar contexto del producto\",
      \"webhookId\": \"5c5bc3a8-0022-49df-8211-3b6106fcd374\"
    }
  ],
  \"connections\": {
    \"Obtener ejemplo product planning1\": {
      \"main\": [
        []
      ]
    },
    \"1. Cargar contexto del producto\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo product planning1\",
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



Ahora el agente deberia consultarle eso al usuario

```

---

### Navegación

[← Prompt 010](/04-orquestacion-productiva/010/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 012 →](/04-orquestacion-productiva/012/)
{% endraw %}
