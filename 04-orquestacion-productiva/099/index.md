---
layout: default
title: '099. ubuntu@ip-172-31-79-144:~/n8n-docker$ docker compose up -d WARN[0…'
parent: Orquestación n8n productiva
nav_order: 99
permalink: /04-orquestacion-productiva/099/
---

{% raw %}

# Prompt 099
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 801 caracteres &middot; **Posición en la conversación:** 99 de 103

---

```
ubuntu@ip-172-31-79-144:~/n8n-docker$ docker compose up -d
WARN[0000] /home/ubuntu/n8n-docker/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion
unable to get image 'postgres:11': permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get \"http://%2Fvar%2Frun%2Fdocker.sock/v1.51/images/postgres:11/json\": dial unix /var/run/docker.sock: connect: permission denied
ubuntu@ip-172-31-79-144:~/n8n-docker$ docker-compose up -d
Command 'docker-compose' not found, but can be installed with:
sudo snap install docker          # version 28.4.0, or
sudo apt  install docker-compose  # version 1.29.2-6
See 'snap info docker' for additional versions.
ubuntu@ip-172-31-79-144:~/n8n-docker$
```

---

### Navegación

[← Prompt 098](/04-orquestacion-productiva/098/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 100 →](/04-orquestacion-productiva/100/)
{% endraw %}
