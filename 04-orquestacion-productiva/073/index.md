---
layout: default
title: '073. pero dime en que parte modifico de esto: // NODO: Preparar PDFs y…'
parent: Orquestación n8n productiva
nav_order: 73
permalink: /04-orquestacion-productiva/073/
---

{% raw %}

# Prompt 073
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 9,088 caracteres &middot; **Posición en la conversación:** 73 de 103

---

```
pero dime en que parte modifico de esto:

// NODO: Preparar PDFs y contexto para Gemini

const items = $input.all();
const jsonInputs = items[0].json;

// 1. OBTENER DATOS DEL FORMULARIO
const objetivoSprint = jsonInputs[\"Objetivo del Sprint\"];
const tipoPrueba = jsonInputs[\"Tipo de Prueba\"] || \"Prueba de Usuario\";

if (!objetivoSprint) {
  throw new Error(\" Falta el objetivo del sprint.\");
}

// 2. OBTENER LOS PDFs DEL JSON
const pdfEstudiante = jsonInputs[\"Transcripción Evaluación Estudiante\"];
const pdfTutor = jsonInputs[\"Transcripción Evaluación Tutor\"];

if (!pdfEstudiante && !pdfTutor) {
  throw new Error(\" No se encontraron PDFs subidos.\");
}

console.log(\"📋 Datos del formulario:\", {
  objetivo: objetivoSprint,
  tipo: tipoPrueba,
  archivosEstudiante: pdfEstudiante?.length || 0,
  archivosTutor: pdfTutor?.length || 0
});

// 3. CONSTRUIR PROMPT DEL SISTEMA
const systemPrompt = `Eres un experto en Diseño Centrado en el Usuario (DCU) especializado en análisis de pruebas de usabilidad y extracción de insights accionables siguiendo metodologías de UX Research.

---

## CONTEXTO DEL PROYECTO

**Objetivo del Sprint:** ${objetivoSprint}

**Tipo de Prueba Realizada:** ${tipoPrueba}

**Transcripciones Adjuntas:**
A continuación se adjuntan los PDFs con las transcripciones de las entrevistas de usuario. Pueden ser:
- Múltiples PDFs de usuarios estudiantes/buscadores
- Múltiples PDFs de usuarios tutores/ofertantes

Analiza TODOS los documentos adjuntos.

---

## TU TAREA

Analiza TODOS los PDFs adjuntos y extrae:

### PASO 1: IDENTIFICACIÓN DE PROBLEMAS DE USABILIDAD

Identifica y documenta TODOS los problemas de usabilidad mencionados por los usuarios.

**Formato requerido:**

## PROBLEMAS DE USABILIDAD IDENTIFICADOS

### Problema 1: [Título descriptivo del problema]
**Severidad:** [Crítica/Alta/Media/Baja]
**Usuario afectado:** [Estudiante/Tutor/Ambos]
**Descripción:** [Descripción detallada del problema]
**Cita textual:** \"[Fragmento de la transcripción que evidencia el problema]\"
**Impacto:** [Cómo afecta la experiencia del usuario]

[Repetir para cada problema identificado]

---

### PASO 2: FEEDBACK ESPECÍFICO SOBRE EL PROTOTIPO

Documenta el feedback positivo y negativo sobre características específicas.

**Formato requerido:**

## FEEDBACK SOBRE EL PROTOTIPO

### Aspectos Positivos
- **[Característica]:** [Comentario del usuario]
- [Repetir...]

### Aspectos a Mejorar
- **[Característica]:** [Comentario del usuario]
- [Repetir...]

### Sugerencias de los Usuarios
- [Sugerencia 1]
- [Sugerencia 2]

---

### PASO 3: EXTRACCIÓN DE NUEVAS HISTORIAS DE USUARIO E ISSUES

Identifica nuevas funcionalidades solicitadas o necesidades expresadas.

**Formato requerido:**

## NUEVAS HISTORIAS DE USUARIO E ISSUES

### Historias de Usuario:

#### Formato Completo (cuando hay suficiente información):
**HU-001: [Título descriptivo de la funcionalidad]**
**Como** [tipo de usuario]
**Quiero** [acción/funcionalidad]
**Para** [beneficio/objetivo]

#### Formato Simplificado (cuando solo se identifica la necesidad):
**HU-002: [Título descriptivo]**
**Descripción breve:** [1-2 líneas explicando la necesidad identificada]

### Issues/Bugs Identificados:

## ISSUES/BUGS IDENTIFICADOS

### Issue #1: [Título del bug/problema]
**Severidad:** [Crítica/Alta/Media/Baja]
**Usuario reportante:** [Estudiante/Tutor]
**Descripción:** [Qué está fallando]
**Pasos para reproducir:** [Si aplica]
**Comportamiento esperado:** [Cómo debería funcionar]

---

### PASO 4: RECOMENDACIONES DE MEJORA

Proporciona recomendaciones priorizadas basadas en los hallazgos.

**Formato requerido:**

## RECOMENDACIONES DE MEJORA

### Prioridad Alta (Críticas)
1. **[Título de recomendación]**
   - **Problema que resuelve:** [Descripción]
   - **Acción sugerida:** [Qué hacer]
   - **Impacto esperado:** [Beneficio]

### Prioridad Media (Importantes)
[Mismo formato]

### Prioridad Baja (Mejoras incrementales)
[Mismo formato]

---

### PASO 5: ANÁLISIS DE PATRONES Y TENDENCIAS

Identifica patrones recurrentes en el comportamiento o feedback.

**Formato requerido:**

## PATRONES Y TENDENCIAS OBSERVADAS

### Patrón 1: [Nombre del patrón]
**Frecuencia:** [Mencionado por X usuarios]
**Descripción:** [Qué patrón se observó]
**Implicaciones:** [Qué significa para el diseño]

---

### PASO 6: CITAS TEXTUALES DESTACADAS

Extrae las citas más reveladoras de los usuarios.

**Formato requerido:**

## CITAS TEXTUALES DESTACADAS

> \"[Cita textual del usuario]\"
> — [Tipo de usuario: Estudiante/Tutor, Documento X]

[Incluir 5-8 citas clave]

---

### PASO 7: DECISIÓN DE REDISEÑO

Basándote en la severidad de los problemas encontrados, determina si es necesario regresar al Paso 7 (rediseño).

**Formato requerido:**

## DECISIÓN: ¿REGRESAR AL PASO 7 (REDISEÑO)?

**Decisión:** [SÍ / NO]

**Justificación:**
[Explicación detallada de por qué sí o no basándote en los problemas críticos encontrados]

**Criterios considerados:**
- Cantidad de problemas críticos: [X]
- Problemas que impiden completar tareas core: [SÍ/NO]
- Feedback negativo recurrente: [Descripción]
- Nivel de frustración de usuarios: [Alto/Medio/Bajo]

**Si la respuesta es SÍ, temáticas sugeridas para el siguiente Sprint:**
1. [Temática 1]
2. [Temática 2]
3. [Temática 3]

---

## INSTRUCCIONES FINALES:

1. **Analiza TODOS los PDFs adjuntos** - No dejes ninguno sin revisar
2. **Identifica el rol de cada usuario** - Distingue entre estudiantes y tutores
3. **Sé específico** - Cita fragmentos textuales cuando sea posible
4. **Identifica diferencias** - Si hay diferencias entre roles, documéntalas
5. **Prioriza** - Enfócate en problemas que realmente afectan la experiencia
6. **Sé objetivo** - Basa tus conclusiones en evidencia de las transcripciones
7. **Output en Markdown limpio** - Sin bloques de código (\\`\\`\\`), sin emojis
8. **Profesional** - El análisis debe ser formal y accionable

¡Comienza el análisis ahora!`;

// 4. PROCESAR LOS PDFs DESDE BINARY DATA
const parts = [{ text: systemPrompt }];
const binaryData = items[0].binary;
const pdfList = [];

console.log(\" Binary data disponible:\", Object.keys(binaryData));

// Función auxiliar para buscar binary key
function encontrarBinaryKey(binaryData, pdfInfo, tipoUsuario) {
  const filename = pdfInfo.filename;
  
  // Intentar varias estrategias de búsqueda
  return Object.keys(binaryData).find(key => {
    const bin = binaryData[key];
    
    // Estrategia 1: Match exacto por filename
    if (bin.fileName === filename) return true;
    
    // Estrategia 2: El key contiene el tipo de usuario
    if (key.toLowerCase().includes(tipoUsuario.toLowerCase())) {
      // Y el tamaño coincide (con margen de error)
      if (Math.abs(bin.fileSize - pdfInfo.size) < 1000) return true;
    }
    
    return false;
  });
}

// Procesar PDFs de Estudiante
if (pdfEstudiante && Array.isArray(pdfEstudiante)) {
  for (const pdf of pdfEstudiante) {
    const binaryKey = encontrarBinaryKey(binaryData, pdf, \"Estudiante\");
    
    if (binaryKey && binaryData[binaryKey]) {
      const buffer = await this.helpers.getBinaryDataBuffer(0, binaryKey);
      const base64String = buffer.toString('base64');
      
      parts.push({ 
        inline_data: { 
          mime_type: \"application/pdf\", 
          data: base64String 
        } 
      });
      
      pdfList.push({
        tipo: \"Estudiante\",
        nombre: pdf.filename,
        tamaño: `${Math.round(pdf.size / 1024)} KB`
      });
      
      console.log(` PDF Estudiante: ${pdf.filename} (${Math.round(pdf.size / 1024)} KB)`);
    } else {
      console.warn(` No se encontró binary data para: ${pdf.filename}`);
    }
  }
}

// Procesar PDFs de Tutor
if (pdfTutor && Array.isArray(pdfTutor)) {
  for (const pdf of pdfTutor) {
    const binaryKey = encontrarBinaryKey(binaryData, pdf, \"Tutor\");
    
    if (binaryKey && binaryData[binaryKey]) {
      const buffer = await this.helpers.getBinaryDataBuffer(0, binaryKey);
      const base64String = buffer.toString('base64');
      
      parts.push({ 
        inline_data: { 
          mime_type: \"application/pdf\", 
          data: base64String 
        } 
      });
      
      pdfList.push({
        tipo: \"Tutor\",
        nombre: pdf.filename,
        tamaño: `${Math.round(pdf.size / 1024)} KB`
      });
      
      console.log(` PDF Tutor: ${pdf.filename} (${Math.round(pdf.size / 1024)} KB)`);
    } else {
      console.warn(` No se encontró binary data para: ${pdf.filename}`);
    }
  }
}

const pdfCount = pdfList.length;
console.log(`📊 Total de PDFs preparados: ${pdfCount}`);

if (pdfCount === 0) {
  throw new Error(\" No se pudieron procesar los PDFs. Verifica los archivos subidos.\");
}

// 5. RETORNAR ESTRUCTURA PARA GEMINI
return { 
  json: { 
    geminiBody: { 
      contents: [{ parts: parts }] 
    },
    metadatos: {
      objetivo_sprint: objetivoSprint,
      tipo_prueba: tipoPrueba,
      cantidad_pdfs: pdfCount,
      pdfs_procesados: pdfList,
      fecha_analisis: new Date().toISOString()
    }
  } 
};

Porque son 325 lineas y tu me devolviste solo 87
```

---

### Navegación

[← Prompt 072](/04-orquestacion-productiva/072/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 074 →](/04-orquestacion-productiva/074/)
{% endraw %}
