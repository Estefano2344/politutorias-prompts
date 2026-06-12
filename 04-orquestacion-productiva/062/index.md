---
layout: default
title: '062. Al final lo deje asi: { ''nodes'': [ { ''parameters'': { ''...'
parent: Orquestación n8n productiva
nav_order: 62
permalink: /04-orquestacion-productiva/062/
---

{% raw %}

# Prompt 062
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 8,001 caracteres &middot; **Posición en la conversación:** 62 de 103

---

```
Al final lo deje asi:

{
  \"nodes\": [
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Discovery/Release-2/Sprint-1/Fase-2/User_Personas&includeContent=true&api-version=7.1\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        5840,
        288
      ],
      \"id\": \"46a790ce-3adf-4e57-a730-e29d01c2067a\",
      \"name\": \"Descargar UP desde Azure\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"rtbOVHBu7hA242gh\",
          \"name\": \"Azure Discovery\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Discovery/Release-2/Sprint-1/Fase-2/Story_Map&includeContent=true&api-version=7.1\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        5840,
        464
      ],
      \"id\": \"6962c3f1-42b4-44c2-b66e-c57a31b50165\",
      \"name\": \"Descargar SM desde Azure\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"rtbOVHBu7hA242gh\",
          \"name\": \"Azure Discovery\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Discovery/Release-2/Sprint-1/Fase-2/Journey_Map&includeContent=true&api-version=7.1\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        5840,
        656
      ],
      \"id\": \"c8e14957-6d72-41c3-a466-0dcbe1129bff\",
      \"name\": \"Descargar JM desde Azure\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"rtbOVHBu7hA242gh\",
          \"name\": \"Azure Discovery\"
        }
      }
    },
    {
      \"parameters\": {
        \"url\": \"https://dev.azure.com/DTIC-2025-B/PoliTutorias/_apis/wiki/wikis/PoliTutorias.wiki/pages?path=/Discovery/Release-2/Sprint-1/Fase-2/Mapa_Navegacional&includeContent=true&api-version=7.1\",
        \"authentication\": \"genericCredentialType\",
        \"genericAuthType\": \"httpBasicAuth\",
        \"options\": {}
      },
      \"type\": \"n8n-nodes-base.httpRequest\",
      \"typeVersion\": 4.3,
      \"position\": [
        5840,
        848
      ],
      \"id\": \"9c79a4fc-56f6-4024-add2-997a7bffc8e2\",
      \"name\": \"Descargar MN desde Azure\",
      \"credentials\": {
        \"httpBasicAuth\": {
          \"id\": \"rtbOVHBu7hA242gh\",
          \"name\": \"Azure Discovery\"
        }
      }
    },
    {
      \"parameters\": {
        \"numberInputs\": 4
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3.2,
      \"position\": [
        6192,
        432
      ],
      \"id\": \"fd190be8-2cd6-4853-a3ce-2d4772ad007a\",
      \"name\": \"Espera de las 4 descargas\"
    },
    {
      \"parameters\": {
        \"numberInputs\": 4
      },
      \"type\": \"n8n-nodes-base.merge\",
      \"typeVersion\": 3.2,
      \"position\": [
        4960,
        432
      ],
      \"id\": \"cb0f6228-ea8b-4cbe-a725-4d0c177e01a6\",
      \"name\": \"Espera de la creación de los 4 artefactos\"
    },
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
        5440,
        688
      ],
      \"id\": \"bc74909c-9ef1-4e5d-95c8-59ae793b315d\",
      \"name\": \"Esperar Corrección Manual\",
      \"webhookId\": \"98718a4f-23b9-4265-9edb-c13ddcc1217d\"
    },
    {
      \"parameters\": {
        \"dataType\": \"string\",
        \"value1\": \"={{ $('Normalizar Inputs').item.json.source || 'manual' }}\",
        \"rules\": {
          \"rules\": [
            {
              \"value2\": \"agent\"
            }
          ]
        },
        \"fallbackOutput\": 1
      },
      \"type\": \"n8n-nodes-base.switch\",
      \"typeVersion\": 1,
      \"position\": [
        5248,
        432
      ],
      \"id\": \"66811317-6cfd-4e27-8099-bfc3869d7a8f\",
      \"name\": \"Check Modo Ejecución\"
    }
  ],
  \"connections\": {
    \"Descargar UP desde Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Espera de las 4 descargas\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Descargar SM desde Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Espera de las 4 descargas\",
            \"type\": \"main\",
            \"index\": 1
          }
        ]
      ]
    },
    \"Descargar JM desde Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Espera de las 4 descargas\",
            \"type\": \"main\",
            \"index\": 2
          }
        ]
      ]
    },
    \"Descargar MN desde Azure\": {
      \"main\": [
        [
          {
            \"node\": \"Espera de las 4 descargas\",
            \"type\": \"main\",
            \"index\": 3
          }
        ]
      ]
    },
    \"Espera de las 4 descargas\": {
      \"main\": [
        []
      ]
    },
    \"Espera de la creación de los 4 artefactos\": {
      \"main\": [
        [
          {
            \"node\": \"Check Modo Ejecución\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Esperar Corrección Manual\": {
      \"main\": [
        [
          {
            \"node\": \"Descargar MN desde Azure\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Descargar JM desde Azure\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Descargar SM desde Azure\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Descargar UP desde Azure\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    },
    \"Check Modo Ejecución\": {
      \"main\": [
        [
          {
            \"node\": \"Descargar UP desde Azure\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Descargar SM desde Azure\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Descargar JM desde Azure\",
            \"type\": \"main\",
            \"index\": 0
          },
          {
            \"node\": \"Descargar MN desde Azure\",
            \"type\": \"main\",
            \"index\": 0
          }
        ],
        [
          {
            \"node\": \"Esperar Corrección Manual\",
            \"type\": \"main\",
            \"index\": 0
          }
        ]
      ]
    }
  },
  \"pinData\": {},
  \"meta\": {
    \"templateCredsSetupCompleted\": true,
    \"instanceId\": \"2750c12808ff0c47854ea0723b5e0a8650384953d2eff356e32ff81e23012ccf\"
  }
}

```

---

### Navegación

[← Prompt 061](/04-orquestacion-productiva/061/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 063 →](/04-orquestacion-productiva/063/)
{% endraw %}
