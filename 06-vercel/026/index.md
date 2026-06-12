---
layout: default
title: '026. 2025-11-27T05:14:24.0033594Z ##[section]Starting: Desplegar a Ver…'
parent: Vercel para el frontend
nav_order: 26
permalink: /06-vercel/026/
---

{% raw %}

# Prompt 026
{: .no_toc }

**Sección:** Vercel para el frontend &middot; **Longitud:** 5,114 caracteres &middot; **Posición en la conversación:** 26 de 34

---

```
2025-11-27T05:14:24.0033594Z ##[section]Starting: Desplegar a Vercel

2025-11-27T05:14:24.0068810Z ==============================================================================

2025-11-27T05:14:24.0079702Z Task : Vercel Deployment Task

2025-11-27T05:14:24.0079964Z Description : An Azure Pipelines Task Extension for automatically deploying to Vercel

2025-11-27T05:14:24.0080243Z Version : 3.0.1

2025-11-27T05:14:24.0080506Z Author : Vercel

2025-11-27T05:14:24.0080795Z Help : https://github.com/vercel/vercel-azure-devops-extension

2025-11-27T05:14:24.0081047Z ==============================================================================

2025-11-27T05:14:25.2854031Z Vercel Project Id specified by both `vercelProjectId` input and `VERCEL_PROJECT_ID` environment variable. Input field `vercelProjectId` will be used.

2025-11-27T05:14:25.2883047Z Vercel Team Id specified by both `vercelTeamId` input and `VERCEL_TEAM_ID` environment variable. Input field `vercelTeamId` will be used.

2025-11-27T05:14:25.3011255Z [command]/usr/bin/npm install -g vercel@latest

2025-11-27T05:14:55.1023309Z npm error code EACCES

2025-11-27T05:14:55.1025818Z npm error syscall mkdir

2025-11-27T05:14:55.1026276Z npm error path /usr/lib/node_modules/vercel

2025-11-27T05:14:55.1026501Z npm error errno -13

2025-11-27T05:14:55.1026766Z npm error Error: EACCES: permission denied, mkdir '/usr/lib/node_modules/vercel'

2025-11-27T05:14:55.1027091Z npm error at async mkdir (node:internal/fs/promises:860:10)

2025-11-27T05:14:55.1027419Z npm error at async /usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:624:20

2025-11-27T05:14:55.1027654Z npm error at async Promise.allSettled (index 0)

2025-11-27T05:14:55.1027969Z npm error at async [reifyPackages] (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:325:11)

2025-11-27T05:14:55.1028348Z npm error at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:142:5)

2025-11-27T05:14:55.1028635Z npm error at async Install.exec (/usr/lib/node_modules/npm/lib/commands/install.js:150:5)

2025-11-27T05:14:55.1041264Z npm error at async Npm.exec (/usr/lib/node_modules/npm/lib/npm.js:207:9)

2025-11-27T05:14:55.1041745Z npm error at async module.exports (/usr/lib/node_modules/npm/lib/cli/entry.js:74:5) {

2025-11-27T05:14:55.1042143Z npm error errno: -13,

2025-11-27T05:14:55.1042395Z npm error code: 'EACCES',

2025-11-27T05:14:55.1042645Z npm error syscall: 'mkdir',

2025-11-27T05:14:55.1042890Z npm error path: '/usr/lib/node_modules/vercel'

2025-11-27T05:14:55.1043090Z npm error }

2025-11-27T05:14:55.1043301Z npm error

2025-11-27T05:14:55.1043561Z npm error The operation was rejected by your operating system.

2025-11-27T05:14:55.1043861Z npm error It is likely you do not have the permissions to access this file as the current user

2025-11-27T05:14:55.1044620Z npm error

2025-11-27T05:14:55.1044911Z npm error If you believe this might be a permissions issue, please double-check the

2025-11-27T05:14:55.1045200Z npm error permissions of the file and its containing directories, or try running

2025-11-27T05:14:55.1045470Z npm error the command again as root/Administrator.

2025-11-27T05:14:55.1045792Z npm error A complete log of this run can be found in: /home/usuario/.npm/_logs/2025-11-27T05_14_26_098Z-debug-0.log

2025-11-27T05:14:55.1164850Z ##[error]npm install failed with exit code 243. Error: npm error code EACCES

npm error syscall mkdir

npm error path /usr/lib/node_modules/vercel

npm error errno -13

npm error Error: EACCES: permission denied, mkdir '/usr/lib/node_modules/vercel'

npm error at async mkdir (node:internal/fs/promises:860:10)

npm error at async /usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:624:20

npm error at async Promise.allSettled (index 0)

npm error at async [reifyPackages] (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:325:11)

npm error at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:142:5)

npm error at async Install.exec (/usr/lib/node_modules/npm/lib/commands/install.js:150:5)

npm error at async Npm.exec (/usr/lib/node_modules/npm/lib/npm.js:207:9)

npm error at async module.exports (/usr/lib/node_modules/npm/lib/cli/entry.js:74:5) {

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

npm error A complete log of this run can be found in: /home/usuario/.npm/_logs/2025-11-27T05_14_26_098Z-debug-0.log




2025-11-27T05:14:55.1241708Z ##[section]Finishing: Desplegar a Vercel
```

---

### Navegación

[← Prompt 025](/06-vercel/025/) &middot; [Volver a Vercel para el frontend](/06-vercel/) &middot; [Prompt 027 →](/06-vercel/027/)
{% endraw %}
