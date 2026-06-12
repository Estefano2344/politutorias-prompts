---
layout: default
title: '100. **Initiating User Context** I''m currently delving into the specif…'
parent: Orquestación n8n productiva
nav_order: 100
permalink: /04-orquestacion-productiva/100/
---

{% raw %}

# Prompt 100
{: .no_toc }

**Sección:** Orquestación n8n productiva &middot; **Longitud:** 1,304 caracteres &middot; **Posición en la conversación:** 100 de 103

---

```
**Initiating User Context**

I'm currently delving into the specifics of the user's issue: setting up Google OAuth2 credentials. The context is an n8n instance running on an AWS EC2. I need to understand the nuances of this setup.


**Analyzing Google Restrictions**

I see the user has resolved the redirect URI mismatch by using nip.io. However, I'm now focusing on a 403 error: \"Google Access Blocked.\" It appears to be a Google OAuth Consent Screen policy issue, indicating the application is in \"Testing\" mode, restricting access to developer-approved testers. The email trying to authenticate, estefano.mateo.p@gmail.com, likely isn't on the \"Test Users\" list. I am zeroing in on this as the likely root cause.


**Crafting the Resolution**

I've formulated a targeted solution. The immediate action is adding `estefano.mateo.p@gmail.com` as a test user within the Google Cloud Console's OAuth Consent Screen. I've also prepared a concise, step-by-step guide for the user, starting with navigating the Google Cloud Console, verifying test mode, adding the user, and finally, retrying. I'm refining my explanation to highlight that the `nip.io` fix was successful and frame this as a manageable permissions issue within Google's testing environment. I'll provide this guide and explanation.



```

---

### Navegación

[← Prompt 099](/04-orquestacion-productiva/099/) &middot; [Volver a Orquestación n8n productiva](/04-orquestacion-productiva/) &middot; [Prompt 101 →](/04-orquestacion-productiva/101/)
{% endraw %}
