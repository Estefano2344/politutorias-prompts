---
layout: default
title: '027. no faltan dependencias de docker o algo? recuerda que aqui se con…'
parent: Migración a AWS
nav_order: 27
permalink: /01-migracion-aws/027/
---

{% raw %}

# Prompt 027
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 12,194 caracteres &middot; **Posición en la conversación:** 27 de 64

---

```
no faltan dependencias de docker o algo? recuerda que aqui se contruye el front y el back:




Backend:

# azure-pipelines.yml (Backend - NestJS con Cobertura y Yarn)




# 1. Disparadores (Triggers)

trigger:

  - main

  - develop




# 2. Agente (Pool)

pool:

  name: PoliTutorias-LocalPool

  demands:

    - Agent.OS -equals Linux




# 2.1 Variables útiles

variables:

  NODE_VERSION: '22.x'

  STAGING_APP: 'app-politutorias-backend-staging'

  STAGING_RG: 'rg-politutorias-staging'

  PROD_APP: 'app-politutorias-backend-prod'

  PROD_RG: 'rg-politutorias-prod'




# 3. Etapas (Stages)

stages:

  # =================

  # ETAPA DE BUILD (CI)

  # =================

  - stage: Build

    displayName: '1. Build & Test API (CI)'

    jobs:

      - job: Build

        steps:

          - task: NodeTool@0

            inputs:

              versionSpec: '$(NODE_VERSION)'

            displayName: 'Instalar Node.js 22 LTS'




          - script: yarn install --frozen-lockfile

            displayName: 'Instalar todas las dependencias (yarn)'




          - script: yarn lint

            displayName: 'Ejecutar Linter'




          - script: yarn test:cov

            displayName: 'Ejecutar pruebas unitarias y de cobertura'




          - task: UseDotNet@2

            displayName: 'Instalar .NET Core SDK'

            inputs:

              packageType: 'sdk'

              version: '6.x'




          - task: PublishCodeCoverageResults@2

            displayName: 'Publicar Cobertura de Código'

            condition: succeededOrFailed()

            inputs:

              codeCoverageTool: 'Cobertura'

              summaryFileLocation: '$(System.DefaultWorkingDirectory)/coverage/cobertura-coverage.xml'




          - script: |

              echo "Limpiando build previo"

              rm -rf dist

            displayName: 'Eliminar carpeta dist (build limpio)'




          - script: yarn build

            displayName: 'Compilar proyecto (yarn build)'




          - script: |

              echo "Copiando imágenes del seed al dist"

              mkdir -p dist/seed/images

              cp -r src/seed/images/* dist/seed/images/

            displayName: 'Copiar imágenes del seed al dist'




          - script: |

              rm -rf node_modules

              yarn install --production --frozen-lockfile

            displayName: 'Instalar solo dependencias de producción'




          - task: ArchiveFiles@2

            inputs:

              rootFolderOrFile: '$(System.DefaultWorkingDirectory)'

              includeRootFolder: false

              archiveType: 'zip'

              archiveFile: '$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip'

              replaceExistingArchive: true

            displayName: 'Archivar artefacto completo (.zip)'




          - task: PublishBuildArtifacts@1

            inputs:

              PathtoPublish: '$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip'

              ArtifactName: 'backend-api'

            displayName: 'Publicar artefacto'




  # =======================

  # ETAPA DE STAGING (CD)

  # =======================

  - stage: Deploy_Staging

    displayName: '2. Deploy to Staging (CD)'

    dependsOn: Build

    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/develop'))

    jobs:

      - deployment: Deploy

        displayName: 'Desplegar y Ejecutar Seed (Staging)'

        environment: 'Staging'

        strategy:

          runOnce:

            deploy:

              steps:

                - task: AzureWebApp@1

                  displayName: 'Desplegar API en App Service (Staging)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Stag'

                    appType: 'webAppLinux'

                    appName: '$(STAGING_APP)'

                    package: '$(Pipeline.Workspace)/backend-api/$(Build.BuildId).zip'

                    runtimeStack: 'NODE|22-lts'

                    enableCustomDeployment: true

                    deploymentMethod: 'zipDeploy'




                - task: AzureCLI@2

                  displayName: 'Limpiar contenedor de imágenes (solo staging)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Stag'

                    scriptType: 'bash'

                    scriptLocation: 'inlineScript'

                    inlineScript: |

                      echo "Eliminando blobs antiguos del contenedor tutor-perfiles..."

                      az storage blob delete-batch --account-name stpolitutoriasstagingep --source tutor-perfiles --pattern "*" --auth-mode key

                      echo "Eliminando blobs antiguos del contenedor tutorias-imagenes..."

                      az storage blob delete-batch --account-name stpolitutoriasstagingep --source tutorias-imagenes --pattern "*" --auth-mode key




                - task: AzureCLI@2

                  displayName: 'Ejecutar Seed en Staging (HTTP request al endpoint)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Stag'

                    scriptType: 'bash'

                    scriptLocation: 'inlineScript'

                    inlineScript: |

                      echo "Esperando 25 segundos para que la API arranque..."

                      sleep 25

                      echo "Ejecutando Seed vía endpoint HTTP..."

                      curl -X POST "https://app-politutorias-backend-staging.azurewebsites.net/api/admin/seed" \

                        -H "x-api-key: <REDACTADO>"

                      echo "Seed ejecutado correctamente en Staging."




  # ===========================

  # ETAPA DE PRODUCCIÓN (CE)

  # ===========================

  - stage: Deploy_Production

    displayName: '3. Deploy to Production (CE)'

    dependsOn: Build

    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))

    jobs:

      - deployment: Deploy

        displayName: 'Desplegar y Ejecutar Seed (Producción)'

        environment: 'Production'

        strategy:

          runOnce:

            deploy:

              steps:

                - task: AzureWebApp@1

                  displayName: 'Desplegar API en App Service (Producción)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Prod'

                    appType: 'webAppLinux'

                    appName: '$(PROD_APP)'

                    package: '$(Pipeline.Workspace)/backend-api/$(Build.BuildId).zip'

                    runtimeStack: 'NODE|22-lts'

                    enableCustomDeployment: true

                    deploymentMethod: 'zipDeploy'




                - task: AzureCLI@2

                  displayName: 'Ejecutar Seed en Producción (HTTP request al endpoint)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Prod'

                    scriptType: 'bash'

                    scriptLocation: 'inlineScript'

                    inlineScript: |

                      echo "Esperando 30 segundos para que la API arranque..."

                      sleep 30

                      echo "Ejecutando Seed vía endpoint HTTP..."

                      curl -X POST "https://app-politutorias-backend-prod.azurewebsites.net/api/admin/seed" \

                        -H "x-api-key: <REDACTADO>"

                      echo "Seed ejecutado correctamente en Producción."




Frontend:

# azure-pipelines.yml (Frontend - Next.js adaptado para Vercel)




# 1. Disparadores (Triggers)

trigger:

  branches:

    include:

      - main

      - develop

pr:

  branches:

    include:

      - develop




# 2. Agente (Pool)

pool:

  name: PoliTutorias-LocalPool

  demands:

    - Agent.OS -equals Linux




# 2.1 Variables útiles

variables:

  # Ahora, cada variable es un elemento de lista

  - name: NODE_VERSION

    value: "22.x"

  - name: VERCEL_DEPLOYMENT_URL

    value: "https://app-politutorias-backend-staging.azurewebsites.net/api"

  - name: VERCEL_PROJECT_ID

    value: "prj_YDYhdgLT12EU3Tfp7o0OlAiK66iN"

  - name: VERCEL_TEAM_ID

    value: "team_rFjZG0SVqdEif7MINfBqAoiJ"




# 3. Etapas (Stages)

stages:

  # ==================

  # ETAPA DE BUILD (CI)

  # ==================

  - stage: Build

    displayName: "1. Build Frontend (CI)"

    jobs:

      - job: Build

        steps:

          # Limpieza del workspace

          - script: |

              echo "Limpiando workspace local..."

              rm -rf $(Agent.BuildDirectory)/*

              echo "Workspace limpio."

            displayName: "Clean workspace"




          - checkout: self

            submodules: true




          - task: NodeTool@0

            inputs:

              versionSpec: "$(NODE_VERSION)"

            displayName: "Instalar Node.js 22 LTS"




          - script: npm ci

            displayName: "Instalar dependencias"




          - script: npm run build

            displayName: "Compilar proyecto (npm run build)"

            env:

              # Inyectar variables de entorno específicas para el Build

              NEXT_PUBLIC_BACKEND_URL: "$(VERCEL_DEPLOYMENT_URL)"

              IMAGE_PROTOCOL: "https"

              IMAGE_HOSTNAME: "stpolitutoriasstagingep.blob.core.windows.net"




          - task: ArchiveFiles@2

            inputs:

              rootFolderOrFile: "$(System.DefaultWorkingDirectory)/.next" # Next.js output

              includeRootFolder: false

              archiveType: "zip"

              archiveFile: "$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip"

              replaceExistingArchive: true

            displayName: "Archivar carpeta .next (.zip)"




          - task: PublishBuildArtifacts@1

            inputs:

              PathtoPublish: "$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip"

              ArtifactName: "frontend-nextjs"

            displayName: "Publicar artefacto"




  # ========================

  # ETAPA DE DESPLIEGUE (CD)

  # ========================

  - stage: Deploy

    displayName: "2. Deploy to Vercel (CD)"

    dependsOn: Build

    condition: succeeded() # Se ejecuta si el build fue exitoso




    jobs:

      - deployment: DeployVercel

        displayName: "Desplegar en Vercel"

        # Usamos el pool local

        pool:

          name: PoliTutorias-LocalPool

          demands:

            - Agent.OS -equals Linux




        environment: "VercelDeployment"

        strategy:

          runOnce:

            deploy:

              steps:

                # Paso 1: Descargar el artefacto (la carpeta .next)

                - task: DownloadBuildArtifacts@1

                  inputs:

                    buildType: "current"

                    artifactName: "frontend-nextjs"

                    downloadPath: "$(System.DefaultWorkingDirectory)"

                  displayName: "Descargar artefacto (frontend-nextjs)"




                # Paso 2: Desplegar en Vercel

                - task: vercel-deployment-task@3

                  displayName: "Desplegar a Vercel"

                  inputs:

                    # Las variables vienen del grupo de variables enlazado a Key Vault:

                    vercelProjectId: "$(VERCEL_PROJECT_ID)"

                    vercelTeamId: "$(VERCEL_TEAM_ID)"

                    vercelToken: "$(VERCEL_TOKEN)"




                    # El 'path' debe apuntar a la carpeta .next que descargaste del artefacto

                    path: "$(System.DefaultWorkingDirectory)/frontend-nextjs"




                    # Si es la rama 'main' es producción, sino, es preview

                    production: ${{ eq(variables['Build.SourceBranch'], 'refs/heads/main') }}




                    # Inyectar las variables de entorno del frontend

                    environment: |

                      NEXT_PUBLIC_BACKEND_URL=$(VERCEL_DEPLOYMENT_URL)

                      IMAGE_PROTOCOL=https

                      IMAGE_HOSTNAME=stpolitutoriasstagingep.blob.core.windows.net
```

---

### Navegación

[← Prompt 026](/01-migracion-aws/026/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 028 →](/01-migracion-aws/028/)
{% endraw %}
