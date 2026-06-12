---
layout: default
title: '011. laptop-estefano@fedora:~/myagent$ which npm /usr/bin/npm laptop-e…'
parent: FEDORA Local
nav_order: 11
permalink: /05-fedora-local/011/
---

{% raw %}

# Prompt 011
{: .no_toc }

**Sección:** FEDORA Local &middot; **Longitud:** 694 caracteres &middot; **Posición en la conversación:** 11 de 18

---

```
laptop-estefano@fedora:~/myagent$ which npm

/usr/bin/npm

laptop-estefano@fedora:~/myagent$ NPM_DIR=$(dirname $(which npm))

laptop-estefano@fedora:~/myagent$ NODE_DIR=$(dirname $(which node))

laptop-estefano@fedora:~/myagent$ echo "$NPM_DIR" >> ~/myagent/.path

laptop-estefano@fedora:~/myagent$ echo "$NODE_DIR" >> ~/myagent/.path

laptop-estefano@fedora:~/myagent$ echo "/usr/local/bin" >> ~/myagent/.path

laptop-estefano@fedora:~/myagent$ sort -u -o ~/myagent/.path ~/myagent/.path

laptop-estefano@fedora:~/myagent$ cat ~/myagent/.path

/home/laptop-estefano/.local/bin:/home/laptop-estefano/bin:/usr/local/bin:/usr/bin

/home/laptop-estefano/.npm-packages/bin

/usr/bin

/usr/local/bin
```

---

### Navegación

[← Prompt 010](/05-fedora-local/010/) &middot; [Volver a FEDORA Local](/05-fedora-local/) &middot; [Prompt 012 →](/05-fedora-local/012/)
{% endraw %}
