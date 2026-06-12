---
layout: default
title: '028. Flujo: Product Planning (Refinament Before Discovery) Entradas de…'
parent: Orquestación n8n productiva
nav_order: 28
permalink: /04-orquestacion-productiva/028/
---

{% raw %}

# Prompt 028
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 31,825 caracteres &middot; **Posición en la conversación:** 28 de 103

---

```
Flujo: Product Planning (Refinament Before Discovery)

Entradas del flujo: Es un formulario que solicita la informacion detallada abajo, esta informacion debe ser consultada por el Agente Supervisor 
Idea Inicial
Decidimos hacer un producto pequeño, de tal manera que pueda ser publicable. Entonces, esta es la propuesta: básicamente es un producto software para que los estudiantes de niveles inferiores puedan pedir tutorías a los estudiantes de niveles superiores.De acuerdo, donde se puedan ver los rankings de los estudiantes, tanto de los tutoriados como de los tutores. Ojo que estoy dando mi necesidad, no... ustedes tienen que descubrir el producto. Donde se puedan ver:•	Los rankings•	Las horas libres•	Las asignaturas•	El expertis•	El cumplimiento•	Que se les puede pagar a los tutores•	Dónde se pueden hacer estas tutorías, si son virtualesSí, entonces tiene un potencial muy grande. ¿Dónde le vamos a cerrar? Básicamente en la visión, en la planificación del producto y en la planificación del release.De acuerdo, entonces es tutorías. Estábamos pensando llamarle PoliTutorías: de estudiantes para estudiantes.

Horizonte de Planificación
El primer release es tiene una duración de 2 meses. Con sprints de 2 semanas, trabajando solo días laborables.

Presupuesto / Recursos
Somos un grupo conformado por 6 personas. Donde a cada uno le corresponde un componente: Scrum, DevOps, Agile Testing, Discovery, Frontend y Backed. Los responsables del desarrollo son Backend y Frontend, pero dependiendo del sprint algún otro componente puede cooperar con el desarrollo.

Formato de Visión y Valores
Seguir estrictamente la siguiente plantilla de Geoffrey Moore:\"Para [cliente objetivo] que [problema que necesita ser resuelto], el [nombre del producto] es un [categoría de producto] que [beneficio clave/razón para comprarlo]. A diferencia de [alternativa(s) de la competencia], nuestro producto [diferencia principal].\"Selecciona las 3 áreas de valor más relevantes de la siguiente lista propuesta por el libro de Scrum Essentials:1. Entry conditions (Condiciones de entrada)- Achieve parity with competition- Deliver minimum required features- Get compliant (SOX, FDA, HIPAA)2. Enablement (Habilitación)- Target a new market- Enable sales of other products or services3. Differentiator (Diferenciador)- Differentiate from competitors- Delight the customer4. Spoiler (Saboteador)- Eliminate competitors' differentiator- Raise the parity bar- Redefine the game by changing market focus5. Cost reducer (Reductor de costos)- Shorten time to market- Reduce the number of people or their time allocation- Improve margins- Increase expertise

Flujo:



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
        4592,
        480
      ],
      \"id\": \"c9f9c1e0-5cee-4ee6-bb89-037f2a23d762\",
      \"name\": \"Obtener ejemplo product planning\"
    },
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
        3728,
        480
      ],
      \"id\": \"e463ac08-1f1c-494e-8e3e-e9526996fb7e\",
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
        3504,
        480
      ],
      \"id\": \"ca4dfcd0-b823-4f27-b068-2319a8737950\",
      \"name\": \"1. Cargar contexto del producto\",
      \"webhookId\": \"5c5bc3a8-0022-49df-8211-3b6106fcd374\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-robotics-er-1.5-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-robotics-er-1.5-preview\"
        },
        \"text\": \"=Objetivo: Necesito tu ayuda para :\\n\\n- seleccionar las áreas de valor\\n- generar la visión según Geoffrey Moore\\n\\nde una nueva aplicación para tutorías académicas.\\n\\nRol: Eres Product Owner experto en el marco de trabajo ágil de Scrum, con una gran experiencia en ambientes complejos.\\n\\nContexto: La nueva aplicación denominada PoliTutorías es un producto de software de alcance reducido y publicable que tiene como objetivo facilitar tutorías académicas entre estudiantes, permitiendo que alumnos de niveles inferiores soliciten apoyo a estudiantes de niveles superiores, quienes actúan como tutores. El sistema busca centralizar la gestión de tutorías mediante la visualización de rankings de tutores y tutoriados, la disponibilidad horaria, las asignaturas impartidas, el nivel de experticia y cumplimiento de los tutores, así como la posibilidad de realizar pagos y definir la modalidad de las tutorías (Virtual/Presencial). Para realizar estas tareas lee las secciones 1.1 y 1.2 del documento \\\"\\\"\\\"Ejemplo_Product_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo. Utiliza la lista de áreas de valor y subcategorías adjunta ({{ $('1. Cargar contexto del producto').item.json['Formato de Visión y Valores'] }})\\n\\nAcción: Selecciona 3 áreas de valor del nuevo producto Politutorías y su correspondiente subcategoría adjuntando una justificación para saber cómo eso representa valor a los stakeholders. Luego, generar la visión de Politutorías siguiendo el formato de Geoffrey Moore.\\n\\nFormato:\\nTu respuesta debe ser ÚNICAMENTE un objeto JSON válido con esta estructura exacta:\\n{\\n  \\\"areas_valor\\\": [\\n    {\\n      \\\"area\\\": \\\"Nombre del Área (Ej: Habilitador/Diferenciador)\\\",\\n      \\\"subcategoria\\\": \\\"Acción específica\\\",\\n      \\\"justificacion\\\": \\\"Por qué aporta valor según el presupuesto y horizonte\\\"\\n    },\\n    { ... (repetir para área 2) },\\n    { ... (repetir para área 3) }\\n  ],\\n  \\\"vision_desglosada\\\": {\\n    \\\"para\\\": \\\"cliente objetivo\\\",\\n    \\\"que\\\": \\\"problema que necesita ser resuelto\\\",\\n    \\\"el\\\": \\\"Nombre del producto\\\",\\n    \\\"es_una\\\": \\\"Categoría del producto\\\",\\n    \\\"que_beneficio\\\": \\\"Beneficio clave / Razón para comprar\\\",\\n    \\\"a_diferencia_de\\\": \\\"Alternativa o competencia principal (Deben ser aplicaciones similares)\\\",\\n    \\\"nuestro_producto\\\": \\\"diferencia principal\\\"\\n  }\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        4144,
        480
      ],
      \"id\": \"525de765-ce37-4699-a6b3-4705c0408549\",
      \"name\": \"2. Propuesta áreas de valor y visión\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        3936,
        480
      ],
      \"id\": \"051283fc-fe1a-4704-9a4a-b326de49aa0d\",
      \"name\": \"Cambiar etiqueta de identificación\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      // Forzamos la etiqueta PDF para que Gemini no corte la conexión\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4800,
        480
      ],
      \"id\": \"b6805409-ba5a-403c-97da-80142b2c6251\",
      \"name\": \"Cambiar etiqueta de identificación1\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-robotics-er-1.5-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-robotics-er-1.5-preview\"
        },
        \"text\": \"=Objetivo: Necesito tu ayuda para generar Historias Usuario (Alto Nivel: Epics) en formato Gherkin para la aplicación de tutorías académicas.\\n\\nRol: Eres un experto en el marco Agile de Scrum.\\n\\nContexto: Soy un Product Owner Proxy que va a liderar la construcción del nuevo producto PoliTutorías, al cual el Product Owner superior le proporciono la siguiente idea: “””La nueva aplicación denominada PoliTutorías es un producto de software de alcance reducido y publicable que tiene como objetivo facilitar tutorías académicas entre estudiantes, permitiendo que alumnos de niveles inferiores soliciten apoyo a estudiantes de niveles superiores, quienes actúan como tutores. El sistema busca centralizar la gestión de tutorías mediante la visualización de rankings de tutores y tutoriados, la disponibilidad horaria, las asignaturas impartidas, el nivel de experticia y cumplimiento de los tutores, así como la posibilidad de realizar pagos y definir la modalidad de las tutorías (Virtual/Presencial).”””. Previamente genere las áreas de valor ({{ JSON.stringify($('Sanitizar paso 2').first().json.areas_valor) }}) y la visión de producto para PoliTutorías ({{ JSON.stringify($('Sanitizar paso 2').first().json.vision_desglosada) }}). Para realizar estas tarea lee la seccion 2. Product Backlog Alto Nivel del documento \\\"\\\"\\\"Ejemplo_Product_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo.\\n\\nAcción: Generar de 6 a 8 Historias Épicas en el formato de Gherkin que aborden las funcionalidades generales de PoliTutorías. Solo coloca una descripción de HU por cada título de épica. EVita colocar \\\"y\\\" u \\\"o\\\" en el \\\"QUIERO\\\" y \\\"PARA\\\" de la descripción de la Épica para que la HU no sea ambigua y confusa.\\n\\nFormato:\\nResponde ÚNICAMENTE con un objeto JSON válido con esta estructura:\\n{\\n  \\\"backlog\\\": [\\n    {\\n      \\\"id\\\": \\\"EP01\\\",\\n      \\\"titulo\\\": \\\"Título corto\\\",\\n      \\\"historia_usuario\\\": \\\"Como... quiero... para...\\\"\\n    },\\n    { ... }\\n  ]\\n}\\n\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"simplify\": false,
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        5024,
        480
      ],
      \"id\": \"e06e4697-d03a-4278-a09e-99e655cb8e51\",
      \"name\": \"3. Crear propuesta PB\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
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
        5456,
        480
      ],
      \"id\": \"a08d3f6d-21f5-4353-a771-c1da2c39b2b0\",
      \"name\": \"Obtener ejemplo product planning2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"for (const item of items) {\\n  if (item.binary) {\\n    const key = Object.keys(item.binary)[0];\\n    if (key) {\\n      // Forzamos la etiqueta PDF para que Gemini no corte la conexión\\n      item.binary[key].mimeType = 'application/pdf';\\n      item.binary[key].fileExtension = 'pdf';\\n      item.binary[key].fileName = 'planning_style.pdf';\\n    }\\n  }\\n}\\nreturn items;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        5648,
        480
      ],
      \"id\": \"46d0cb0f-82bf-469b-96d2-acf9ab30e03b\",
      \"name\": \"Cambiar etiqueta de identificación2\"
    },
    {
      \"parameters\": {
        \"resource\": \"document\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-robotics-er-1.5-preview\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-robotics-er-1.5-preview\"
        },
        \"text\": \"=Objetivo: Necesito tu ayuda para organizar y priorizar el Product RoadMap para la aplicación de tutorías académicas.\\n\\nRol: Eres un experto Product Owner, que tiene experiencia en organizar Product RoadMaps que aseguren valor para el usuario desde temprano en el primer release.\\n\\nContexto: Soy un Product Owner Proxy que va a liderar la construcción del nuevo producto PoliTutorías. Mi equipo esta conformado por 6 personas con diferentes roles como: Discovery, Scrum, Agile Testing, Backend, Frontend, DevOps. La planificación del release es por fecha fija con duración máxima de 2 meses (8 semanas, solo días laborables). Previamente genere: \\n\\n- Las áreas de valor ({{ JSON.stringify($('Sanitizar paso 2').first().json.areas_valor) }})\\n- La visión de producto para PoliTutorías ({{ JSON.stringify($('Sanitizar paso 2').first().json.vision_desglosada) }})\\n- El product Backlog de alto nivel ({{ JSON.stringify($('Sanitizar paso 3').first().json.backlog) }})\\n\\nPara generar el Product Roadmap lee la sección 3. Product Roadmap (en el documento esta mal colocado el nombre del punto 3., ignóralo) del documento \\\"\\\"\\\"Ejemplo_Product_Planning.pdf\\\"\\\"\\\" para familiarizarte con el formato, tono y estilo.\\n\\nAcción: Generar el marketp map (se traduce como objetivo del release, el cuál tiene nivel de abstracción de negocio y es directo y conciso), feature/benefit map (se traduce como las funcionalidades mínimas liberables del release) y el Architecture map (se traduce como la arquitectura web que se va a utilizar, puedes idear por decir alguna) para tres diferentes releases. Considera organizar el Roadmap incluyendo la característica diferenciadora de PoliTutorías en el primer Release.\\n\\nFormato:\\nResponde ÚNICAMENTE con un JSON válido:\\n{\\n  \\\"releases\\\": [\\n    {\\n      \\\"release_name\\\": \\\"Release 1\\\",\\n      \\\"market_map\\\": \\\"...\\\",\\n      \\\"feature_map\\\": \\\"...\\\",\\n      \\\"architecture\\\": \\\"...\\\"\\n    },\\n    ... (Release 2 y 3)\\n  ]\\n}\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"Ejemplo_Product_Planning.pdf\",
        \"simplify\": false,
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        5856,
        480
      ],
      \"id\": \"4067d432-12ca-415c-8964-c476d406a59c\",
      \"name\": \"4. Crear propuesta Product Roadmap\",
      \"credentials\": {
        \"googlePalmApi\": {
          \"id\": \"vAdcrxmFNKfVm0TO\",
          \"name\": \"Gemini Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"// --- 1. FUNCIÓN DE AYUDA PARA OBTENER DATOS DE CUALQUIER NODO ---\\n// Esto permite buscar el JSON de nodos anteriores por su nombre\\nconst getData = (nodeName) => {\\n  try {\\n    // Intentamos obtener el primer item del nodo especificado\\n    const node = $(nodeName).first();\\n    return node ? node.json : {};\\n  } catch (error) {\\n    return {}; // Si falla, devolvemos objeto vacío para no romper el flujo\\n  }\\n};\\n\\n// --- 2. RECUPERAR DATOS DE LOS NODOS SANITIZADOS ---\\nconst dataVision = getData('Sanitizar paso 2'); // Áreas y Visión\\nconst dataBacklog = getData('Sanitizar paso 3'); // Epics / Backlog\\nconst dataRoadmap = getData('Sanitizar paso 4'); // Roadmap / Releases\\n\\n// Extraemos sub-objetos para facilitar el uso\\nconst v = dataVision.vision_desglosada || {};\\nconst areas = dataVision.areas_valor || [];\\nconst backlog = dataBacklog.backlog || [];\\nconst releases = dataRoadmap.releases || [];\\n\\n// --- 3. CONSTRUCCIÓN DEL DOCUMENTO MARKDOWN ---\\n\\n// Función para limpiar texto dentro de tablas (quita saltos de línea que rompen tablas MD)\\nconst clean = (text) => (text || '').toString().replace(/\\\\n/g, ' ').trim();\\n\\nlet md = `# 01_Product Planning: ${v.el_producto || 'PoliTutorías'}\\\\n\\\\n`;\\n\\n// SECCIÓN 1: VISIÓN DEL PRODUCTO\\nmd += `## 1. Visión del producto\\\\n\\\\n`;\\n\\n// 1.1 Áreas de Valor (Formato Tabla)\\nmd += `### 1.1 Áreas de valor\\\\n`;\\nmd += `| Área | Subcategoría | Justificación |\\\\n`;\\nmd += `|---|---|---|\\\\n`;\\nareas.forEach(item => {\\n  md += `| ${clean(item.area)} | ${clean(item.subcategoria)} | ${clean(item.justificacion)} |\\\\n`;\\n});\\nmd += `\\\\n`;\\n\\n// 1.2 Visión Narrativa\\nmd += `### 1.2 Visión con las áreas de valor\\\\n`;\\nmd += `> \\\"Para **${v.para}**, que **${v.que}**, el producto **${v.el}**, es una **${v.es_una}**, que **${v.que_beneficio}**. A diferencia de **${v.a_diferencia_de}**, nuestro producto **${v.nuestro_producto}**.\\\"\\\\n\\\\n`;\\n\\n// SECCIÓN 2: PRODUCT BACKLOG\\nmd += `## 2. Product Backlog de alto nivel\\\\n\\\\n`;\\nmd += `| Nro. | Título | Historia de Usuario |\\\\n`;\\nmd += `|---|---|---|\\\\n`;\\n\\nif (backlog.length > 0) {\\n    backlog.forEach(item => {\\n      // Intentamos tomar ID, id, Id, etc. por si la IA varió la mayúscula\\n      const id = item.id || item.ID || item.nro || '-';\\n      const titulo = item.titulo || item.Titulo || 'Sin título';\\n      const hu = item.historia_usuario || item.descripcion || '';\\n      \\n      md += `| ${clean(id)} | ${clean(titulo)} | ${clean(hu)} |\\\\n`;\\n    });\\n} else {\\n    md += `| - | No se generaron items | - |\\\\n`;\\n}\\nmd += `\\\\n`;\\n\\n// SECCIÓN 3: ROADMAP / RELEASES\\nmd += `## 3. Product Roadmap (Releases)\\\\n\\\\n`;\\n\\nif (releases.length > 0) {\\n    // Paso A: Crear la cabecera (Release 1 | Release 2 | Release 3)\\n    let header = `| |`; // Celda vacía inicial (esquina superior izquierda)\\n    let separator = `|---|`;\\n    \\n    releases.forEach(r => {\\n        header += ` ${clean(r.release_name)} |`;\\n        separator += `---|`;\\n    });\\n\\n    md += header + `\\\\n`;\\n    md += separator + `\\\\n`;\\n\\n    // Paso B: Construir las filas específicas basándonos en tus claves JSON\\n    \\n    // Fila 1: Market Map\\n    let rowMarket = `| **Market Map** |`;\\n    releases.forEach(r => rowMarket += ` ${clean(r.market_map)} |`);\\n    md += rowMarket + `\\\\n`;\\n\\n    // Fila 2: Feature/benefit map\\n    let rowFeature = `| **Feature/benefit map** |`;\\n    releases.forEach(r => rowFeature += ` ${clean(r.feature_map)} |`);\\n    md += rowFeature + `\\\\n`;\\n\\n    // Fila 3: Architecture map\\n    let rowArch = `| **Architecture map** |`;\\n    releases.forEach(r => rowArch += ` ${clean(r.architecture)} |`);\\n    md += rowArch + `\\\\n`;\\n\\n} else {\\n    md += `_No se encontró información del Roadmap._\\\\n`;\\n}\\n\\n// --- 4. RETORNAR RESULTADO FINAL ---\\nreturn [{\\n  json: {\\n    nombre_archivo: \\\"01_Product_Planning.md\\\",\\n    contenido_markdown: md\\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        6320,
        480
      ],
      \"id\": \"50d2c62e-b13b-48a7-aa6f-f91a1779e23f\",
      \"name\": \"Generar documento Markdown\"
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendQuery\": true,
        \"queryParameters\": {
          \"parameters\": [
            {
              \"name\": \"path\",
              \"value\": \"/Scrum automatización/Product Planning Version/Product-Planning-Refinament\"
            },
            {
              \"name\": \"api-version\",
              \"value\": \"7.1\"
            }
          ]
        },
        \"sendBody\": true,
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.contenido_markdown }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        6544,
        480
      ],
      \"id\": \"a3ca4a68-04fc-4d46-b809-cf65f8e1401c\",
      \"name\": \"5. Guardar información generada en el repositorio\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"YDvvUemEtes98zgO\",
          \"name\": \"Azure Scrum\"
        }
      }
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.content.parts[0].text;\\n\\n// 2. Sanitizar: Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4368,
        480
      ],
      \"id\": \"33706a85-75ca-433e-ae8e-d9fdad4df074\",
      \"name\": \"Sanitizar paso 2\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.candidates[0].content.parts[0].text;\\n// 2. Sanitizar:Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        5232,
        480
      ],
      \"id\": \"29364391-e6b0-4b39-bf72-d368e3060ce4\",
      \"name\": \"Sanitizar paso 3\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtener la respuesta de texto cruda de Gemini\\nconst rawText = items[0].json.candidates[0].content.parts[0].text;\\n// 2. Sanitizar:Expresión Regular (Regex) para quitar ```json y ``` \\nconst jsonString = rawText.replace(/^```json\\\\s*|\\\\s*```$/g, '');\\n// 3. Parsear: Convertir el string limpio a un Objeto JSON real\\ntry {\\n  const jsonData = JSON.parse(jsonString);\\n  return { json: jsonData };\\n} catch (error) {\\n  // Si falla, devolvemos un error claro para depurar\\n  throw new Error(\\\"El modelo no devolvió un JSON válido o la limpieza falló. Output recibido: \\\" + rawText);\\n}\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        6080,
        480
      ],
      \"id\": \"3ce73454-90f6-4934-a345-ba26fc396f4f\",
      \"name\": \"Sanitizar paso 4\"
    }
  ],
  \"connections\": {
    \"Obtener ejemplo product planning\": {
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
    \"Obtener ejemplo product planning1\": {
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
    },
    \"2. Propuesta áreas de valor y visión\": {
      \"main\": [
        [
          {
            \"node\": \"Sanitizar paso 2\",
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
            \"node\": \"2. Propuesta áreas de valor y visión\",
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
            \"node\": \"3. Crear propuesta PB\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"3. Crear propuesta PB\": {
      \"main\": [
        [
          {
            \"node\": \"Sanitizar paso 3\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Obtener ejemplo product planning2\": {
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
            \"node\": \"4. Crear propuesta Product Roadmap\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"4. Crear propuesta Product Roadmap\": {
      \"main\": [
        [
          {
            \"node\": \"Sanitizar paso 4\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Generar documento Markdown\": {
      \"main\": [
        [
          {
            \"node\": \"5. Guardar información generada en el repositorio\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Sanitizar paso 2\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo product planning\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Sanitizar paso 3\": {
      \"main\": [
        [
          {
            \"node\": \"Obtener ejemplo product planning2\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Sanitizar paso 4\": {
      \"main\": [
        [
          {
            \"node\": \"Generar documento Markdown\",
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

Salida esperada: JSON del modulo de Agente Supervisor actualizado para funcionar con este paso 1 y JSON Completo con el flujo actualizado. Ademas el Happy Path para probar con las mismas entradas del formualrio que usa el flujo 

```

---

### Navegación

[← Prompt 027](/04-orquestacion-productiva/027/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 029 →](/04-orquestacion-productiva/029/)
{% endraw %}
