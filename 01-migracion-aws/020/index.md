---
layout: default
title: '020. Review Info Step 1: Configure environment Edit Environment inform…'
parent: Migración a AWS
nav_order: 20
permalink: /01-migracion-aws/020/
---

{% raw %}

# Prompt 020
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 2,765 caracteres &middot; **Posición en la conversación:** 20 de 64

---

```
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







No environment properties

There are no environment properties defined







Creo que me faltan las variables de entorno
```

---

### Navegación

[← Prompt 019](/01-migracion-aws/019/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 021 →](/01-migracion-aws/021/)
{% endraw %}
