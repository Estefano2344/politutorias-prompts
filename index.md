---
layout: home
title: Inicio
nav_order: 1
description: "Compendio de prompts de IA Generativa del componente DevOps del TIC de Politutorías."
permalink: /
---

# Prompts del Componente DevOps de Politutorías
{: .fs-9 }

Compendio público de los prompts de IA Generativa (modelo Gemini 2.5 Flash) que asistieron el desarrollo del componente DevOps y orquestación de IA agéntica del proyecto Politutorías, Trabajo de Integración Curricular de la Escuela Politécnica Nacional.
{: .fs-6 .fw-300 }

[Explorar prompts](#secciones){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Ver en GitHub](https://github.com/Estefano2344/politutorias-prompts){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Propósito

Este sitio constituye el **Anexo II** del Trabajo de Integración Curricular titulado *"Acelerando el desarrollo ágil de software con IA: DevOps y orquestación de IA agéntica"*. Documenta el conjunto completo de prompts dirigidos al modelo Gemini 2.5 Flash durante las cuatro fases del desarrollo del componente: configuración inicial sobre Microsoft Azure, prueba de concepto de orquestación con n8n, migración integral a Amazon Web Services y despliegue productivo del orquestador agéntico.

La publicación de los prompts cumple dos objetivos. Documentar la frontera operativa entre las tareas que se automatizaron con asistencia de IA Generativa y las tareas que se mantuvieron bajo supervisión humana estricta. Ofrecer una referencia reproducible para futuros estudiantes y profesionales que adopten un enfoque DevOps asistido por IA Generativa en sus propios proyectos.

## Secciones

| Sección | Conversación | Prompts |
|---|---|---:|
| [Migración a AWS](/01-migracion-aws/) | `gemini_migracion_aws_prompts` | 64 |
| [PoC n8n local](/02-poc-n8n-local/) | `gemini_2_n8n_poc` | 2 |
| [Agente supervisor](/03-agente-supervisor/) | `gemini_6_supervidor_tesis` | 3 |
| [Orquestación n8n productiva](/04-orquestacion-productiva/) | `gemini_9_orquestacion` | 103 |
| [FEDORA Local](/05-fedora-local/) | `gemini_3_fedora_local` | 18 |
| [Vercel para el frontend](/06-vercel/) | `gemini_4_vercel` | 34 |
| [Redacción TIC DevOps](/07-tesis-devops/) | `gemini_5_tesis_devops` | 24 |
| [Ensayo DevOps](/08-ensayo-devops/) | `gemini_7_ensayo_devops` | 5 |

**Total acumulado: 253 prompts** distribuidos en 8 secciones temáticas.

---

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
