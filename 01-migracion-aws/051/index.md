---
layout: default
title: '051. listo ya fucniona, en el front solo hice estos cambios verdad ? #…'
parent: Migración a AWS
nav_order: 51
permalink: /01-migracion-aws/051/
---

{% raw %}

# Prompt 051
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 2,533 caracteres &middot; **Posición en la conversación:** 51 de 64

---

```
listo ya fucniona, en el front solo hice estos cambios verdad ?

# Backend API URL (Apuntando a tu Elastic Beanstalk Staging)

# Nota: Es HTTP porque aún no hemos configurado certificado SSL/HTTPS en el Load Balancer

NEXT_PUBLIC_BACKEND_URL="http://politutorias-backend-staging.eba-qnyktbf8.us-east-1.elasticbeanstalk.com/api"




# Image Configuration (Apuntando a tu Bucket S3 de Staging)

# Protocolo seguro porque S3 siempre usa HTTPS

IMAGE_PROTOCOL="https"

IMAGE_HOSTNAME="politutorias-storage-staging.s3.amazonaws.com"




# Entorno

NODE_ENV="development"




Y el de las config:

import type { NextConfig } from "next";




const nextConfig: NextConfig = {

  output: "standalone",

  images: {

    remotePatterns: [

      {

        protocol: process.env.IMAGE_PROTOCOL === "https" ? "https" : "http",

        hostname: process.env.IMAGE_HOSTNAME || "127.0.0.1",

      },

      {

        protocol: "https",

        hostname: "iili.io",

      },

      {

        protocol: "https",

        hostname: "politutoriasstagingeng.blob.core.windows.net",

      },

      {

        protocol: "https",

        hostname: "**.amazonaws.com",

      },

      {

        protocol: "https",

        hostname: "politutorias-storage-prod.s3.amazonaws.com", // <--- AGREGA EL DE PROD DE UNA VEZ

        port: "",

        pathname: "/**",

      },

    ],

    unoptimized: true,

  },

  experimental: {

    serverActions: {

      bodySizeLimit: "3mb",

    },

  },

  // Configuración adicional para Azure Static Web Apps

  async headers() {

    return [

      {

        source: "/:path*",

        headers: [

          {

            key: "Access-Control-Allow-Credentials",

            value: "true",

          },

          {

            key: "Access-Control-Allow-Origin",

            value: process.env.NEXT_PUBLIC_BACKEND_URL || "*",

          },

          {

            key: "Access-Control-Allow-Methods",

            value: "GET,DELETE,PATCH,POST,PUT,OPTIONS",

          },

          {

            key: "Access-Control-Allow-Headers",

            value:

              "X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version, Authorization",

          },

        ],

      },

    ];

  },

  typescript: {

    ignoreBuildErrors: true,

  },

};




export default nextConfig;







Para que funcione en el vercel que deberia poner? porque lo que esta ahorita en localhost apuntando al back de aws es lo que esta en vercel:
```

---

### Navegación

[← Prompt 050](/01-migracion-aws/050/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 052 →](/01-migracion-aws/052/)
{% endraw %}
