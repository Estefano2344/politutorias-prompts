---
layout: default
title: '039. Esta bastante mal, yo creo que para este flujo lo que debe hacer…'
parent: Orquestación n8n productiva
nav_order: 39
permalink: /04-orquestacion-productiva/039/
---

{% raw %}

# Prompt 039
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 2,192 caracteres &middot; **Posición en la conversación:** 39 de 103

---

```
Esta bastante mal, yo creo que para este flujo lo que debe hacer el agente es realizarnos la encuesta directamente a nostros:

{
  \"nodes\": [
    {
      \"parameters\": {
        \"formTitle\": \"Inicio Sprint DCU\",
        \"formDescription\": \"Inicio de la toma de información relacionada al contexto inicial de la aplicación\",
        \"formFields\": {
          \"values\": [
            {
              \"fieldLabel\": \"Contexto_App\",
              \"fieldType\": \"textarea\",
              \"placeholder\": \"Describe el contexto de la app\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Objetivo_Sprint\",
              \"fieldType\": \"textarea\",
              \"placeholder\": \"Indica el objetivo del Sprint\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"HUs_Epicas\",
              \"fieldType\": \"textarea\",
              \"placeholder\": \"Coloca las HUs épicas correspondientes al Release\",
              \"requiredField\": true
            },
            {
              \"fieldLabel\": \"Investigacion_PDF\",
              \"fieldType\": \"file\",
              \"acceptFileTypes\": \".pdf\",
              \"requiredField\": true
            }
          ]
        },
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.formTrigger\",
      \"typeVersion\": 2.3,
      \"position\": [
        912,
        464
      ],
      \"id\": \"9a3506dd-3a5d-4a2f-b5cc-686d3dfc6427\",
      \"name\": \"Contexto de la App + Fase 1 DCU\",
      \"webhookId\": \"f3cfca31-c102-40d2-8ce2-ce1d8dac81cb\"
    }
  ],
  \"connections\": {
    \"Contexto de la App + Fase 1 DCU\": {
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

Donde tambien en el cuando llame al otro flujo inicie el otro flujo con un formulario soliciutando el pdf y ahi si iniciar todo el proceso no edites todo el flujo porque es extenso solo dame las entrada y la salida y modificaciones necesarias en el agente
```

---

### Navegación

[← Prompt 038](/04-orquestacion-productiva/038/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 040 →](/04-orquestacion-productiva/040/)
{% endraw %}
