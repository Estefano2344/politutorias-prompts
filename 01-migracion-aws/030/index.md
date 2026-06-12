---
layout: default
title: '030. 2026-02-04T20:19:58.9783096Z ##[section]Starting: Deploy a Elasti…'
parent: Migración a AWS
nav_order: 30
permalink: /01-migracion-aws/030/
---

{% raw %}

# Prompt 030
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 11,378 caracteres &middot; **Posición en la conversación:** 30 de 64

---

```
2026-02-04T20:19:58.9783096Z ##[section]Starting: Deploy a Elastic Beanstalk (Staging)

2026-02-04T20:19:58.9801330Z ==============================================================================

2026-02-04T20:19:58.9801513Z Task : AWS Elastic Beanstalk Deploy Application

2026-02-04T20:19:58.9801637Z Description : Deploys an application to Amazon EC2 instance(s) using AWS Elastic Beanstalk

2026-02-04T20:19:58.9801771Z Version : 1.24.0

2026-02-04T20:19:58.9801877Z Author : Amazon Web Services

2026-02-04T20:19:58.9802529Z Help : Please refer to [AWS Elastic Beanstalk User Guide](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html) for more details on deploying applications with AWS Elastic Beanstalk.




More information on this task can be found in the [task reference](https://docs.aws.amazon.com/vsts/latest/userguide/elastic-beanstalk-deploy.html).




####Task Permissions

This task requires permissions to call the following AWS service APIs (not all APIs may be used depending on selected task options and environment configuration):

* autoscaling:DescribeScalingActivities

* autoscaling:DescribeAutoScalingGroups

* autoscaling:ResumeProcesses

* autoscaling:SuspendProcesses

* cloudformation:DescribeStackResource

* cloudformation:DescribeStackResources

* elasticbeanstalk:CreateApplicationVersion

* elasticbeanstalk:CreateStorageLocation

* elasticbeanstalk:DescribeApplications

* elasticbeanstalk:DescribeEnvironments

* elasticbeanstalk:DescribeEvents

* elasticloadbalancing:RegisterInstancesWithLoadBalancer

* elasticbeanstalk:UpdateEnvironment




The task also requires permissions to upload your application content to the specified Amazon S3 bucket. Depending on the size of the application bundle, either PutObject or the S3 multi-part upload APIs may be used.

2026-02-04T20:19:58.9803715Z ==============================================================================

2026-02-04T20:20:00.6189508Z Deployment type set to aspnet

2026-02-04T20:20:00.6208254Z Configuring credentials for task

2026-02-04T20:20:00.6219443Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:20:00.6247071Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:20:00.6249555Z Skipping OIDC: not enabled in service connections

2026-02-04T20:20:00.6250546Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:20:00.6252965Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:20:00.6253850Z Configuring region for task

2026-02-04T20:20:00.6255700Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:20:00.6350645Z Configuring credentials for task

2026-02-04T20:20:00.6354350Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:20:00.6361602Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:20:00.6362359Z Skipping OIDC: not enabled in service connections

2026-02-04T20:20:00.6363480Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:20:00.6364552Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:20:00.6366123Z Configuring region for task

2026-02-04T20:20:00.6367466Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:20:01.4155548Z ##[error]Error: Application politutorias-backend does not exist

2026-02-04T20:20:01.5097539Z ##[section]Finishing: Deploy a Elastic Beanstalk (Staging)




Y si modifique la URL:

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
```

---

### Navegación

[← Prompt 029](/01-migracion-aws/029/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 031 →](/01-migracion-aws/031/)
{% endraw %}
