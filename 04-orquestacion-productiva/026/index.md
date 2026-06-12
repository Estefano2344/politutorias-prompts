---
layout: default
title: '026. Pero no quiero que deje de entrevistar como lo hace ahora, recuer…'
parent: Orquestación n8n productiva
nav_order: 26
permalink: /04-orquestacion-productiva/026/
---

{% raw %}

# Prompt 026
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 2,753 caracteres &middot; **Posición en la conversación:** 26 de 103

---

```
Pero no quiero que deje de entrevistar como lo hace ahora, recuerda que si no te lo pido no cambias todo solo lo puntual siempre como equipo de expertos debemos ser quirujicos y prevalecer lo que ya funciona:

{
  \"nodes\": [
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
    }
  ],
  \"connections\": {},
  \"pinData\": {},
  \"meta\": {
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

```

---

### Navegación

[← Prompt 025](/04-orquestacion-productiva/025/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 027 →](/04-orquestacion-productiva/027/)
{% endraw %}
