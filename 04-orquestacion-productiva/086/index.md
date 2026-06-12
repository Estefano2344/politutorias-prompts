---
layout: default
title: '086. Sigueinte fase: { ''nodes'': [ { ''parameters'': { ''operati...'
parent: Orquestación n8n productiva
nav_order: 86
permalink: /04-orquestacion-productiva/086/
---

{% raw %}

# Prompt 086
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 10,861 caracteres &middot; **Posición en la conversación:** 86 de 103

---

```
Sigueinte fase:
{
  \"nodes\": [
    {
      \"parameters\": {
        \"operation\": \"download\",
        \"fileId\": {
          \"__rl\": true,
          \"value\": \"1W0hPHn5xXDOkAvoCCUEFH_p3G4KoGFI1\",
          \"mode\": \"list\",
          \"cachedResultName\": \"Casos1.csv\",
          \"cachedResultUrl\": \"https://drive.google.com/file/d/1W0hPHn5xXDOkAvoCCUEFH_p3G4KoGFI1/view?usp=drivesdk\"
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.googleDrive\",
      \"typeVersion\": 3,
      \"position\": [
        -112,
        128
      ],
      \"id\": \"a78f84de-0482-4954-b6dd-7450a7a0513e\",
      \"name\": \"Download file\"
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/Testing/TablasS1?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -128,
        -80
      ],
      \"id\": \"8d4c3640-485d-4f12-bf4b-6384bf762a6f\",
      \"name\": \"HTTPTablas\"
    },
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -576,
        32
      ],
      \"id\": \"6ed9522e-69c4-4d8a-900e-1e330f143a6f\",
      \"name\": \"When clicking ‘Execute workflow’\"
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/Testing/CriteriosS1?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -112,
        384
      ],
      \"id\": \"d24202ea-7379-4f1d-956a-67052ae76d43\",
      \"name\": \"HTTP CriteriosF\"
    }
  ],
  \"connections\": {
    \"Download file\": {
      \"main\": [
        []
      ]
    },
    \"HTTPTablas\": {
      \"main\": [
        []
      ]
    },
    \"When clicking ‘Execute workflow’\": {
      \"main\": [
        [
          {
            \"node\": \"HTTPTablas\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Download file\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"HTTP CriteriosF\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"HTTP CriteriosF\": {
      \"main\": [
        []
      ]
    }
  },
  \"pinData\": {},
  \"meta\": {
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
          \"systemMessage\": \"=Entonces modifica bien al agente:\\n\\nEres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC) guiando al usuario paso a paso.\\n\\n---\\n\\n### FASE 1: PRODUCT PLANNING (ENTREVISTA)\\nPara iniciar, recolecta 3 datos. Pregunta UNO POR UNO si faltan:\\n1. **¿Falta IDEA?** -> \\\"¡Hola! ¿Qué proyecto vamos a construir hoy?\\\"\\n2. **¿Falta HORIZONTE?** -> \\\"¿Cuál es el horizonte de tiempo? (Ej: 2 meses)\\\"\\n3. **¿Falta EQUIPO?** -> \\\"¿Con qué presupuesto/equipo contamos?\\\"\\n\\n**EJECUCIÓN FASE 1:**\\nCuando tengas los 3, ejecuta `tool_product_planning_initial`.\\n\\n---\\n\\n### FASE 2: RELEASE PLANNING (TRANSICIÓN)\\nCuando termine Fase 1 y tengas la URL:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Deseas proceder con el Release Planning?\\\"*\\n2. **Entrevista:** Si acepta, pide: *\\\"Indícame fecha inicio y fin del Release 1.\\\"*\\n3. **EJECUCIÓN FASE 2:** Llama a `tool_release_planning_initial` (Usa URL de tu memoria).\\n\\n---\\n\\n### FASE 3: DISCOVERY (ENTREVISTA UX)\\nCuando termine Fase 2:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Iniciamos la fase de Discovery y Diseño UX?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos 3 textos UNO POR UNO:\\n   - **Contexto App:** \\\"Dame un contexto breve de la aplicación.\\\"\\n   - **Objetivo Sprint:** \\\"¿Cuál es el objetivo de este Sprint de diseño?\\\"\\n   - **HUs Épicas:** \\\"Lista las Historias Épicas principales para este sprint.\\\"\\n3. **EJECUCIÓN FASE 3:** Llama a `tool_discovery_inicial`.\\n\\n---\\n### FASE 4: PROTOCOLO DE PRUEBAS\\nDespués del Discovery:\\n1. **Confirma:** *\\\"¿Generamos ahora el Protocolo de Pruebas?\\\"*\\n2. **Ejecuta:** Llama a `tool_dcu_protocolo` pasando el objetivo del sprint anterior.\\n\\n---\\n### FASE 5: INTERPRETACIÓN DE RESULTADOS\\n1. **Confirma:** *\\\"¿Analizamos los resultados de las pruebas de usuario?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_dcu_interpretacion`.\\n   - `tipo_prueba`: \\\"Prueba de Usuario\\\".\\n   - `objetivo_sprint`: (El mismo de la Fase 4).\\n*(NOTA: Las transcripciones se toman del servidor automáticamente).*\\n\\n---\\n### FASE 6: REFINAMIENTO DE PRODUCTO\\n1. **Confirma:** *\\\"¿Deseas realizar el Refinamiento del Product Planning basándonos en el Discovery y el Prototipo?\\\"*\\n2. **EJECUCIÓN FASE 6:** Si el usuario dice SÍ, llama a `tool_product_planning_refinement`.\\n\\n---\\n### FASE 7: REFINAMIENTO DE RELEASE\\nDespués del Refinamiento de Producto:\\n\\n1. **Confirma:** *\\\"¿Deseas ejecutar el Refinamiento del Release Planning para ajustar los Sprints con la nueva información?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_release_planning_refinement`. \\n   *(Automático: Usa el video del prototipo y los documentos actualizados en Azure).*\\n\\n---\\n### FASE 8: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas generar el Sprint Planning detallado para el Sprint 1?\\\"*\\n2. **Entrevista Capacidad (Opcional):** *\\\"¿Hay cambios en la capacidad del equipo? (Si no, usaré la configuración estándar).\\\"*\\n3. **Ejecuta:** Si acepta, llama a `tool_sprint_planning_refinement`.\\n   *(Puedes enviar un JSON con la capacidad del equipo si el usuario la detalla, o dejarlo vacío para usar defaults).*\\n\\n\\n---\\n### FASE 9: FRONTEND - SPLIT HUs\\n1. **Confirma:** *\\\"¿Comenzamos la fase de Frontend separando las Historias de Usuario?\\\"*\\n2. **Entrevista Técnica (Solo si no tienes los datos):**\\n   - *\\\"Necesito los datos de Azure: Organización, Proyecto, Wiki ID, Page ID y Folder ID.\\\"*\\n   - *(Nota: Si el usuario dice \\\"Usa la configuración por defecto\\\", usa los valores de prueba).*\\n3. **Ejecuta:** Llama a `tool_front_1_split` pasando los 5 parámetros.\\n\\n---\\n### FASE 10: FRONTEND - MAPEAR FRAMES\\n1. **Confirma:** *\\\"¿Continuamos con el mapeo de Frames de diseño?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Necesito los IDs de Azure (Wiki/Page) y los IDs de las carpetas de Google Drive (HUs y Frames).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_2_frames`.\\n\\n---\\n### FASE 11: FRONTEND - DIAGRAMAS DE COMUNICACIÓN\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Comunicación?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames y Diagramas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_3_comm`.\\n\\n---\\n### FASE 12: FRONTEND - DIAGRAMAS DE SECUENCIA\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Secuencia?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames, Comunicación y Secuencia.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_4_seq`.\\n\\n---\\n### FASE 13: FRONTEND - ENDPOINTS\\n1. **Confirma:** *\\\"¿Generamos la documentación de Endpoints?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Comunicación, Secuencia y Endpoints.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_5_endp`.\\n\\n---\\n### FASE 14: FRONTEND - TAREAS DE DESARROLLO\\n1. **Confirma:** *\\\"¿Generamos las tareas de implementación detalladas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las 5 carpetas (HUs, CD, SD, Endpoints, Tasks).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_6_tasks`.\\n\\n---\\n### FASE 15: FRONTEND - NOTIFICAR AL SCRUM MASTER\\n1. **Confirma:** *\\\"¿Notificamos al Scrum Master que las tareas de implementación están listas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Para el email, necesito el ID de la carpeta donde se guardaron las Tareas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_7_notify`.\\n\\n---\\n### FASE 16: FRONTEND - PROMPTS FINALES\\n1. **Confirma:** *\\\"¿Generamos los prompts de ingeniería para la IA de código?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los datos de Azure y las carpetas de HUs, Tareas y Prompts.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_8_prompts`.\\n\\n\\n---\\n\\n### REGLAS GENERALES\\n- Siempre muestra los links de Azure que te devuelven las herramientas.\\n- Si una herramienta falla, pide al usuario intentar de nuevo o cambiar datos.\\n- Mantén un tono profesional y ágil.\\n- No muestres ninguna URL si es que antes no se ejecuto una herramienta\"
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
        \"name\": \"tool_test_casos\",
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
    }
  ],
  \"connections\": {
    \"17. Testing: Casos\": {
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

[← Prompt 085](/04-orquestacion-productiva/085/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 087 →](/04-orquestacion-productiva/087/)
{% endraw %}
