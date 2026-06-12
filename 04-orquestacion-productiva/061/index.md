---
layout: default
title: '061. Este nodo de esperar correcion manual: { ''nodes'': [ { ''parameter.…'
parent: Orquestación n8n productiva
nav_order: 61
permalink: /04-orquestacion-productiva/061/
---

{% raw %}

# Prompt 061
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 1,515 caracteres &middot; **Posición en la conversación:** 61 de 103

---

```
Este nodo de esperar correcion manual:

{
  \"nodes\": [
    {
      \"parameters\": {
        \"formFields\": {
          \"values\": [
            {
              \"fieldLabel\": \"Presiona Continuar cuando hayas revisado y corregido los 4 artefactos en Azure DevOps Wikis\",
              \"fieldType\": \"checkbox\",
              \"fieldOptions\": {
                \"values\": [
                  {
                    \"option\": \"He terminado las correcciones\"
                  },
                  {
                    \"option\": \"No los he corregido aún\"
                  }
                ]
              }
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.form\",
      \"typeVersion\": 2.5,
      \"position\": [
        5168,
        464
      ],
      \"id\": \"bc74909c-9ef1-4e5d-95c8-59ae793b315d\",
      \"name\": \"Esperar Corrección Manual\",
      \"webhookId\": \"98718a4f-23b9-4265-9edb-c13ddcc1217d\"
    }
  ],
  \"connections\": {
    \"Esperar Corrección Manual\": {
      \"main\": [
        []
      ]
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"templateCredsSetupCompleted\": true,
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

Cuando ejecuto el flujo completo manualmente funciona bien pero cuando lo hago con el agente no puedo acceder a dar esa correcion asi que necesito una forma de que a traves del agente me pida confirmacion manteniendo la otra manual tambien
```

---

### Navegación

[← Prompt 060](/04-orquestacion-productiva/060/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 062 →](/04-orquestacion-productiva/062/)
{% endraw %}
