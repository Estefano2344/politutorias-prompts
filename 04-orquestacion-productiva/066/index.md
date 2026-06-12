---
layout: default
title: '066. El problema esta en split protocols { ''nodes'': [ { ''parameters''..…'
parent: Orquestación n8n productiva
nav_order: 66
permalink: /04-orquestacion-productiva/066/
---

{% raw %}

# Prompt 066
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 5,260 caracteres &middot; **Posición en la conversación:** 66 de 103

---

```
El problema esta en split protocols

{
  \"nodes\": [
    {
      \"parameters\": {
        \"jsCode\": \"// NODO: Split Protocolos (VERSIÓN MEJORADA Y ROBUSTA)\\n\\nconst textoCompleto = $json.protocolos_completos;\\n\\n// Validación inicial\\nif (!textoCompleto || textoCompleto.length < 500) {\\n  throw new Error('El texto de protocolos está vacío o es demasiado corto. Verifica el output del AI Agent.');\\n}\\n\\n// Regex que captura diferentes nombres de roles\\nconst regexProtocolo = /^#\\\\s+Protocolo de Evaluación de Usuario\\\\s*[-–—]\\\\s*(.+?)$/gim;\\n\\n// Encontrar todos los protocolos\\nconst matches = [...textoCompleto.matchAll(regexProtocolo)];\\n\\nconsole.log(` Protocolos encontrados: ${matches.length}`);\\n\\nif (matches.length === 0) {\\n  throw new Error(' No se encontró ningún protocolo con el formato esperado. Verifica que el AI Agent esté generando los encabezados correctos.');\\n}\\n\\nif (matches.length === 1) {\\n  console.warn(' Solo se encontró UN protocolo. Se esperaban dos (uno por cada rol).');\\n}\\n\\n// Extraer los protocolos\\nconst protocolos = [];\\n\\nfor (let i = 0; i < matches.length; i++) {\\n  const match = matches[i];\\n  const inicioProtocolo = match.index;\\n  const finProtocolo = matches[i + 1]?.index || textoCompleto.length;\\n  \\n  const contenidoProtocolo = textoCompleto.substring(inicioProtocolo, finProtocolo).trim();\\n  const nombreRol = match[1].trim(); // Captura el nombre del rol (Estudiante, Tutor, etc.)\\n  \\n  // Validar que el protocolo tiene contenido mínimo\\n  if (contenidoProtocolo.length < 1000) {\\n    throw new Error(` El protocolo \\\"${nombreRol}\\\" es demasiado corto (${contenidoProtocolo.length} caracteres). Probablemente el AI Agent no generó el contenido completo.`);\\n  }\\n  \\n  // Validar secciones requeridas\\n  const seccionesRequeridas = [\\n    'OBJETIVO',\\n    'RECLUTAR PARTICIPANTES',\\n    'ESCENARIO',\\n    'TAREAS',\\n    'VARIABLES POR MEDIR',\\n    'PROTOCOLO DE EJECUCIÓN'\\n  ];\\n  \\n  const seccionesFaltantes = seccionesRequeridas.filter(seccion => \\n    !contenidoProtocolo.toUpperCase().includes(seccion)\\n  );\\n  \\n  if (seccionesFaltantes.length > 0) {\\n    console.warn(` Advertencia: El protocolo \\\"${nombreRol}\\\" no contiene las siguientes secciones: ${seccionesFaltantes.join(', ')}`);\\n  }\\n  \\n  // Detectar el tipo de rol\\n  const nombreRolLower = nombreRol.toLowerCase();\\n  let tipoRol = 'desconocido';\\n  \\n  if (nombreRolLower.includes('estudiante') || nombreRolLower.includes('alumno') || nombreRolLower.includes('buscador')) {\\n    tipoRol = 'estudiante';\\n  } else if (nombreRolLower.includes('tutor') || nombreRolLower.includes('profesor') || nombreRolLower.includes('ofertante')) {\\n    tipoRol = 'tutor';\\n  } else {\\n    console.warn(`No se pudo clasificar automáticamente el rol \\\"${nombreRol}\\\". Se usará como tipo: ${i === 0 ? 'rol1' : 'rol2'}`);\\n    tipoRol = i === 0 ? 'rol1' : 'rol2';\\n  }\\n  \\n  // Generar nombre de archivo seguro\\n  const nombreArchivo = nombreRol\\n    .replace(/[^a-zA-Z0-9\\\\s]/g, '') // Elimina caracteres especiales\\n    .replace(/\\\\s+/g, '_') // Reemplaza espacios con guiones bajos\\n    .substring(0, 50); // Limita longitud\\n  \\n  protocolos.push({\\n    json: {\\n      tipo: tipoRol,\\n      rol_nombre: nombreRol,\\n      protocolo_markdown: contenidoProtocolo,\\n      titulo: `Protocolo_Evaluacion_${nombreArchivo}`,\\n      longitud: contenidoProtocolo.length,\\n      secciones_faltantes: seccionesFaltantes,\\n      es_valido: seccionesFaltantes.length === 0,\\n      // Metadata útil\\n      primer_linea: contenidoProtocolo.split('\\\\n')[0],\\n      numero_lineas: contenidoProtocolo.split('\\\\n').length\\n    }\\n  });\\n}\\n\\n// Si solo encontró un protocolo, duplicarlo con advertencia\\nif (protocolos.length === 1) {\\n  console.warn('Solo se generó un protocolo. Duplicando con advertencia...');\\n  protocolos.push({\\n    json: {\\n      tipo: 'error',\\n      rol_nombre: 'FALTA_SEGUNDO_PROTOCOLO',\\n      protocolo_markdown: '# ERROR: El AI Agent solo generó un protocolo\\\\n\\\\nSe esperaban dos protocolos (uno por cada tipo de usuario).\\\\n\\\\nPor favor, revisa:\\\\n1. El prompt del AI Agent\\\\n2. Las imágenes adjuntas\\\\n3. El objetivo del sprint\\\\n\\\\nY vuelve a ejecutar el flujo.',\\n      titulo: 'ERROR_Falta_Segundo_Protocolo',\\n      longitud: 0,\\n      secciones_faltantes: [],\\n      es_valido: false\\n    }\\n  });\\n}\\n\\n// Log resumen\\nconsole.log('\\\\n Resumen de protocolos separados:');\\nprotocolos.forEach((p, i) => {\\n  console.log(`   ${i + 1}. ${p.json.rol_nombre} (${p.json.longitud} caracteres) - Válido: ${p.json.es_valido}`);\\n});\\n\\nreturn protocolos;\\n\"
      },
      \"type\": \"n8n-nodes-base.code\",
      \"typeVersion\": 2,
      \"position\": [
        -1888,
        -96
      ],
      \"id\": \"a4a0d9da-fb15-42e0-98d8-c874f52584fe\",
      \"name\": \"Split Protocolos\"
    }
  ],
  \"connections\": {
    \"Split Protocolos\": {
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
```

---

### Navegación

[← Prompt 065](/04-orquestacion-productiva/065/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 067 →](/04-orquestacion-productiva/067/)
{% endraw %}
