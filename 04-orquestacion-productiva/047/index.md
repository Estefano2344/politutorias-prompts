---
layout: default
title: '047. docker logs n8n-tesis Last session crashed Initializing n8n proce…'
parent: Orquestación n8n productiva
nav_order: 47
permalink: /04-orquestacion-productiva/047/
---

{% raw %}

# Prompt 047
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 6,906 caracteres &middot; **Posición en la conversación:** 47 de 103

---

```
docker logs n8n-tesis
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
Initializing n8n process
n8n ready on ::, port 5678
Migrations in progress, please do NOT stop the process.
Starting migration ChangeDefaultForIdInUserTable1762771264000
Migration \"ChangeDefaultForIdInUserTable1762771264000\" failed, error: function gen_random_uuid() does not exist
There was an error running database migrations
function gen_random_uuid() does not exist
Last session crashed
PS D:\\9noSemestre\\TESIS 8vo\\Tesis_Orquestador> docker logs tunnel-tesis
2026-01-18T17:15:47Z INF Thank you for trying Cloudflare Tunnel. Doing so, without a Cloudflare account, is a quick way to experiment and try it out. However, be aware that these account-less Tunnels have no uptime guarantee, are subject to the Cloudflare Online Services Terms of Use (https://www.cloudflare.com/website-terms/), and Cloudflare reserves the right to investigate your use of Tunnels for violations of such terms. If you intend to use Tunnels in production you should use a pre-created named tunnel by following: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps        
2026-01-18T17:15:47Z INF Requesting new quick Tunnel on trycloudflare.com...
2026-01-18T17:15:52Z INF +--------------------------------------------------------------------------------------------+
2026-01-18T17:15:52Z INF |  Your quick Tunnel has been created! Visit it at (it may take some time to be reachable):  |
2026-01-18T17:15:52Z INF |  https://powder-personals-worcester-vatican.trycloudflare.com                              |
2026-01-18T17:15:52Z INF +--------------------------------------------------------------------------------------------+
2026-01-18T17:15:52Z INF Cannot determine default configuration path. No file [config.yml config.yaml] in [~/.cloudflared ~/.cloudflare-warp ~/cloudflare-warp /etc/cloudflared /usr/local/etc/cloudflared]
2026-01-18T17:15:52Z INF Version 2025.11.1 (Checksum cf95c90f5f6d6c87296bbab3b5a967ef580b017357353bfc1777ed5451ff9805)
2026-01-18T17:15:52Z INF GOOS: linux, GOVersion: go1.24.9, GoArch: amd64
2026-01-18T17:15:52Z INF Settings: map[ha-connections:1 no-autoupdate:true protocol:quic url:http://host.docker.internal:5678]
2026-01-18T17:15:52Z INF Generated Connector ID: 17ad1534-0a89-46de-8845-3aff5541a59b
2026-01-18T17:15:52Z INF Initial protocol quic
2026-01-18T17:15:52Z INF ICMP proxy will use 172.21.0.3 as source for IPv4
2026-01-18T17:15:52Z INF ICMP proxy will use ::1 in zone lo as source for IPv6
2026-01-18T17:15:52Z ERR Cannot determine default origin certificate path. No file cert.pem in [~/.cloudflared ~/.cloudflare-warp ~/cloudflare-warp /etc/cloudflared /usr/local/etc/cloudflared]. You need to specify the origin certificate path by specifying the origincert option in the configuration file, or set TUNNEL_ORIGIN_CERT environment variable originCertPath=
2026-01-18T17:15:52Z INF ICMP proxy will use 172.21.0.3 as source for IPv4
2026-01-18T17:15:52Z INF ICMP proxy will use ::1 in zone lo as source for IPv6
2026-01-18T17:15:52Z INF Starting metrics server on [::]:20241/metrics
2026-01-18T17:15:52Z INF Tunnel connection curve preferences: [X25519MLKEM768 CurveP256] connIndex=0 event=0 ip=198.41.192.227
2026/01/18 17:15:52 failed to sufficiently increase receive buffer size (was: 208 kiB, wanted: 7168 kiB, got: 416 kiB). See https://github.com/quic-go/quic-go/wiki/UDP-Buffer-Sizes for details.
2026-01-18T17:15:53Z INF Registered tunnel connection connIndex=0 connection=917b40c1-59b1-41f7-8f58-2d01c7363cff event=0 ip=198.41.192.227 location=gye01 protocol=quic
PS D:\\9noSemestre\\TESIS 8vo\\Tesis_Orquestador>

502 Bad Gateway
Unable to reach the origin service. The service may be down or it may not be responding to traffic from cloudflared
```

---

### Navegación

[← Prompt 046](/04-orquestacion-productiva/046/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 048 →](/04-orquestacion-productiva/048/)
{% endraw %}
