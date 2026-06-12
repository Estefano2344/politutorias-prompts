---
layout: default
title: '029. Listo, ya estaria, ahora modifiquemos el pipeline del backend pri…'
parent: Migración a AWS
nav_order: 29
permalink: /01-migracion-aws/029/
---

{% raw %}

# Prompt 029
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 7,566 caracteres &middot; **Posición en la conversación:** 29 de 64

---

```
Listo, ya estaria, ahora modifiquemos el pipeline del backend primero:

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
```

---

### Navegación

[← Prompt 028](/01-migracion-aws/028/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 030 →](/01-migracion-aws/030/)
{% endraw %}
