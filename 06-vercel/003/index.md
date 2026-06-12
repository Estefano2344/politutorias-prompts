---
layout: default
title: '003. Este es mi pipeline actual en mi frontend: name: Azure Static Web…'
parent: Vercel para el frontend
nav_order: 3
permalink: /06-vercel/003/
---

{% raw %}

# Prompt 003
{: .no_toc }

**Sección:** Vercel para el frontend &middot; **Longitud:** 8,807 caracteres &middot; **Posición en la conversación:** 3 de 34

---

```
Este es mi pipeline actual en mi frontend:




name: Azure Static Web Apps CI/CD




pr:

  branches:

    include:

      - develop

trigger:

  branches:

    include:

      - develop




jobs:

  - job: build_and_deploy_job

    displayName: Build and Deploy Job

    condition: or(eq(variables['Build.Reason'], 'Manual'),or(eq(variables['Build.Reason'], 'PullRequest'),eq(variables['Build.Reason'], 'IndividualCI')))

    pool:

      name: PoliTutorias-LocalPool

    variables:

      - group: Azure-Static-Web-Apps-witty-grass-0a0148d10-variable-group

    steps:

      # Paso de limpieza del workspace

      - script: |

          echo "Limpiando workspace local..."

          rm -rf $(Agent.BuildDirectory)/*

          echo "Workspace limpio."

        displayName: "Clean workspace"




      # Luego hace el checkout normal

      - checkout: self

        submodules: true




      # Y finalmente el despliegue

      - task: AzureStaticWebApp@0

        inputs:

          azure_static_web_apps_api_token: $(AZURE_STATIC_WEB_APPS_API_TOKEN_WITTY_GRASS_0A0148D10)

          app_location: "/"

          api_location: ""

          output_location: ".next"







Quiero adaptar un pipeline como mi back:




# azure-pipelines.yml (Backend - NestJS Corregido FINAL)




# 1. Disparadores (Triggers)

trigger:

  - main

  - develop




# 2. Agente (Pool)

pool:

  name: PoliTutorias-LocalPool

  demands:

    - Agent.OS -equals Linux




# 2.1 Variables útiles

variables:

  NODE_VERSION: '22.x'

  STAGING_APP: 'app-politutorias-backend-staging'

  STAGING_RG: 'rg-politutorias-staging'

  PROD_APP: 'app-politutorias-backend-prod'

  PROD_RG: 'rg-politutorias-prod'




# 3. Etapas (Stages)

stages:

  # =================

  # ETAPA DE BUILD (CI)

  # =================

  - stage: Build

    displayName: '1. Build & Test API (CI)'

    jobs:

      - job: Build

        steps:

          - task: NodeTool@0

            inputs:

              versionSpec: '$(NODE_VERSION)'

            displayName: 'Instalar Node.js 22 LTS'




          - script: npm ci --include=dev

            displayName: 'Instalar todas las dependencias (incluye dev)'




          - script: npm run lint

            displayName: 'Ejecutar Linter'




          - script: npm test -- --coverage

            displayName: 'Ejecutar pruebas unitarias y de cobertura'




          - script: npm test -- --ci --reporters=default

            displayName: 'Ejecutar pruebas unitarias'




          - script: |

              echo "Limpiando build previo"

              rm -rf dist

            displayName: 'Eliminar carpeta dist (build limpio)'




          - script: npm run build

            displayName: 'Compilar proyecto (npm run build)'




          - script: |

              echo "Copiando imágenes del seed al dist"

              mkdir -p dist/seed/images

              cp -r src/seed/images/* dist/seed/images/

            displayName: 'Copiar imágenes del seed al dist'




          - script: |

              rm -rf node_modules

              npm ci --omit=dev

            displayName: 'Instalar solo dependencias de producción'




          - task: ArchiveFiles@2

            inputs:

              rootFolderOrFile: '$(System.DefaultWorkingDirectory)'

              includeRootFolder: false

              archiveType: 'zip'

              archiveFile: '$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip'

              replaceExistingArchive: true

            displayName: 'Archivar artefacto completo (.zip)'




          - task: PublishBuildArtifacts@1

            inputs:

              PathtoPublish: '$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip'

              ArtifactName: 'backend-api'

            displayName: 'Publicar artefacto'




  # =======================

  # ETAPA DE STAGING (CD)

  # =======================

  - stage: Deploy_Staging

    displayName: '2. Deploy to Staging (CD)'

    dependsOn: Build

    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/develop'))




    jobs:

      - deployment: Deploy

        displayName: 'Desplegar y Ejecutar Seed (Staging)'

        environment: 'Staging'

        strategy:

          runOnce:

            deploy:

              steps:

                - task: AzureWebApp@1

                  displayName: 'Desplegar API en App Service (Staging)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Stag'

                    appType: 'webAppLinux'

                    appName: '$(STAGING_APP)'

                    package: '$(Pipeline.Workspace)/backend-api/$(Build.BuildId).zip'

                    runtimeStack: 'NODE|22-lts'

                    enableCustomDeployment: true

                    deploymentMethod: 'zipDeploy'




                - task: AzureCLI@2

                  displayName: 'Limpiar contenedor de imágenes (solo staging)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Stag'

                    scriptType: 'bash'

                    scriptLocation: 'inlineScript'

                    inlineScript: |

                      echo "Eliminando blobs antiguos del contenedor tutor-perfiles..."

                      az storage blob delete-batch --account-name stpolitutoriasstagingep --source tutor-perfiles --pattern "*" --auth-mode key

                      echo "Eliminando blobs antiguos del contenedor tutorias-imagenes..."

                      az storage blob delete-batch --account-name stpolitutoriasstagingep --source tutorias-imagenes --pattern "*" --auth-mode key




                # PASO 2: Esperar y ejecutar el SEED vía endpoint

                - task: AzureCLI@2

                  displayName: 'Ejecutar Seed en Staging (HTTP request al endpoint)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Stag'

                    scriptType: 'bash'

                    scriptLocation: 'inlineScript'

                    inlineScript: |

                      echo "Esperando 25 segundos para que la API arranque..."

                      sleep 25

                      echo "Ejecutando Seed vía endpoint HTTP..."

                      curl -X POST "https://app-politutorias-backend-staging.azurewebsites.net/api/admin/seed" \

                        -H "x-api-key: <REDACTADO>"

                      echo "Seed ejecutado correctamente en Staging."




  # ===========================

  # ETAPA DE PRODUCCIÓN (CE)

  # ===========================

  - stage: Deploy_Production

    displayName: '3. Deploy to Production (CE)'

    dependsOn: Build

    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))




    jobs:

      - deployment: Deploy

        displayName: 'Desplegar y Ejecutar Seed (Producción)'

        environment: 'Production' # Activa aprobación manual

        strategy:

          runOnce:

            deploy:

              steps:

                - task: AzureWebApp@1

                  displayName: 'Desplegar API en App Service (Producción)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Prod'

                    appType: 'webAppLinux'

                    appName: '$(PROD_APP)'

                    package: '$(Pipeline.Workspace)/backend-api/$(Build.BuildId).zip'

                    runtimeStack: 'NODE|22-lts'

                    enableCustomDeployment: true

                    deploymentMethod: 'zipDeploy'




                - task: AzureCLI@2

                  displayName: 'Ejecutar Seed en Producción (HTTP request al endpoint)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Prod'

                    scriptType: 'bash'

                    scriptLocation: 'inlineScript'

                    inlineScript: |

                      echo "Esperando 30 segundos para que la API arranque..."

                      sleep 30

                      echo "Ejecutando Seed vía endpoint HTTP..."

                      curl -X POST "https://app-politutorias-backend-prod.azurewebsites.net/api/admin/seed" \

                        -H "x-api-key: <REDACTADO>"

                      echo "Seed ejecutado correctamente en Producción."







Pero ahora para desplegar el front en vercel, considerando que actualmente mis .env en back estan en key azure y para mi front para apuntar al back de azure uso esto:

NEXT_PUBLIC_BACKEND_URL=https://app-politutorias-backend-staging.azurewebsites.net/api

IMAGE_PROTOCOL=https

IMAGE_HOSTNAME=stpolitutoriasstagingep.blob.core.windows.net







Como lo hago paso a paso
```

---

### Navegación

[← Prompt 002](/06-vercel/002/) &middot; [Volver a Vercel para el frontend](/06-vercel/) &middot; [Prompt 004 →](/06-vercel/004/)
{% endraw %}
