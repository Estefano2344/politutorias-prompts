---
layout: default
title: '044. No tengo eso que mencionas en staging: option_settings: aws:elast…'
parent: Migración a AWS
nav_order: 44
permalink: /01-migracion-aws/044/
---

{% raw %}

# Prompt 044
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 1,941 caracteres &middot; **Posición en la conversación:** 44 de 64

---

```
No tengo eso que mencionas en staging:

option_settings:

  aws:elasticbeanstalk:environment:

    LoadBalancerType: application

  aws:elasticbeanstalk:application:environment:

    NODE_ENV: staging

    PORT: 8080

    # Database (configura estos valores en AWS)

    DB_HOST: <REDACTADO>

    DB_PORT: 5432

    DB_USERNAME: postgres

    DB_PASSWORD: <REDACTADO>

    DB_NAME: politutorias

    # JWT Secrets

    JWT_SECRET: staging-secret-change-me

    JWT_REFRESH_SECRET: staging-refresh-secret-change-me

    # Seed API Key

    SEED_API_KEY: <REDACTADO>

    # AWS S3 Storage

    AWS_S3_BUCKET_NAME: politutorias-storage-staging

    AWS_S3_REGION: us-east-1

    S3_CONTAINER_NAME_OFFERS: offers

    S3_CONTAINER_NAME_PROFILES: profiles

  aws:autoscaling:launchconfiguration:

    InstanceType: t3.micro

  aws:elasticbeanstalk:healthreporting:system:

    SystemType: enhanced




y produc:

option_settings:

  aws:elasticbeanstalk:environment:

    LoadBalancerType: application

  aws:elasticbeanstalk:application:environment:

    NODE_ENV: production

    PORT: 8080

    # Database (configura estos valores en AWS)

    DB_HOST: <REDACTADO>

    DB_PORT: 5432

    DB_USERNAME: postgres

    DB_PASSWORD: <REDACTADO>

    DB_NAME: politutorias

    # JWT Secrets

    JWT_SECRET: production-secret-change-me

    JWT_REFRESH_SECRET: production-refresh-secret-change-me

    # Seed API Key

    SEED_API_KEY: <REDACTADO>

    # Azure Storage

    AZURE_STORAGE_CONNECTION_STRING: ""

    AZURE_STORAGE_CONTAINER_NAME_OFFERS: ""

    AZURE_STORAGE_CONTAINER_NAME_PROFILES: ""

  aws:autoscaling:launchconfiguration:

    InstanceType: t3.small

  aws:elasticbeanstalk:healthreporting:system:

    SystemType: enhanced







Si tengo las reglas de entrada, ademas te envio los logs en ese arcvhivo txt
```

---

### Navegación

[← Prompt 043](/01-migracion-aws/043/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 045 →](/01-migracion-aws/045/)
{% endraw %}
