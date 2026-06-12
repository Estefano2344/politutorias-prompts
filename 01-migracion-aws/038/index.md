---
layout: default
title: '038. 2026-02-04T20:48:06.0748252Z ##[section]Starting: Deploy a Elasti…'
parent: Migración a AWS
nav_order: 38
permalink: /01-migracion-aws/038/
---

{% raw %}

# Prompt 038
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 4,113 caracteres &middot; **Posición en la conversación:** 38 de 64

---

```
2026-02-04T20:48:06.0748252Z ##[section]Starting: Deploy a Elastic Beanstalk (Staging)

2026-02-04T20:48:06.0764461Z ==============================================================================

2026-02-04T20:48:06.0764631Z Task : AWS Elastic Beanstalk Deploy Application

2026-02-04T20:48:06.0764758Z Description : Deploys an application to Amazon EC2 instance(s) using AWS Elastic Beanstalk

2026-02-04T20:48:06.0764907Z Version : 1.24.0

2026-02-04T20:48:06.0765024Z Author : Amazon Web Services

2026-02-04T20:48:06.0765901Z Help : Please refer to [AWS Elastic Beanstalk User Guide](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html) for more details on deploying applications with AWS Elastic Beanstalk.




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

2026-02-04T20:48:06.0767109Z ==============================================================================

2026-02-04T20:48:07.6689270Z Deployment type set to aspnet

2026-02-04T20:48:07.6697073Z Configuring credentials for task

2026-02-04T20:48:07.6702240Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:48:07.6719102Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:48:07.6720330Z Skipping OIDC: not enabled in service connections

2026-02-04T20:48:07.6722740Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:48:07.6727559Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:48:07.6728212Z Configuring region for task

2026-02-04T20:48:07.6728584Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:48:07.6807095Z Configuring credentials for task

2026-02-04T20:48:07.6817218Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:48:07.6818732Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:48:07.6819784Z Skipping OIDC: not enabled in service connections

2026-02-04T20:48:07.6841573Z ...configuring AWS credentials from service endpoint '0f14ea6e-3a78-4732-b8b7-3dabe7342742'

2026-02-04T20:48:07.6842668Z ...endpoint defines standard access/secret key credentials

2026-02-04T20:48:07.6843130Z Configuring region for task

2026-02-04T20:48:07.6843565Z ...configured to use region us-east-1, defined in task.

2026-02-04T20:48:08.1948514Z Determine S3 bucket elasticbeanstalk-us-east-1-350973055938 to store application bundle

2026-02-04T20:48:08.1954751Z Uploading application bundle /home/ubuntu/myagent/_work/1/s to object politutorias-backend/politutorias-backend-staging/s-v1770238088109.zip in bucket elasticbeanstalk-us-east-1-350973055938

2026-02-04T20:48:08.2117516Z ##[error]Unhandled: EISDIR: illegal operation on a directory, read

2026-02-04T20:48:08.2131541Z ##[error]Error: EISDIR: illegal operation on a directory, read

2026-02-04T20:48:08.2294497Z ##[section]Finishing: Deploy a Elastic Beanstalk (Staging)




Ya no es eso tampoco
```

---

### Navegación

[← Prompt 037](/01-migracion-aws/037/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 039 →](/01-migracion-aws/039/)
{% endraw %}
