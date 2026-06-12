---
layout: default
title: '084. Ahora la siguiente fase: { ''nodes'': [ { ''parameters'': {...'
parent: Orquestación n8n productiva
nav_order: 84
permalink: /04-orquestacion-productiva/084/
---

{% raw %}

# Prompt 084
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 12,132 caracteres &middot; **Posición en la conversación:** 84 de 103

---

```
Ahora la siguiente fase:

{
  \"nodes\": [
    {
      \"parameters\": {
        \"jsCode\": \"const data = $input.first().json;\\n\\nconst folderLink = `https://drive.google.com/drive/folders/${data.query.sp_folder_id}`;\\nconst sprintName = data.query.name;\\n\\nreturn [{\\n  json: {\\n    subject: `✅ Tareas de Implementación Generadas - ${sprintName}`,\\n    message: `\\n      <!DOCTYPE html>\\n      <html>\\n      <head>\\n        <style>\\n          body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }\\n          .container { max-width: 600px; margin: 0 auto; padding: 20px; }\\n          .header { background-color: #0D7377; color: white; padding: 20px; text-align: center; border-radius: 5px; }\\n          .content { background-color: #E8F6F3; padding: 20px; margin-top: 20px; border-radius: 5px; border: 2px solid #14A085; }\\n          .info { margin: 10px 0; }\\n          .label { font-weight: bold; color: #0B5345; }\\n          .button { display: inline-block; background-color: #148F77; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin-top: 15px; }\\n          .button:hover { background-color: #117864; }\\n          .footer { margin-top: 20px; font-size: 12px; color: #888; text-align: center; }\\n        </style>\\n      </head>\\n      <body>\\n        <div class=\\\"container\\\">\\n          <div class=\\\"header\\\">\\n            <h2>🎉 Tareas de Implementación Listas - ${sprintName}</h2>\\n          </div>\\n          \\n          <div class=\\\"content\\\">\\n            <p>Hola,</p>\\n            <p>Se ha completado exitosamente la generación de las <strong>Tareas de Implementación</strong> para las Historias de Usuario del <strong>${sprintName}</strong>.</p>\\n            \\n            <div class=\\\"info\\\">\\n              <span class=\\\"label\\\">📂 Sprint:</span> ${sprintName}\\n            </div>\\n            <div class=\\\"info\\\">\\n              <span class=\\\"label\\\">📋 Contenido:</span> Tareas granulares con estimaciones\\n            </div>\\n            <div class=\\\"info\\\">\\n              <span class=\\\"label\\\">📅 Fecha de generación:</span> ${new Date().toLocaleString('es-EC', { timeZone: 'America/Guayaquil' })}\\n            </div>\\n            <div class=\\\"info\\\">\\n              <span class=\\\"label\\\">📄 Formato:</span> Archivos Markdown (.md)\\n            </div>\\n            \\n            <p style=\\\"margin-top: 20px;\\\">Las tareas incluyen descripciones detalladas paso a paso, estimaciones de esfuerzo en horas y están listas para el Sprint Planning. Puedes revisarlas en la siguiente carpeta:</p>\\n            \\n            <a href=\\\"${folderLink}\\\" class=\\\"button\\\">📂 Ver Tareas de Implementación del ${sprintName}</a>\\n          </div>\\n          \\n          <div class=\\\"footer\\\">\\n            <p>Este correo fue generado automáticamente por el sistema de automatización.</p>\\n            <p>🤖 Powered by n8n + Gemini AI</p>\\n          </div>\\n        </div>\\n      </body>\\n      </html>\\n    `\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -3376,
        1344
      ],
      \"id\": \"80b3651b-eb08-4c31-8933-37ee17a8be2b\",
      \"name\": \"Code in JavaScript3\"
    },
    {
      \"parameters\": {
        \"sendTo\": \"anthony.morales03@epn.edu.ec\",
        \"subject\": \"={{ $json.subject }}\",
        \"message\": \"={{ $json.message }}\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.gmail\",
      \"typeVersion\": 2.2,
      \"position\": [
        -3184,
        1344
      ],
      \"id\": \"78a393db-a933-4963-ace2-b7ffe9e51f9a\",
      \"name\": \"Notificar1\",
      \"webhookId\": \"a309ee36-edba-4b4e-9d55-4549f154f6eb\"
    },
    {
      \"parameters\": {
        \"path\": \"a679699c-846f-4639-9286-76b04336af43\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.webhook\",
      \"typeVersion\": 2.1,
      \"position\": [
        -3584,
        1344
      ],
      \"id\": \"771882b4-eaaa-4763-a978-9d43f41bc51c\",
      \"name\": \"Webhook\",
      \"webhookId\": \"a679699c-846f-4639-9286-76b04336af43\",
      \"alwaysOutputData\": true
    }
  ],
  \"connections\": {
    \"Code in JavaScript3\": {
      \"main\": [
        [
          {
            \"node\": \"Notificar1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Webhook\": {
      \"main\": [
        [
          {
            \"node\": \"Code in JavaScript3\",
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

{
  \"nodes\": [
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"={{ $json.chatInput }}\",
        \"options\": {
          \"systemMessage\": \"=Entonces modifica bien al agente:\\n\\nEres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC) guiando al usuario paso a paso.\\n\\n---\\n\\n### FASE 1: PRODUCT PLANNING (ENTREVISTA)\\nPara iniciar, recolecta 3 datos. Pregunta UNO POR UNO si faltan:\\n1. **¿Falta IDEA?** -> \\\"¡Hola! ¿Qué proyecto vamos a construir hoy?\\\"\\n2. **¿Falta HORIZONTE?** -> \\\"¿Cuál es el horizonte de tiempo? (Ej: 2 meses)\\\"\\n3. **¿Falta EQUIPO?** -> \\\"¿Con qué presupuesto/equipo contamos?\\\"\\n\\n**EJECUCIÓN FASE 1:**\\nCuando tengas los 3, ejecuta `tool_product_planning_initial`.\\n\\n---\\n\\n### FASE 2: RELEASE PLANNING (TRANSICIÓN)\\nCuando termine Fase 1 y tengas la URL:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Deseas proceder con el Release Planning?\\\"*\\n2. **Entrevista:** Si acepta, pide: *\\\"Indícame fecha inicio y fin del Release 1.\\\"*\\n3. **EJECUCIÓN FASE 2:** Llama a `tool_release_planning_initial` (Usa URL de tu memoria).\\n\\n---\\n\\n### FASE 3: DISCOVERY (ENTREVISTA UX)\\nCuando termine Fase 2:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Iniciamos la fase de Discovery y Diseño UX?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos 3 textos UNO POR UNO:\\n   - **Contexto App:** \\\"Dame un contexto breve de la aplicación.\\\"\\n   - **Objetivo Sprint:** \\\"¿Cuál es el objetivo de este Sprint de diseño?\\\"\\n   - **HUs Épicas:** \\\"Lista las Historias Épicas principales para este sprint.\\\"\\n3. **EJECUCIÓN FASE 3:** Llama a `tool_discovery_inicial`.\\n\\n---\\n### FASE 4: PROTOCOLO DE PRUEBAS\\nDespués del Discovery:\\n1. **Confirma:** *\\\"¿Generamos ahora el Protocolo de Pruebas?\\\"*\\n2. **Ejecuta:** Llama a `tool_dcu_protocolo` pasando el objetivo del sprint anterior.\\n\\n---\\n### FASE 5: INTERPRETACIÓN DE RESULTADOS\\n1. **Confirma:** *\\\"¿Analizamos los resultados de las pruebas de usuario?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_dcu_interpretacion`.\\n   - `tipo_prueba`: \\\"Prueba de Usuario\\\".\\n   - `objetivo_sprint`: (El mismo de la Fase 4).\\n*(NOTA: Las transcripciones se toman del servidor automáticamente).*\\n\\n---\\n### FASE 6: REFINAMIENTO DE PRODUCTO\\n1. **Confirma:** *\\\"¿Deseas realizar el Refinamiento del Product Planning basándonos en el Discovery y el Prototipo?\\\"*\\n2. **EJECUCIÓN FASE 6:** Si el usuario dice SÍ, llama a `tool_product_planning_refinement`.\\n\\n---\\n### FASE 7: REFINAMIENTO DE RELEASE\\nDespués del Refinamiento de Producto:\\n\\n1. **Confirma:** *\\\"¿Deseas ejecutar el Refinamiento del Release Planning para ajustar los Sprints con la nueva información?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_release_planning_refinement`. \\n   *(Automático: Usa el video del prototipo y los documentos actualizados en Azure).*\\n\\n---\\n### FASE 8: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas generar el Sprint Planning detallado para el Sprint 1?\\\"*\\n2. **Entrevista Capacidad (Opcional):** *\\\"¿Hay cambios en la capacidad del equipo? (Si no, usaré la configuración estándar).\\\"*\\n3. **Ejecuta:** Si acepta, llama a `tool_sprint_planning_refinement`.\\n   *(Puedes enviar un JSON con la capacidad del equipo si el usuario la detalla, o dejarlo vacío para usar defaults).*\\n\\n\\n---\\n### FASE 9: FRONTEND - SPLIT HUs\\n1. **Confirma:** *\\\"¿Comenzamos la fase de Frontend separando las Historias de Usuario?\\\"*\\n2. **Entrevista Técnica (Solo si no tienes los datos):**\\n   - *\\\"Necesito los datos de Azure: Organización, Proyecto, Wiki ID, Page ID y Folder ID.\\\"*\\n   - *(Nota: Si el usuario dice \\\"Usa la configuración por defecto\\\", usa los valores de prueba).*\\n3. **Ejecuta:** Llama a `tool_front_1_split` pasando los 5 parámetros.\\n\\n---\\n### FASE 10: FRONTEND - MAPEAR FRAMES\\n1. **Confirma:** *\\\"¿Continuamos con el mapeo de Frames de diseño?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Necesito los IDs de Azure (Wiki/Page) y los IDs de las carpetas de Google Drive (HUs y Frames).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_2_frames`.\\n\\n---\\n### FASE 11: FRONTEND - DIAGRAMAS DE COMUNICACIÓN\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Comunicación?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames y Diagramas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_3_comm`.\\n\\n---\\n### FASE 12: FRONTEND - DIAGRAMAS DE SECUENCIA\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Secuencia?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames, Comunicación y Secuencia.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_4_seq`.\\n\\n---\\n### FASE 13: FRONTEND - ENDPOINTS\\n1. **Confirma:** *\\\"¿Generamos la documentación de Endpoints?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Comunicación, Secuencia y Endpoints.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_5_endp`.\\n\\n---\\n### FASE 14: FRONTEND - TAREAS DE DESARROLLO\\n1. **Confirma:** *\\\"¿Generamos las tareas de implementación detalladas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las 5 carpetas (HUs, CD, SD, Endpoints, Tasks).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_6_tasks`.\\n\\n\\n---\\n\\n### REGLAS GENERALES\\n- Siempre muestra los links de Azure que te devuelven las herramientas.\\n- Si una herramienta falla, pide al usuario intentar de nuevo o cambiar datos.\\n- Mantén un tono profesional y ágil.\\n- No muestres ninguna URL si es que antes no se ejecuto una herramienta\"
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
    }
  ],
  \"connections\": {
    \"15. Front: Notificar\": {
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

[← Prompt 083](/04-orquestacion-productiva/083/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 085 →](/04-orquestacion-productiva/085/)
{% endraw %}
