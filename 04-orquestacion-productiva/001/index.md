---
layout: default
title: '001. Debes trabajar como un estudiante experto en promp enginerring, d…'
parent: Orquestación n8n productiva
nav_order: 1
permalink: /04-orquestacion-productiva/001/
---

{% raw %}

# Prompt 001
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 9,225 caracteres &middot; **Posición en la conversación:** 1 de 103

---

```
Debes trabajar como un estudiante experto en promp enginerring, devops y orquestacion de agentes

Contexto: Es una Tesis de un grupo de 6 personas donde cada uno tiene un componente, Discovery, DevOps, Scrum, Testing, Front, Back. El titulo de la tesis es Low-Code con IA Generativa: Acelerando el Desarrollo Ágil de Software. Tu al igual que yo vas a ser el componente devops y debes proponer e implementar paso a paso lo que esta en el PDF de Video Final,
Entradas: Repositorio con los flujos de n8n, PDF de revision del tutor de tesis, una planificacion base
Salida: Una planificacion para esta hacer funcional la orquestacion con el paso a paso para implementar correctamente todos los flujos

https://github.com/Estefano2344/Tesis_Orquestador/tree/5feb94ed7fc14eeddc9df8d340daecfa3435b824/Actualizados

Tenia estas ideas:
Perfecto. Aquí va TODO lo necesario, limpio y coherente, para que tengas AutomationFlow v1.0 completo, funcional y defendible.
Voy a darte exactamente 3 JSON, ni más ni menos (esto es arquitectura, no caos).

🧩 AUTOMATIONFLOW v1.0 — COMPONENTES
1️⃣ WF-01 — Supervisor (Planner Cognitivo)

👉 Decide QUÉ PASO SIGUE
👉 NO ejecuta workflows
👉 SOLO devuelve JSON { step }

2️⃣ WF-02 — Orchestrator Central

👉 Ejecuta workflows por orden
👉 Controla transición de fases
👉 Es el “motor” tipo GitFlow

3️⃣ WF-03 — Plantilla de Workflow Hijo

👉 Todos tus flujos deben terminar así
👉 Devuelve estado estándar

1️⃣ WF-01 — SUPERVISOR (PLANNER PURO)

📌 Nombre sugerido

code
Code
download
content_copy
expand_less
AF_v1_01_Supervisor_Planner

📌 Rol

Analiza conversación

Decide el siguiente step

Llama al Orchestrator

✅ JSON — Supervisor Planner (IMPORTABLE)
code
JSON
download
content_copy
expand_less
{
  \"nodes\": [
    {
      \"id\": \"chat-trigger\",
      \"name\": \"Chat Input\",
      \"type\": \"@n8n/n8n-nodes-langchain.chatTrigger\",
      \"typeVersion\": 1,
      \"position\": [-600, 200],
      \"parameters\": {}
    },
    {
      \"id\": \"llm\",
      \"name\": \"LLM\",
      \"type\": \"@n8n/n8n-nodes-langchain.lmChatGoogleGemini\",
      \"typeVersion\": 1,
      \"position\": [-400, 200],
      \"parameters\": {
        \"modelName\": \"models/gemini-2.0-flash\",
        \"options\": { \"temperature\": 0.2 }
      },
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"YOUR_CREDENTIAL_ID\",
          \"name\": \"Gemini\"
        }
      }
    },
    {
      \"id\": \"planner\",
      \"name\": \"Planner Agent\",
      \"type\": \"@n8n/n8n-nodes-langchain.agent\",
      \"typeVersion\": 1,
      \"position\": [-200, 200],
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"={{ $json.chatInput }}\",
        \"options\": {
          \"systemMessage\": \"Eres el Supervisor de AutomationFlow v1.0.\\n\\nTu ÚNICA tarea es decidir el NÚMERO DEL PASO siguiente (1 al 16).\\n\\nReglas estrictas:\\n- No ejecutes herramientas.\\n- No expliques.\\n- No repitas pasos anteriores.\\n- El flujo es secuencial.\\n\\nDevuelve SOLO este JSON:\\n{\\n  \\\"project_id\\\": \\\"tesis-001\\\",\\n  \\\"step\\\": <numero>\\n}\"
        }
      }
    },
    {
      \"id\": \"call-orchestrator\",
      \"name\": \"Call Orchestrator\",
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 2,
      \"position\": [40, 200],
      \"parameters\": {
        \"method\": \"POST\",
        \"url\": \"http://localhost:5678/webhook/automationflow/execute\",
        \"jsonParameters\": true,
        \"bodyParametersJson\": \"={{ $json }}\"
      }
    }
  ],
  \"connections\": {
    \"Chat Input\": {
      \"main\": [[{ \"node\": \"Planner Agent\", \"type\": \"main\", \"index\": 0 }]]
    },
    \"LLM\": {
      \"ai_languageModel\": [[{ \"node\": \"Planner Agent\", \"type\": \"ai_languageModel\", \"index\": 0 }]]
    },
    \"Planner Agent\": {
      \"main\": [[{ \"node\": \"Call Orchestrator\", \"type\": \"main\", \"index\": 0 }]]
    }
  }
}
2️⃣ WF-02 — ORCHESTRATOR CENTRAL (CORE)

📌 Nombre

code
Code
download
content_copy
expand_less
AF_v1_02_Orchestrator_Core

📌 Rol

Ejecuta workflows

Controla orden

Nunca “piensa”

✅ JSON — Orchestrator Central
code
JSON
download
content_copy
expand_less
{
  \"nodes\": [
    {
      \"id\": \"webhook\",
      \"name\": \"Execute Step\",
      \"type\": \"n8n-nodes-base.webhook\",
      \"typeVersion\": 1,
      \"position\": [-600, 200],
      \"parameters\": {
        \"httpMethod\": \"POST\",
        \"path\": \"automationflow/execute\",
        \"responseMode\": \"lastNode\"
      }
    },
    {
      \"id\": \"switch\",
      \"name\": \"Switch Step\",
      \"type\": \"n8n-nodes-base.switch\",
      \"typeVersion\": 2,
      \"position\": [-400, 200],
      \"parameters\": {
        \"value1\": \"={{ $json.step }}\",
        \"rules\": [
          { \"operation\": \"equal\", \"value2\": 1 },
          { \"operation\": \"equal\", \"value2\": 2 },
          { \"operation\": \"equal\", \"value2\": 3 },
          { \"operation\": \"equal\", \"value2\": 4 },
          { \"operation\": \"equal\", \"value2\": 5 },
          { \"operation\": \"equal\", \"value2\": 6 },
          { \"operation\": \"equal\", \"value2\": 7 },
          { \"operation\": \"equal\", \"value2\": 8 },
          { \"operation\": \"equal\", \"value2\": 9 },
          { \"operation\": \"equal\", \"value2\": 10 },
          { \"operation\": \"equal\", \"value2\": 11 },
          { \"operation\": \"equal\", \"value2\": 12 },
          { \"operation\": \"equal\", \"value2\": 13 },
          { \"operation\": \"equal\", \"value2\": 14 },
          { \"operation\": \"equal\", \"value2\": 15 },
          { \"operation\": \"equal\", \"value2\": 16 }
        ]
      }
    },

    {
      \"id\": \"step-1\",
      \"name\": \"1. Product Planning Initial\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [-100, -400],
      \"parameters\": { \"workflowId\": \"ZhezxyqBaf8lyhER\" }
    },
    {
      \"id\": \"step-2\",
      \"name\": \"2. Release Planning Initial\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [-100, -340],
      \"parameters\": { \"workflowId\": \"JcJaYWxG3YU5E8AO\" }
    },
    {
      \"id\": \"step-3\",
      \"name\": \"3. Discovery\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [-100, -280],
      \"parameters\": { \"workflowId\": \"CPE7Bf8xQTu5pwhk\" }
    },
    {
      \"id\": \"step-4\",
      \"name\": \"4. DCU Protocolo\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [-100, -220],
      \"parameters\": { \"workflowId\": \"anO4tEz9NcUVNC3S\" }
    },
    {
      \"id\": \"step-5\",
      \"name\": \"5. DCU Interpretación\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [-100, -160],
      \"parameters\": { \"workflowId\": \"cPQHxhfVL0waZJ2L\" }
    },

    {
      \"id\": \"step-6\",
      \"name\": \"6. Product Planning Final\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [200, -100],
      \"parameters\": { \"workflowId\": \"Bs9hgdz11lF2zFJ3\" }
    },
    {
      \"id\": \"step-7\",
      \"name\": \"7. Release Planning Final\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [200, -40],
      \"parameters\": { \"workflowId\": \"BV4FTwoDezhLiCbK\" }
    },
    {
      \"id\": \"step-8\",
      \"name\": \"8. Sprint Planning\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [200, 20],
      \"parameters\": { \"workflowId\": \"L4QphkDkDvBPmu2L\" }
    },

    {
      \"id\": \"step-9\",
      \"name\": \"9. Front Split HUs\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [500, -200],
      \"parameters\": { \"workflowId\": \"gEBtGN5LxDieFeN1\" }
    },
    {
      \"id\": \"step-16\",
      \"name\": \"16. Front Prompts\",
      \"type\": \"n8n-nodes-base.executeWorkflow\",
      \"position\": [500, 160],
      \"parameters\": { \"workflowId\": \"NYJdAk8cSmuevJzK\" }
    }
  ],
  \"connections\": {
    \"Execute Step\": {
      \"main\": [[{ \"node\": \"Switch Step\", \"type\": \"main\", \"index\": 0 }]]
    }
  }
}

(Puedes completar steps 10–15 igual, ya sabes el patrón)

3️⃣ WF-03 — PLANTILLA DE WORKFLOW HIJO

📌 OBLIGATORIO en TODOS tus flujos

Al FINAL de cada workflow (Product Plan, DCU, Front, etc.) agrega:

✅ JSON — Nodo final estándar
code
JSON
download
content_copy
expand_less
{
  \"nodes\": [
    {
      \"id\": \"final-response\",
      \"name\": \"AutomationFlow Response\",
      \"type\": \"n8n-nodes-base.set\",
      \"position\": [800, 300],
      \"parameters\": {
        \"values\": {
          \"string\": [
            { \"name\": \"status\", \"value\": \"completed\" }
          ],
          \"number\": [
            { \"name\": \"current_step\", \"value\": 3 },
            { \"name\": \"next_step\", \"value\": 4 }
          ]
        }
      }
    }
  ]
}

📌 Ajusta current_step y next_step según el workflow.

🏁 RESULTADO FINAL

Con estos 3 JSON tienes:

✅ Planner cognitivo
✅ Orquestador determinista
✅ SDLC automatizado
✅ Separación de responsabilidades
✅ Arquitectura defendible como AutomationFlow v1.0

Esto ya es nivel tesis seria, no demo.
```

---

### Navegación

[Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 002 →](/04-orquestacion-productiva/002/)
{% endraw %}
