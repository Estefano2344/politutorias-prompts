---
layout: default
title: '022. Ahi estaria bien para prod ? Review Info Step 1: Configure enviro…'
parent: Migración a AWS
nav_order: 22
permalink: /01-migracion-aws/022/
---

{% raw %}

# Prompt 022
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 3,294 caracteres &middot; **Posición en la conversación:** 22 de 64

---

```
Ahi estaria bien para prod ?

Review

 




Info

Step 1: Configure environment

Edit

Environment information

Environment tier

Web server environment

Environment name

politutorias-backend-prod

Platform

arn:aws:elasticbeanstalk:us-east-1::platform/Node.js 22 running on 64bit Amazon Linux 2023/6.7.3

Application name

politutorias-backend

Application code

Sample application

Step 2: Configure service access

Edit

Service access

 




Info

Configure the service role and EC2 instance profile that Elastic Beanstalk uses to manage your environment. Choose an EC2 key pair to securely log in to your EC2 instances.

Service role

arn:aws:iam::350973055938:role/aws-elasticbeanstalk-service-role

EC2 instance profile

aws-elasticbeanstalk-ec2-role

Step 3: Set up networking, database, and tags

Edit

Networking, database, and tags

 




Info

Configure VPC settings, and subnets for your environment's EC2 instances and load balancer. Set up an Amazon RDS database that's integrated with your environment.

No options configured

Tags

Key







Value







No tags

There are no tags defined

Step 4: Configure instance traffic and scaling

Edit

Instance traffic and scaling

 




Info

Customize the capacity and scaling for your environment’s instances. Select security groups to control instance traffic. Configure the software that runs on your environment’s instances by setting platform-specific options.

Instances




IMDSv1

Disabled

Capacity




Environment type

Single instance

Fleet composition

On-Demand instance

On-demand base

0

On-demand above base

70

Capacity rebalancing

Disabled

Scaling cooldown

360

Processor type

x86_64

Instance types

t3.micro,t3.small

AMI ID

ami-0e0a40022645f6e17

Step 5: Configure updates, monitoring, and logging

Edit

Updates, monitoring, and logging

 




Info

Define when and how Elastic Beanstalk deploys changes to your environment. Manage your application’s monitoring and logging settings, instances, and other environment resources.

Monitoring




System

enhanced

Cloudwatch custom metrics - instance

—

Cloudwatch custom metrics - environment

—

Log streaming

Disabled

Retention

7

Lifecycle

false

Updates




Managed updates

Enabled

Deployment batch size

100

Deployment batch size type

Percentage

Command timeout

600

Deployment policy

AllAtOnce

Health threshold

Ok

Ignore health check

false

Instance replacement

false

Platform software




Lifecycle

false

Log streaming

Disabled

Proxy server

nginx

Logs retention

7

Rotate logs

Disabled

Update level

minor

X-Ray enabled

Disabled

Environment properties




Source







Key







Value







Plain text

AWS_ACCESS_KEY_ID

<REDACTADO>

Plain text

AWS_BUCKET_NAME

politutorias-storage-prod

Plain text

AWS_REGION

us-east-1

Plain text

AWS_SECRET_ACCESS_KEY

<REDACTADO>

Plain text

DB_HOST

<REDACTADO>

Plain text

DB_NAME

politutorias_prod

Plain text

DB_PASSWORD

postgres

Plain text

DB_PORT

5432

Plain text

DB_USERNAME

postgres

Plain text

JWT_REFRESH_SECRET

<REDACTADO>

Plain text

JWT_SECRET

<REDACTADO>

Plain text

NODE_ENV

production

Plain text

SEED_API_KEY

<REDACTADO>
```

---

### Navegación

[← Prompt 021](/01-migracion-aws/021/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 023 →](/01-migracion-aws/023/)
{% endraw %}
