---
layout: default
title: '077. Tengo un inconveniente porque el anterior flujo antes del workflo…'
parent: Orquestación n8n productiva
nav_order: 77
permalink: /04-orquestacion-productiva/077/
---

{% raw %}

# Prompt 077
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 15,899 caracteres &middot; **Posición en la conversación:** 77 de 103

---

```
Tengo un inconveniente porque el anterior flujo antes del workflow trigger era asi:

{
  \"nodes\": [
    {
      \"parameters\": {
        \"formTitle\": \"Dividir Historias de Usuario\",
        \"formDescription\": \"Este formulario divide las HUs del sprint Planning y almacena la información en documentos individuales de Google Drive\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldName\": \"org_name\",
              \"fieldLabel\": \"Organización Azure\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"project_name\",
              \"fieldLabel\": \"Proyecto Azure\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"wiki_id\",
              \"fieldLabel\": \"Wiki ID\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"page_id\",
              \"fieldLabel\": \"Page ID\",
              \"requiredField\": true
            },
            {
              \"fieldName\": \"hus_folder_id\",
              \"fieldLabel\": \"HUs Folder ID\",
              \"requiredField\": true
            }
          ]
        },
        \"options\": {
          \"buttonLabel\": \"Obtener HUs\"
        }
      },
      \"type\": \"n8n-nodes-base.formTrigger\",
      \"typeVersion\": 2.4,
      \"position\": [
        -832,
        176
      ],
      \"id\": \"e348f6e9-6e0e-4b33-8aea-67ffe682d977\",
      \"name\": \"Configurar Sprint Planning\",
      \"webhookId\": \"5f8527d5-25c8-4829-ae3c-13432b0663c8\",
      \"alwaysOutputData\": true
    },
    {
      \"parameters\": {
        \"url\": \"=https://dev.azure.com/{{ $json.org_name }}/{{ $json.project_name }}/_apis/wiki/wikis/{{ $json.wiki_id }}/pages/{{ $json.page_id }}\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendQuery\": true,
        \"queryParameters\": {
          \"parameters\": [
            {
              \"name\": \"includeContent\",
              \"value\": \"true\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -624,
        240
      ],
      \"id\": \"4e89ac8b-1cd9-4455-9317-6fd1f0a18b9f\",
      \"name\": \"Consultar Sprint Planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"qBkwKR5D0HKCXumO\",
          \"name\": \"Azure DevOps\"
        }
      }
    }
  ],
  \"connections\": {
    \"Configurar Sprint Planning\": {
      \"main\": [
        [
          {
            \"node\": \"Consultar Sprint Planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Consultar Sprint Planning\": {
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

Ahora eso debe preguntar el agente y mandarle:
{
  \"nodes\": [
    {
      \"parameters\": {
        \"jsCode\": \"const data = $input.first().json;\\nconst path = data.path;\\nconst content = data.content;\\n\\n// Extraer el último elemento del path\\nconst folderName = path.split('/').pop().replace(/%2D/g, '-');\\n\\n// Función para limpiar y normalizar texto\\nfunction normalize(text) {\\n  if (!text) return '';\\n  return text\\n    .replace(/\\\\*\\\\*/g, '') // Eliminar negritas\\n    .replace(/\\\\s+/g, ' ') // Normalizar espacios\\n    .trim();\\n}\\n\\n// Intentar múltiples patrones de HU\\nconst huPatterns = [\\n  // Patrón 1: \\\"### Nro. HU01 Título: XXX\\\"\\n  /###\\\\s*Nro\\\\.?\\\\s*(HU\\\\d+)\\\\s*[-–—]?\\\\s*Título:\\\\s*(.+?)\\\\n/gi,\\n  // Patrón 2: \\\"### HU01 - Título: XXX\\\"\\n  /###\\\\s*(HU\\\\d+)\\\\s*[-–—]\\\\s*Título:\\\\s*(.+?)\\\\n/gi,\\n  // Patrón 3: \\\"### HU01: XXX\\\"\\n  /###\\\\s*(HU\\\\d+):\\\\s*(.+?)\\\\n/gi,\\n  // Patrón 4: \\\"### Nro HU01 XXX\\\" (sin \\\"Título:\\\")\\n  /###\\\\s*Nro\\\\.?\\\\s*(HU\\\\d+)\\\\s+(.+?)\\\\n/gi\\n];\\n\\nconst historias = [];\\n\\n// Intentar cada patrón hasta encontrar matches\\nfor (const pattern of huPatterns) {\\n  const matches = [...content.matchAll(pattern)];\\n  \\n  if (matches.length > 0) {\\n    console.log(`✓ Patrón encontrado: ${matches.length} HUs detectadas`);\\n    \\n    matches.forEach((match, index) => {\\n      const huNumber = match[1].toUpperCase();\\n      const huTitle = normalize(match[2]);\\n      \\n      // Calcular inicio y fin del contenido de esta HU\\n      const huStart = match.index + match[0].length;\\n      const nextMatch = matches[index + 1];\\n      const huEnd = nextMatch ? nextMatch.index : content.indexOf('## Resumen del Sprint', huStart);\\n      const huContent = content.substring(huStart, huEnd > 0 ? huEnd : content.length);\\n      \\n      // Extraer estimación con múltiples variantes\\n      let estimacion = 'N/A';\\n      const estimacionPatterns = [\\n        /\\\\|\\\\s*\\\\*\\\\*Estimación\\\\*\\\\*\\\\s*\\\\|\\\\s*(.+?)\\\\s*\\\\|/i,\\n        /Estimación:\\\\s*(.+?)(?:\\\\n|$)/i,\\n        /\\\\*\\\\*Estimación[:\\\\s]*\\\\*\\\\*\\\\s*(.+?)(?:\\\\n|$)/i\\n      ];\\n      \\n      for (const ep of estimacionPatterns) {\\n        const em = huContent.match(ep);\\n        if (em) {\\n          estimacion = normalize(em[1]);\\n          break;\\n        }\\n      }\\n      \\n      // Extraer historia de usuario con múltiples variantes\\n      let historia = 'N/A';\\n      const historiaPatterns = [\\n        /\\\\|\\\\s*\\\\*\\\\*Historia de Usuario\\\\*\\\\*\\\\s*\\\\|\\\\s*(.+?)\\\\s*\\\\|/i,\\n        /Historia de Usuario:\\\\s*(.+?)(?:\\\\n|$)/i,\\n        /\\\\*\\\\*Historia de Usuario[:\\\\s]*\\\\*\\\\*\\\\s*(.+?)(?:\\\\n\\\\n|$)/i,\\n        /Como\\\\s+.+?,\\\\s*quiero\\\\s+.+?,\\\\s*para\\\\s+.+?\\\\./i\\n      ];\\n      \\n      for (const hp of historiaPatterns) {\\n        const hm = huContent.match(hp);\\n        if (hm) {\\n          historia = normalize(hm[1] || hm[0]);\\n          break;\\n        }\\n      }\\n      \\n      // Extraer criterios de aceptación con búsqueda flexible\\n      let criterios = 'No hay criterios de aceptación definidos.';\\n      const criteriosPatterns = [\\n        // Patrón 1: Con encabezado \\\"#### Criterios de aceptación\\\"\\n        /####\\\\s*Criterios de [Aa]ceptación.*?\\\\n\\\\n([\\\\s\\\\S]*?)(?=\\\\n---|\\\\n\\\\*\\\\*Tareas|\\\\n###|$)/i,\\n        // Patrón 2: Con \\\"## Criterios\\\"\\n        /##\\\\s*Criterios.*?\\\\n\\\\n([\\\\s\\\\S]*?)(?=\\\\n---|\\\\n\\\\*\\\\*Tareas|\\\\n##|$)/i,\\n        // Patrón 3: Directamente tabla con \\\"Escenario\\\"\\n        /(\\\\|\\\\s*\\\\*\\\\*Escenario\\\\*\\\\*[\\\\s\\\\S]*?)(?=\\\\n---|\\\\n\\\\*\\\\*Tareas|\\\\n###|$)/i\\n      ];\\n      \\n      for (const cp of criteriosPatterns) {\\n        const cm = huContent.match(cp);\\n        if (cm) {\\n          criterios = cm[1].trim();\\n          break;\\n        }\\n      }\\n      \\n      // Crear contenido Markdown\\n      const infoMd = `# ${huNumber} - ${huTitle}\\n\\n## Información de la Historia de Usuario\\n\\n| **Sección** | **Descripción** |\\n| :--- | :--- |\\n| **Estimación** | ${estimacion} |\\n| **Historia de Usuario** | ${historia} |\\n`;\\n\\n      const criteriosMd = `# ${huNumber} - Criterios de Aceptación\\n\\n${criterios}\\n`;\\n      \\n      historias.push({\\n        numero: huNumber,\\n        titulo: huTitle,\\n        estimacion: estimacion,\\n        historia: historia,\\n        info_md: infoMd,\\n        criterios_md: criteriosMd,\\n        filename_info: `${huNumber}_Info.md`,\\n        filename_criterios: `${huNumber}_Criterios.md`\\n      });\\n    });\\n    \\n    break; // Si encontró matches, no probar más patrones\\n  }\\n}\\n\\n// Validación final\\nif (historias.length === 0) {\\n  console.error('⚠️ No se encontraron Historias de Usuario con ningún patrón');\\n  console.log('Primeros 1000 caracteres del contenido:');\\n  console.log(content.substring(0, 1000));\\n}\\n\\n// Retornar resultado\\nreturn [{\\n  json: {\\n    folder_name: folderName,\\n    total_historias: historias.length,\\n    historias: historias,\\n    debug: {\\n      path_original: path,\\n      content_length: content.length,\\n      patterns_tested: huPatterns.length\\n    }\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -496,
        304
      ],
      \"id\": \"607fa34b-abb2-445f-9ef4-21ea5330edb7\",
      \"name\": \"Identificar HUs\"
    },
    {
      \"parameters\": {
        \"url\": \"=https://dev.azure.com/{{ $json.org_name }}/{{ $json.project_name }}/_apis/wiki/wikis/{{ $json.wiki_id }}/pages/{{ $json.page_id }}\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendQuery\": true,
        \"queryParameters\": {
          \"parameters\": [
            {
              \"name\": \"includeContent\",
              \"value\": \"true\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        -704,
        368
      ],
      \"id\": \"a333a89c-3112-4b74-a088-44525d168a58\",
      \"name\": \"Consultar Sprint Planning\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"qBkwKR5D0HKCXumO\",
          \"name\": \"Azure DevOps\"
        }
      }
    },
    {
      \"parameters\": {},
      \"id\": \"c4100b41-c8d8-4ea2-86f7-714e9254761a\",
      \"name\": \"Execute Workflow Trigger\",
      \"type\": \"n8n-nodes-base.executeWorkflowTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        -992,
        208
      ]
    }
  ],
  \"connections\": {
    \"Identificar HUs\": {
      \"main\": [
        []
      ]
    },
    \"Consultar Sprint Planning\": {
      \"main\": [
        [
          {
            \"node\": \"Identificar HUs\",
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
            \"node\": \"Consultar Sprint Planning\",
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

Asi que debemos modificar eso
{
  \"nodes\": [
    {
      \"parameters\": {
        \"promptType\": \"define\",
        \"text\": \"={{ $json.chatInput }}\",
        \"options\": {
          \"systemMessage\": \"=Entonces modifica bien al agente:\\n\\nEres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC) guiando al usuario paso a paso.\\n\\n---\\n\\n### FASE 1: PRODUCT PLANNING (ENTREVISTA)\\nPara iniciar, recolecta 3 datos. Pregunta UNO POR UNO si faltan:\\n1. **¿Falta IDEA?** -> \\\"¡Hola! ¿Qué proyecto vamos a construir hoy?\\\"\\n2. **¿Falta HORIZONTE?** -> \\\"¿Cuál es el horizonte de tiempo? (Ej: 2 meses)\\\"\\n3. **¿Falta EQUIPO?** -> \\\"¿Con qué presupuesto/equipo contamos?\\\"\\n\\n**EJECUCIÓN FASE 1:**\\nCuando tengas los 3, ejecuta `tool_product_planning_initial`.\\n\\n---\\n\\n### FASE 2: RELEASE PLANNING (TRANSICIÓN)\\nCuando termine Fase 1 y tengas la URL:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Deseas proceder con el Release Planning?\\\"*\\n2. **Entrevista:** Si acepta, pide: *\\\"Indícame fecha inicio y fin del Release 1.\\\"*\\n3. **EJECUCIÓN FASE 2:** Llama a `tool_release_planning_initial` (Usa URL de tu memoria).\\n\\n---\\n\\n### FASE 3: DISCOVERY (ENTREVISTA UX)\\nCuando termine Fase 2:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Iniciamos la fase de Discovery y Diseño UX?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos 3 textos UNO POR UNO:\\n   - **Contexto App:** \\\"Dame un contexto breve de la aplicación.\\\"\\n   - **Objetivo Sprint:** \\\"¿Cuál es el objetivo de este Sprint de diseño?\\\"\\n   - **HUs Épicas:** \\\"Lista las Historias Épicas principales para este sprint.\\\"\\n3. **EJECUCIÓN FASE 3:** Llama a `tool_discovery_inicial`.\\n\\n---\\n### FASE 4: PROTOCOLO DE PRUEBAS\\nDespués del Discovery:\\n1. **Confirma:** *\\\"¿Generamos ahora el Protocolo de Pruebas?\\\"*\\n2. **Ejecuta:** Llama a `tool_dcu_protocolo` pasando el objetivo del sprint anterior.\\n\\n---\\n### FASE 5: INTERPRETACIÓN DE RESULTADOS\\n1. **Confirma:** *\\\"¿Analizamos los resultados de las pruebas de usuario?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_dcu_interpretacion`.\\n   - `tipo_prueba`: \\\"Prueba de Usuario\\\".\\n   - `objetivo_sprint`: (El mismo de la Fase 4).\\n*(NOTA: Las transcripciones se toman del servidor automáticamente).*\\n\\n---\\n### FASE 6: REFINAMIENTO DE PRODUCTO\\n1. **Confirma:** *\\\"¿Deseas realizar el Refinamiento del Product Planning basándonos en el Discovery y el Prototipo?\\\"*\\n2. **EJECUCIÓN FASE 6:** Si el usuario dice SÍ, llama a `tool_product_planning_refinement`.\\n\\n---\\n### FASE 7: REFINAMIENTO DE RELEASE\\nDespués del Refinamiento de Producto:\\n\\n1. **Confirma:** *\\\"¿Deseas ejecutar el Refinamiento del Release Planning para ajustar los Sprints con la nueva información?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_release_planning_refinement`. \\n   *(Automático: Usa el video del prototipo y los documentos actualizados en Azure).*\\n\\n---\\n### FASE 8: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas generar el Sprint Planning detallado para el Sprint 1?\\\"*\\n2. **Entrevista Capacidad (Opcional):** *\\\"¿Hay cambios en la capacidad del equipo? (Si no, usaré la configuración estándar).\\\"*\\n3. **Ejecuta:** Si acepta, llama a `tool_sprint_planning_refinement`.\\n   *(Puedes enviar un JSON con la capacidad del equipo si el usuario la detalla, o dejarlo vacío para usar defaults).*\\n\\n\\n---\\n### FASE 9: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas comenzar el front?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos X textos UNO POR UNO:\\n3. **Ejecuta:** Si acepta, llama a `txxxx`.\\n\\n---\\n\\n### REGLAS GENERALES\\n- Siempre muestra los links de Azure que te devuelven las herramientas.\\n- Si una herramienta falla, pide al usuario intentar de nuevo o cambiar datos.\\n- Mantén un tono profesional y ágil.\\n- No muestres ninguna URL si es que antes no se ejecuto una herramienta\"
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
    }
  ],
  \"connections\": {
    \"9. Front: Separar HUs\": {
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

Ya sabes quirurjico
```

---

### Navegación

[← Prompt 076](/04-orquestacion-productiva/076/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 078 →](/04-orquestacion-productiva/078/)
{% endraw %}
