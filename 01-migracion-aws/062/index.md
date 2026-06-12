---
layout: default
title: '062. Me hicieron redactar un ENSAYO para mi tesis, que resuelva estas…'
parent: Migración a AWS
nav_order: 62
permalink: /01-migracion-aws/062/
---

{% raw %}

# Prompt 062
{: .no_toc }

**Sección:** Migración a AWS &middot; **Longitud:** 3,953 caracteres &middot; **Posición en la conversación:** 62 de 64

---

```
Me hicieron redactar un ENSAYO para mi tesis, que resuelva estas preguntas:




Comparativa sin IA vs con IA

- En qué medida ayudó la inteligencia artificial el

desarrollo de mi componente.

 

Qué está cubierto por IA?

- Qué parte del componente requiere supervisión humana.

 

Tiempo de ejecución de cada componente

- Cuánto se tardaba antes vs cuánto se tarda antes, en

comparación de crecimiento en n veces. Se aceleró en 3 veces el proceso

 

Integración como equipo

- En qué medida mejoró la integración entre el equipo el uso

de la IA.

 

-Reflexiones

-Narrativa

-Propositivo

-Que se pone, que se quita




Y yo escribi este primer borrador:




ENSAYO: AVANCE AWS

La implementación de la IA en mi

componente DevOps acelero el proceso de elaboración de los pipelines, ya que la

IA al conocer cada uno de los componentes de cada proyecto en el repositorio

este pudo deducir la forma correcta desplegar pese a que se movió los pipelines

desde azure hacia los pipelines de github actions, esto gracias a que existieron

complicaciones con la plataforma de azure donde se alojaba el agente de CI/CD y

además la infraestructura. En la migración a AWS también con la función de

aprendizaje guiado de Gemini la migración fue mas fácil, pese a conocer solo básico

del ecosistema de azure, permitiendo asi una migración de una infraestructura

similar a la qu ese había construido en Azure durante aproximadamente 1 mes en

tan solo 2 dias como mucho. Aunque hay que considerar que cuando se construyo

en Azure esta misma demoro por concepto de prueba y error hasta encontrar los componentes

que generen menor costo y mayor beneficio al tratarse de una suscripción de

estudiante. En contraste Gemini recomendó directamente la que conocía que

generaban menos gasto y se rivalido esa información con la calculadora de aws.

Ademas hay que considerar que el aprendizaje guiado no fue solo usado para la migración

a AWS del aplicativo de PoliTutorias sino también guiar la orquestación de los

agentes, proponiendo arquitecturas que se podían usar, hasta encontrar la

adecuado de Hybrid Trigger, además de ayuda constante en entender los otros

flujos para poder ir uniéndolos a través de su trazabalidad.

 

Pese a ver descrito las bondades

y beneficios que trae la IA al componente hay que considerar que las partes que

la IA no puede cubrir es especialmente el monitoreo de la ejecución de los pipelines,

sin embargo si le compartimos los logs de la ejecución puede guiarnos en la resolución

del conflicto de existir alguno. Tambien la IA no puede cubrir el seguimiento

de reglas de commits y PR que eso solo un humano lo puede aprobar después de su

debida revisión.

 

En tiempo de ejecución de la tareas

del componente la evolución se puede percibir con los datos del inicio de cada

sprint en cada realese, el primer realese que se desarrollo de forma tradicional

bajo el marco de trabajo de Scrum sin uso de IA el levantamiento y puesta en

marcha verificada demoro alrededor de 2 semanas mas 2 semanas para verificación

de errores. En cambio en la PoC (Prueba de concepto) del Sprint 5 donde ya se requirió

el levantemiento de la infraestructura en AWS, por problemas antes mencionados,

esta fase que demoraba 2 semanas pudo construirme en 2 dias, considerando que

para AWS ya se conocía lo que se debia levantar y no requeria de volver a hacer

pruebas sino que con la guía de la IA mas el conocimiento previo se consiguió ese

tiempo.

 

Ahora bien, ¿la IA impacto en la integración

como equipo? En mi opinión minimamente pero un impacto que tuvo fue la

velocidad con la que todos podias hacer nuestros entregables por lo que reducia

el tiempo entre entregables y la posibilidad de que pasado dos días algún miembro

del equipo olvidara partes del desarrollo que se estaba llevando acabo. Esto

agilizo el proceso no solo del desarrollo sino también la comuncacion y retuvo

mejor la atención del equipo.
```

---

### Navegación

[← Prompt 061](/01-migracion-aws/061/) &middot; [Volver a Migración a AWS](/01-migracion-aws/) &middot; [Prompt 063 →](/01-migracion-aws/063/)
{% endraw %}
