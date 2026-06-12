---
layout: default
title: '032. 2025-11-27T05:34:15.1741458Z ##[debug]Evaluating condition for st…'
parent: Vercel para el frontend
nav_order: 32
permalink: /06-vercel/032/
---

{% raw %}

# Prompt 032
{: .no_toc }

**Sección:** Vercel para el frontend &middot; **Longitud:** 17,407 caracteres &middot; **Posición en la conversación:** 32 de 34

---

```
2025-11-27T05:34:15.1741458Z ##[debug]Evaluating condition for step: 'Desplegar a Vercel'

2025-11-27T05:34:15.1744407Z ##[debug]Evaluating: SucceededNode()

2025-11-27T05:34:15.1746899Z ##[debug]Evaluating SucceededNode:

2025-11-27T05:34:15.1749830Z ##[debug]=> True

2025-11-27T05:34:15.1750983Z ##[debug]Result: True

2025-11-27T05:34:15.1754212Z ##[section]Starting: Desplegar a Vercel

2025-11-27T05:34:15.1783792Z ==============================================================================

2025-11-27T05:34:15.1784203Z Task : Vercel Deployment Task

2025-11-27T05:34:15.1784520Z Description : An Azure Pipelines Task Extension for automatically deploying to Vercel

2025-11-27T05:34:15.1784856Z Version : 3.0.1

2025-11-27T05:34:15.1785176Z Author : Vercel

2025-11-27T05:34:15.1785507Z Help : https://github.com/vercel/vercel-azure-devops-extension

2025-11-27T05:34:15.1785836Z ==============================================================================

2025-11-27T05:34:16.2302034Z ##[debug]Using node path: /home/usuario/azagent/externals/node20_1/bin/node

2025-11-27T05:34:16.4313256Z ##[debug]agent.TempDirectory=/home/usuario/azagent/_work/_temp

2025-11-27T05:34:16.4330705Z ##[debug]loading inputs and endpoints

2025-11-27T05:34:16.4336989Z ##[debug]loading INPUT_VERCELPROJECTID

2025-11-27T05:34:16.4369075Z ##[debug]loading INPUT_VERCELTEAMID

2025-11-27T05:34:16.4379141Z ##[debug]loading INPUT_VERCELTOKEN

2025-11-27T05:34:16.4392368Z ##[debug]loading INPUT_PRODUCTION

2025-11-27T05:34:16.4396816Z ##[debug]loading INPUT_USESUDO

2025-11-27T05:34:16.4402623Z ##[debug]loading INPUT_PATH

2025-11-27T05:34:16.4420860Z ##[debug]loading INPUT_ENVIRONMENT

2025-11-27T05:34:16.4424406Z ##[debug]loading ENDPOINT_AUTH_SYSTEMVSSCONNECTION

2025-11-27T05:34:16.4428693Z ##[debug]loading ENDPOINT_AUTH_SCHEME_SYSTEMVSSCONNECTION

2025-11-27T05:34:16.4430851Z ##[debug]loading ENDPOINT_AUTH_PARAMETER_SYSTEMVSSCONNECTION_ACCESSTOKEN

2025-11-27T05:34:16.4451792Z ##[debug]loading SECRET_DB-HOST

2025-11-27T05:34:16.4462031Z ##[debug]loading SECRET_VERCEL-TOKEN

2025-11-27T05:34:16.4471418Z ##[debug]loading SECRET_DB-NAME

2025-11-27T05:34:16.4479536Z ##[debug]loading SECRET_DB-PASSWORD

2025-11-27T05:34:16.4489691Z ##[debug]loading SECRET_AZURE-STORAGE-CONNECTION-STRING

2025-11-27T05:34:16.4497444Z ##[debug]loading SECRET_DB-USERNAME

2025-11-27T05:34:16.4505840Z ##[debug]loading SECRET_JWT-SECRET

2025-11-27T05:34:16.4512968Z ##[debug]loading SECRET_DB-PORT

2025-11-27T05:34:16.4520088Z ##[debug]loading SECRET_JWT-REFRESH-SECRET

2025-11-27T05:34:16.4526625Z ##[debug]loading SECRET_AZURE-STORAGE-CONTAINER-NAME-OFFERS

2025-11-27T05:34:16.4535700Z ##[debug]loading SECRET_SYSTEM_ACCESSTOKEN

2025-11-27T05:34:16.4544847Z ##[debug]loading SECRET_AZURE-STORAGE-CONTAINER-NAME-PROFILES

2025-11-27T05:34:16.4551669Z ##[debug]loaded 22

2025-11-27T05:34:16.4563156Z ##[debug]Agent.ProxyUrl=undefined

2025-11-27T05:34:16.4569841Z ##[debug]Agent.CAInfo=undefined

2025-11-27T05:34:16.4575521Z ##[debug]Agent.ClientCert=undefined

2025-11-27T05:34:16.4580535Z ##[debug]Agent.SkipCertValidation=undefined

2025-11-27T05:34:16.6289131Z ##[debug]check path : /home/usuario/azagent/_work/_tasks/vercel-deployment-task_7452306c-c0c7-4e93-8691-a364394d1229/3.0.1/task.json

2025-11-27T05:34:16.6300391Z ##[debug]adding resource file: /home/usuario/azagent/_work/_tasks/vercel-deployment-task_7452306c-c0c7-4e93-8691-a364394d1229/3.0.1/task.json

2025-11-27T05:34:16.6306829Z ##[debug]system.culture=en-US

2025-11-27T05:34:16.6321227Z ##[debug]target=undefined

2025-11-27T05:34:16.6328944Z ##[debug]debug=undefined

2025-11-27T05:34:16.6334715Z ##[debug]archive=undefined

2025-11-27T05:34:16.6340193Z ##[debug]env=undefined

2025-11-27T05:34:16.6344484Z ##[debug]buildEnv=undefined

2025-11-27T05:34:16.6349332Z ##[debug]logs=undefined

2025-11-27T05:34:16.6362551Z ##[debug]vercelProjectId=prj_YDYhdgLT12EU3Tfp7o0OlAiK66iN

2025-11-27T05:34:16.6367013Z ##[debug]VERCEL_PROJECT_ID=prj_YDYhdgLT12EU3Tfp7o0OlAiK66iN

2025-11-27T05:34:16.6377193Z Vercel Project Id specified by both `vercelProjectId` input and `VERCEL_PROJECT_ID` environment variable. Input field `vercelProjectId` will be used.

2025-11-27T05:34:16.6387124Z ##[debug]set VERCEL_PROJECT_ID=prj_YDYhdgLT12EU3Tfp7o0OlAiK66iN

2025-11-27T05:34:16.6393400Z ##[debug]Processed: ##vso[task.setvariable variable=VERCEL_PROJECT_ID;isOutput=false;issecret=false;]prj_YDYhdgLT12EU3Tfp7o0OlAiK66iN

2025-11-27T05:34:16.6400347Z ##[debug]vercelTeamId=team_rFjZG0SVqdEif7MINfBqAoiJ

2025-11-27T05:34:16.6410891Z Vercel Team Id specified by both `vercelTeamId` input and `VERCEL_TEAM_ID` environment variable. Input field `vercelTeamId` will be used.

2025-11-27T05:34:16.6412865Z ##[debug]VERCEL_TEAM_ID=team_rFjZG0SVqdEif7MINfBqAoiJ

2025-11-27T05:34:16.6415509Z ##[debug]set VERCEL_TEAM_ID=team_rFjZG0SVqdEif7MINfBqAoiJ

2025-11-27T05:34:16.6418571Z ##[debug]Processed: ##vso[task.setvariable variable=VERCEL_TEAM_ID;isOutput=false;issecret=false;]team_rFjZG0SVqdEif7MINfBqAoiJ

2025-11-27T05:34:16.6421012Z ##[debug]set VERCEL_ORG_ID=team_rFjZG0SVqdEif7MINfBqAoiJ

2025-11-27T05:34:16.6425047Z ##[debug]Processed: ##vso[task.setvariable variable=VERCEL_ORG_ID;isOutput=false;issecret=false;]team_rFjZG0SVqdEif7MINfBqAoiJ

2025-11-27T05:34:16.6427114Z ##[debug]vercelToken=$(VERCEL_TOKEN)

2025-11-27T05:34:16.6449768Z ##[debug]VERCEL_TOKEN=undefined

2025-11-27T05:34:16.6451687Z ##[debug]set VERCEL_TOKEN=$(VERCEL_TOKEN)

2025-11-27T05:34:16.6471448Z ##[debug]Processed: ##vso[task.setvariable variable=VERCEL_TOKEN;isOutput=false;issecret=false;]$(VERCEL_TOKEN)

2025-11-27T05:34:16.6474728Z ##[debug]System.DefaultWorkingDirectory=/home/usuario/azagent/_work/3/s

2025-11-27T05:34:16.6477640Z ##[debug]vercelCWD=undefined

2025-11-27T05:34:16.6479787Z ##[debug]VERCEL_CWD=undefined

2025-11-27T05:34:16.6481560Z ##[debug]set VERCEL_CWD=/home/usuario/azagent/_work/3/s

2025-11-27T05:34:16.6483898Z ##[debug]Processed: ##vso[task.setvariable variable=VERCEL_CWD;isOutput=false;issecret=false;]/home/usuario/azagent/_work/3/s

2025-11-27T05:34:16.6485604Z ##[debug]production=False

2025-11-27T05:34:16.6487675Z ##[debug]VERCEL_CLI_VERSION=undefined

2025-11-27T05:34:16.6491433Z ##[debug]which 'npm'

2025-11-27T05:34:16.6493302Z ##[debug]found: '/usr/bin/npm'

2025-11-27T05:34:16.6495292Z ##[debug]which '/usr/bin/npm'

2025-11-27T05:34:16.6497138Z ##[debug]found: '/usr/bin/npm'

2025-11-27T05:34:16.6520340Z ##[debug]/usr/bin/npm arg: ["install","-g","vercel@latest"]

2025-11-27T05:34:16.6522602Z ##[debug]exec tool: /usr/bin/npm

2025-11-27T05:34:16.6524592Z ##[debug]arguments:

2025-11-27T05:34:16.6526558Z ##[debug] install

2025-11-27T05:34:16.6531794Z ##[debug] -g

2025-11-27T05:34:16.6534268Z ##[debug] vercel@latest

2025-11-27T05:34:16.6536459Z [command]/usr/bin/npm install -g vercel@latest

2025-11-27T05:34:20.3627325Z ##[debug]Agent environment resources - Disk: / Available 10724.41 MB out of 28691.13 MB, Memory: Used 691.00 MB out of 1854.00 MB, CPU: Usage 35.84%

2025-11-27T05:34:26.4701990Z ##[debug]Agent environment resources - Disk: / Available 10712.73 MB out of 28691.13 MB, Memory: Used 785.00 MB out of 1854.00 MB, CPU: Usage 58.64%

2025-11-27T05:34:32.5900762Z ##[debug]Agent environment resources - Disk: / Available 10712.71 MB out of 28691.13 MB, Memory: Used 867.00 MB out of 1854.00 MB, CPU: Usage 73.75%

2025-11-27T05:34:39.3548851Z ##[debug]Agent environment resources - Disk: / Available 10712.66 MB out of 28691.13 MB, Memory: Used 875.00 MB out of 1854.00 MB, CPU: Usage 39.70%

2025-11-27T05:34:46.0678538Z ##[debug]Agent environment resources - Disk: / Available 10712.61 MB out of 28691.13 MB, Memory: Used 940.00 MB out of 1854.00 MB, CPU: Usage 100.00%

2025-11-27T05:34:49.9856783Z npm warn deprecated path-match@1.2.4: This package is archived and no longer maintained. For support, visit https://github.com/expressjs/express/discussions

2025-11-27T05:34:49.9859216Z npm error code EACCES

2025-11-27T05:34:49.9882990Z npm error syscall symlink

2025-11-27T05:34:49.9884375Z npm error path ../lib/node_modules/vercel/dist/vc.js

2025-11-27T05:34:49.9886124Z npm error dest /usr/bin/vercel

2025-11-27T05:34:49.9886661Z npm error errno -13

2025-11-27T05:34:49.9887443Z npm error Error: EACCES: permission denied, symlink '../lib/node_modules/vercel/dist/vc.js' -> '/usr/bin/vercel'

2025-11-27T05:34:49.9887886Z npm error at async symlink (node:internal/fs/promises:1008:10)

2025-11-27T05:34:49.9908627Z npm error at async Promise.all (index 1)

2025-11-27T05:34:49.9909378Z npm error at async Promise.all (index 0)

2025-11-27T05:34:49.9910144Z npm error at async #createBinLinks (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:394:5)

2025-11-27T05:34:49.9910740Z npm error at async Promise.allSettled (index 0)

2025-11-27T05:34:49.9911516Z npm error at async #linkAllBins (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:375:5)

2025-11-27T05:34:49.9911955Z npm error at async #build (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:160:7)

2025-11-27T05:34:49.9912619Z npm error at async Arborist.rebuild (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/rebuild.js:62:5)

2025-11-27T05:34:49.9913077Z npm error at async [reifyPackages] (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:325:11)

2025-11-27T05:34:49.9913547Z npm error at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:142:5) {

2025-11-27T05:34:49.9914161Z npm error errno: -13,

2025-11-27T05:34:49.9914653Z npm error code: 'EACCES',

2025-11-27T05:34:49.9914959Z npm error syscall: 'symlink',

2025-11-27T05:34:49.9915296Z npm error path: '../lib/node_modules/vercel/dist/vc.js',

2025-11-27T05:34:49.9915774Z npm error dest: '/usr/bin/vercel'

2025-11-27T05:34:49.9916034Z npm error }

2025-11-27T05:34:49.9916312Z npm error

2025-11-27T05:34:49.9916660Z npm error The operation was rejected by your operating system.

2025-11-27T05:34:49.9917037Z npm error It is likely you do not have the permissions to access this file as the current user

2025-11-27T05:34:49.9917511Z npm error

2025-11-27T05:34:49.9917867Z npm error If you believe this might be a permissions issue, please double-check the

2025-11-27T05:34:49.9918245Z npm error permissions of the file and its containing directories, or try running

2025-11-27T05:34:49.9999626Z npm error the command again as root/Administrator.

2025-11-27T05:34:50.0000070Z npm error A complete log of this run can be found in: /home/usuario/.npm/_logs/2025-11-27T05_34_17_365Z-debug-0.log

2025-11-27T05:34:50.0001988Z ##[debug]task result: Failed

2025-11-27T05:34:50.0086366Z ##[error]npm install failed with exit code 243. Error: npm warn deprecated path-match@1.2.4: This package is archived and no longer maintained. For support, visit https://github.com/expressjs/express/discussions

npm error code EACCES

npm error syscall symlink

npm error path ../lib/node_modules/vercel/dist/vc.js

npm error dest /usr/bin/vercel

npm error errno -13

npm error Error: EACCES: permission denied, symlink '../lib/node_modules/vercel/dist/vc.js' -> '/usr/bin/vercel'

npm error at async symlink (node:internal/fs/promises:1008:10)

npm error at async Promise.all (index 1)

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

npm error dest: '/usr/bin/vercel'

npm error }

npm error

npm error The operation was rejected by your operating system.

npm error It is likely you do not have the permissions to access this file as the current user

npm error

npm error If you believe this might be a permissions issue, please double-check the

npm error permissions of the file and its containing directories, or try running

npm error the command again as root/Administrator.

npm error A complete log of this run can be found in: /home/usuario/.npm/_logs/2025-11-27T05_34_17_365Z-debug-0.log




2025-11-27T05:34:50.0119641Z ##[debug]Processed: ##vso[task.issue type=error;]npm install failed with exit code 243. Error: npm warn deprecated path-match@1.2.4: This package is archived and no longer maintained. For support, visit https://github.com/expressjs/express/discussions

npm error code EACCES

npm error syscall symlink

npm error path ../lib/node_modules/vercel/dist/vc.js

npm error dest /usr/bin/vercel

npm error errno -13

npm error Error: EACCES: permission denied, symlink '../lib/node_modules/vercel/dist/vc.js' -> '/usr/bin/vercel'

npm error at async symlink (node:internal/fs/promises:1008:10)

npm error at async Promise.all (index 1)

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

npm error dest: '/usr/bin/vercel'

npm error }

npm error

npm error The operation was rejected by your operating system.

npm error It is likely you do not have the permissions to access this file as the current user

npm error

npm error If you believe this might be a permissions issue, please double-check the

npm error permissions of the file and its containing directories, or try running

npm error the command again as root/Administrator.

npm error A complete log of this run can be found in: /home/usuario/.npm/_logs/2025-11-27T05_34_17_365Z-debug-0.log




2025-11-27T05:34:50.0123979Z ##[debug]Processed: ##vso[task.complete result=Failed;]npm install failed with exit code 243. Error: npm warn deprecated path-match@1.2.4: This package is archived and no longer maintained. For support, visit https://github.com/expressjs/express/discussions

npm error code EACCES

npm error syscall symlink

npm error path ../lib/node_modules/vercel/dist/vc.js

npm error dest /usr/bin/vercel

npm error errno -13

npm error Error: EACCES: permission denied, symlink '../lib/node_modules/vercel/dist/vc.js' -> '/usr/bin/vercel'

npm error at async symlink (node:internal/fs/promises:1008:10)

npm error at async Promise.all (index 1)

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

npm error dest: '/usr/bin/vercel'

npm error }

npm error

npm error The operation was rejected by your operating system.

npm error It is likely you do not have the permissions to access this file as the current user

npm error

npm error If you believe this might be a permissions issue, please double-check the

npm error permissions of the file and its containing directories, or try running

npm error the command again as root/Administrator.

npm error A complete log of this run can be found in: /home/usuario/.npm/_logs/2025-11-27T05_34_17_365Z-debug-0.log




2025-11-27T05:34:50.0183528Z ##[section]Finishing: Desplegar a Vercel
```

---

### Navegación

[← Prompt 031](/06-vercel/031/) &middot; [Volver a Vercel para el frontend](/06-vercel/) &middot; [Prompt 033 →](/06-vercel/033/)
{% endraw %}
