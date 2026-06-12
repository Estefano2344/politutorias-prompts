---
layout: default
title: '029. 2025-11-27T05:19:29.9902824Z ##[section]Starting: Desplegar a Ver…'
parent: Vercel para el frontend
nav_order: 29
permalink: /06-vercel/029/
---

{% raw %}

# Prompt 029
{: .no_toc }

**Sección:** Vercel para el frontend &middot; **Longitud:** 6,259 caracteres &middot; **Posición en la conversación:** 29 de 34

---

```
2025-11-27T05:19:29.9902824Z ##[section]Starting: Desplegar a Vercel

2025-11-27T05:19:29.9935397Z ==============================================================================

2025-11-27T05:19:29.9935746Z Task : Vercel Deployment Task

2025-11-27T05:19:29.9935994Z Description : An Azure Pipelines Task Extension for automatically deploying to Vercel

2025-11-27T05:19:29.9936267Z Version : 3.0.1

2025-11-27T05:19:29.9936507Z Author : Vercel

2025-11-27T05:19:29.9937189Z Help : https://github.com/vercel/vercel-azure-devops-extension

2025-11-27T05:19:29.9937987Z ==============================================================================

2025-11-27T05:19:31.1290283Z Vercel Project Id specified by both `vercelProjectId` input and `VERCEL_PROJECT_ID` environment variable. Input field `vercelProjectId` will be used.

2025-11-27T05:19:31.1292507Z Vercel Team Id specified by both `vercelTeamId` input and `VERCEL_TEAM_ID` environment variable. Input field `vercelTeamId` will be used.

2025-11-27T05:19:32.0911280Z [command]/usr/bin/npm install -g vercel@latest

2025-11-27T05:19:53.9188055Z npm warn deprecated path-match@1.2.4: This package is archived and no longer maintained. For support, visit https://github.com/expressjs/express/discussions

2025-11-27T05:19:53.9192290Z npm error code EACCES

2025-11-27T05:19:53.9193053Z npm error syscall symlink

2025-11-27T05:19:53.9196203Z npm error path ../lib/node_modules/vercel/dist/vc.js

2025-11-27T05:19:53.9196651Z npm error dest /usr/bin/vc

2025-11-27T05:19:53.9197321Z npm error errno -13

2025-11-27T05:19:53.9219333Z npm error Error: EACCES: permission denied, symlink '../lib/node_modules/vercel/dist/vc.js' -> '/usr/bin/vc'

2025-11-27T05:19:53.9220135Z npm error at async symlink (node:internal/fs/promises:1008:10)

2025-11-27T05:19:53.9220398Z npm error at async Promise.all (index 0)

2025-11-27T05:19:53.9220677Z npm error at async Promise.all (index 0)

2025-11-27T05:19:53.9221043Z npm error at async #createBinLinks (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:394:5)

2025-11-27T05:19:53.9221311Z npm error at async Promise.allSettled (index 0)

2025-11-27T05:19:53.9221645Z npm error at async #linkAllBins (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:375:5)

2025-11-27T05:19:53.9221991Z npm error at async #build (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:160:7)

2025-11-27T05:19:53.9222537Z npm error at async Arborist.rebuild (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:62:5)

2025-11-27T05:19:53.9222893Z npm error at async [reifyPackages] (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:325:11)

2025-11-27T05:19:53.9223402Z npm error at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:142:5) {

2025-11-27T05:19:53.9224159Z npm error errno: -13,

2025-11-27T05:19:53.9224402Z npm error code: 'EACCES',

2025-11-27T05:19:53.9224608Z npm error syscall: 'symlink',

2025-11-27T05:19:53.9224858Z npm error path: '../lib/node_modules/vercel/dist/vc.js',

2025-11-27T05:19:53.9225082Z npm error dest: '/usr/bin/vc'

2025-11-27T05:19:53.9225285Z npm error }

2025-11-27T05:19:53.9225469Z npm error

2025-11-27T05:19:53.9225726Z npm error The operation was rejected by your operating system.

2025-11-27T05:19:53.9226004Z npm error It is likely you do not have the permissions to access this file as the current user

2025-11-27T05:19:53.9226196Z npm error

2025-11-27T05:19:53.9226471Z npm error If you believe this might be a permissions issue, please double-check the

2025-11-27T05:19:53.9226732Z npm error permissions of the file and its containing directories, or try running

2025-11-27T05:19:53.9227251Z npm error the command again as root/Administrator.

2025-11-27T05:19:53.9227604Z npm error A complete log of this run can be found in: /home/usuario/.npm/_logs/2025-11-27T05_19_31_222Z-debug-0.log

2025-11-27T05:19:53.9330604Z ##[error]npm install failed with exit code 243. Error: npm warn deprecated path-match@1.2.4: This package is archived and no longer maintained. For support, visit https://github.com/expressjs/express/discussions

npm error code EACCES

npm error syscall symlink

npm error path ../lib/node_modules/vercel/dist/vc.js

npm error dest /usr/bin/vc

npm error errno -13

npm error Error: EACCES: permission denied, symlink '../lib/node_modules/vercel/dist/vc.js' -> '/usr/bin/vc'

npm error at async symlink (node:internal/fs/promises:1008:10)

npm error at async Promise.all (index 0)

npm error at async Promise.all (index 0)

npm error at async #createBinLinks (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:394:5)

npm error at async Promise.allSettled (index 0)

npm error at async #linkAllBins (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:375:5)

npm error at async #build (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:160:7)

npm error at async Arborist.rebuild (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:62:5)

npm error at async [reifyPackages] (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:325:11)

npm error at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:142:5) {

npm error errno: -13,

npm error code: 'EACCES',

npm error syscall: 'symlink',

npm error path: '../lib/node_modules/vercel/dist/vc.js',

npm error dest: '/usr/bin/vc'

npm error }

npm error

npm error The operation was rejected by your operating system.

npm error It is likely you do not have the permissions to access this file as the current user

npm error

npm error If you believe this might be a permissions issue, please double-check the

npm error permissions of the file and its containing directories, or try running

npm error the command again as root/Administrator.

npm error A complete log of this run can be found in: /home/usuario/.npm/_logs/2025-11-27T05_19_31_222Z-debug-0.log




2025-11-27T05:19:53.9390966Z ##[section]Finishing: Desplegar a Vercel




Use solo la solucion manual
```

---

### Navegación

[← Prompt 028](/06-vercel/028/) &middot; [Volver a Vercel para el frontend](/06-vercel/) &middot; [Prompt 030 →](/06-vercel/030/)
{% endraw %}
