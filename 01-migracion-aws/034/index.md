---
layout: default
title: '034. Modificalo tu mismo y sin emojis: # azure-pipelines.yml (Backend…'
parent: Migración a AWS
nav_order: 34
permalink: /01-migracion-aws/034/
---

{% raw %}

# Prompt 034
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 7,866 caracteres &middot; **Posición en la conversación:** 34 de 64

---

```
Modificalo tu mismo y sin emojis:




# azure-pipelines.yml (Backend - Migrado a AWS Elastic Beanstalk)




# 1. Disparadores

trigger:

  - main

  - develop




# 2. Agente (Ahora apunta a tu EC2 con Agente instalado)

pool:

  name: PoliTutorias-LocalPool

  demands:

    - Agent.OS -equals Linux




# 2.1 Variables (ADAPTADAS A AWS)

variables:

  NODE_VERSION: '22.x'




  # --- CONFIGURACIÓN AWS ---

  AWS_REGION: 'us-east-1'

  # Nombre de la conexión que creaste en Project Settings > Service Connections

  AWS_SERVICE_CONNECTION: 'AWS-Connection-Politutorias'




  # Elastic Beanstalk (Nombres exactos que pusimos en la consola)

  EB_APP_NAME: 'politutorias-backend'

  EB_ENV_STAGING: 'politutorias-backend-staging'

  EB_ENV_PROD: 'politutorias-backend-prod'




  # Buckets S3 (Para subir el ZIP antes de desplegar y almacenar archivos)

  # Asegúrate que estos nombres coincidan con los buckets que creaste

  S3_BUCKET_STAGING: 'politutorias-storage-staging'

  S3_BUCKET_PROD: 'politutorias-storage-prod'




# 3. Etapas

stages:

  # =================

  # ETAPA DE BUILD (CI) - (Intacta, solo optimizada para AWS)

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

            displayName: 'Instalar dependencias'




          - script: yarn lint

            displayName: 'Ejecutar Linter'




          - script: yarn test:cov

            displayName: 'Tests y Cobertura'




          # Mantenemos .NET solo para reportes de cobertura XML (si lo usas)

          - task: UseDotNet@2

            displayName: 'Instalar .NET Core SDK (Reportes)'

            inputs:

              packageType: 'sdk'

              version: '6.x'




          - task: PublishCodeCoverageResults@2

            displayName: 'Publicar Cobertura'

            inputs:

              codeCoverageTool: 'Cobertura'

              summaryFileLocation: '$(System.DefaultWorkingDirectory)/coverage/cobertura-coverage.xml'




          - script: |

              echo "Limpiando build previo..."

              rm -rf dist

              yarn build

            displayName: 'Compilar NestJS'




          # Copiar imágenes del seed

          - script: |

              mkdir -p dist/seed/images

              cp -r src/seed/images/* dist/seed/images/

            displayName: 'Copiar assets Seed'




          # Instalar dependencias de producción

          - script: |

              rm -rf node_modules

              yarn install --production --frozen-lockfile

            displayName: 'Instalar Prod Deps'




          # Empaquetado para Elastic Beanstalk

          - task: ArchiveFiles@2

            inputs:

              rootFolderOrFile: '$(System.DefaultWorkingDirectory)'

              includeRootFolder: false

              archiveType: 'zip'

              archiveFile: '$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip'

              replaceExistingArchive: true

            displayName: 'Crear ZIP de despliegue'




          - task: PublishBuildArtifacts@1

            inputs:

              PathtoPublish: '$(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip'

              ArtifactName: 'backend-api'

            displayName: 'Publicar Artefacto'




  # =======================

  # ETAPA DE STAGING (CD)

  # =======================

  - stage: Deploy_Staging

    displayName: '2. Deploy to Staging (AWS)'

    dependsOn: Build

    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/develop'))

    jobs:

      - deployment: Deploy

        environment: 'Staging'

        strategy:

          runOnce:

            deploy:

              steps:

                # 1. Despliegue a Elastic Beanstalk

                - task: BeanstalkDeployApplication@1

                  displayName: 'Deploy a Elastic Beanstalk (Staging)'

                  inputs:

                    awsCredentials: '$(AWS_SERVICE_CONNECTION)'

                    regionName: '$(AWS_REGION)'

                    applicationName: '$(EB_APP_NAME)'

                    environmentName: '$(EB_ENV_STAGING)'

                    applicationType: 'json'

                    # Elastic Beanstalk requiere subir el zip a S3 primero:

                    deploymentBundleBucket: '$(S3_BUCKET_STAGING)'

                    deploymentBundleKey: 'deploy-staging-$(Build.BuildId).zip'

                    webAppArchive: '$(Pipeline.Workspace)/backend-api/$(Build.BuildId).zip'




                # 2. Limpieza de S3 (Reemplaza a Azure CLI)

                - task: AWSCLI@1

                  displayName: 'Limpiar Bucket S3 (Staging)'

                  inputs:

                    awsCredentials: '$(AWS_SERVICE_CONNECTION)'

                    regionName: '$(AWS_REGION)'

                    scriptType: 'inline'

                    inlineScript: |

                      echo "Limpiando carpetas antiguas en S3 Staging..."

                      # AWS CLI usa 'rm --recursive' para borrar carpetas

                      aws s3 rm s3://$(S3_BUCKET_STAGING)/tutor-perfiles --recursive

                      aws s3 rm s3://$(S3_BUCKET_STAGING)/tutorias-imagenes --recursive




                # 3. Seed (CURL genérico)

                - script: |

                    echo "Esperando 30s a que el servidor arranque..."

                    sleep 30




                    # ⚠️ IMPORTANTE: Verifica esta URL en tu consola AWS Elastic Beanstalk

                    URL_STAGING="http://politutorias-backend-staging.eba-qnyktbf8.us-east-1.elasticbeanstalk.com/"




                    echo "Ejecutando Seed en: $URL_STAGING"

                    curl -X POST "$URL_STAGING/api/admin/seed" \

                      -H "x-api-key: <REDACTADO>"

                  displayName: 'Ejecutar Seed Staging'




  # ===========================

  # ETAPA DE PRODUCCIÓN (CE)

  # ===========================

  - stage: Deploy_Production

    displayName: '3. Deploy to Production (AWS)'

    dependsOn: Build

    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))

    jobs:

      - deployment: Deploy

        environment: 'Production'

        strategy:

          runOnce:

            deploy:

              steps:

                # 1. Despliegue a Elastic Beanstalk

                - task: BeanstalkDeployApplication@1

                  displayName: 'Deploy a Elastic Beanstalk (Prod)'

                  inputs:

                    awsCredentials: '$(AWS_SERVICE_CONNECTION)'

                    regionName: '$(AWS_REGION)'

                    applicationName: '$(EB_APP_NAME)'

                    environmentName: '$(EB_ENV_PROD)'

                    applicationType: 'json'

                    deploymentBundleBucket: '$(S3_BUCKET_PROD)'

                    deploymentBundleKey: 'deploy-prod-$(Build.BuildId).zip'

                    webAppArchive: '$(Pipeline.Workspace)/backend-api/$(Build.BuildId).zip'




                # 2. Seed Prod

                - script: |

                    echo "Esperando 30s a que el servidor arranque..."

                    sleep 30




                    # ⚠️ IMPORTANTE: Verifica esta URL en tu consola AWS Elastic Beanstalk

                    URL_PROD="http://politutorias-backend-prod.eba-qnyktbf8.us-east-1.elasticbeanstalk.com/"




                    echo "Ejecutando Seed en: $URL_PROD"

                    curl -X POST "$URL_PROD/api/admin/seed" \

                      -H "x-api-key: <REDACTADO>"

                  displayName: 'Ejecutar Seed Prod'







Devuelvelo completamente corregido
```

---

### Navegación

[← Prompt 033](/01-migracion-aws/033/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 035 →](/01-migracion-aws/035/)
{% endraw %}
