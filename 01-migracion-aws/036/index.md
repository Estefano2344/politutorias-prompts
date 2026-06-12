---
layout: default
title: '036. No use la ultima actualizacion del pipeline pero una versiona nte…'
parent: Migración a AWS
nav_order: 36
permalink: /01-migracion-aws/036/
---

{% raw %}

# Prompt 036
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 5,480 caracteres &middot; **Posición en la conversación:** 36 de 64

---

```
No use la ultima actualizacion del pipeline pero una versiona nterior tengo esto:

2026-02-04T20:40:44.5416781Z ##[section]Starting: Deploy a Elastic Beanstalk (Staging)

2026-02-04T20:40:44.5434104Z ==============================================================================

2026-02-04T20:40:44.5434279Z Task : AWS Elastic Beanstalk Deploy Application

2026-02-04T20:40:44.5434405Z Description : Deploys an application to Amazon EC2 instance(s) using AWS Elastic Beanstalk

2026-02-04T20:40:44.5434552Z Version : 1.24.0

2026-02-04T20:40:44.5434656Z Author : Amazon Web Services

2026-02-04T20:40:44.5435276Z Help : Please refer to [AWS Elastic Beanstalk User Guide](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html) for more details on deploying applications with AWS Elastic Beanstalk.




More information on this task can be found in the [task reference](https://docs.aws.amazon.com/vsts/latest/userguide/elastic-beanstalk-deploy.html).




####Task Permissions

This task requires permissions to call the following AWS service APIs (not all APIs may be used depending on selected task options and environment configuration):

* autoscaling:DescribeScalingActivities

* autoscaling:DescribeAutoScalingGroups

* autoscaling:ResumeProcesses

* autoscaling:SuspendProcesses

* cloudformation:DescribeStackResource

* cloudformation:DescribeStackResources

* elasticbeanstalk:CreateApplicationVersion

* elasticbeanstalk:CreateStorageLocation

* elasticbeanstalk:DescribeApplications

* elasticbeanstalk:DescribeEnvironments

* elasticbeanstalk:DescribeEvents

* elasticloadbalancing:RegisterInstancesWithLoadBalancer

* elasticbeanstalk:UpdateEnvironment




The task also requires permissions to upload your application content to the specified Amazon S3 bucket. Depending on the size of the application bundle, either PutObject or the S3 multi-part upload APIs may be used.

2026-02-04T20:40:44.5436483Z ==============================================================================

2026-02-04T20:40:45.9243405Z Deployment type set to aspnet

2026-02-04T20:40:45.9252343Z Configuring credentials for task

2026-02-04T20:40:45.9256258Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:40:45.9266980Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:40:45.9267918Z Skipping OIDC: not enabled in service connections

2026-02-04T20:40:45.9273032Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:40:45.9274128Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:40:45.9274989Z Configuring region for task

2026-02-04T20:40:45.9303472Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:40:45.9339023Z Configuring credentials for task

2026-02-04T20:40:45.9343150Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:40:45.9347308Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:40:45.9349258Z Skipping OIDC: not enabled in service connections

2026-02-04T20:40:45.9350413Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:40:45.9351731Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:40:45.9352771Z Configuring region for task

2026-02-04T20:40:45.9353831Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:40:46.4297708Z Determine S3 bucket elasticbeanstalk-us-east-1-350973055938 to store application bundle

2026-02-04T20:40:46.4302464Z Uploading application bundle /home/ubuntu/myagent/_work/1/s to object politutorias-backend/politutorias-backend-staging/s-v1770237646326.zip in bucket elasticbeanstalk-us-east-1-350973055938

2026-02-04T20:40:46.4381092Z ##[error]Unhandled: EISDIR: illegal operation on a directory, read

2026-02-04T20:40:46.4389595Z ##[error]Error: EISDIR: illegal operation on a directory, read

2026-02-04T20:40:46.4544942Z ##[section]Finishing: Deploy a Elastic Beanstalk (Staging)




Y esto en la localizacion:




2026-02-04T20:40:41.8902024Z ##[section]Starting: Localizar ZIP del Artefacto

2026-02-04T20:40:41.8909107Z ==============================================================================

2026-02-04T20:40:41.8909273Z Task : Command line

2026-02-04T20:40:41.8909364Z Description : Run a command line script using Bash on Linux and macOS and cmd.exe on Windows

2026-02-04T20:40:41.8909519Z Version : 2.268.0

2026-02-04T20:40:41.8909608Z Author : Microsoft Corporation

2026-02-04T20:40:41.8909719Z Help : https://docs.microsoft.com/azure/devops/pipelines/tasks/utility/command-line

2026-02-04T20:40:41.8909850Z ==============================================================================

2026-02-04T20:40:44.4658142Z Generating script.

2026-02-04T20:40:44.4668282Z ========================== Starting Command Output ===========================

2026-02-04T20:40:44.4692150Z [command]/usr/bin/bash --noprofile --norc /home/ubuntu/myagent/_work/_temp/bfec2567-88a8-4903-b222-977bce796e30.sh

2026-02-04T20:40:44.4750220Z Buscando archivo .zip en el Workspace...

2026-02-04T20:40:44.5289358Z ZIP encontrado en: /home/ubuntu/myagent/_work/1/backend-api/188.zip

2026-02-04T20:40:44.5308742Z

2026-02-04T20:40:44.5381587Z ##[section]Finishing: Localizar ZIP del Artefacto
```

---

### Navegación

[← Prompt 035](/01-migracion-aws/035/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 037 →](/01-migracion-aws/037/)
{% endraw %}
