---
layout: default
title: '052. El frontend que se construye en el mismo agente con este pipeline…'
parent: Migración a AWS
nav_order: 52
permalink: /01-migracion-aws/052/
---

{% raw %}

# Prompt 052
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 9,943 caracteres &middot; **Posición en la conversación:** 52 de 64

---

```
El frontend que se construye en el mismo agente con este pipeline:

# azure-pipelines.yml (Frontend - Next.js adaptado para Vercel)




# 1. Disparadores (Triggers)

trigger:

  branches:

    include:

      - main

      - develop

pr:

  branches:

    include:

      - develop




# 2. Agente (Pool)

pool:

  name: PoliTutorias-LocalPool

  demands:

    - Agent.OS -equals Linux




# 2.1 Variables útiles

variables:

  # Ahora, cada variable es un elemento de lista

  - name: NODE_VERSION

    value: "22.x"

  - name: VERCEL_DEPLOYMENT_URL

    value: "https://app-politutorias-backend-staging.azurewebsites.net/api"

  - name: VERCEL_PROJECT_ID

    value: "prj_YDYhdgLT12EU3Tfp7o0OlAiK66iN"

  - name: VERCEL_TEAM_ID

    value: "team_rFjZG0SVqdEif7MINfBqAoiJ"




# 3. Etapas (Stages)

stages:

  # ==================

  # ETAPA DE BUILD (CI)

  # ==================

  - stage: Build

    displayName: "1. Build Frontend (CI)"

    jobs:

      - job: Build

        steps:

          # Limpieza del workspace

          - script: |

              echo "Limpiando workspace local..."

              rm -rf $(Agent.BuildDirectory)/*

              echo "Workspace limpio."

            displayName: "Clean workspace"




          - checkout: self

            submodules: true




          - task: NodeTool@0

            inputs:

              versionSpec: "$(NODE_VERSION)"

            displayName: "Instalar Node.js 22 LTS"




          - script: npm ci

            displayName: "Instalar dependencias"




          - script: npm run build

            displayName: "Compilar proyecto (npm run build)"

            env:

              # Inyectar variables de entorno específicas para el Build

              NEXT_PUBLIC_BACKEND_URL: "$(VERCEL_DEPLOYMENT_URL)"

              IMAGE_PROTOCOL: "https"

              IMAGE_HOSTNAME: "stpolitutoriasstagingep.blob.core.windows.net"




          - task: ArchiveFiles@2

            inputs:

              rootFolderOrFile: "$(System.DefaultWorkingDirectory)/.next" # Next.js output

              includeRootFolder: false

              archiveType: "zip"

              archiveFile: "$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip"

              replaceExistingArchive: true

            displayName: "Archivar carpeta .next (.zip)"




          - task: PublishBuildArtifacts@1

            inputs:

              PathtoPublish: "$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip"

              ArtifactName: "frontend-nextjs"

            displayName: "Publicar artefacto"




  # ========================

  # ETAPA DE DESPLIEGUE (CD)

  # ========================

  - stage: Deploy

    displayName: "2. Deploy to Vercel (CD)"

    dependsOn: Build

    condition: succeeded() # Se ejecuta si el build fue exitoso




    jobs:

      - deployment: DeployVercel

        displayName: "Desplegar en Vercel"

        # Usamos el pool local

        pool:

          name: PoliTutorias-LocalPool

          demands:

            - Agent.OS -equals Linux




        environment: "VercelDeployment"

        strategy:

          runOnce:

            deploy:

              steps:

                # Paso 1: Descargar el artefacto (la carpeta .next)

                - task: DownloadBuildArtifacts@1

                  inputs:

                    buildType: "current"

                    artifactName: "frontend-nextjs"

                    downloadPath: "$(System.DefaultWorkingDirectory)"

                  displayName: "Descargar artefacto (frontend-nextjs)"




                # Paso 2: Desplegar en Vercel

                - task: vercel-deployment-task@3

                  displayName: "Desplegar a Vercel"

                  inputs:

                    # Las variables vienen del grupo de variables enlazado a Key Vault:

                    vercelProjectId: "$(VERCEL_PROJECT_ID)"

                    vercelTeamId: "$(VERCEL_TEAM_ID)"

                    vercelToken: "$(VERCEL_TOKEN)"




                    # El 'path' debe apuntar a la carpeta .next que descargaste del artefacto

                    path: "$(System.DefaultWorkingDirectory)/frontend-nextjs"




                    # Si es la rama 'main' es producción, sino, es preview

                    production: ${{ eq(variables['Build.SourceBranch'], 'refs/heads/main') }}




                    # Inyectar las variables de entorno del frontend

                    environment: |

                      NEXT_PUBLIC_BACKEND_URL=$(VERCEL_DEPLOYMENT_URL)

                      IMAGE_PROTOCOL=https

                      IMAGE_HOSTNAME=stpolitutoriasstagingep.blob.core.windows.net







No funciona:

2026-02-06T01:53:54.1255914Z ##[section]Starting: Desplegar a Vercel

2026-02-06T01:53:54.1272901Z ==============================================================================

2026-02-06T01:53:54.1273082Z Task : Vercel Deployment Task

2026-02-06T01:53:54.1273202Z Description : An Azure Pipelines Task Extension for automatically deploying to Vercel

2026-02-06T01:53:54.1273338Z Version : 3.0.1

2026-02-06T01:53:54.1273435Z Author : Vercel

2026-02-06T01:53:54.1273516Z Help : https://github.com/vercel/vercel-azure-devops-extension

2026-02-06T01:53:54.1273631Z ==============================================================================

2026-02-06T01:53:55.5245006Z Vercel Project Id specified by both `vercelProjectId` input and `VERCEL_PROJECT_ID` environment variable. Input field `vercelProjectId` will be used.

2026-02-06T01:53:55.5258018Z Vercel Team Id specified by both `vercelTeamId` input and `VERCEL_TEAM_ID` environment variable. Input field `vercelTeamId` will be used.

2026-02-06T01:53:55.5265051Z Vercel Token specified by both `vercelToken` input and `VERCEL_TOKEN` environment variable. Input field `vercelToken` will be used.

2026-02-06T01:53:55.5347149Z [command]/usr/bin/npm install -g vercel@latest

2026-02-06T01:54:28.0680630Z npm error code EACCES

2026-02-06T01:54:28.0681358Z npm error syscall mkdir

2026-02-06T01:54:28.0681708Z npm error path /usr/lib/node_modules/vercel

2026-02-06T01:54:28.0682231Z npm error errno -13

2026-02-06T01:54:28.0682601Z npm error Error: EACCES: permission denied, mkdir '/usr/lib/node_modules/vercel'

2026-02-06T01:54:28.0683063Z npm error at async mkdir (node:internal/fs/promises:855:10)

2026-02-06T01:54:28.0683575Z npm error at async /usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:624:20

2026-02-06T01:54:28.0684019Z npm error at async Promise.allSettled (index 0)

2026-02-06T01:54:28.0684464Z npm error at async [reifyPackages] (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:325:11)

2026-02-06T01:54:28.0685042Z npm error at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:142:5)

2026-02-06T01:54:28.0685741Z npm error at async Install.exec (/usr/lib/node_modules/npm/lib/commands/install.js:150:5)

2026-02-06T01:54:28.0686254Z npm error at async Npm.exec (/usr/lib/node_modules/npm/lib/npm.js:207:9)

2026-02-06T01:54:28.0687971Z npm error at async module.exports (/usr/lib/node_modules/npm/lib/cli/entry.js:74:5) {

2026-02-06T01:54:28.0688564Z npm error errno: -13,

2026-02-06T01:54:28.0689002Z npm error code: 'EACCES',

2026-02-06T01:54:28.0689445Z npm error syscall: 'mkdir',

2026-02-06T01:54:28.0689941Z npm error path: '/usr/lib/node_modules/vercel'

2026-02-06T01:54:28.0690380Z npm error }

2026-02-06T01:54:28.0690760Z npm error

2026-02-06T01:54:28.0692959Z npm error The operation was rejected by your operating system.

2026-02-06T01:54:28.0693322Z npm error It is likely you do not have the permissions to access this file as the current user

2026-02-06T01:54:28.0693583Z npm error

2026-02-06T01:54:28.0694048Z npm error If you believe this might be a permissions issue, please double-check the

2026-02-06T01:54:28.0694487Z npm error permissions of the file and its containing directories, or try running

2026-02-06T01:54:28.0695606Z npm error the command again as root/Administrator.

2026-02-06T01:54:28.0696094Z npm error A complete log of this run can be found in: /home/ubuntu/.npm/_logs/2026-02-06T01_53_56_157Z-debug-0.log

2026-02-06T01:54:28.0746915Z ##[error]npm install failed with exit code 243. Error: npm error code EACCES

npm error syscall mkdir

npm error path /usr/lib/node_modules/vercel

npm error errno -13

npm error Error: EACCES: permission denied, mkdir '/usr/lib/node_modules/vercel'

npm error at async mkdir (node:internal/fs/promises:855:10)

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

npm error A complete log of this run can be found in: /home/ubuntu/.npm/_logs/2026-02-06T01_53_56_157Z-debug-0.log




2026-02-06T01:54:28.0953682Z ##[section]Finishing: Desplegar a Vercel
```

---

### Navegación

[← Prompt 051](/01-migracion-aws/051/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 053 →](/01-migracion-aws/053/)
{% endraw %}
