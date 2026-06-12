---
layout: default
title: '046. forward-logs-shared.ts:95 Download the React DevTools for a bette…'
parent: Migración a AWS
nav_order: 46
permalink: /01-migracion-aws/046/
---

{% raw %}

# Prompt 046
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 3,402 caracteres &middot; **Posición en la conversación:** 46 de 64

---

```
forward-logs-shared.ts:95 Download the React DevTools for a better development experience: https://react.dev/link/react-devtools

forward-logs-shared.ts:95 [HMR] connected

forward-logs-shared.ts:95 Image with src "/mock-rol-selector-v2.webp" was detected as the Largest Contentful Paint (LCP). Please add the `loading="eager"` property if this image is above the fold.

Read more: https://nextjs.org/docs/app/api-reference/components/image#loading

warn @ forward-logs-shared.ts:95

forward-logs-shared.ts:95 [Fast Refresh] rebuilding

forward-logs-shared.ts:95 [Fast Refresh] done in 641ms

forward-logs-shared.ts:95 [Fast Refresh] rebuilding

forward-logs-shared.ts:95 [Fast Refresh] done in 717ms




Las iamgenes de las ofertas no se abren, y si les doy en abrir imagen una pestaña nueva me sale lo siguiente:

Example Domain

This domain is for use in documentation examples without needing permission. Avoid use in operations.

Learn more




Ademas si agregue los permisos:

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

        hostname: "politutorias-storage-staging.s3.amazonaws.com", // <--- TU BUCKET DE STAGING

        port: "",

        pathname: "/**",

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







Y el env:




# Backend API URL (Apuntando a tu Elastic Beanstalk Staging)

# Nota: Es HTTP porque aún no hemos configurado certificado SSL/HTTPS en el Load Balancer

NEXT_PUBLIC_BACKEND_URL="http://politutorias-backend-staging.eba-qnyktbf8.us-east-1.elasticbeanstalk.com/api"




# Image Configuration (Apuntando a tu Bucket S3 de Staging)

# Protocolo seguro porque S3 siempre usa HTTPS

IMAGE_PROTOCOL="https"

IMAGE_HOSTNAME="politutorias-storage-staging.s3.amazonaws.com"




# Entorno

NODE_ENV="development"
```

---

### Navegación

[← Prompt 045](/01-migracion-aws/045/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 047 →](/01-migracion-aws/047/)
{% endraw %}
