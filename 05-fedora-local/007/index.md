---
layout: default
title: '007. laptop-estefano@fedora:~$ sudo npm i -g @nestjs/cli added 215 pac…'
parent: FEDORA Local
nav_order: 7
permalink: /05-fedora-local/007/
---

{% raw %}

# Prompt 007
{: .no_toc }

**Sección:** FEDORA Local &middot; **Longitud:** 2,208 caracteres &middot; **Posición en la conversación:** 7 de 18

---

```
laptop-estefano@fedora:~$ sudo npm i -g @nestjs/cli




added 215 packages in 30s




38 packages are looking for funding

  run `npm fund` for details

npm notice

npm notice New major version of npm available! 10.8.2 -> 11.6.4

npm notice Changelog: https://github.com/npm/cli/releases/tag/v11.6.4

npm notice To update run: npm install -g npm@11.6.4

npm notice

laptop-estefano@fedora:~$ npm install -g npm@11.6.4

npm error code EACCES

npm error syscall rename

npm error path /usr/lib/node_modules/npm

npm error dest /usr/lib/node_modules/.npm-qUIFSsiV

npm error errno -13

npm error Error: EACCES: permission denied, rename '/usr/lib/node_modules/npm' -> '/usr/lib/node_modules/.npm-qUIFSsiV'

npm error     at async Object.rename (node:internal/fs/promises:782:10)

npm error     at async moveFile (/usr/lib/node_modules/npm/node_modules/@npmcli/fs/lib/move-file.js:30:5)

npm error     at async Promise.allSettled (index 0)

npm error     at async [reifyPackages] (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:325:11)

npm error     at async Arborist.reify (/usr/lib/node_modules/npm/node_modules/@npmcli/arborist/lib/arborist/reify.js:142:5)

npm error     at async Install.exec (/usr/lib/node_modules/npm/lib/commands/install.js:150:5)

npm error     at async Npm.exec (/usr/lib/node_modules/npm/lib/npm.js:207:9)

npm error     at async module.exports (/usr/lib/node_modules/npm/lib/cli/entry.js:74:5) {

npm error   errno: -13,

npm error   code: 'EACCES',

npm error   syscall: 'rename',

npm error   path: '/usr/lib/node_modules/npm',

npm error   dest: '/usr/lib/node_modules/.npm-qUIFSsiV'

npm error }

npm error

npm error The operation was rejected by your operating system.

npm error It is likely you do not have the permissions to access this file as the current user

npm error

npm error If you believe this might be a permissions issue, please double-check the

npm error permissions of the file and its containing directories, or try running

npm error the command again as root/Administrator.

npm error A complete log of this run can be found in: /home/laptop-estefano/.npm/_logs/2025-12-06T17_31_48_469Z-debug-0.log

laptop-estefano@fedora:~$
```

---

### Navegación

[← Prompt 006](/05-fedora-local/006/) &middot; [Volver a FEDORA Local](/05-fedora-local/) &middot; [Prompt 008 →](/05-fedora-local/008/)
{% endraw %}
