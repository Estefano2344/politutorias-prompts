---
layout: default
title: '040. pero recuerda que no estamos subiendo al S3 el backedn sino que e…'
parent: Migración a AWS
nav_order: 40
permalink: /01-migracion-aws/040/
---

{% raw %}

# Prompt 040
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 12,339 caracteres &middot; **Posición en la conversación:** 40 de 64

---

```
pero recuerda que no estamos subiendo al S3 el backedn sino que estamos subiendo la construccion como tal recuerda como lo haciamos antes:




# azure-pipelines.yml (Backend - NestJS con Seed)




# 1. Disparadores (Triggers)

trigger:

  - main # Se dispara con cambios en 'main'

  - develop # Se dispara con cambios en 'develop'




# 2. Agente (Pool)

pool:

  name: PoliTutorias-LocalPool




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

          - task: Cache@2

            displayName: 'Cache npm'

            inputs:

              key: 'npm | "$(Agent.OS)" | package-lock.json'

              restoreKeys: |

                npm | "$(Agent.OS)"

              path: '$(Pipeline.Workspace)/.npm'




          - task: NodeTool@0

            inputs:

              versionSpec: '22.x'

            displayName: 'Instalar Node.js 22 LTS'




          - script: npm ci

            env:

              NPM_CONFIG_CACHE: '$(Pipeline.Workspace)/.npm'

            displayName: 'Instalar todas las dependencias'




          - script: npm run lint

            displayName: 'Ejecutar Linter'




          - script: npm test -- --ci --reporters=default

            displayName: 'Ejecutar pruebas unitarias'




          - script: npm run build

            displayName: 'Compilar proyecto (npm run build)'




          - script: |

              echo "Copiando Imagenes del seed al dist"

              mkdir -p dist/seed/images

              cp -r src/seed/images/* dist/seed/images/

            displayName: 'Copiar imágenes del seed al dist'




          - script: |

              rm -rf node_modules

              npm ci --only=production

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

        displayName: 'Desplegar a App Service de Staging'

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

                    appName: 'app-politutorias-backend-staging'

                    package: '$(Pipeline.Workspace)/backend-api/$(Build.BuildId).zip'

                    runtimeStack: 'NODE|22-lts'

                    enableCustomDeployment: true

                    deploymentMethod: 'zipDeploy'




                - task: AzureCLI@2

                  displayName: 'Esperar /api/health y ejecutar seed (Staging)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Stag'

                    scriptType: 'bash'

                    scriptLocation: 'inlineScript'

                    inlineScript: |

                      set -euo pipefail

                      echo "Esperando a que /api/health esté OK (Staging)..."

                      for i in {1..30}; do

                        status=$(curl -fsS -o /dev/null -w "%{http_code}" https://app-politutorias-backend-staging.azurewebsites.net/api/health || true)

                        if [ "$status" = "200" ]; then

                          echo "Health OK"; break

                        fi

                        echo "Aún no disponible (status=$status). Reintentando..."; sleep 5

                      done

                      echo "Ejecutando comando de seed en App Service (Staging)..."

                      az rest --method POST \

                              --uri https://app-politutorias-backend-staging.scm.azurewebsites.net/api/command \

                              --resource https://management.azure.com/ \

                              --body '{"command":"npm run seed:prod", "dir":"site/wwwroot"}' \

                              --headers "Content-Type=application/json"

                      echo "Seed ejecutado."




  # ===========================

  # ETAPA DE PRODUCCIÓN (CE)

  # ===========================

  - stage: Deploy_Production

    displayName: '3. Deploy to Production (CE)'

    dependsOn: Build

    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))




    jobs:

      - deployment: Deploy

        displayName: 'Desplegar a App Service de Producción'

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

                    appName: 'app-politutorias-backend-prod'

                    package: '$(Pipeline.Workspace)/backend-api/$(Build.BuildId).zip'

                    runtimeStack: 'NODE|22-lts'

                    enableCustomDeployment: true

                    deploymentMethod: 'zipDeploy'




                - task: AzureCLI@2

                  displayName: 'Esperar /api/health y ejecutar seed (Producción)'

                  inputs:

                    azureSubscription: 'Azure-Student-Subscription-Connection-Prod'

                    scriptType: 'bash'

                    scriptLocation: 'inlineScript'

                    inlineScript: |

                      set -euo pipefail

                      echo "Esperando a que /api/health esté OK (Producción)..."

                      for i in {1..30}; do

                        status=$(curl -fsS -o /dev/null -w "%{http_code}" https://app-politutorias-backend-prod.azurewebsites.net/api/health || true)

                        if [ "$status" = "200" ]; then

                          echo "Health OK"; break

                        fi

                        echo "Aún no disponible (status=$status). Reintentando..."; sleep 5

                      done

                      echo "Ejecutando comando de seed en App Service (Producción)..."

                      az rest --method POST \

                              --uri https://app-politutorias-backend-prod.scm.azurewebsites.net/api/command \

                              --resource https://management.azure.com/ \

                              --body '{"command":"npm run seed:prod", "dir":"site/wwwroot"}' \

                              --headers "Content-Type=application/json"

                      echo "Seed ejecutado."







Ademas de que yo el blob lo uso para que le de direcciones a la BD:

import { Inject, Injectable, Logger } from '@nestjs/common';

import { ConfigService } from '@nestjs/config';

import { BlobServiceClient, BlockBlobClient } from '@azure/storage-blob';

import * as crypto from 'crypto';

import { Express } from 'express';




@Injectable()

export class StorageService {

  private readonly logger = new Logger(StorageService.name);




  // Propiedades para los nombres de tus contenedores

  private readonly offersContainerName: string;

  private readonly profilesContainerName: string;




  constructor(

    @Inject('BLOB_SERVICE_CLIENT') private blobServiceClient: BlobServiceClient,

    private configService: ConfigService,

  ) {

    // --- CORRECCIÓN DE TIPO ---

    // 1. Lee las variables en constantes temporales

    const offersContainer = this.configService.get<string>(

      'AZURE_STORAGE_CONTAINER_NAME_OFFERS',

    );

    const profilesContainer = this.configService.get<string>(

      'AZURE_STORAGE_CONTAINER_NAME_PROFILES',

    );




    // 2. Comprueba si existen ANTES de asignarlas

    if (!offersContainer || !profilesContainer) {

      throw new Error(

        'AZURE_STORAGE_CONTAINER_NAME_OFFERS or AZURE_STORAGE_CONTAINER_NAME_PROFILES is not defined in .env',

      );

    }




    // 3. Asigna (ahora TypeScript sabe que son strings)

    this.offersContainerName = offersContainer;

    this.profilesContainerName = profilesContainer;

    // --- FIN DE LA CORRECCIÓN ---

  }




  // --- CAMBIO 2: Métodos públicos específicos ---




  /**

   * Sube un archivo al contenedor de OFERTAS

   */

  async uploadOfferFile(file: Express.Multer.File): Promise<string> {

    return this.uploadFile(file, this.offersContainerName);

  }




  /**

   * Sube un archivo al contenedor de PERFILES

   */

  async uploadProfileFile(file: Express.Multer.File): Promise<string> {

    return this.uploadFile(file, this.profilesContainerName);

  }




  // --- FIN CAMBIO 2 ---




  // --- CAMBIO 3: Lógica genérica (ahora privada) ---




  /**

   * Obtiene/Crea un cliente de contenedor genérico

   */

  private async getContainerClient(containerName: string) {

    const containerClient =

      this.blobServiceClient.getContainerClient(containerName);

    try {

      await containerClient.createIfNotExists({ access: 'blob' });

    } catch (error) {

      let message = 'Unknown error';

      if (error instanceof Error) {

        message = error.message;

      }

      this.logger.error(`Could not create container: ${message}`);

    }

    return containerClient;

  }




  /**

   * Lógica de subida de archivo genérica (ahora privada)

   */

  private async uploadFile(

    file: Express.Multer.File,

    containerName: string, // <-- Acepta el nombre del contenedor

  ): Promise<string> {

    if (!file) {

      throw new Error('File not provided');

    }




    const fileExtension = file.originalname.split('.').pop();

    const uniqueFileName = `${crypto

      .randomBytes(16)

      .toString('hex')}.${fileExtension}`;




    try {

      // Usa el nombre del contenedor dinámicamente

      const containerClient = await this.getContainerClient(containerName);

      const blockBlobClient: BlockBlobClient =

        containerClient.getBlockBlobClient(uniqueFileName);




      await blockBlobClient.uploadData(file.buffer, {

        blobHTTPHeaders: {

          blobContentType: file.mimetype,

        },

      });




      // Loguea el contenedor correcto

      this.logger.log(

        `File ${uniqueFileName} uploaded successfully to container ${containerName}`,

      );




      return blockBlobClient.url;

    } catch (error) {

      let message = 'Unknown error';

      if (error instanceof Error) {

        message = error.message;

      }

      this.logger.error(`Error uploading file: ${message}`);

      throw new Error('Failed to upload file to Azure Storage');

    }

  }

  // --- FIN CAMBIO 3 ---

}




Y asi lo usaba en mi env:




DB_PASSWORD=<REDACTADO>

DB_NAME=politutorias

DB_HOST=localhost

DB_PORT=5432

DB_USERNAME=postgres

AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;"

AZURE_STORAGE_CONTAINER_NAME_OFFERS="tutorias-imagenes"

AZURE_STORAGE_CONTAINER_NAME_PROFILES="tutor-perfiles"

JWT_SECRET=<REDACTADO>

JWT_REFRESH_SECRET=<REDACTADO>

SEED_API_KEY=<REDACTADO>




Ademas asi lo tenia en azure, con las variables de entorno correspondientes
```

---

### Navegación

[← Prompt 039](/01-migracion-aws/039/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 041 →](/01-migracion-aws/041/)
{% endraw %}
