---
layout: default
title: '015. 2025-12-06T18:31:41.5931961Z ##[section]Starting: Limpiar contene…'
parent: FEDORA Local
nav_order: 15
permalink: /05-fedora-local/015/
---

{% raw %}

# Prompt 015
{: .no_toc }

**Sección:** FEDORA Local &middot; **Longitud:** 3,617 caracteres &middot; **Posición en la conversación:** 15 de 18

---

```
2025-12-06T18:31:41.5931961Z ##[section]Starting: Limpiar contenedor de imágenes (solo staging)

2025-12-06T18:31:41.5936990Z ==============================================================================

2025-12-06T18:31:41.5937061Z Task : Azure CLI

2025-12-06T18:31:41.5937142Z Description : Run Azure CLI commands against an Azure subscription in a PowerShell Core/Shell script when running on Linux agent or PowerShell/PowerShell Core/Batch script when running on Windows agent.

2025-12-06T18:31:41.5937238Z Version : 2.262.1

2025-12-06T18:31:41.5937309Z Author : Microsoft Corporation

2025-12-06T18:31:41.5937371Z Help : https://docs.microsoft.com/azure/devops/pipelines/tasks/deploy/azure-cli

2025-12-06T18:31:41.5937437Z ==============================================================================

2025-12-06T18:31:41.8256193Z ##[error]Azure CLI 2.x is not installed on this machine.

2025-12-06T18:31:41.8286472Z ##[error]Script failed with error: Error: Unable to locate executable file: 'az'. Please verify either the file path exists or the file can be found within a directory specified by the PATH environment variable. Also check the file mode to verify the file is executable.

at Object._which (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/node_modules/azure-pipelines-task-lib/internal.js:368:23)

at new ToolRunner (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/node_modules/azure-pipelines-task-lib/toolrunner.js:33:29)

at Object.tool (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/node_modules/azure-pipelines-task-lib/task.js:1401:14)

at Object.execSync (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/node_modules/azure-pipelines-task-lib/task.js:1379:19)

at azureclitask.<anonymous> (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/azureclitask.js:61:42)

at Generator.next (<anonymous>)

at fulfilled (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/azureclitask.js:5:58)

2025-12-06T18:31:41.8294034Z ##[error]Script failed with error: Error: Unable to locate executable file: 'az'. Please verify either the file path exists or the file can be found within a directory specified by the PATH environment variable. Also check the file mode to verify the file is executable.

at Object._which (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/node_modules/azure-pipelines-task-lib/internal.js:368:23)

at new ToolRunner (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/node_modules/azure-pipelines-task-lib/toolrunner.js:33:29)

at Object.tool (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/node_modules/azure-pipelines-task-lib/task.js:1401:14)

at Object.execSync (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/node_modules/azure-pipelines-task-lib/task.js:1379:19)

at azureclitask.<anonymous> (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/azureclitask.js:61:42)

at Generator.next (<anonymous>)

at fulfilled (/home/laptop-estefano/myagent/_work/_tasks/AzureCLI_46e4be58-730b-4389-8a2f-ea10b3e5e815/2.262.1/azureclitask.js:5:58)

2025-12-06T18:31:41.8330951Z ##[section]Finishing: Limpiar contenedor de imágenes (solo staging)
```

---

### Navegación

[← Prompt 014](/05-fedora-local/014/) &middot; [Volver a FEDORA Local](/05-fedora-local/) &middot; [Prompt 016 →](/05-fedora-local/016/)
{% endraw %}
