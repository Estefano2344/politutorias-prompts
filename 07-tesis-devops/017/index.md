---
layout: default
title: '017. NW@PC-ESTEFANO MINGW64 /d/9noSemestre/Tesis_Scrum/poli_tutorias_b…'
parent: Redacción TIC DevOps
nav_order: 17
permalink: /07-tesis-devops/017/
---

{% raw %}

# Prompt 017
{: .no_toc }

**Sección:** Redacción TIC DevOps &middot; **Longitud:** 2,379 caracteres &middot; **Posición en la conversación:** 17 de 24

---

```
NW@PC-ESTEFANO MINGW64 /d/9noSemestre/Tesis_Scrum/poli_tutorias_backend (develop)

$ npm audit fix




up to date, audited 382 packages in 2s




90 packages are looking for funding

  run `npm fund` for details




# npm audit report




@azure/identity  <4.2.1

Severity: moderate

Azure Identity Libraries and Microsoft Authentication Library Elevation of Privilege Vulnerability - https://github.com/advisories/GHSA-m5vv-6r4h-3vj9

fix available via `npm audit fix`

node_modules/@azure/identity

  tedious  11.0.9 - 18.2.0

  Depends on vulnerable versions of @azure/identity

  node_modules/tedious

    azurite  >=3.0.0-preview

    Depends on vulnerable versions of @azure/ms-rest-js

    Depends on vulnerable versions of axios

    Depends on vulnerable versions of sequelize

    Depends on vulnerable versions of tedious

    node_modules/azurite




axios  <=0.30.1

Severity: high

Axios Cross-Site Request Forgery Vulnerability - https://github.com/advisories/GHSA-wf5p-g6vw-rhxx

axios Requests Vulnerable To Possible SSRF and Credential Leakage via Absolute URL - https://github.com/advisories/GHSA-jr5f-v2jv-69x6

Axios is vulnerable to DoS attack through lack of data size check - https://github.com/advisories/GHSA-4hjh-wcwx-xvwj

fix available via `npm audit fix`

node_modules/axios

node_modules/azurite/node_modules/axios

  @azure/ms-rest-js  <=2.6.6

  Depends on vulnerable versions of axios

  Depends on vulnerable versions of tough-cookie

  Depends on vulnerable versions of xml2js

  node_modules/@azure/ms-rest-js




tough-cookie  <4.1.3

Severity: moderate

tough-cookie Prototype Pollution vulnerability - https://github.com/advisories/GHSA-72xf-g2v4-qvf3

fix available via `npm audit fix`

node_modules/tough-cookie




validator  *

Severity: moderate

validator.js has a URL validation bypass vulnerability in its isURL function - https://github.com/advisories/GHSA-9965-vmph-33xx

fix available via `npm audit fix`

node_modules/validator

  sequelize  0.0.0-development || >=1.3.0

  Depends on vulnerable versions of validator

  node_modules/sequelize




xml2js  <0.5.0

Severity: moderate

xml2js is vulnerable to prototype pollution - https://github.com/advisories/GHSA-776f-qx25-q3cc

fix available via `npm audit fix`

node_modules/xml2js




9 vulnerabilities (6 moderate, 3 high)




To address all issues, run:

  npm audit fix
```

---

### Navegación

[← Prompt 016](/07-tesis-devops/016/) &middot; [Volver a Redacción TIC DevOps](/07-tesis-devops/) &middot; [Prompt 018 →](/07-tesis-devops/018/)
{% endraw %}
