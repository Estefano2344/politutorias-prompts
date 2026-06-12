---
layout: default
title: '050. asi quedo la politica si esta bien? ''Version'': ''2012-10-17'', ''Sta…'
parent: Migración a AWS
nav_order: 50
permalink: /01-migracion-aws/050/
---

{% raw %}

# Prompt 050
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 336 caracteres &middot; **Posición en la conversación:** 50 de 64

---

```
asi quedo la politica si esta bien?




    "Version": "2012-10-17",

    "Statement": [

        {

            "Sid": "PublicReadGetObject",

            "Effect": "Allow",

            "Principal": "*",

            "Action": "s3:GetObject",

            "Resource": "arn:aws:s3:::politutorias-storage-staging/*"

        }

    ]

}
```

---

### Navegación

[← Prompt 049](/01-migracion-aws/049/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 051 →](/01-migracion-aws/051/)
{% endraw %}
