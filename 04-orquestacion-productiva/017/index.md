---
layout: default
title: '017. pero ya no me deja acceder, cree otro tunnel y no funciona C:User…'
parent: Orquestación n8n productiva
nav_order: 17
permalink: /04-orquestacion-productiva/017/
---

{% raw %}

# Prompt 017
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 3,488 caracteres &middot; **Posición en la conversación:** 17 de 103

---

```
pero ya no me deja acceder, cree otro tunnel y no funciona

C:\\Users\\NW>docker run -it --rm cloudflare/cloudflared:latest tunnel --url http://host.docker.internal:5678
2026-01-15T14:21:46Z INF Thank you for trying Cloudflare Tunnel. Doing so, without a Cloudflare account, is a quick way to experiment and try it out. However, be aware that these account-less Tunnels have no uptime guarantee, are subject to the Cloudflare Online Services Terms of Use (https://www.cloudflare.com/website-terms/), and Cloudflare reserves the right to investigate your use of Tunnels for violations of such terms. If you intend to use Tunnels in production you should use a pre-created named tunnel by following: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps
2026-01-15T14:21:46Z INF Requesting new quick Tunnel on trycloudflare.com...
2026-01-15T14:21:50Z INF +--------------------------------------------------------------------------------------------+
2026-01-15T14:21:50Z INF |  Your quick Tunnel has been created! Visit it at (it may take some time to be reachable):  |
2026-01-15T14:21:50Z INF |  https://initially-refresh-mouth-resolved.trycloudflare.com                                |
2026-01-15T14:21:50Z INF +--------------------------------------------------------------------------------------------+
2026-01-15T14:21:50Z INF Cannot determine default configuration path. No file [config.yml config.yaml] in [~/.cloudflared ~/.cloudflare-warp ~/cloudflare-warp /etc/cloudflared /usr/local/etc/cloudflared]
2026-01-15T14:21:50Z INF Version 2025.11.1 (Checksum cf95c90f5f6d6c87296bbab3b5a967ef580b017357353bfc1777ed5451ff9805)
2026-01-15T14:21:50Z INF GOOS: linux, GOVersion: go1.24.9, GoArch: amd64
2026-01-15T14:21:50Z INF Settings: map[ha-connections:1 no-autoupdate:true protocol:quic url:http://host.docker.internal:5678]
2026-01-15T14:21:50Z INF cloudflared will not automatically update when run from the shell. To enable auto-updates, run cloudflared as a service: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/configure-tunnels/local-management/as-a-service/
2026-01-15T14:21:50Z INF Generated Connector ID: 36e16c1c-f92a-412d-8c73-d19d1ad8ad02
2026-01-15T14:21:50Z INF Initial protocol quic
2026-01-15T14:21:50Z INF ICMP proxy will use 172.17.0.2 as source for IPv4
2026-01-15T14:21:50Z INF ICMP proxy will use ::1 in zone lo as source for IPv6
2026-01-15T14:21:50Z ERR Cannot determine default origin certificate path. No file cert.pem in [~/.cloudflared ~/.cloudflare-warp ~/cloudflare-warp /etc/cloudflared /usr/local/etc/cloudflared]. You need to specify the origin certificate path by specifying the origincert option in the configuration file, or set TUNNEL_ORIGIN_CERT environment variable originCertPath=
2026-01-15T14:21:50Z INF ICMP proxy will use 172.17.0.2 as source for IPv4
2026-01-15T14:21:50Z INF ICMP proxy will use ::1 in zone lo as source for IPv6
2026-01-15T14:21:50Z INF Starting metrics server on [::]:20241/metrics
2026-01-15T14:21:50Z INF Tunnel connection curve preferences: [X25519MLKEM768 CurveP256] connIndex=0 event=0 ip=198.41.200.73
2026/01/15 14:21:50 failed to sufficiently increase receive buffer size (was: 208 kiB, wanted: 7168 kiB, got: 416 kiB). See https://github.com/quic-go/quic-go/wiki/UDP-Buffer-Sizes for details.
2026-01-15T14:21:51Z INF Registered tunnel connection connIndex=0 connection=e2ecfd12-676f-4b04-b0ba-d80a3550739c event=0 ip=198.41.200.73 location=mia05 protocol=quic
```

---

### Navegación

[← Prompt 016](/04-orquestacion-productiva/016/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 018 →](/04-orquestacion-productiva/018/)
{% endraw %}
