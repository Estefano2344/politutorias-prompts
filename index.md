---
layout: home
title: Inicio
nav_order: 1
description: "Compendio de prompts de IA Generativa del componente DevOps del TIC de Politutorías."
permalink: /
---

<div class="pt-hero" markdown="0">
  <span class="pt-badge">Anexo II · Trabajo de Integración Curricular</span>
  <h1>Prompts del Componente DevOps de Politutorías</h1>
  <p class="pt-lead">Compendio público de los prompts de IA Generativa (modelo Gemini 2.5 Flash) que asistieron el desarrollo del componente DevOps y la orquestación de IA agéntica del proyecto Politutorías — Escuela Politécnica Nacional.</p>
  <div class="pt-actions">
    <a href="#secciones" class="btn btn-primary fs-5">Explorar secciones</a>
    <a href="https://github.com/Estefano2344/politutorias-prompts" class="btn fs-5">Ver en GitHub</a>
  </div>
</div>

<div class="pt-stats" markdown="0">
  <div class="pt-stat"><span class="pt-num">253</span><span class="pt-label">Prompts</span></div>
  <div class="pt-stat"><span class="pt-num">8</span><span class="pt-label">Secciones</span></div>
  <div class="pt-stat"><span class="pt-num">1M</span><span class="pt-label">Tokens de contexto</span></div>
  <div class="pt-stat"><span class="pt-num">EPN</span><span class="pt-label">TIC · 2026</span></div>
</div>

## Secciones

<div class="pt-grid" markdown="0">

  <a class="pt-card" href="{{ '/01-migracion-aws/' | relative_url }}">
    <span class="pt-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 13v8"/><path d="m8 17 4-4 4 4"/><path d="M20 16.5A4.5 4.5 0 0 0 17.5 8h-1.26A8 8 0 1 0 4 14.25"/></svg></span>
    <span class="pt-count">64 prompts</span>
    <span class="pt-title">Migración a AWS</span>
    <p>Aprovisionamiento manual y migración integral de los servicios a Amazon Web Services.</p>
  </a>

  <a class="pt-card" href="{{ '/02-poc-n8n-local/' | relative_url }}">
    <span class="pt-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><circle cx="6" cy="12" r="2.5"/><circle cx="18" cy="6" r="2.5"/><circle cx="18" cy="18" r="2.5"/><line x1="8.2" y1="10.8" x2="15.8" y2="7.2"/><line x1="8.2" y1="13.2" x2="15.8" y2="16.8"/></svg></span>
    <span class="pt-count">2 prompts</span>
    <span class="pt-title">PoC n8n local</span>
    <p>Prueba de concepto inicial de orquestación con n8n en entorno local.</p>
  </a>

  <a class="pt-card" href="{{ '/03-agente-supervisor/' | relative_url }}">
    <span class="pt-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="4" y="8" width="16" height="11" rx="2"/><path d="M12 4v4"/><circle cx="12" cy="3" r="1"/><path d="M9 13h.01"/><path d="M15 13h.01"/><path d="M9.5 16.5a3 3 0 0 0 5 0"/></svg></span>
    <span class="pt-count">3 prompts</span>
    <span class="pt-title">Agente supervisor</span>
    <p>Diseño del agente supervisor que integra Gemini dentro de n8n.</p>
  </a>

  <a class="pt-card" href="{{ '/04-orquestacion-productiva/' | relative_url }}">
    <span class="pt-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="m12 2 9 5-9 5-9-5 9-5Z"/><path d="m3 12 9 5 9-5"/><path d="m3 17 9 5 9-5"/></svg></span>
    <span class="pt-count">103 prompts</span>
    <span class="pt-title">Orquestación n8n productiva</span>
    <p>Despliegue productivo del orquestador de IA agéntica con n8n.</p>
  </a>

  <a class="pt-card" href="{{ '/05-fedora-local/' | relative_url }}">
    <span class="pt-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="m7 9 3 3-3 3"/><line x1="13" y1="15" x2="17" y2="15"/></svg></span>
    <span class="pt-count">18 prompts</span>
    <span class="pt-title">FEDORA Local</span>
    <p>Configuración y troubleshooting del entorno de desarrollo sobre Fedora.</p>
  </a>

  <a class="pt-card" href="{{ '/06-vercel/' | relative_url }}">
    <span class="pt-icon"><svg viewBox="0 0 24 24" fill="currentColor" stroke="none"><path d="M12 4 22 20H2Z"/></svg></span>
    <span class="pt-count">34 prompts</span>
    <span class="pt-title">Vercel para el frontend</span>
    <p>Despliegue del frontend en Vercel y pipelines de Azure DevOps.</p>
  </a>

  <a class="pt-card" href="{{ '/07-tesis-devops/' | relative_url }}">
    <span class="pt-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M14 3H6a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"/><path d="M14 3v6h6"/><line x1="9" y1="13" x2="15" y2="13"/><line x1="9" y1="17" x2="15" y2="17"/></svg></span>
    <span class="pt-count">24 prompts</span>
    <span class="pt-title">Redacción TIC DevOps</span>
    <p>Redacción y documentación del Trabajo de Integración Curricular.</p>
  </a>

  <a class="pt-card" href="{{ '/08-ensayo-devops/' | relative_url }}">
    <span class="pt-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2Z"/></svg></span>
    <span class="pt-count">5 prompts</span>
    <span class="pt-title">Ensayo DevOps</span>
    <p>Ensayo argumentativo sobre DevOps asistido por IA Generativa.</p>
  </a>

</div>

**Total acumulado: 253 prompts** distribuidos en 8 secciones temáticas. Usa el **buscador** de la barra superior o la **navegación lateral** para llegar a cualquier prompt.

---

## Propósito

Este sitio constituye el **Anexo II** del Trabajo de Integración Curricular titulado *"Acelerando el desarrollo ágil de software con IA: DevOps y orquestación de IA agéntica"*. Documenta el conjunto completo de prompts dirigidos al modelo Gemini 2.5 Flash durante el desarrollo del componente DevOps: configuración inicial sobre Microsoft Azure, prueba de concepto de orquestación con n8n, migración integral a Amazon Web Services y despliegue productivo del orquestador agéntico.

La publicación de los prompts cumple dos objetivos. Documentar la frontera operativa entre las tareas que se automatizaron con asistencia de IA Generativa y las tareas que se mantuvieron bajo supervisión humana estricta. Ofrecer una referencia reproducible para futuros estudiantes y profesionales que adopten un enfoque DevOps asistido por IA Generativa en sus propios proyectos.

## Cómo usar este sitio

La navegación lateral lista las ocho secciones temáticas. Cada sección agrupa los prompts en orden cronológico de la conversación original con Gemini, conserva el texto exacto que el desarrollador del componente DevOps envió al modelo y añade una breve descripción de la intención de cada prompt.

El buscador integrado, accesible mediante la barra superior, permite localizar prompts por palabras clave (por ejemplo: *RDS*, *Elastic Beanstalk*, *ngrok*, *nip.io*, *Gemini*, *máquina de estados*, *Vercel*, *Fedora*).

## Acerca del Trabajo de Integración Curricular

| Campo | Valor |
|---|---|
| Estudiante | Estefano Mateo Proaño Ingavelez |
| Director | Prof. Julio César Sandobalín Guamán |
| Facultad | Ingeniería de Sistemas, Escuela Politécnica Nacional |
| Carrera | Software |
| Componente | DevOps y orquestación de IA agéntica |
| Producto | Politutorías |
