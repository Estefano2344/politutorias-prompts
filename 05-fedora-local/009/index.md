---
layout: default
title: '009. 2025-12-06T17:47:10.4986518Z ##[section]Starting: Desplegar a Ver…'
parent: FEDORA Local
nav_order: 9
permalink: /05-fedora-local/009/
---

{% raw %}

# Prompt 009
{: .no_toc }

**Sección:** FEDORA Local &middot; **Longitud:** 5,290 caracteres &middot; **Posición en la conversación:** 9 de 18

---

```
2025-12-06T17:47:10.4986518Z ##[section]Starting: Desplegar a Vercel

2025-12-06T17:47:10.5009217Z ==============================================================================

2025-12-06T17:47:10.5009399Z Task : Vercel Deployment Task

2025-12-06T17:47:10.5009531Z Description : An Azure Pipelines Task Extension for automatically deploying to Vercel

2025-12-06T17:47:10.5009675Z Version : 3.0.1

2025-12-06T17:47:10.5009803Z Author : Vercel

2025-12-06T17:47:10.5009927Z Help : https://github.com/vercel/vercel-azure-devops-extension

2025-12-06T17:47:10.5010071Z ==============================================================================

2025-12-06T17:47:10.6751592Z Vercel Project Id specified by both `vercelProjectId` input and `VERCEL_PROJECT_ID` environment variable. Input field `vercelProjectId` will be used.

2025-12-06T17:47:10.6758902Z Vercel Team Id specified by both `vercelTeamId` input and `VERCEL_TEAM_ID` environment variable. Input field `vercelTeamId` will be used.

2025-12-06T17:47:10.6762726Z Vercel Token specified by both `vercelToken` input and `VERCEL_TOKEN` environment variable. Input field `vercelToken` will be used.

2025-12-06T17:47:10.6780794Z [command]/usr/bin/npm install -g vercel@latest

2025-12-06T17:47:51.1790679Z npm error code EACCES

2025-12-06T17:47:51.1791714Z npm error syscall mkdir

2025-12-06T17:47:51.1792219Z npm error path /usr/lib/node_modules/vercel

2025-12-06T17:47:51.1793003Z npm error errno -13

2025-12-06T17:47:51.1793381Z npm error Error: EACCES: permission denied, mkdir '/usr/lib/node_modules/vercel'

2025-12-06T17:47:51.1793771Z npm error at async mkdir (node:internal/fs/promises:858:10)

2025-12-06T17:47:51.1794200Z npm error at async /usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:572:20

2025-12-06T17:47:51.1794539Z npm error at async Promise.allSettled (index 0)

2025-12-06T17:47:51.1794988Z npm error at async #reifyPackages (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:309:11)

2025-12-06T17:47:51.1795472Z npm error at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:121:5)

2025-12-06T17:47:51.1795887Z npm error at async Install.exec (/usr/lib/node_modules/npm/lib/commands/install.js:150:5)

2025-12-06T17:47:51.1796250Z npm error at async Npm.exec (/usr/lib/node_modules/npm/lib/npm.js:208:9)

2025-12-06T17:47:51.1796646Z npm error at async module.exports (/usr/lib/node_modules/npm/lib/cli/entry.js:67:5) {

2025-12-06T17:47:51.1796956Z npm error errno: -13,

2025-12-06T17:47:51.1797252Z npm error code: 'EACCES',

2025-12-06T17:47:51.1797562Z npm error syscall: 'mkdir',

2025-12-06T17:47:51.1797884Z npm error path: '/usr/lib/node_modules/vercel'

2025-12-06T17:47:51.1798163Z npm error }

2025-12-06T17:47:51.1798439Z npm error

2025-12-06T17:47:51.1798793Z npm error The operation was rejected by your operating system.

2025-12-06T17:47:51.1799180Z npm error It is likely you do not have the permissions to access this file as the current user

2025-12-06T17:47:51.1799461Z npm error

2025-12-06T17:47:51.1799838Z npm error If you believe this might be a permissions issue, please double-check the

2025-12-06T17:47:51.1800208Z npm error permissions of the file and its containing directories, or try running

2025-12-06T17:47:51.1800544Z npm error the command again as root/Administrator.

2025-12-06T17:47:51.1800982Z npm error A complete log of this run can be found in: /home/laptop-estefano/.npm/_logs/2025-12-06T17_47_14_556Z-debug-0.log

2025-12-06T17:47:51.1842220Z ##[error]npm install failed with exit code 243. Error: npm error code EACCES

npm error syscall mkdir

npm error path /usr/lib/node_modules/vercel

npm error errno -13

npm error Error: EACCES: permission denied, mkdir '/usr/lib/node_modules/vercel'

npm error at async mkdir (node:internal/fs/promises:858:10)

npm error at async /usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:572:20

npm error at async Promise.allSettled (index 0)

npm error at async #reifyPackages (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:309:11)

npm error at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:121:5)

npm error at async Install.exec (/usr/lib/node_modules/npm/lib/commands/install.js:150:5)

npm error at async Npm.exec (/usr/lib/node_modules/npm/lib/npm.js:208:9)

npm error at async module.exports (/usr/lib/node_modules/npm/lib/cli/entry.js:67:5) {

npm error errno: -13,

npm error code: 'EACCES',

npm error syscall: 'mkdir',

npm error path: '/usr/lib/node_modules/vercel'

npm error }

npm error

npm error The operation was rejected by your operating system.

npm error It is likely you do not have the permissions to access this file as the current user

npm error

npm error If you believe this might be a permissions issue, please double-check the

npm error permissions of the file and its containing directories, or try running

npm error the command again as root/Administrator.

npm error A complete log of this run can be found in: /home/laptop-estefano/.npm/_logs/2025-12-06T17_47_14_556Z-debug-0.log




2025-12-06T17:47:51.1883365Z ##[section]Finishing: Desplegar a Vercel
```

---

### Navegación

[← Prompt 008](/05-fedora-local/008/) &middot; [Volver a FEDORA Local](/05-fedora-local/) &middot; [Prompt 010 →](/05-fedora-local/010/)
{% endraw %}
