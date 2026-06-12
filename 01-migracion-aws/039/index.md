---
layout: default
title: '039. Ya salio otro error si quiera: 2026-02-04T20:57:18.2008944Z ##[se…'
parent: Migración a AWS
nav_order: 39
permalink: /01-migracion-aws/039/
---

{% raw %}

# Prompt 039
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 3,770 caracteres &middot; **Posición en la conversación:** 39 de 64

---

```
Ya salio otro error si quiera:

2026-02-04T20:57:18.2008944Z ##[section]Starting: Deploy a Elastic Beanstalk (Staging)

2026-02-04T20:57:18.2045283Z ==============================================================================

2026-02-04T20:57:18.2045456Z Task : AWS Elastic Beanstalk Deploy Application

2026-02-04T20:57:18.2045595Z Description : Deploys an application to Amazon EC2 instance(s) using AWS Elastic Beanstalk

2026-02-04T20:57:18.2045735Z Version : 1.24.0

2026-02-04T20:57:18.2045836Z Author : Amazon Web Services

2026-02-04T20:57:18.2046639Z Help : Please refer to [AWS Elastic Beanstalk User Guide](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html) for more details on deploying applications with AWS Elastic Beanstalk.




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

2026-02-04T20:57:18.2047897Z ==============================================================================

2026-02-04T20:57:19.9000389Z Deployment type set to json

2026-02-04T20:57:19.9009995Z Configuring credentials for task

2026-02-04T20:57:19.9019644Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:57:19.9038894Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:57:19.9040632Z Skipping OIDC: not enabled in service connections

2026-02-04T20:57:19.9093537Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:57:19.9095078Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:57:19.9096341Z Configuring region for task

2026-02-04T20:57:19.9097635Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:57:19.9177805Z Configuring credentials for task

2026-02-04T20:57:19.9202641Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:57:19.9207110Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:57:19.9211236Z Skipping OIDC: not enabled in service connections

2026-02-04T20:57:19.9215621Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:57:19.9216602Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:57:19.9223070Z Configuring region for task

2026-02-04T20:57:19.9232648Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:57:20.5463890Z ##[error]InvalidParameterCombination: Both S3 bucket and key must be specified.

2026-02-04T20:57:20.5625565Z ##[section]Finishing: Deploy a Elastic Beanstalk (Staging)




pero tambien me doy cuenta que hay dos tareas de download artifact
```

---

### Navegación

[← Prompt 038](/01-migracion-aws/038/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 040 →](/01-migracion-aws/040/)
{% endraw %}
