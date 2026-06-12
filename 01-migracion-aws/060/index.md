---
layout: default
title: '060. Corrige tu mismo: # azure-pipelines.yml (Frontend - Next.js a Ver…'
parent: Migración a AWS
nav_order: 60
permalink: /01-migracion-aws/060/
---

{% raw %}

# Prompt 060
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 6,083 caracteres &middot; **Posición en la conversación:** 60 de 64

---

```
Corrige tu mismo:




# azure-pipelines.yml (Frontend - Next.js a Vercel - FIX MANUAL)




trigger:

  branches:

    include:

      - main

      - develop

pr:

  branches:

    include:

      - develop




pool:

  name: PoliTutorias-LocalPool

  demands:

    - Agent.OS -equals Linux




variables:

  - name: NODE_VERSION

    value: "22.x"




  # IDs de Vercel (Configuración del Proyecto)

  - name: VERCEL_PROJECT_ID

    value: "prj_YDYhdgLT12EU3Tfp7o0OlAiK66iN"

  - name: VERCEL_ORG_ID # Equivalente a TEAM_ID para la CLI

    value: "team_rFjZG0SVqdEif7MINfBqAoiJ"




  # Variables de Entorno de la Aplicación

  - name: NEXT_PUBLIC_BACKEND_URL

    value: "http://politutorias-backend-staging.eba-qnyktbf8.us-east-1.elasticbeanstalk.com/api"

  - name: IMAGE_PROTOCOL

    value: "https"

  - name: IMAGE_HOSTNAME

    value: "politutorias-storage-staging.s3.amazonaws.com"




stages:

  # ==========================================

  # ETAPA 1: BUILD (Preparar Código Fuente)

  # ==========================================

  - stage: Build

    displayName: "1. Empaquetar Código (CI)"

    jobs:

      - job: Build

        steps:

          - script: |

              echo "Limpiando workspace..."

              rm -rf $(Agent.BuildDirectory)/*

            displayName: "Clean workspace"




          - checkout: self




          - task: NodeTool@0

            inputs:

              versionSpec: "$(NODE_VERSION)"

            displayName: "Instalar Node.js"




          - script: npm ci

            displayName: "Instalar dependencias (Check)"




          # Verificamos que el proyecto compile localmente antes de enviarlo

          - script: npm run build

            displayName: "Verificar Compilación (Dry Run)"




          # EMPAQUETADO:

          # Para Vercel vía CLI, lo mejor es enviar el CÓDIGO FUENTE.

          # Vercel hará el build real en su nube (serverless).

          - script: |

              echo "Preparando paquete para Vercel..."

              mkdir deploy_source




              # Copiamos archivos esenciales del proyecto

              # Asegúrate de incluir todos los configs necesarios

              cp package.json deploy_source/

              cp package-lock.json deploy_source/

              cp next.config.ts deploy_source/

              cp tsconfig.json deploy_source/




              # Copiamos carpetas de código y assets

              cp -r src deploy_source/

              cp -r public deploy_source/




              # Si tienes archivos como tailwind.config.ts o postcss.config.mjs, agrégalos:

              # cp tailwind.config.ts deploy_source/ 2>/dev/null || true

              # cp postcss.config.mjs deploy_source/ 2>/dev/null || true




              echo "Contenido del paquete a enviar:"

              ls -la deploy_source

            displayName: "Preparar Código Fuente"




          - task: ArchiveFiles@2

            inputs:

              rootFolderOrFile: "deploy_source"

              includeRootFolder: false

              archiveType: "zip"

              archiveFile: "$(Build.ArtifactStagingDirectory)/source.zip"

              replaceExistingArchive: true

            displayName: "Crear ZIP"




          - task: PublishBuildArtifacts@1

            inputs:

              PathtoPublish: "$(Build.ArtifactStagingDirectory)/source.zip"

              ArtifactName: "frontend-source"

            displayName: "Publicar Artefacto"




  # ==========================================

  # ETAPA 2: DEPLOY (Enviar a Vercel)

  # ==========================================

  - stage: Deploy

    displayName: "2. Deploy to Vercel (CD)"

    dependsOn: Build

    condition: succeeded()

    jobs:

      - deployment: DeployVercel

        displayName: "Desplegar CLI"

        pool:

          name: PoliTutorias-LocalPool

        environment: "VercelDeployment"

        strategy:

          runOnce:

            deploy:

              steps:

                # 1. Descargar y Descomprimir

                - task: DownloadBuildArtifacts@1

                  inputs:

                    buildType: "current"

                    downloadType: "single"

                    artifactName: "frontend-source"

                    downloadPath: "$(System.DefaultWorkingDirectory)"

                  displayName: "Descargar Artefacto"




                - script: |

                    echo "Extrayendo código..."

                    mkdir app-source

                    unzip $(System.DefaultWorkingDirectory)/frontend-source/source.zip -d app-source

                  displayName: "Descomprimir Código"




                # 2. Instalar Vercel CLI (Localmente para evitar sudo/EACCES)

                - script: |

                    echo "Instalando Vercel CLI en carpeta local..."

                    cd app-source

                    npm install vercel

                  displayName: "Instalar Vercel CLI"




                # 3. Ejecutar Despliegue

                - script: |

                    cd app-source




                    echo "Iniciando despliegue a Vercel..."




                    # Construimos las variables de entorno para inyectarlas en el deploy

                    # Esto sobreescribe o complementa lo que tengas en el panel de Vercel

                    VARS="--env NEXT_PUBLIC_BACKEND_URL=$(NEXT_PUBLIC_BACKEND_URL) --env IMAGE_PROTOCOL=$(IMAGE_PROTOCOL) --env IMAGE_HOSTNAME=$(IMAGE_HOSTNAME)"




                    # Ejecutamos el binario local de Vercel

                    # --prod: Producción

                    # --yes: Sin preguntas

                    # --force: Forzar nuevo build en Vercel




                    ./node_modules/.bin/vercel deploy --prod $VARS --token $(VERCEL_TOKEN) --yes --force

                  displayName: "Ejecutar Vercel Deploy"

                  env:

                    # Inyectamos IDs obligatorios para que la CLI sepa dónde ir sin login interactivo

                    VERCEL_ORG_ID: $(VERCEL_ORG_ID)

                    VERCEL_PROJECT_ID: $(VERCEL_PROJECT_ID)
```

---

### Navegación

[← Prompt 059](/01-migracion-aws/059/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 061 →](/01-migracion-aws/061/)
{% endraw %}
