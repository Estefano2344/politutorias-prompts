---
layout: default
title: '043. Con este pipeline: # azure-pipelines.yml (Backend - Migrado a AWS…'
parent: Migración a AWS
nav_order: 43
permalink: /01-migracion-aws/043/
---

{% raw %}

# Prompt 043
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 16,669 caracteres &middot; **Posición en la conversación:** 43 de 64

---

```
Con este pipeline:

# azure-pipelines.yml (Backend - Migrado a AWS Elastic Beanstalk)




# 1. Disparadores

trigger:

  - main

  - develop




# 2. Agente

pool:

  name: PoliTutorias-LocalPool

  demands:

    - Agent.OS -equals Linux




# 2.1 Variables (Configuración para AWS)

variables:

  - group: AWS-Credentials # Variable group con AWS_ACCESS_KEY_ID y AWS_SECRET_ACCESS_KEY




  - name: NODE_VERSION

    value: '22.x'




  # --- CONFIGURACIÓN AWS ---

  - name: AWS_REGION

    value: 'us-east-1'

  - name: AWS_SERVICE_CONNECTION

    value: 'AWS-Connection-Politutorias'

  - name: AWS_BUCKET_NAME

    value: 'politutorias-storage-prod'




  # Elastic Beanstalk

  - name: EB_APP_NAME

    value: 'politutorias-backend'

  - name: EB_ENV_STAGING

    value: 'politutorias-backend-staging'

  - name: EB_ENV_PROD

    value: 'politutorias-backend-prod'




# 3. Etapas

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

            displayName: 'Instalar dependencias'




          - script: yarn lint

            displayName: 'Ejecutar Linter'




          - script: yarn test:cov

            displayName: 'Tests y Cobertura'




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




          - script: |

              mkdir -p dist/seed/images

              cp -r src/seed/images/* dist/seed/images/

            displayName: 'Copiar assets Seed'




          - script: |

              rm -rf node_modules

              yarn install --production --frozen-lockfile

            displayName: 'Instalar Prod Deps'




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

                - script: |

                    # Install AWS CLI and EB CLI using pipx

                    echo "Installing AWS CLI and EB CLI..."

                    sudo apt-get update -qq

                    sudo apt-get install -y pipx unzip curl




                    # Install AWS CLI v2

                    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

                    unzip -q awscliv2.zip

                    sudo ./aws/install




                    # Install EB CLI

                    pipx install awsebcli

                    pipx ensurepath




                    # Add pipx bin to PATH

                    export PATH=$PATH:$HOME/.local/bin




                    # Verify installations

                    aws --version

                    eb --version

                  displayName: 'Install AWS CLI and EB CLI'




                - script: |

                    # Add tools to PATH

                    export PATH=$PATH:$HOME/.local/bin




                    # Configure AWS credentials (using Azure DevOps variables)

                    aws configure set aws_access_key_id "$(AWS_ACCESS_KEY_ID)"

                    aws configure set aws_secret_access_key "$(AWS_SECRET_ACCESS_KEY)"

                    aws configure set default.region "$(AWS_REGION)"




                    # Extract the application package

                    cd $(Pipeline.Workspace)/backend-api

                    echo "Extracting application package..."

                    ls -lh $(Build.BuildId).zip

                    unzip -o $(Build.BuildId).zip -d app-staging

                    cd app-staging

                    echo "Package extracted. Contents:"

                    ls -la




                    # Initialize EB application if not exists

                    eb init $(EB_APP_NAME) --region $(AWS_REGION) --platform "Node.js 22 running on 64bit Amazon Linux 2023"




                    # Deploy to staging environment

                    eb deploy $(EB_ENV_STAGING) --timeout 20

                  displayName: 'Deploy to AWS Elastic Beanstalk Staging'




                - script: |

                    echo "Esperando 120s a que el servidor arranque después del deploy..."

                    sleep 120

                    URL_STAGING="http://$(EB_ENV_STAGING).eba-qnyktbf8.us-east-1.elasticbeanstalk.com"

                    echo "Ejecutando Seed en: $URL_STAGING"

                    curl -X POST "$URL_STAGING/api/admin/seed" \

                      -H "x-api-key: <REDACTADO>" \

                      -H "Content-Type: application/json" \

                      --max-time 300 \

                      --retry 5 \

                      --retry-delay 10

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

                - script: |

                    # Install AWS CLI and EB CLI using pipx

                    echo "Installing AWS CLI and EB CLI..."

                    sudo apt-get update -qq

                    sudo apt-get install -y pipx unzip curl




                    # Install AWS CLI v2

                    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

                    unzip -q awscliv2.zip

                    sudo ./aws/install




                    # Install EB CLI

                    pipx install awsebcli

                    pipx ensurepath




                    # Add pipx bin to PATH

                    export PATH=$PATH:$HOME/.local/bin




                    # Verify installations

                    aws --version

                    eb --version

                  displayName: 'Install AWS CLI and EB CLI'




                - script: |

                    # Add tools to PATH

                    export PATH=$PATH:$HOME/.local/bin




                    # Configure AWS credentials (using Azure DevOps variables)

                    aws configure set aws_access_key_id "$(AWS_ACCESS_KEY_ID)"

                    aws configure set aws_secret_access_key "$(AWS_SECRET_ACCESS_KEY)"

                    aws configure set default.region "$(AWS_REGION)"




                    # Extract the application package

                    cd $(Pipeline.Workspace)/backend-api

                    echo "Extracting application package..."

                    ls -lh $(Build.BuildId).zip

                    unzip -o $(Build.BuildId).zip -d app-prod

                    cd app-prod

                    echo "Package extracted. Contents:"

                    ls -la




                    # Initialize EB application if not exists

                    eb init $(EB_APP_NAME) --region $(AWS_REGION) --platform "Node.js 22 running on 64bit Amazon Linux 2023"




                    # Deploy to production environment

                    eb deploy $(EB_ENV_PROD) --timeout 20

                  displayName: 'Deploy to AWS Elastic Beanstalk Production'




                - script: |

                    echo "Esperando 120s a que el servidor arranque después del deploy..."

                    sleep 120

                    URL_PROD="http://$(EB_ENV_PROD).eba-qnyktbf8.us-east-1.elasticbeanstalk.com"

                    echo "Ejecutando Seed en: $URL_PROD"

                    curl -X POST "$URL_PROD/api/admin/seed" \

                      -H "x-api-key: <REDACTADO>" \

                      -H "Content-Type: application/json" \

                      --max-time 300 \

                      --retry 3 \

                      --retry-delay 10

                  displayName: 'Ejecutar Seed Prod'







Logre llegar hasta aca:

2026-02-05T04:53:33.5933284Z inflating: app-staging/tsconfig.build.json

2026-02-05T04:53:33.5933699Z inflating: app-staging/tsconfig.json

2026-02-05T04:53:33.5966335Z inflating: app-staging/yarn.lock

2026-02-05T04:53:33.5982572Z Package extracted. Contents:

2026-02-05T04:53:33.6012787Z total 788

2026-02-05T04:53:33.6014874Z drwxr-xr-x 10 ubuntu ubuntu 4096 Feb 5 04:53 .

2026-02-05T04:53:33.6016090Z drwxr-xr-x 3 ubuntu ubuntu 4096 Feb 5 04:53 ..

2026-02-05T04:53:33.6016389Z drwxr-xr-x 2 ubuntu ubuntu 4096 Feb 5 04:53 .ebextensions

2026-02-05T04:53:33.6016781Z drwxr-xr-x 3 ubuntu ubuntu 4096 Feb 5 04:20 .elasticbeanstalk

2026-02-05T04:53:33.6031576Z -rw-r--r-- 1 ubuntu ubuntu 547 Feb 4 20:14 .env.template

2026-02-05T04:53:33.6042086Z drwxr-xr-x 8 ubuntu ubuntu 4096 Feb 5 04:53 .git

2026-02-05T04:53:33.6045453Z -rw-r--r-- 1 ubuntu ubuntu 755 Feb 4 20:14 .gitignore

2026-02-05T04:53:33.6045747Z -rw-r--r-- 1 ubuntu ubuntu 52 Feb 4 20:14 .prettierrc

2026-02-05T04:53:33.6046016Z -rw-r--r-- 1 ubuntu ubuntu 9 Feb 5 04:49 Buildfile

2026-02-05T04:53:33.6046294Z -rw-r--r-- 1 ubuntu ubuntu 6532 Feb 4 20:14 POSTMAN_HISTORY_ENDPOINT.md

2026-02-05T04:53:33.6046586Z -rw-r--r-- 1 ubuntu ubuntu 7564 Feb 4 20:14 POSTMAN_STUDENT_HISTORY.md

2026-02-05T04:53:33.6046861Z -rw-r--r-- 1 ubuntu ubuntu 23 Feb 5 04:35 Procfile

2026-02-05T04:53:33.6047124Z -rw-r--r-- 1 ubuntu ubuntu 5212 Feb 4 20:14 README.md

2026-02-05T04:53:33.6047400Z -rw-r--r-- 1 ubuntu ubuntu 9281 Feb 5 04:35 azure-pipelines.yml

2026-02-05T04:53:33.6047688Z drwxr-xr-x 3 ubuntu ubuntu 4096 Feb 5 04:53 coverage

2026-02-05T04:53:33.6047950Z drwxr-xr-x 10 ubuntu ubuntu 4096 Feb 5 04:53 dist

2026-02-05T04:53:33.6048219Z -rw-r--r-- 1 ubuntu ubuntu 608 Feb 4 20:14 docker-compose.yml

2026-02-05T04:53:33.6048499Z -rw-r--r-- 1 ubuntu ubuntu 899 Feb 4 20:14 eslint.config.mjs

2026-02-05T04:53:33.6048771Z -rw-r--r-- 1 ubuntu ubuntu 171 Feb 4 20:14 nest-cli.json

2026-02-05T04:53:33.6049051Z drwxr-xr-x 231 ubuntu ubuntu 12288 Feb 5 04:53 node_modules

2026-02-05T04:53:33.6049314Z -rw-r--r-- 1 ubuntu ubuntu 393137 Feb 4 20:14 package-lock.json

2026-02-05T04:53:33.6049588Z -rw-r--r-- 1 ubuntu ubuntu 3273 Feb 5 02:29 package.json

2026-02-05T04:53:33.6049858Z drwxr-xr-x 10 ubuntu ubuntu 4096 Feb 5 04:53 src

2026-02-05T04:53:33.6050117Z drwxr-xr-x 2 ubuntu ubuntu 4096 Feb 5 04:53 test

2026-02-05T04:53:33.6050387Z -rw-r--r-- 1 ubuntu ubuntu 97 Feb 4 20:14 tsconfig.build.json

2026-02-05T04:53:33.6050664Z -rw-r--r-- 1 ubuntu ubuntu 677 Feb 4 20:14 tsconfig.json

2026-02-05T04:53:33.6051162Z -rw-r--r-- 1 ubuntu ubuntu 281197 Feb 5 02:29 yarn.lock

2026-02-05T04:53:34.5669074Z WARNING: Git is in a detached head state. Using branch "default".

2026-02-05T04:53:35.7665256Z WARNING: Git is in a detached head state. Using branch "default".

2026-02-05T04:53:36.6377359Z WARNING: Git is in a detached head state. Using branch "default".

2026-02-05T04:53:36.6474493Z WARNING: Git is in a detached head state. Using branch "default".

2026-02-05T04:53:37.5595927Z WARNING: Git is in a detached head state. Using branch "default".

2026-02-05T04:53:37.5667729Z WARNING: Git is in a detached head state. Using branch "default".

2026-02-05T04:53:37.9388732Z WARNING: Git is in a detached head state. Using branch "default".

2026-02-05T04:54:50.4913908Z Creating application version archive "app-57a5-260205_045338022012".

2026-02-05T04:54:50.4915110Z Uploading politutorias-backend/app-57a5-260205_045338022012.zip to S3. This may take a while.

2026-02-05T04:54:50.4916003Z Upload Complete.

2026-02-05T04:54:50.4916504Z 2026-02-05 04:53:39 INFO Environment update is starting.

2026-02-05T04:54:50.4917532Z 2026-02-05 04:54:03 INFO Deploying new version to instance(s).

2026-02-05T04:54:50.4917795Z 2026-02-05 04:54:29 INFO Instance deployment completed successfully.

2026-02-05T04:54:50.4918273Z 2026-02-05 04:54:49 INFO New application version was deployed to running EC2 instances.

2026-02-05T04:54:50.4918567Z 2026-02-05 04:54:50 INFO Environment update completed successfully.

2026-02-05T04:54:50.6466666Z

2026-02-05T04:54:50.6615157Z ##[section]Finishing: Deploy to AWS Elastic Beanstalk Staging




Pero tengo un problema, ademas con el agente de claude creo:

Procfile:

web: node dist/main.js







production.config

option_settings:

  aws:elasticbeanstalk:environment:

    LoadBalancerType: application

  aws:elasticbeanstalk:application:environment:

    NODE_ENV: production

    PORT: 8080

    # Database (configura estos valores en AWS)

    DB_HOST: <REDACTADO>

    DB_PORT: 5432

    DB_USERNAME: postgres

    DB_PASSWORD: <REDACTADO>

    DB_NAME: politutorias

    # JWT Secrets

    JWT_SECRET: production-secret-change-me

    JWT_REFRESH_SECRET: production-refresh-secret-change-me

    # Seed API Key

    SEED_API_KEY: <REDACTADO>

    # Azure Storage

    AZURE_STORAGE_CONNECTION_STRING: ""

    AZURE_STORAGE_CONTAINER_NAME_OFFERS: ""

    AZURE_STORAGE_CONTAINER_NAME_PROFILES: ""

  aws:autoscaling:launchconfiguration:

    InstanceType: t3.small

  aws:elasticbeanstalk:healthreporting:system:

    SystemType: enhanced




Y un staging.config:




option_settings:

  aws:elasticbeanstalk:environment:

    LoadBalancerType: application

  aws:elasticbeanstalk:application:environment:

    NODE_ENV: staging

    PORT: 8080

    # Database (configura estos valores en AWS)

    DB_HOST: <REDACTADO>

    DB_PORT: 5432

    DB_USERNAME: postgres

    DB_PASSWORD: <REDACTADO>

    DB_NAME: politutorias

    # JWT Secrets

    JWT_SECRET: staging-secret-change-me

    JWT_REFRESH_SECRET: staging-refresh-secret-change-me

    # Seed API Key

    SEED_API_KEY: <REDACTADO>

    # AWS S3 Storage

    AWS_S3_BUCKET_NAME: politutorias-storage-staging

    AWS_S3_REGION: us-east-1

    S3_CONTAINER_NAME_OFFERS: offers

    S3_CONTAINER_NAME_PROFILES: profiles

  aws:autoscaling:launchconfiguration:

    InstanceType: t3.micro

  aws:elasticbeanstalk:healthreporting:system:

    SystemType: enhanced




Y este es mi env:

# Configuración de entorno para AWS




# Base de datos

DB_HOST=<REDACTADO>

DB_PORT=5432

DB_NAME=postgres

DB_USERNAME=postgres

DB_PASSWORD=<REDACTADO>




# Seguridad

JWT_SECRET=<REDACTADO>

JWT_REFRESH_SECRET=<REDACTADO>

SEED_API_KEY=<REDACTADO>

NODE_ENV=development




# AWS

AWS_ACCESS_KEY_ID=<REDACTADO>

AWS_SECRET_ACCESS_KEY=<REDACTADO>

AWS_REGION=us-east-1

AWS_BUCKET_NAME=politutorias-storage-prod




Que ademas si ejecuto yarn start:dev funciona todo bien:

{"success":true,"message":"Operación realizada","data":{"status":"ok","uptime":14.2518847,"timestamp":"2026-02-05T05:04:42.095Z"},"statusCode":200,"timestamp":"2026-02-05T05:04:42.095Z","path":"/api/health"}




Y en mis pipelines esta condifuguradas las variables en azure pipelines
```

---

### Navegación

[← Prompt 042](/01-migracion-aws/042/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 044 →](/01-migracion-aws/044/)
{% endraw %}
