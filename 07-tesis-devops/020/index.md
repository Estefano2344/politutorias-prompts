---
layout: default
title: '020. Okay, te comento ahorita mi front y back ya se esta conectando y…'
parent: Redacción TIC DevOps
nav_order: 20
permalink: /07-tesis-devops/020/
---

{% raw %}

# Prompt 020
{: .no_toc }

**Sección:** Redacción TIC DevOps &middot; **Longitud:** 1,724 caracteres &middot; **Posición en la conversación:** 20 de 24

---

```
Okay, te comento ahorita mi front y back ya se esta conectando y tenemos estas estructuras donde mi .env.template esta tal que:




DB_PASSWORD=AquivaTuContraseña

DB_NAME=politutorias

DB_HOST=localhost

DB_PORT=5432

DB_USERNAME=postgres

AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;"

AZURE_STORAGE_CONTAINER_NAME_OFFERS=

AZURE_STORAGE_CONTAINER_NAME_PROFILES=




Donde en el entorno local desde docker-compose levantamos el azurite y el postgres para simular lo que deberia estar en produccion. Ahora bien actualmente mi aplicacion funciona solo en ciertas endpoints pero con ciertas condiciones, como por ejemplo que haya un tutor y un student creados para que puedan acceder y para ello hemos creado un seed aunque no se si pueda mas bien replicar lo que hago localmente con postman en produccion, es decir conectarme a la BD y Blob en Azure con postman y mandar como lo hago localmente estos datos. Entonces esa es la duda fundamental porque sin esos datos la app da eror 404, luego si esto es posible o si es viable mejor el seed quiero que me guies en la parte de construcciones de todo el azure desde pipelines, recurso a crear, apps a crear en el portal y demas. Ademas como no es la primera vez que lo hago yo se que es necesario tener un agent pool y para ello yo prefiero uno local para poder tener trabajos paralelos. Ademas considera que como la suscripcion de studiante no me deja pasar de staging a produccion en un mismo recurso me tocaria simular el staging algo asi como lo hice un proyecto anterior.
```

---

### Navegación

[← Prompt 019](/07-tesis-devops/019/) &middot; [Volver a Redacción TIC DevOps](/07-tesis-devops/) &middot; [Prompt 021 →](/07-tesis-devops/021/)
{% endraw %}
