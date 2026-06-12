---
layout: default
title: '034. 2025-11-27T05:44:32.9435634Z ##[section]Starting: Desplegar a Ver…'
parent: Vercel para el frontend
nav_order: 34
permalink: /06-vercel/034/
---

{% raw %}

# Prompt 034
{: .no_toc }

**Sección:** Vercel para el frontend &middot; **Longitud:** 3,015 caracteres &middot; **Posición en la conversación:** 34 de 34

---

```
2025-11-27T05:44:32.9435634Z ##[section]Starting: Desplegar a Vercel

2025-11-27T05:44:32.9462873Z ==============================================================================

2025-11-27T05:44:32.9463038Z Task : Vercel Deployment Task

2025-11-27T05:44:32.9463113Z Description : An Azure Pipelines Task Extension for automatically deploying to Vercel

2025-11-27T05:44:32.9463200Z Version : 3.0.1

2025-11-27T05:44:32.9463282Z Author : Vercel

2025-11-27T05:44:32.9463415Z Help : https://github.com/vercel/vercel-azure-devops-extension

2025-11-27T05:44:32.9463478Z ==============================================================================

2025-11-27T05:44:34.3046674Z Vercel Project Id specified by both `vercelProjectId` input and `VERCEL_PROJECT_ID` environment variable. Input field `vercelProjectId` will be used.

2025-11-27T05:44:34.3067987Z Vercel Team Id specified by both `vercelTeamId` input and `VERCEL_TEAM_ID` environment variable. Input field `vercelTeamId` will be used.

2025-11-27T05:44:34.3191626Z [command]/usr/bin/npm install -g vercel@latest

2025-11-27T05:45:04.9976449Z

2025-11-27T05:45:04.9978786Z added 257 packages in 30s

2025-11-27T05:45:04.9982433Z

2025-11-27T05:45:04.9983122Z 26 packages are looking for funding

2025-11-27T05:45:04.9983571Z run `npm fund` for details

2025-11-27T05:45:04.9986148Z npm warn deprecated path-match@1.2.4: This package is archived and no longer maintained. For support, visit https://github.com/expressjs/express/discussions

2025-11-27T05:45:05.3711311Z [command]/usr/bin/vercel pull --yes --environment=preview --token=$(VERCEL_TOKEN)

2025-11-27T05:45:06.7590957Z Vercel CLI 48.11.0

2025-11-27T05:45:06.7592386Z > NOTE: The Vercel CLI now collects telemetry regarding usage of the CLI.

2025-11-27T05:45:06.7595103Z > This information is used to shape the CLI roadmap and prioritize features.

2025-11-27T05:45:06.7595568Z > You can learn more, including how to opt-out if you'd not like to participate in this program, by visiting the following URL:

2025-11-27T05:45:06.7596023Z > https://vercel.com/docs/cli/about-telemetry

2025-11-27T05:45:06.7596425Z Error: You defined "--token", but its contents are invalid. Must not contain: "$", "(", ")"

2025-11-27T05:45:06.7596693Z Learn More: https://err.sh/vercel/invalid-token-value

2025-11-27T05:45:06.7649382Z [command]/usr/bin/vercel deploy --token=$(VERCEL_TOKEN) --cwd=/home/usuario/azagent/_work/3/s

2025-11-27T05:45:07.3427564Z Vercel CLI 48.11.0

2025-11-27T05:45:07.3428222Z Error: You defined "--token", but its contents are invalid. Must not contain: "$", "(", ")"

2025-11-27T05:45:07.3432852Z Learn More: https://err.sh/vercel/invalid-token-value

2025-11-27T05:45:07.3521722Z ##[error]vercel deploy failed with exit code 1. Error: Vercel CLI 48.11.0

Error: You defined "--token", but its contents are invalid. Must not contain: "$", "(", ")"

Learn More: https://err.sh/vercel/invalid-token-value




2025-11-27T05:45:07.3592373Z ##[section]Finishing: Desplegar a Vercel
```

---

### Navegación

[← Prompt 033](/06-vercel/033/) &middot; [Volver a Vercel para el frontend](/06-vercel/)
{% endraw %}
