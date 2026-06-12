---
layout: default
title: '016. Ya esta la base de datos y los S3 pero no falta todavia, el backe…'
parent: Migración a AWS
nav_order: 16
permalink: /01-migracion-aws/016/
---

{% raw %}

# Prompt 016
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 1,191 caracteres &middot; **Posición en la conversación:** 16 de 64

---

```
Ya esta la base de datos y los S3 pero no falta todavia, el backend como tal?




porque por ejemplo yo mi backend lo conectaba asi:




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




Y mi frontend lo conectaba asi:

# Backend API URL

# Local: http://localhost:3001/api

# Azure: https://tu-backend.azurewebsites.net/api

NEXT_PUBLIC_BACKEND_URL="http://localhost:3001/api"




# Image Configuration

# Local: http y 127.0.0.1

# Azure: https y tu-storage.blob.core.windows.net

IMAGE_PROTOCOL="http"

IMAGE_HOSTNAME="127.0.0.1"




# Node Environment

# Automáticamente establecido por Next.js

# development | production | test

NODE_ENV="development"
```

---

### Navegación

[← Prompt 015](/01-migracion-aws/015/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 017 →](/01-migracion-aws/017/)
{% endraw %}
