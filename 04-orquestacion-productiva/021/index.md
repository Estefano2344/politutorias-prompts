---
layout: default
title: '021. Con eso ya responde bien y podriamos pasar al siguiente flujo: El…'
parent: Orquestación n8n productiva
nav_order: 21
permalink: /04-orquestacion-productiva/021/
---

{% raw %}

# Prompt 021
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 4,398 caracteres &middot; **Posición en la conversación:** 21 de 103

---

```
Con eso ya responde bien y podriamos pasar al siguiente flujo:

El flujo empieza con:

{
  \"nodes\": [
    {
      \"parameters\": {},
      \"id\": \"4a8e3cc7-6ccc-412c-9f77-39e9d4050b6c\",
      \"name\": \"Execute Workflow Trigger\",
      \"type\": \"n8n-nodes-base.executeWorkflowTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -2448,
        -240
      ]
    },
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -2448,
        -32
      ],
      \"id\": \"7cad9f7d-6e01-4454-b761-6cfae2fc9f1b\",
      \"name\": \"Manual Trigger\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// NODO DE CONFIGURACIÓN\\n// Define los parámetros del proyecto (Fechas, Sprints, Velocidad)\\n// Si el Agente los envía, los usa. Si no, usa los DEFAULTS de la Tesis.\\n\\nconst input = $input.first().json;\\n\\nreturn {\\n  json: {\\n    // Fechas del Release 1\\n    fecha_inicio: input.fecha_inicio || '2025-12-25',\\n    fecha_fin: input.fecha_fin || '2026-02-19',\\n    \\n    // Configuración Scrum\\n    duracion_sprint: input.duracion_sprint || '2 semanas',\\n    cantidad_sprints: input.cantidad_sprints || 4,\\n    \\n    // Velocidad del Equipo\\n    velocidad_baja: input.velocidad_baja || 31,\\n    velocidad_alta: input.velocidad_alta || 42\\n  }\\n};\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -2208,
        -144
      ],
      \"id\": \"f062c202-fcf8-4a2c-b111-1cdcbfd195fe\",
      \"name\": \"Configurar Parametros\"
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/111?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -1968,
        -144
      ],
      \"id\": \"2dafba72-cacc-4e95-b42a-ee4c76f1380a\",
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

Donde necesitamos el URL del wiki para el nodo 1. Cargar documento product planning el cual nos devuelve el anterior nodo en el json que contiene:


[
  
{
  
  
\"status\": 
\"completed\",
  
  
\"wiki_url\": 
\"https://dev.azure.com/DTIC-2025-B/30e5c828-6f0b-44b3-a7c4-2a0e9ce86680/_wiki/wikis/f6d0a203-664b-4898-bb77-aa4005c1073f?pagePath=%2FProduct-Planning-V1.0\",
  
  
\"output\": 
\"El Product Planning se generó correctamente. Puedes ver la Wiki aquí: https://dev.azure.com/DTIC-2025-B/30e5c828-6f0b-44b3-a7c4-2a0e9ce86680/_wiki/wikis/f6d0a203-664b-4898-bb77-aa4005c1073f?pagePath=%2FProduct-Planning-V1.0\"
  
}
]

de hecho eso deberia mostrarse bien pero en el chat se ve asi y no segmentado
: 

El Product Planning se generó correctamente. Puedes ver la Wiki aquí: https://dev.azure.com/DTIC-2025-B/30e5c828-6f0b-44b3-a7c4-2a0e9ce86680/_wiki/wikis/f6d0a203-664b-4898-bb77-aa4005c1073f?pagePath=%2FProduct-Planning-V1.0


Eso se guarda en su memoria a corto plazo, por lo que la siguiente tool podria coger de ahi la URL y mandarle a la siguiente tool 2. Release Plan (Initial) que es lo que necesita

```

---

### Navegación

[← Prompt 020](/04-orquestacion-productiva/020/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 022 →](/04-orquestacion-productiva/022/)
{% endraw %}
