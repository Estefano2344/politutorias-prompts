---
layout: default
title: '045. PS D:9noSemestreTESIS 8voTesis_Orquestador> docker-compose up -d…'
parent: Orquestación n8n productiva
nav_order: 45
permalink: /04-orquestacion-productiva/045/
---

{% raw %}

# Prompt 045
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 4,099 caracteres &middot; **Posición en la conversación:** 45 de 103

---

```
PS D:\\9noSemestre\\TESIS 8vo\\Tesis_Orquestador> docker-compose up -d
time=\"2026-01-18T12:11:20-05:00\" level=warning msg=\"D:\\\\9noSemestre\\\\TESIS 8vo\\\\Tesis_Orquestador\\\\docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion\"
[+] Running 3/3
 ✔ Container tunnel-tesis    Started                                                                                                                                                                  0.5s 
 ✔ Container n8n-tesis       Started                                                                                                                                                                  0.7s 
 ✔ Container postgres-tesis  Started                                                                                                                                                                  0.3s 
PS D:\\9noSemestre\\TESIS 8vo\\Tesis_Orquestador> docker logs tunnel-tesis
2026-01-18T17:11:20Z INF Thank you for trying Cloudflare Tunnel. Doing so, without a Cloudflare account, is a quick way to experiment and try it out. However, be aware that these account-less Tunnels have no uptime guarantee, are subject to the Cloudflare Online Services Terms of Use (https://www.cloudflare.com/website-terms/), and Cloudflare reserves the right to investigate your use of Tunnels for violations of such terms. If you intend to use Tunnels in production you should use a pre-created named tunnel by following: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps        
2026-01-18T17:11:20Z INF Requesting new quick Tunnel on trycloudflare.com...
2026-01-18T17:11:25Z INF +--------------------------------------------------------------------------------------------+
2026-01-18T17:11:25Z INF |  Your quick Tunnel has been created! Visit it at (it may take some time to be reachable):  |
2026-01-18T17:11:25Z INF |  https://seven-game-verse-duke.trycloudflare.com                                           |
2026-01-18T17:11:25Z INF +--------------------------------------------------------------------------------------------+
2026-01-18T17:11:25Z INF Cannot determine default configuration path. No file [config.yml config.yaml] in [~/.cloudflared ~/.cloudflare-warp ~/cloudflare-warp /etc/cloudflared /usr/local/etc/cloudflared]
2026-01-18T17:11:25Z INF Version 2025.11.1 (Checksum cf95c90f5f6d6c87296bbab3b5a967ef580b017357353bfc1777ed5451ff9805)
2026-01-18T17:11:25Z INF GOOS: linux, GOVersion: go1.24.9, GoArch: amd64
2026-01-18T17:11:25Z INF Settings: map[ha-connections:1 no-autoupdate:true protocol:quic url:http://n8n:5678]
2026-01-18T17:11:26Z INF Generated Connector ID: b9731ead-25f1-4fa6-84d8-d762b57ce0e5
2026-01-18T17:11:26Z INF Initial protocol quic
2026-01-18T17:11:26Z INF ICMP proxy will use 172.21.0.3 as source for IPv4
2026-01-18T17:11:26Z INF ICMP proxy will use ::1 in zone lo as source for IPv6
2026-01-18T17:11:26Z ERR Cannot determine default origin certificate path. No file cert.pem in [~/.cloudflared ~/.cloudflare-warp ~/cloudflare-warp /etc/cloudflared /usr/local/etc/cloudflared]. You need to specify the origin certificate path by specifying the origincert option in the configuration file, or set TUNNEL_ORIGIN_CERT environment variable originCertPath=
2026-01-18T17:11:26Z INF ICMP proxy will use 172.21.0.3 as source for IPv4
2026-01-18T17:11:26Z INF ICMP proxy will use ::1 in zone lo as source for IPv6
2026-01-18T17:11:26Z INF Starting metrics server on [::]:20241/metrics
2026-01-18T17:11:26Z INF Tunnel connection curve preferences: [X25519MLKEM768 CurveP256] connIndex=0 event=0 ip=198.41.200.53
2026/01/18 17:11:26 failed to sufficiently increase receive buffer size (was: 208 kiB, wanted: 7168 kiB, got: 416 kiB). See https://github.com/quic-go/quic-go/wiki/UDP-Buffer-Sizes for details.
2026-01-18T17:11:26Z INF Registered tunnel connection connIndex=0 connection=3b4d0263-9117-4e0f-96e0-cb8a687795ec event=0 ip=198.41.200.53 location=mia05 protocol=quic
PS D:\\9noSemestre\\TESIS 8vo\\Tesis_Orquestador>
```

---

### Navegación

[← Prompt 044](/04-orquestacion-productiva/044/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 046 →](/04-orquestacion-productiva/046/)
{% endraw %}
