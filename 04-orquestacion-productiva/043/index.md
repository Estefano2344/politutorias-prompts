---
layout: default
title: '043. Tengo docker compose y es por la terminal de docker desktop que l…'
parent: Orquestación n8n productiva
nav_order: 43
permalink: /04-orquestacion-productiva/043/
---

{% raw %}

# Prompt 043
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 910 caracteres &middot; **Posición en la conversación:** 43 de 103

---

```
Tengo docker compose y es por la terminal de docker desktop que lo levnaot:
Asiq ue editalo de una vez:
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

Y aprovechando coloca todo en la misma red y haz que mis compañeros desde su casa puedan acceder 
```

---

### Navegación

[← Prompt 042](/04-orquestacion-productiva/042/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 044 →](/04-orquestacion-productiva/044/)
{% endraw %}
