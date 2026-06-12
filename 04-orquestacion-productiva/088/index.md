---
layout: default
title: '088. Siguiente fase: { ''nodes'': [ { ''parameters'': {}, ''typ...'
parent: Orquestación n8n productiva
nav_order: 88
permalink: /04-orquestacion-productiva/088/
---

{% raw %}

# Prompt 088
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 39,281 caracteres &middot; **Posición en la conversación:** 88 de 103

---

```
Siguiente fase:




{
  \"nodes\": [
    {
      \"parameters\": {},
      \"type\": \"n8n-nodes-base.manualTrigger\",
      \"typeVersion\": 1,
      \"position\": [
        3200,
        -320
      ],
      \"id\": \"d161383a-1bd6-4fa3-ba4a-7672058efa25\",
      \"name\": \"When clicking ‘Execute workflow’\"
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/16?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        3792,
        -144
      ],
      \"id\": \"16aae718-b2d7-496e-a8bf-d5341ac9acb3\",
      \"name\": \"HTTP Criterios\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Validación de seguridad\\nif (!items[0].json.content) {\\n  return [{ json: { error: \\\"No hay contenido. Verifica la URL de la API.\\\" } }];\\n}\\n\\nconst content = items[0].json.content;\\n\\n// --- ESTRATEGIA NUEVA: BLOQUES MAESTROS ---\\n// 1. Buscamos el encabezado que define el inicio de una HU.\\n// Estructura: \\\"### Nro. HU03 - Título: Publicar oferta\\\"\\n// Capturamos:\\n// - Grupo 1: El Número (03)\\n// - Grupo 2: El Título (Publicar oferta)\\n// - Grupo 3: TODO el contenido hasta que empiece la siguiente HU o termine el archivo\\nconst masterRegex = /(?:###|##)\\\\s*Nro\\\\.\\\\s*HU(\\\\d+)\\\\s*-\\\\s*Título:\\\\s*([^\\\\n\\\\r]+)([\\\\s\\\\S]*?)(?=(?:###|##)\\\\s*Nro\\\\.\\\\s*HU|$)/gi;\\n\\nlet match;\\nconst resultados = [];\\n\\nwhile ((match = masterRegex.exec(content)) !== null) {\\n  const huNumero = match[1];\\n  const huTitulo = match[2].trim();\\n  const huCuerpo = match[3]; // Aquí dentro están la descripción, criterios, tareas, etc.\\n\\n  // 2. BUSCAR CRITERIOS (Solo dentro del cuerpo de ESTA HU)\\n  // Usamos un regex similar al tuyo, pero aplicado solo a 'huCuerpo'\\n  const criteriaRegex = /(?:#+\\\\s*)?Criterios de aceptación\\\\s*HU\\\\d+([\\\\s\\\\S]*?)(?=(?:#+\\\\s*)?Tareas|Nro\\\\.\\\\s*HU|(?:#+\\\\s*)?Resumen|$)/i;\\n  \\n  const criteriaMatch = criteriaRegex.exec(huCuerpo);\\n\\n  if (criteriaMatch) {\\n    let tablaRaw = criteriaMatch[1];\\n\\n    // --- LIMPIEZA DE TEXTO (Tu lógica original) ---\\n    let textoLimpio = tablaRaw\\n      .replace(/Tareas\\\\s*HU\\\\d+/i, '')\\n      .replace(/Resumen\\\\s*de\\\\s*Story\\\\s*Points/i, '')\\n      .replace(/\\\\|?\\\\s*:?-+:?\\\\s*\\\\|\\\\s*:?-+:?\\\\s*\\\\|?/g, '') \\n      .replace(/\\\\*\\\\*/g, '')\\n      .replace(/<br\\\\s*\\\\/?>/gi, ' ')\\n      .replace(/\\\\|/g, ' - ')\\n      .replace(/Escenario\\\\s*-\\\\s*Descripción/gi, '')\\n      .replace(/\\\\s+/g, ' ')\\n      .trim();\\n\\n    // Solo guardamos si hay contenido real\\n    if (textoLimpio.length > 5) {\\n      resultados.push({\\n        json: {\\n          id: `HU-${huNumero}`,\\n          titulo: huTitulo, // <--- ¡AQUÍ ESTÁ TU TÍTULO!\\n          tipo: 'Entrenamiento',\\n          contenido_criterios: textoLimpio    \\n        }\\n      });\\n    }\\n  }\\n}\\n\\nif (resultados.length === 0) {\\n    return [{ json: { warning: \\\"No se encontraron HUs con el formato esperado.\\\" } }];\\n}\\n\\nreturn resultados;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4032,
        -144
      ],
      \"id\": \"9243a399-71da-4d59-beb7-fc3a71cd9cae\",
      \"name\": \"Code in Criterios\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// Validamos que haya items\\nif (items.length === 0) {\\n    return [{ json: { contexto_entrenamiento: \\\"No hay ejemplos históricos.\\\" } }];\\n}\\n\\n// Recorremos cada item para darle formato individual\\nconst listaEjemplos = items.map(item => {\\n    const datos = item.json;\\n    \\n    // Construimos el bloque con ID, TÍTULO y CRITERIOS\\n    // Nota: Es vital que 'datos.titulo' venga del nodo anterior.\\n    return `### EJEMPLO DE REFERENCIA (${datos.id})\\nTÍTULO: ${datos.titulo}\\n--------------------------------------------------\\nCRITERIOS:\\n${datos.contenido_criterios}`;\\n});\\n\\n// AQUÍ ESTÁ LA CLAVE: Separamos cada bloque con una barrera visual GRANDE\\n// Usamos saltos de línea triples (\\\\n\\\\n\\\\n) y una línea divisoria fuerte.\\nconst separador = '\\\\n\\\\n\\\\n--------------------------------------------------------------------------------\\\\n\\\\n\\\\n';\\n\\nconst textoFinal = listaEjemplos.join(separador);\\n\\n// Devolvemos el paquete listo para inyectar en el Merge Multiplex\\nreturn [{\\n    json: {\\n      \\n        contexto_entrenamiento: textoFinal\\n    }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4240,
        -144
      ],
      \"id\": \"eea783d2-493e-4787-9099-840dbba229b3\",
      \"name\": \"Code in JavaScript\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Recolectamos el texto con una extracción más robusta\\nconst listaEscenarios = items.map(item => {\\n  const json = item.json;\\n\\n  // CASO A: Estructura compleja de Gemini (según tu captura image_b2c14c.png)\\n  // content -> parts -> [0] -> text\\n  if (json.content && json.content.parts && json.content.parts[0] && json.content.parts[0].text) {\\n    return json.content.parts[0].text;\\n  }\\n\\n  // CASO B: Estructura simple (si viene directo)\\n  return json.text || json.output || json.content;\\n})\\n.filter(texto => texto) // Elimina nulos o undefined\\n.map(texto => {\\n  // SEGURIDAD: Convertimos a String antes de hacer trim()\\n  // Esto evita el error si llega un número o un objeto por error\\n  return String(texto).trim(); \\n});\\n\\n// 2. Unimos todo con un separador Markdown claro\\nconst contenidoUnido = listaEscenarios.join('\\\\n\\\\n---\\\\n\\\\n');\\n\\n// 3. Creamos el documento final con encabezado y fecha\\nconst fecha = new Date().toLocaleDateString('es-ES');\\nconst documentoFinal = `# Reporte de Escenarios Generados (S1)\\\\n> Generado el: ${fecha}\\\\n\\\\n${contenidoUnido}`;\\n\\n// 4. Devolvemos el paquete para Azure DevOps\\nreturn [{\\n  json: {\\n    contenido_wiki: documentoFinal,\\n    page_path: \\\"CriteriosS1\\\", \\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        6272,
        -192
      ],
      \"id\": \"efeb3c28-0ab4-44c2-9f38-960e9a6d673d\",
      \"name\": \"Code in JavaScript1\"
    },
    {
      \"parameters\": {
        \"method\": \"PUT\",
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/Testing/CriteriosS1?api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"sendHeaders\": true,
        \"headerParameters\": {
          \"parameters\": [
            {
              \"name\": \"Content-Type\",
              \"value\": \"application/json\"
            }
          ]
        },
        \"sendBody\": true,
        \"bodyParameters\": {
          \"parameters\": [
            {
              \"name\": \"content\",
              \"value\": \"={{ $json.contenido_wiki }}\"
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        6512,
        -192
      ],
      \"id\": \"c4de6634-06cb-4bef-90ef-4942dbdc8887\",
      \"name\": \"HTTP Azure enviar\"
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/268?includeContent=true&api-version=7.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        3808,
        -400
      ],
      \"id\": \"51d33309-e0b2-4bbc-a5d6-be0374445783\",
      \"name\": \"HTTP HU1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtenemos el contenido de la Wiki\\nconst content = items[0].json.content;\\n\\n// Validación de seguridad\\nif (!content) {\\n  return [{ json: { error: \\\"El nodo HTTP no trajo contenido. Revisa la URL.\\\" } }];\\n}\\n\\n// 2. ESTRATEGIA DE BLOQUES\\nconst blockRegex = /(?:###\\\\s*)?Nro\\\\.\\\\s*HU-?(\\\\d+)\\\\s*-\\\\s*Título:\\\\s*([^\\\\n\\\\r]+)([\\\\s\\\\S]*?)(?=(?:###\\\\s*)?Nro\\\\.\\\\s*HU|$)/gi;\\n\\nlet match;\\nconst historias = [];\\n\\nwhile ((match = blockRegex.exec(content)) !== null) {\\n  const idRaw = match[1];\\n  const tituloRaw = match[2].trim().replace(/\\\\*\\\\*/g, ''); \\n  const cuerpoHU = match[3]; \\n\\n  // A. Extraer Descripción (Historia de Usuario)\\n  const descRegex = /Historia de Usuario.*?\\\\|\\\\s*([^|\\\\r\\\\n]+)/i;\\n  const descMatch = descRegex.exec(cuerpoHU);\\n  const descripcion = descMatch ? descMatch[1].trim() : \\\"Descripción no encontrada\\\";\\n\\n  // B. Extraer FRAMES DEL PROTOTIPO (CORREGIDO)\\n  // Busca desde \\\"Frame prototipo\\\" hasta que encuentre \\\"Observaciones\\\", \\\"Nota\\\" o el fin.\\n  const frameSectionRegex = /(?:Frame prototipo|Frames prototipo)\\\\*{0,2}([\\\\s\\\\S]*?)(?=(?:Observaciones|Nota|###|$))/i;\\n  const frameSectionMatch = frameSectionRegex.exec(cuerpoHU);\\n   \\n  let listaFrames = [];\\n\\n  if (frameSectionMatch) {\\n    const textoFrames = frameSectionMatch[1];\\n    const lineas = textoFrames.split('\\\\n');\\n    \\n    lineas.forEach(linea => {\\n      const limpia = linea.trim();\\n      // CORRECCIÓN: Ahora acepta cualquier línea que empiece con -, * o +\\n      // Ya no exige que tenga \\\"V.\\\"\\n      if (limpia.match(/^[*+-]/)) {\\n        // Reemplaza el símbolo inicial y espacios, y guarda el resto\\n        listaFrames.push(limpia.replace(/^[*+-]\\\\s*/, '').trim());\\n      }\\n    });\\n  }\\n\\n  // C. EXTRAER OBSERVACIONES\\n  const obsRegex = /(?:Observaciones|Nota)\\\\s*(?:\\\\*\\\\*|:)?\\\\s*:?\\\\s*([\\\\s\\\\S]*)/i;\\n  const obsMatch = obsRegex.exec(cuerpoHU);\\n   \\n  let observacionesTexto = \\\"Ninguna\\\";\\n  if (obsMatch && obsMatch[1]) {\\n      observacionesTexto = obsMatch[1].trim();\\n  }\\n\\n  // D. Guardamos el resultado final\\n  historias.push({\\n    json: {\\n      id: `HU-${idRaw}`,\\n      titulo: tituloRaw,\\n      descripcion: descripcion,\\n      observaciones: observacionesTexto,\\n      frames: listaFrames \\n    }\\n  });\\n}\\n\\n// 3. DIAGNÓSTICO\\nif (historias.length === 0) {\\n    return [{ \\n        json: { \\n            warning: \\\"No se encontraron historias con el formato esperado.\\\",\\n            texto_inicio: content.substring(0, 200) \\n        } \\n    }];\\n}\\n\\nreturn historias;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4064,
        -400
      ],
      \"id\": \"24a7b18f-11c1-462c-9074-630e47c565a4\",
      \"name\": \"Code in JavaScript5\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"const itemsProcesados = [];\\n\\n// Recorremos cada Historia de Usuario que llegó\\nfor (const item of items) {\\n  const json = item.json;\\n  const frames = json.frames || [];\\n\\n  // Si la HU tiene frames, creamos un item individual por cada uno\\n  if (frames.length > 0) {\\n    frames.forEach(frameNombre => {\\n      itemsProcesados.push({\\n        json: {\\n          id_hu: json.id,\\n          titulo_hu: json.titulo,\\n          descripcion: json.descripcion,\\n          observaciones: json.observaciones, // Pasamos las observaciones\\n          nombre_imagen_buscar: frameNombre // <--- ESTE es el clave para Drive\\n        }\\n      });\\n    });\\n  } else {\\n    // Si no tiene frames, pasamos la HU sola para que al menos se sepa\\n    itemsProcesados.push({\\n      json: {\\n        ...json,\\n        nombre_imagen_buscar: \\\"Sin Frames\\\"\\n      }\\n    });\\n  }\\n}\\n\\nreturn itemsProcesados;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4272,
        -400
      ],
      \"id\": \"a855564b-68c4-4bf5-825b-6a8ac59bfa3f\",
      \"name\": \"Code in JavaScript6\"
    },
    {
      \"parameters\": {
        \"resource\": \"fileFolder\",
        \"searchMethod\": \"query\",
        \"queryString\": \"=name = '{{ $json.nombre_imagen_buscar }}.jpg' and trashed = false\",
        \"returnAll\": true,
        \"filter\": {
          \"folderId\": {
            \"__rl\": true,
            \"value\": \"1u9bkPVozMlUxnkGXe2SGEQgNP4Xpci8L\",
            \"mode\": \"list\",
            \"cachedResultName\": \"Frames\",
            \"cachedResultUrl\": \"https://drive.google.com/drive/folders/1u9bkPVozMlUxnkGXe2SGEQgNP4Xpci8L\"
          }
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.googleDrive\",
      \"typeVersion\": 3,
      \"position\": [
        4480,
        -400
      ],
      \"id\": \"6046adfe-9701-4d2b-b73a-5c070703dea0\",
      \"name\": \"Search files and folders\"
    },
    {
      \"parameters\": {
        \"operation\": \"download\",
        \"fileId\": {
          \"__rl\": true,
          \"value\": \"={{ $json.id }}\",
          \"mode\": \"id\"
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.googleDrive\",
      \"typeVersion\": 3,
      \"position\": [
        4672,
        -400
      ],
      \"id\": \"4374354f-c5e2-4588-8a9b-a078c8d158f5\",
      \"name\": \"Download file1\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"// 1. Obtenemos TODOS los datos de texto\\nconst datosTexto = $('Code in JavaScript6').all();\\n\\nconst itemsFinales = [];\\n\\n// --- MAPA DE AGRUPACIÓN (Igual que antes) ---\\nconst mapaHUs = new Map();\\n\\ndatosTexto.forEach(item => {\\n  const data = item.json;\\n  if (data.nombre_imagen_buscar) {\\n    const nombreLimpio = data.nombre_imagen_buscar.trim();\\n    if (!mapaHUs.has(nombreLimpio)) {\\n      mapaHUs.set(nombreLimpio, []);\\n    }\\n    mapaHUs.get(nombreLimpio).push(data);\\n  }\\n});\\n\\n// --- NUEVO: CONTROL DE DUPLICADOS ---\\n// Usamos esto para anotar qué imágenes ya \\\"atendimos\\\"\\nconst imagenesProcesadas = new Set();\\n\\n// 2. Recorremos las imágenes de Drive\\nfor (const itemImagen of items) {\\n  const driveData = itemImagen.json; \\n  const binaryData = itemImagen.binary;\\n\\n  // Limpieza del nombre\\n  const nombreArchivoSinExt = driveData.name.replace(/\\\\.[^/.]+$/, \\\"\\\").trim();\\n\\n  // --- FILTRO ANTI-REPETICIÓN ---\\n  // Si ya procesamos una imagen con este nombre, saltamos a la siguiente.\\n  if (imagenesProcesadas.has(nombreArchivoSinExt)) {\\n    continue; \\n  }\\n\\n  // Si es nueva, la buscamos en el mapa\\n  const listaHUsCoincidentes = mapaHUs.get(nombreArchivoSinExt);\\n\\n  if (listaHUsCoincidentes && listaHUsCoincidentes.length > 0) {\\n    \\n    // Marcamos esta imagen como \\\"YA USADA\\\" para que no se repita\\n    imagenesProcesadas.add(nombreArchivoSinExt);\\n\\n    // Generamos los items (HU-13, HU-14, etc.)\\n    for (const huData of listaHUsCoincidentes) {\\n      itemsFinales.push({\\n        json: {\\n          id_hu: huData.id_hu,\\n          titulo: huData.titulo_hu,\\n          descripcion: huData.descripcion,\\n          observaciones: huData.observaciones,\\n          \\n          archivo_nombre_original: driveData.name,\\n          archivo_id: driveData.id\\n        },\\n        binary: binaryData\\n      });\\n    }\\n  }\\n}\\n\\nreturn itemsFinales;\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4880,
        -400
      ],
      \"id\": \"1adb77e1-87aa-40ef-b0cf-143eb5e36cc9\",
      \"name\": \"Code in JavaScript7\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"const grupos = {};\\n\\n// 1. Recorremos todos los items sueltos\\nfor (const item of items) {\\n  const json = item.json;\\n  \\n  // N8N maneja los binarios de forma particular. \\n  // A veces viene como 'data', a veces como el nombre del archivo. \\n  // Asumiremos que viene en la propiedad por defecto que suele ser 'data' o la primera llave disponible.\\n  const binaryKey = Object.keys(item.binary)[0]; \\n  const binary = item.binary[binaryKey];\\n  \\n  const idHu = json.id_hu;\\n\\n  // 2. Si es la primera vez que vemos esta HU, la inicializamos\\n  if (!grupos[idHu]) {\\n    grupos[idHu] = {\\n      json: {\\n        id_hu: idHu,\\n        titulo: json.titulo,\\n        descripcion: json.descripcion,\\n        observaciones: json.observaciones,\\n        // Inicializamos el array\\n        frames_info: [] \\n      },\\n      binary: {}\\n    };\\n  }\\n\\n  // 3. CORRECCIÓN AQUÍ: Usamos los nombres correctos que vienen del nodo anterior\\n  grupos[idHu].json.frames_info.push({\\n    // Antes tenías json.nombre_frame (incorrecto)\\n    nombre: json.archivo_nombre_original, \\n    // Antes tenías json.archivo_drive_id (incorrecto)\\n    archivo_id: json.archivo_id        \\n  });\\n\\n  // 4. Guardamos la imagen binaria con un nombre único para que no se sobrescriban\\n  const indice = Object.keys(grupos[idHu].binary).length;\\n  \\n  // Esto crea propiedades: data_0, data_1, data_2...\\n  grupos[idHu].binary[`data_${indice}`] = binary;\\n}\\n\\n// 5. Devolvemos el array limpio\\nreturn Object.values(grupos);\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        5072,
        -400
      ],
      \"id\": \"76919519-40e0-46db-9925-e3c99a783586\",
      \"name\": \"Code in JavaScript8\"
    },
    {
      \"parameters\": {
        \"resource\": \"image\",
        \"operation\": \"analyze\",
        \"modelId\": {
          \"__rl\": true,
          \"value\": \"models/gemini-2.5-flash\",
          \"mode\": \"list\",
          \"cachedResultName\": \"models/gemini-2.5-flash\"
        },
        \"text\": \"=Actúa como un QA Lead experto en metodologías ágiles y meticuloso con los detalles.\\n\\nOBJETIVO PRINCIPAL:\\nSincronizar la lógica de negocio con la realidad visual del prototipo para crear una suite de pruebas BDD robusta. Tu prioridad es asegurar que los nombres de los elementos (botones, inputs, mensajes) en los tests coincidan EXACTAMENTE con la descripción visual y las observaciones técnicas proporcionadas.\\n\\nTu tarea es generar Criterios de Aceptación usando BDD (Behavior-Driven Development) para la Historia de Usuario solicitada, basándote en la DOCUMENTACIÓN ADJUNTA y siguiendo ESTRICTAMENTE mi estilo de redacción.\\n\\n---\\nSECCIÓN 1: MIS EJEMPLOS MAESTROS \\nFíjate cómo especifico los campos (Nombre: Valor), los mensajes de error exactos entre comillas y el flujo \\\"Dado/Cuando/Entonces\\\".\\n\\n\\\"\\\"\\\"\\n{{ $json.contexto_entrenamiento }}\\n\\\"\\\"\\\"\\n---\\nSECCIÓN 2: CONTEXTO DEL MAPA DE NAVEGACIÓN (CRÍTICO PARA EL FLUJO)\\nUsa esta información para determinar qué sucede después de una acción (ej: a qué pantalla redirige un botón) y entender la lógica de interacción.\\n\\n\\\"\\\"\\\"\\n{{ $json.mapa_consolidado }}\\n\\\"\\\"\\\"\\n---\\nSECCIÓN 3 : TU TAREA ACTUAL\\nGenera los escenarios BDD completos para la siguiente historia.\\n\\nCRÍTICO - ANÁLISIS DE UI Y OBSERVACIONES:\\nAntes de escribir los escenarios, analiza los campos \\\"Observaciones\\\" y \\\"Info Visual (Frames)\\\" de la entrada:\\n1. **Nombres Exactos:** Si la info visual menciona un botón \\\"Siguiente\\\", NO uses \\\"Continuar\\\". Usa el texto exacto.\\n2. **Campos y Labels:** Identifica qué datos pide el frame (ej: \\\"Materia\\\", \\\"Horario\\\") y úsalos en tus pasos **Dado** y **cuando**.\\n3. **Restricciones:** Si las observaciones dicen \\\"Omitir filtros\\\", NO crees tests para filtros. Si dicen \\\"Validar campo vacío\\\", crea el escenario negativo correspondiente.\\n4. **Mensajes:** Si las observaciones definen un mensaje de error o éxito, úsalo literalmente en el paso **entonces**.\\n5. **Consistencia Visual y de Flujo:** Los pasos deben parecer un guion de prueba manual basado en la pantalla descrita y validado por el mapa de navegación.\\n\\n---\\nREGLAS FINALES:\\n1. Usa \\\"Dado/Cuando/Entonces\\\" en español.\\n2. Genera escenarios basándote exclusivamente en los elementos visibles en las imágenes y el mapa. Queda prohibido inventar validaciones o mensajes de error estándar (ej: \\\"contraseña incorrecta\\\") por muy obvios que parezcan, a menos que aparezcan explícitamente en los Frames. Si no lo ves visualmente, no lo documentes.\\n3. Solo céntrate en generar los escenarios, cualquier comentario de mejora o algo aparte NO lo pongas.\\n4. Usa estrictamente el formato de los ejemplos de la sección 1.\\n5. **Consistencia Visual:** Los pasos deben parecer un guion de prueba manual basado en la pantalla descrita.\\n6. IMPORTANTE: La salida debe ser estrictamente formato Markdown (sin bloques de código ```json).\\n\\nINSTRUCCIONES DE FORMATO \\n1. Tu salida debe ser ÚNICAMENTE código Markdown.\\n2. Debes estructurar la respuesta usando TABLAS.\\n3. DENTRO de las celdas de la tabla, para separar el \\\"Dado\\\", \\\"Cuando\\\" y \\\"Entonces\\\", DEBES usar la etiqueta HTML `<br>`. Si usas un salto de línea normal, la tabla se romperá.\\n4. Las palabras clave **Dado**, **cuando**, **entonces** deben ir en minúsculas (excepto al inicio) y en negrita.\\n5. NO ALUCINES NI CREES ESCENARIOS QUE NO ESTÁN AHÍ. Guíate únicamente por la entrada proporcionada (la HU y el frame) para la creación. Analiza los campos, botones o mensajes existentes para generar los escenarios basándote estrictamente en la información visual obtenida. NO inventes escenarios si no los ves explícitamente en los frames o en las observaciones.\\n6. En SECCIÓN 1: MIS EJEMPLOS MAESTROS  solo guiate para el formate no debes hacer tal cual.\\n\\nREGLA QUE SE DEBE SEGUIR SIEMPRE\\n1. Guíate únicamente por la hu y los frames incluidos. no agregues nada que no veas explícitamente; es decir, si intuyes que debería haber un campo pero no aparece en el frame, no lo incluyas. si no visualizas mensajes específicos, no los inventes; limítate a describir acciones generales como \\\"entonces entra a la página\\\". no crees escenarios basándote en suposiciones o validaciones que no estén presentes en los frames, por muy intuitivas que parezcan.\\n\\n2. Recuerda que los ejemplos maestros son solo referencias de formato. utilízalos únicamente para entender la estructura de escritura requerida, pero no copies el contenido de los casos, incluso si se parecen a la tarea actual.\\n\\nENTRADA:\\nID: {{ $json.id_hu }}\\nTítulo: {{ $json.titulo }}\\nDescripción: {{ $json.descripcion }}\\nObservaciones Técnicas: {{ $json.observaciones }}\\nInfo Visual (Frames/Botones/UI): {{ JSON.stringify($json.frames_info) }}\\nContexto Mapa (Flujo/Lógica): {{ $json.mapa_consolidado }}\\n\\n---\\nSALIDA ESPERADA:\\nRellena la siguiente plantilla exacta con la información de la entrada. \\nNo añadas nada más antes ni después.\\n\\n### Nro. {{ $json.id_hu }} - Título: {{ $json.titulo }}\\n\\n#### Criterios de aceptación {{ $json.id_hu }}\\n\\n| **Escenario** | **Descripción** |\\n| :--- | :--- |\\n| **Nombre corto del Escenario 1** | **Dado** que [condición inicial]... <br> **cuando** [acción usando nombres reales de UI]... <br> **entonces** [resultado esperado]... |\\n| **Nombre corto del Escenario 2** | **Dado** que... <br> **cuando**... <br> **entonces**... |\\n| **Nombre corto del Escenario 3** | **Dado** que... <br> **cuando**... <br> **entonces**... |\",
        \"inputType\": \"binary\",
        \"binaryPropertyName\": \"data_0\",
        \"options\": {}
      },
      \"type\": \"@n8n/n8n-nodes-langchain.googleGemini\",
      \"typeVersion\": 1,
      \"position\": [
        6032,
        -192
      ],
      \"id\": \"ac01daf0-33d7-4017-a4f4-76b940a50f72\",
      \"name\": \"Analyze an image\"
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages/497?includeContent=true&api-version=6.0\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        3776,
        192
      ],
      \"id\": \"d6e3d973-9871-4575-9136-4d14cad8cbf4\",
      \"name\": \"HTTP Mapa\"
    },
    {
      \"parameters\": {
        \"jsCode\": \"const content = items[0].json.content || \\\"\\\";\\n\\n// 1. PRIMERO LIMPIAMOS: Quitamos los asteriscos (**) y saltos HTML para que el texto quede puro\\n// Esto soluciona el problema de que no encontrara los números antes.\\nconst textoLimpio = content\\n  .replace(/\\\\*\\\\*/g, \\\"\\\") \\n  .replace(/<br\\\\s*\\\\/?>/gi, \\\"\\\\n\\\")\\n  .trim();\\n\\n// 2. EXTRACCIÓN (Ahora sí funcionará porque el texto está limpio)\\nconst razonMatch = textoLimpio.match(/Razon:\\\\s*([\\\\s\\\\S]*?)(?=(?:Total de Nodos|Pantallas|###|$))/i);\\nconst nodosMatch = textoLimpio.match(/Total de Nodos:\\\\s*(\\\\d+)/i);\\nconst pantallasMatch = textoLimpio.match(/Pantallas:\\\\s*(\\\\d+)/i);\\n\\nconst razon = razonMatch ? razonMatch[1].trim() : \\\"No especificada\\\";\\nconst nodos = nodosMatch ? nodosMatch[1] : \\\"N/A\\\";\\nconst pantallas = pantallasMatch ? pantallasMatch[1] : \\\"N/A\\\";\\n\\n// 3. UNIFICACIÓN: Creamos un solo bloque de texto formateado\\nconst bloqueFinal = `\\n=== CONTEXTO DEL MAPA DE NAVEGACIÓN ===\\n> Resumen de actualización:\\n- Motivo: ${razon}\\n- Métricas: ${nodos} nodos y ${pantallas} pantallas involucradas.\\n\\n> Detalle Completo:\\n${textoLimpio}\\n`.trim();\\n\\n// 4. Salida en una sola variable\\nreturn [{\\n  json: {\\n    mapa_consolidado: bloqueFinal \\n  }\\n}];\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        4016,
        192
      ],
      \"id\": \"1cea8315-0e01-4eda-bf40-01d45ce5a43f\",
      \"name\": \"Code in Criterios1\"
    },
    {
      \"parameters\": {
        \"mode\": \"combine\",
        \"combineBy\": \"combineAll\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3.2,
      \"position\": [
        5504,
        -304
      ],
      \"id\": \"d3a2f619-f282-4532-83c5-8c89c64130ed\",
      \"name\": \"Merge\"
    },
    {
      \"parameters\": {
        \"mode\": \"combine\",
        \"combineBy\": \"combineAll\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3.2,
      \"position\": [
        5744,
        -192
      ],
      \"id\": \"a77f859a-2f7b-406c-b2b1-3b18fc329a06\",
      \"name\": \"Merge1\"
    }
  ],
  \"connections\": {
    \"When clicking ‘Execute workflow’\": {
      \"main\": [
        [
          {
            \"node\": \"HTTP Criterios\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"HTTP HU1\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"HTTP Mapa\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"HTTP Criterios\": {
      \"main\": [
        [
          {
            \"node\": \"Code in Criterios\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in Criterios\": {
      \"main\": [
        [
          {
            \"node\": \"Code in JavaScript\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in JavaScript\": {
      \"main\": [
        [
          {
            \"node\": \"Merge\",
            \"type\": \"main\",
            \"index\": 1
          }
        ]
      ]
    },
    \"Code in JavaScript1\": {
      \"main\": [
        [
          {
            \"node\": \"HTTP Azure enviar\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"HTTP HU1\": {
      \"main\": [
        [
          {
            \"node\": \"Code in JavaScript5\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in JavaScript5\": {
      \"main\": [
        [
          {
            \"node\": \"Code in JavaScript6\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in JavaScript6\": {
      \"main\": [
        [
          {
            \"node\": \"Search files and folders\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Search files and folders\": {
      \"main\": [
        [
          {
            \"node\": \"Download file1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Download file1\": {
      \"main\": [
        [
          {
            \"node\": \"Code in JavaScript7\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in JavaScript7\": {
      \"main\": [
        [
          {
            \"node\": \"Code in JavaScript8\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in JavaScript8\": {
      \"main\": [
        [
          {
            \"node\": \"Merge\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Analyze an image\": {
      \"main\": [
        [
          {
            \"node\": \"Code in JavaScript1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"HTTP Mapa\": {
      \"main\": [
        [
          {
            \"node\": \"Code in Criterios1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Code in Criterios1\": {
      \"main\": [
        [
          {
            \"node\": \"Merge1\",
            \"type\": \"main\",
            \"index\": 1
          }
        ]
      ]
    },
    \"Merge\": {
      \"main\": [
        [
          {
            \"node\": \"Merge1\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Merge1\": {
      \"main\": [
        [
          {
            \"node\": \"Analyze an image\",
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
          \"systemMessage\": \"=Entonces modifica bien al agente:\\n\\nEres el **Supervisor de Ingeniería de Software (AI Architect)**.\\nTu misión es orquestar el ciclo de vida del software (SDLC) guiando al usuario paso a paso.\\n\\n---\\n\\n### FASE 1: PRODUCT PLANNING (ENTREVISTA)\\nPara iniciar, recolecta 3 datos. Pregunta UNO POR UNO si faltan:\\n1. **¿Falta IDEA?** -> \\\"¡Hola! ¿Qué proyecto vamos a construir hoy?\\\"\\n2. **¿Falta HORIZONTE?** -> \\\"¿Cuál es el horizonte de tiempo? (Ej: 2 meses)\\\"\\n3. **¿Falta EQUIPO?** -> \\\"¿Con qué presupuesto/equipo contamos?\\\"\\n\\n**EJECUCIÓN FASE 1:**\\nCuando tengas los 3, ejecuta `tool_product_planning_initial`.\\n\\n---\\n\\n### FASE 2: RELEASE PLANNING (TRANSICIÓN)\\nCuando termine Fase 1 y tengas la URL:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Deseas proceder con el Release Planning?\\\"*\\n2. **Entrevista:** Si acepta, pide: *\\\"Indícame fecha inicio y fin del Release 1.\\\"*\\n3. **EJECUCIÓN FASE 2:** Llama a `tool_release_planning_initial` (Usa URL de tu memoria).\\n\\n---\\n\\n### FASE 3: DISCOVERY (ENTREVISTA UX)\\nCuando termine Fase 2:\\n1. **Confirma:** Muestra la URL y pregunta: *\\\"¿Iniciamos la fase de Discovery y Diseño UX?\\\"*\\n2. **Entrevista:** Si acepta, recolecta estos 3 textos UNO POR UNO:\\n   - **Contexto App:** \\\"Dame un contexto breve de la aplicación.\\\"\\n   - **Objetivo Sprint:** \\\"¿Cuál es el objetivo de este Sprint de diseño?\\\"\\n   - **HUs Épicas:** \\\"Lista las Historias Épicas principales para este sprint.\\\"\\n3. **EJECUCIÓN FASE 3:** Llama a `tool_discovery_inicial`.\\n\\n---\\n### FASE 4: PROTOCOLO DE PRUEBAS\\nDespués del Discovery:\\n1. **Confirma:** *\\\"¿Generamos ahora el Protocolo de Pruebas?\\\"*\\n2. **Ejecuta:** Llama a `tool_dcu_protocolo` pasando el objetivo del sprint anterior.\\n\\n---\\n### FASE 5: INTERPRETACIÓN DE RESULTADOS\\n1. **Confirma:** *\\\"¿Analizamos los resultados de las pruebas de usuario?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_dcu_interpretacion`.\\n   - `tipo_prueba`: \\\"Prueba de Usuario\\\".\\n   - `objetivo_sprint`: (El mismo de la Fase 4).\\n*(NOTA: Las transcripciones se toman del servidor automáticamente).*\\n\\n---\\n### FASE 6: REFINAMIENTO DE PRODUCTO\\n1. **Confirma:** *\\\"¿Deseas realizar el Refinamiento del Product Planning basándonos en el Discovery y el Prototipo?\\\"*\\n2. **EJECUCIÓN FASE 6:** Si el usuario dice SÍ, llama a `tool_product_planning_refinement`.\\n\\n---\\n### FASE 7: REFINAMIENTO DE RELEASE\\nDespués del Refinamiento de Producto:\\n\\n1. **Confirma:** *\\\"¿Deseas ejecutar el Refinamiento del Release Planning para ajustar los Sprints con la nueva información?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_release_planning_refinement`. \\n   *(Automático: Usa el video del prototipo y los documentos actualizados en Azure).*\\n\\n---\\n### FASE 8: SPRINT PLANNING (REFINAMIENTO)\\nDespués del Refinamiento de Release:\\n\\n1. **Confirma:** *\\\"¿Deseas generar el Sprint Planning detallado para el Sprint 1?\\\"*\\n2. **Entrevista Capacidad (Opcional):** *\\\"¿Hay cambios en la capacidad del equipo? (Si no, usaré la configuración estándar).\\\"*\\n3. **Ejecuta:** Si acepta, llama a `tool_sprint_planning_refinement`.\\n   *(Puedes enviar un JSON con la capacidad del equipo si el usuario la detalla, o dejarlo vacío para usar defaults).*\\n\\n\\n---\\n### FASE 9: FRONTEND - SPLIT HUs\\n1. **Confirma:** *\\\"¿Comenzamos la fase de Frontend separando las Historias de Usuario?\\\"*\\n2. **Entrevista Técnica (Solo si no tienes los datos):**\\n   - *\\\"Necesito los datos de Azure: Organización, Proyecto, Wiki ID, Page ID y Folder ID.\\\"*\\n   - *(Nota: Si el usuario dice \\\"Usa la configuración por defecto\\\", usa los valores de prueba).*\\n3. **Ejecuta:** Llama a `tool_front_1_split` pasando los 5 parámetros.\\n\\n---\\n### FASE 10: FRONTEND - MAPEAR FRAMES\\n1. **Confirma:** *\\\"¿Continuamos con el mapeo de Frames de diseño?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Necesito los IDs de Azure (Wiki/Page) y los IDs de las carpetas de Google Drive (HUs y Frames).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_2_frames`.\\n\\n---\\n### FASE 11: FRONTEND - DIAGRAMAS DE COMUNICACIÓN\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Comunicación?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames y Diagramas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_3_comm`.\\n\\n---\\n### FASE 12: FRONTEND - DIAGRAMAS DE SECUENCIA\\n1. **Confirma:** *\\\"¿Generamos los Diagramas de Secuencia?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Frames, Comunicación y Secuencia.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_4_seq`.\\n\\n---\\n### FASE 13: FRONTEND - ENDPOINTS\\n1. **Confirma:** *\\\"¿Generamos la documentación de Endpoints?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las carpetas: HUs, Comunicación, Secuencia y Endpoints.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_5_endp`.\\n\\n---\\n### FASE 14: FRONTEND - TAREAS DE DESARROLLO\\n1. **Confirma:** *\\\"¿Generamos las tareas de implementación detalladas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los IDs de las 5 carpetas (HUs, CD, SD, Endpoints, Tasks).\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_6_tasks`.\\n\\n---\\n### FASE 15: FRONTEND - NOTIFICAR AL SCRUM MASTER\\n1. **Confirma:** *\\\"¿Notificamos al Scrum Master que las tareas de implementación están listas?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Para el email, necesito el ID de la carpeta donde se guardaron las Tareas.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_7_notify`.\\n\\n---\\n### FASE 16: FRONTEND - PROMPTS FINALES\\n1. **Confirma:** *\\\"¿Generamos los prompts de ingeniería para la IA de código?\\\"*\\n2. **Entrevista Técnica:**\\n   - *\\\"Confirma los datos de Azure y las carpetas de HUs, Tareas y Prompts.\\\"*\\n   - *(Si el usuario pide usar defaults, envía parámetros vacíos).*\\n3. **Ejecuta:** Llama a `tool_front_8_prompts`.\\n\\n---\\n### FASE 17: TESTING - CASOS DE PRUEBA\\n1. **Confirma:** *\\\"¿Generamos los Casos de Prueba automatizados?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_test_casos`. \\n   *(Automático: Usa el archivo Casos1.csv del servidor).*\\n\\n---\\n### FASE 18: TESTING - TABLAS DE DECISIÓN\\n1. **Confirma:** *\\\"¿Generamos las Tablas de Decisión basadas en los Criterios de Aceptación?\\\"*\\n2. **Ejecuta:** Si acepta, llama a `tool_test_tablas`.\\n\\n\\n---\\n\\n### REGLAS GENERALES\\n- Siempre muestra los links de Azure que te devuelven las herramientas.\\n- Si una herramienta falla, pide al usuario intentar de nuevo o cambiar datos.\\n- Mantén un tono profesional y ágil.\\n- No muestres ninguna URL si es que antes no se ejecuto una herramienta\"
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
        \"name\": \"tool_test_criterios\",
        \"description\": \"Paso 17 Testing: Crear pruebas\",
        \"workflowId\": \"LNXRGXZqqHkCBccj\"
      },
      \"type\": \"@n8n/n8n-nodes-langchain.toolWorkflow\",
      \"typeVersion\": 1.1,
      \"position\": [
        0,
        784
      ],
      \"id\": \"a42db258-32eb-4488-8fbb-f5d4add6e8dc\",
      \"name\": \"19. Test: Criterios\"
    }
  ],
  \"connections\": {
    \"19. Test: Criterios\": {
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

[← Prompt 087](/04-orquestacion-productiva/087/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 089 →](/04-orquestacion-productiva/089/)
{% endraw %}
