---
layout: default
title: '013. Connection steps Follow the steps below to paste the code of each…'
parent: Migración a AWS
nav_order: 13
permalink: /01-migracion-aws/013/
---

{% raw %}

# Prompt 013
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 438 caracteres &middot; **Posición en la conversación:** 13 de 64

---

```
Connection steps

Follow the steps below to paste the code of each step in your tool and run the commands. The snippets dynamically reflect the authentication configuration.




export RDSHOST="<REDACTADO>" psql "host=$RDSHOST port=5432 dbname=politutorias_db user=postgres sslmode=verify-full sslrootcert=/certs/global-bundle.pem password=<Enter_DB_Password>"




Esto me sale ningun endpoint
```

---

### Navegación

[← Prompt 012](/01-migracion-aws/012/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 014 →](/01-migracion-aws/014/)
{% endraw %}
