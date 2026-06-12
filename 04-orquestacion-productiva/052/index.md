---
layout: default
title: '052. ya me rendi con eso, dejemolo para despues, ahorita en mi n8n ant…'
parent: Orquestación n8n productiva
nav_order: 52
permalink: /04-orquestacion-productiva/052/
---

{% raw %}

# Prompt 052
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 938 caracteres &middot; **Posición en la conversación:** 52 de 103

---

```
ya me rendi con eso, dejemolo para despues, ahorita en mi n8n anterior sin tunel porque lo quite:

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

Deberia poder observar los archivos verdad? en C:\\n8n-archivos

y ahora si como seria el happy path? para probar hasta el flujo 3
```

---

### Navegación

[← Prompt 051](/04-orquestacion-productiva/051/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 053 →](/04-orquestacion-productiva/053/)
{% endraw %}
