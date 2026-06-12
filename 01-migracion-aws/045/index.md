---
layout: default
title: '045. Ya esta: Starting: Ejecutar Seed Staging ========================…'
parent: Migración a AWS
nav_order: 45
permalink: /01-migracion-aws/045/
---

{% raw %}

# Prompt 045
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 1,844 caracteres &middot; **Posición en la conversación:** 45 de 64

---

```
Ya esta:




Starting: Ejecutar Seed Staging




==============================================================================




Task : Command line




Description : Run a command line script using Bash on Linux and macOS and cmd.exe on Windows




Version : 2.268.0




Author : Microsoft Corporation




Help : https://docs.microsoft.com/azure/devops/pipelines/tasks/utility/command-line




==============================================================================




Generating script.




========================== Starting Command Output ===========================




/usr/bin/bash --noprofile --norc /home/ubuntu/myagent/_work/_temp/49b1a825-c55b-4113-a794-bf69f516943b.sh




Esperando 120s a que el servidor arranque después del deploy...




Ejecutando Seed en: http://politutorias-backend-staging.eba-qnyktbf8.us-east-1.elasticbeanstalk.com




% Total % Received % Xferd Average Speed Time Time Time Current




Dload Upload Total Spent Left Speed










0 0 0 0 0 0 0 0 --:--:-- --:--:-- --:--:-- 0




100 180 100 180 0 0 343 0 --:--:-- --:--:-- --:--:-- 343




{"success":true,"message":"Operación realizada","data":{"message":"Seed ejecutado correctamente"},"statusCode":201,"timestamp":"2026-02-05T05:34:24.165Z","path":"/api/admin/seed"}




Finishing: Ejecutar Seed Staging










Ahora como lo pruebo desde mi frontend localmente?




cuando antes me conectaba asi:

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

[← Prompt 044](/01-migracion-aws/044/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 046 →](/01-migracion-aws/046/)
{% endraw %}
