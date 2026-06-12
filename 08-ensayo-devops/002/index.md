---
layout: default
title: '002. Asi lo modifique: La IA en la implementación del componente DevOp…'
parent: Ensayo DevOps
nav_order: 2
permalink: /08-ensayo-devops/002/
---

{% raw %}

# Prompt 002
{: .no_toc }

**Sección:** Ensayo DevOps &middot; **Longitud:** 5,339 caracteres &middot; **Posición en la conversación:** 2 de 5

---

```
Asi lo modifique:

La IA en la implementación del componente DevOps
La implementación de Inteligencia Artificial en el componente DevOps agilizo la gestión de la infraestructura del proyecto PoliTutorias. En la fase inicial (sin IA), el levantamiento en Azure fue un proceso empírico y manual. Manteníamos una arquitectura compleja que incluía PostgreSQL Flexible Server (con limitantes de configuración), App Service para el backend, Key Vault para la gestión de secretos y una Máquina Virtual (VM) Linux actuando como agente de construcción. Además, enfrentamos cuellos de botella con Static Web Apps que nos obligaron a migrar el frontend a Vercel en el Sprint 3. Todo esto duplicado para los entornos de Staging y Producción.
Ante la necesidad crítica de migrar a AWS y GitHub Actions debido a fallos en la suscripción de Azure for Students, la IA actuó como un arquitecto consultor. Analizó los requerimientos y, considerando el poco gasto que debía implicar recomendó los 100 créditos que se les otorga a las cuentas nuevas de AWS, propuso una arquitectura optimizada: usar el servicio de base de datos Amazon RDS (PostgreSQL), implementar un agente de CI/CD autogestionado en una instancia EC2 (actualmente bajo revisión de consumo) y utilizar Elastic Beanstalk para orquestar el backend en dos entornos diferenciados mediante variables de entorno, eliminando la complejidad inicial del Vault. Esta selección no fue aleatoria; fue una deducción lógica de costo-eficiencia que validamos posteriormente con la calculadora de AWS.
En términos de tiempo, la comparativa es contundente. La fase de levantamiento en Azure, que tomó 20 días laborables, de prueba y error, se reconstruyó y adaptó al entorno de Azure en AWS en tan solo 2 días, considerando que solo se buscaba replicar lo que se tenía en Azure, por lo que ya se tenía la base técnica. La IA no solo generó código, sino que \"tradujo\" la lógica de calidad que ya teníamos.
El nuevo pipeline de GitHub Actions no es una versión simplificada; mantiene el rigor del original: ejecución de ESLint, pruebas unitarias y verificación de endpoints para la ejecución de seeds. La IA fue capaz de replicar los pasos de seguridad y control IAM para el despliegue en Elastic Beanstalk, garantizando que la reducción del tiempo (un factor de 10x) no comprometiera la robustez que habíamos construido manualmente.
A pesar de la eficiencia, la adopción de la IA definió claramente sus limitaciones operativas. Detecté que la IA tiende a \"alucinar\" en la nomenclatura de las variables de entorno dentro de los pipelines, inventando nombres que no existen en el contexto del proyecto. Aquí es donde la supervisión humana fue estricta e insustituible.
Asimismo, la IA carece de contexto de negocio y gobernanza. Desde el Release 1, se definió políticas de ramas y convenciones de commits que actúan como un contrato de calidad. La revisión de los Pull Requests (PR), el análisis de cómo un cambio afecta la lógica del negocio y la notificación de errores a los responsables siguen siendo tareas puramente humanas. La IA puede sugerir correcciones, pero no puede juzgar la intención ni la ética del cambio propuesto.
 
A nivel de integración, la herramienta tuvo un impacto estratégico en la cultura del equipo. Al acelerar el desarrollo de cada componente individual, mis compañeros pudieron adherirse más fácilmente a las políticas DevOps (linter, commits semánticos) asistidos por sus propias herramientas de IA antes de llegar a mi revisión. Esto eliminó los cuellos de botella en los Dailys: al reducirse los conflictos de integración y los errores de sintaxis, la comunicación dejó de centrarse en \"por qué falló el build\" para enfocarse en la entrega de valor y la funcionalidad del software.
En retrospectiva, la IA transformó el rol de DevOps en PoliTutorias, permitiendo abandonar la configuración mecánica para enfocarnos en la estrategia. Lo que podría reflejarse en la traducción de sintaxis entre plataformas (ej. Azure Pipelines a GitHub Actions) y la asistencia de la IA para el levantamiento de la infraestructura de forma eficiente.
También hay que notar que no es recomendable permitir a la IA la monitorización en tiempo real y la gestión de versiones críticas. La IA tiende a sugerir cambios hacia versiones muy recientes que pueden romper la compatibilidad o generar costos ocultos.
Además, es importante destacar que la decisión final sobre la arquitectura y la aprobación del paso a producción siempre debe recaer en el componente humano. La IA es el motor que acelera el vehículo, pero no es quien conduce.


Pero falta una parte:

Bueno ademas cabe recalcar que lo del uso de IA primera tuvo estas etapas:

PoC:

Donde se uso la IA para la orquestacion de flujos en n8n levantando un servidor en AWS igual con aprendizaje guiado. Cabe recalcar que primero lo hice tambien en localhost, la IA participo aqui en:

- ayudarme a entender los flujos 
- guiarme en la construcción del agente orquestador que sepa que herramientas usar
- cumplir requerimientos, como clonar una carpeta de local a AWS
- migrar la infraestructura del backend hacia AWS y para eso me dio aprendizaje guiado y sugerencias que ya comentamos antes
- aqui en la PoC todavia se tenia los pipelines en azure pero una vez finalizada el PoC se pasaron a GitHub como lo habiamos conversando antes.
```

---

### Navegación

[← Prompt 001](/08-ensayo-devops/001/) &middot; [Volver a Ensayo DevOps](/08-ensayo-devops/) &middot; [Prompt 003 →](/08-ensayo-devops/003/)
{% endraw %}
