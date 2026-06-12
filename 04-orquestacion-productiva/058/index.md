---
layout: default
title: '058. No puede acceder al video, asi esta el compose: version: ''3.8'' se…'
parent: Orquestación n8n productiva
nav_order: 58
permalink: /04-orquestacion-productiva/058/
---

{% raw %}

# Prompt 058
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 757 caracteres &middot; **Posición en la conversación:** 58 de 103

---

```
No puede acceder al video, asi esta el compose:

version: '3.8'

services:
  n8n:
    image: docker.n8n.io/n8nio/n8n
    restart: always
    ports:
      - \"5678:5678\"
    environment:
      - N8N_HOST=localhost
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - NODE_ENV=production
      - WEBHOOK_URL=http://localhost:5678/
      - GENERIC_TIMEZONE=America/Guayaquil
    volumes:
      - n8n_data:/home/node/.n8n
      - C:\\n8n-archivos:/files
    depends_on:
      - postgres

  postgres:
    image: postgres:11
    restart: always
    environment:
      - POSTGRES_USER=n8n
      - POSTGRES_PASSWORD=<REDACTADO>
      - POSTGRES_DB=n8n
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  n8n_data:
  postgres_data:

```

---

### Navegación

[← Prompt 057](/04-orquestacion-productiva/057/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 059 →](/04-orquestacion-productiva/059/)
{% endraw %}
