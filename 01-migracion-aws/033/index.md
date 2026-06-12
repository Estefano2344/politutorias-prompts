---
layout: default
title: '033. 2026-02-04T20:27:15.7517996Z ##[section]Starting: Deploy a Elasti…'
parent: Migración a AWS
nav_order: 33
permalink: /01-migracion-aws/033/
---

{% raw %}

# Prompt 033
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 4,088 caracteres &middot; **Posición en la conversación:** 33 de 64

---

```
2026-02-04T20:27:15.7517996Z ##[section]Starting: Deploy a Elastic Beanstalk (Staging)

2026-02-04T20:27:15.7535682Z ==============================================================================

2026-02-04T20:27:15.7535847Z Task : AWS Elastic Beanstalk Deploy Application

2026-02-04T20:27:15.7535973Z Description : Deploys an application to Amazon EC2 instance(s) using AWS Elastic Beanstalk

2026-02-04T20:27:15.7536113Z Version : 1.24.0

2026-02-04T20:27:15.7536212Z Author : Amazon Web Services

2026-02-04T20:27:15.7536909Z Help : Please refer to [AWS Elastic Beanstalk User Guide](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html) for more details on deploying applications with AWS Elastic Beanstalk.




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

2026-02-04T20:27:15.7538127Z ==============================================================================

2026-02-04T20:27:17.2335890Z Deployment type set to aspnet

2026-02-04T20:27:17.2352697Z Configuring credentials for task

2026-02-04T20:27:17.2363817Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:27:17.2378898Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:27:17.2383412Z Skipping OIDC: not enabled in service connections

2026-02-04T20:27:17.2390054Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:27:17.2413216Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:27:17.2413651Z Configuring region for task

2026-02-04T20:27:17.2414083Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:27:17.2487767Z Configuring credentials for task

2026-02-04T20:27:17.2495884Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:27:17.2512408Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:27:17.2513293Z Skipping OIDC: not enabled in service connections

2026-02-04T20:27:17.2517259Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:27:17.2522293Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:27:17.2522808Z Configuring region for task

2026-02-04T20:27:17.2523331Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:27:17.7616936Z Determine S3 bucket elasticbeanstalk-us-east-1-350973055938 to store application bundle

2026-02-04T20:27:17.7625887Z Uploading application bundle /home/ubuntu/myagent/_work/1/s to object politutorias-backend/politutorias-backend-staging/s-v1770236837683.zip in bucket elasticbeanstalk-us-east-1-350973055938

2026-02-04T20:27:17.7705483Z ##[error]Unhandled: EISDIR: illegal operation on a directory, read

2026-02-04T20:27:17.7724221Z ##[error]Error: EISDIR: illegal operation on a directory, read

2026-02-04T20:27:17.7855861Z ##[section]Finishing: Deploy a Elastic Beanstalk (Staging)
```

---

### Navegación

[← Prompt 032](/01-migracion-aws/032/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 034 →](/01-migracion-aws/034/)
{% endraw %}
