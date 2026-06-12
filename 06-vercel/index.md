---
layout: default
title: Vercel para el frontend
nav_order: 7
has_children: true
permalink: /06-vercel/
---

# Vercel para el frontend
{: .no_toc }

Migración del frontend Next.js desde Azure Static Web Apps hacia la plataforma Vercel durante el tercer sprint del proyecto, motivada por los tiempos de despliegue superiores a siete minutos del plan gratuito de Azure Static Web Apps. La migración redujo el tiempo de despliegue a aproximadamente noventa segundos por iteración.
{: .fs-5 .fw-300 }

**Total de prompts en esta sección: 34**

| # | Vista previa | Caracteres |
|---:|---|---:|
| 001 | [puedo con un pipeline de azure desplegar en vercel?](001/) | 51 |
| 002 | [Las variables secretas las manejo en keyvalues, ademas dime como agrego esa extension paso...](002/) | 97 |
| 003 | [Este es mi pipeline actual en mi frontend:     name: Azure Static Web Apps CI/CD     pr:...](003/) | 8,807 |
| 004 | [Ya cree el azure-pipelines-frontend.yml ahora me falta hacer todo el marketplace y demas d...](004/) | 120 |
| 005 | [Ya tengo el Token, que debo crear para el project y teams considerando azure](005/) | 76 |
| 006 | [Asi le hice:     $ vercel link  Vercel CLI 48.11.0  ? Set up “D:\9noSemestre\TESIS 8vo\pol...](006/) | 1,225 |
| 007 | [Este es el project.json:     {"projectId":"prj_YDYhdgLT12EU3Tfp7o0OlAiK66iN","orgId":"team...](007/) | 197 |
| 008 | [Donde agrego a la libreria de devops?](008/) | 37 |
| 009 | [Haber, hagamos un check de todo lo que necesito para ver si ya tengo todo para desplegar c...](009/) | 104 |
| 010 | [Este:     5. PAT en Grupo de VariablesEl secreto VERCEL-TOKEN está Enabled y seleccionado...](010/) | 4,887 |
| 011 | [Si esta en la configuracion de la organizacion, ahora dime donde consigo el nombre exacro...](011/) | 112 |
| 012 | [Parece que no lo tengo](012/) | 22 |
| 013 | [Y como podemos estar seguros lo que azure-static-web-apps-witty-grass-0a0148d10-variable-g...](013/) | 122 |
| 014 | [Parece que no esta marcada, por lo que no se si deberiamos crear otro en libreria para est...](014/) | 112 |
| 015 | [The specified Azure service connection needs to have "Get, List" secret management permiss...](015/) | 240 |
| 016 | [Como lo hago manual porque no funciona](016/) | 38 |
| 017 | [Ahora es con IAM no con acces Policies, como lo hago ahi?](017/) | 57 |
| 018 | [Copio y pego mi client id y no me sale](018/) | 38 |
| 019 | [Listo](019/) | 5 |
| 020 | [# azure-pipelines.yml (Frontend - Next.js adaptado para Vercel)     # 1. Disparadores (Tri...](020/) | 4,594 |
| 021 | [Que pasos externo? ademas ahorita si me aparece en vercel el proyecto, en ese se va a desp...](021/) | 153 |
| 022 | [Por que me aparece en rojo?](022/) | 27 |
| 023 | [/azure-pipelines-frontend.yml (Line: 26, Col: 1): Unexpected value '  - group'        # az...](023/) | 4,575 |
| 024 | [Encountered error(s) while parsing pipeline YAML:  /azure-pipelines-frontend.yml (Line: 26...](024/) | 158 |
| 025 | [A task is missing. The pipeline references a task called 'vercel-deployment-task' with ver...](025/) | 194 |
| 026 | [2025-11-27T05:14:24.0033594Z ##[section]Starting: Desplegar a Vercel  2025-11-27T05:14:24....](026/) | 5,114 |
| 027 | [Con esto me conecto al cloud shell: ssh usuario@20.80.88.96 no lo puedo hacer en el cloud...](027/) | 96 |
| 028 | [solo te mencionaba que mi usuario administrador es: usuario](028/) | 59 |
| 029 | [2025-11-27T05:19:29.9902824Z ##[section]Starting: Desplegar a Vercel  2025-11-27T05:19:29....](029/) | 6,259 |
| 030 | [voy a intentar con useSudo](030/) | 26 |
| 031 | [2025-11-27T05:24:38.3140665Z ##[section]Starting: Compilar proyecto (npm run build)  2025-...](031/) | 3,173 |
| 032 | [2025-11-27T05:34:15.1741458Z ##[debug]Evaluating condition for step: 'Desplegar a Vercel'...](032/) | 17,407 |
| 033 | [usuario@vm-agent-linux:~$ sudo chown -R usuario /usr/bin  [sudo] password for usuario:   u...](033/) | 230 |
| 034 | [2025-11-27T05:44:32.9435634Z ##[section]Starting: Desplegar a Vercel  2025-11-27T05:44:32....](034/) | 3,015 |

---

Fuente original: `gemini_4_vercel.json`.
