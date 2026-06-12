---
layout: default
title: '001. Rol: Eres un tutor de tesis experto que tiene doctorados afines a…'
parent: Ensayo DevOps
nav_order: 1
permalink: /08-ensayo-devops/001/
---

{% raw %}

# Prompt 001
{: .no_toc }

**Sección:** Ensayo DevOps &middot; **Longitud:** 10,866 caracteres &middot; **Posición en la conversación:** 1 de 5

---

```
Rol: Eres un tutor de tesis experto que tiene doctorados afines a su carrera de ingenieria en software con multiples certificados en IA relacionada a devops, scrum, etc. 

Contexto: Se solicito que redactaran a sus tutoriados un ensayo tratando de resolver las siguientes cuestiones, Comparativa sin IA vs con IA
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

Este ensayo es para el componente DevOps que soy yo, y tu conoces el proyecto PoliTutorias y como lo hemos cosntruido en todo este tiempo.


El Impacto de la IA Generativa en la Arquitectura DevOps: De la Fricción
a la Agilidad
La implementación de Inteligencia Artificial en el
componente DevOps marcó un punto de inflexión decisivo en la gestión de la
infraestructura del proyecto. En la fase inicial, el levantamiento de los
pipelines de CI/CD y la infraestructura en Azure se realizó mediante un proceso
tradicional. Esta etapa empírica, caracterizada por la prueba y error para
identificar los servicios con mejor relación costo-beneficio bajo una
suscripción de estudiante, tomó aproximadamente cuatro semanas (dos de
desarrollo y dos de estabilización).
Posteriormente, debido a complicaciones con los agentes
de integración en Azure, surgió la necesidad crítica de migrar la arquitectura
hacia AWS y GitHub Actions. En este punto, la IA actuó como un catalizador
técnico. A través del aprendizaje guiado, la herramienta analizó el ecosistema
del repositorio y dedujo las configuraciones óptimas para el despliegue. Logró
recomendar servicios altamente rentables —que luego fueron revalidados
exitosamente con la calculadora de AWS— y propuso modelos de orquestación
eficientes, como el uso de Hybrid
Triggers.
En términos de tiempo de ejecución, la comparativa es
contundente. La fase de levantamiento que inicialmente tomó alrededor de 20
días laborables se logró reconstruir y adaptar al entorno de AWS en tan solo 2
días. Aunque existía un conocimiento previo de la lógica de la arquitectura que
facilitó esta transición, el uso de la IA aceleró el proceso de migración y
configuración en un factor de 10 veces (10x), reduciendo drásticamente la curva
de aprendizaje frente a una plataforma nueva.
A pesar de estos beneficios técnicos, la adopción de la
IA definió claramente las fronteras de su propia capacidad, resaltando las
áreas que requieren supervisión humana estricta. La IA demostró ser deficiente
para el monitoreo autónomo de la ejecución de los pipelines en tiempo real; su
utilidad en este ámbito se limita a actuar como un asistente de depuración
reactivo cuando se le proveen los logs de error. Asimismo, la IA carece del contexto
de negocio y del criterio ético para el seguimiento de reglas de commits y la aprobación de Pull Requests (PR). Estas
tareas de revisión y control de calidad siguen siendo responsabilidad exclusiva
del componente humano.
A nivel de integración de equipo, el impacto de la
herramienta fue indirecto pero estratégico. Al acelerar exponencialmente la
creación de entregables individuales, se redujo el tiempo de inactividad entre
las fases del ciclo de vida del software. Esta velocidad evitó que los miembros
del equipo perdieran el contexto del código desarrollado, un problema común
cuando las tareas se estancan por días. En consecuencia, la comunicación se
volvió más fluida y continua, reteniendo la atención y el enfoque del equipo
sobre el objetivo principal.
En retrospectiva, la IA no reemplazó la ingeniería de
software, sino que eliminó la fricción operativa. Permitió abandonar las tareas
mecánicas de configuración de sintaxis para enfocar el esfuerzo humano en el
diseño arquitectónico, la validación de seguridad y la toma de decisiones
estratégicas.

Respondi a estas preguntas:
1. Sobre la Arquitectura y Selección de Servicios
Mencionas que la IA recomendó servicios rentables que luego validaste con la calculadora de AWS. Aquí falta detalle técnico sobre la toma de decisiones.

Pregunta de profundización: ¿Qué servicios específicos de AWS seleccionó la IA para reemplazar la arquitectura de Azure (por ejemplo, EC2 vs. Lambda, RDS vs. DynamoDB)? ¿Cómo manejó la IA el dilema de la suscripción de estudiante (Free Tier) frente a la necesidad de recursos para PoliTutorias?

Sugerencia: Sé más específico con los nombres de los servicios para que el lector entienda la complejidad técnica de la migración.

2. El Factor 10x y la Deuda Técnica
Reducir de 20 días a 2 días es una métrica de eficiencia excepcional. Sin embargo, en DevOps, la velocidad a veces sacrifica la seguridad o la robustez.

Pregunta de profundización: Al acelerar la configuración de los pipelines de GitHub Actions con IA, ¿cómo garantizaste que el código generado no tuviera vulnerabilidades (como secretos expuestos o permisos de IAM excesivos)? ¿Utilizaste la IA también para generar pruebas de infraestructura o linters?

Sugerencia: No solo hables de tiempo, menciona si la IA ayudó a que el código fuera de \"mejor calidad\" (más modular, mejor documentado) comparado con la versión manual de Azure.

3. Supervisión Humana y Contexto de Negocio
Dices que la IA carece de criterio para la aprobación de Pull Requests y reglas de commits. Esto es un punto crítico de gobernanza.

Pregunta de profundización: ¿Qué \"reglas de negocio\" de PoliTutorias tuvo que imponer el equipo humano que la IA ignoraba? Por ejemplo, ¿hubo convenciones de nomenclatura de ramas o flujos de GitFlow específicos que la IA no lograba asimilar?

Sugerencia: Describe un ejemplo real de un error de lógica o de \"sentido común\" que la IA cometió en el pipeline y que tú tuviste que corregir.

4. Integración del Equipo y Flujo de Valor
Mencionas que la IA redujo el \"tiempo de inactividad\". En términos de Scrum, esto afecta directamente al Velocity y al Lead Time.

Pregunta de profundización: ¿Cómo cambió la dinámica de los Daily Stand-ups o la revisión de tareas ahora que el componente DevOps no era un cuello de botella? ¿Sientes que la IA permitió que tus compañeros (desarrolladores) se involucraran más en la cultura DevOps (infraestructura como código) o seguiste siendo el único encargado?

Sugerencia: Conecta este punto con la entrega de valor al usuario final de PoliTutorias.

5. Propuesta y Reflexión (Lo que se queda y lo que se va)
El ensayo termina de forma narrativa, pero falta la parte propositiva que se te solicitó.

Pregunta de profundización: Basado en tu experiencia, ¿qué parte del proceso DevOps de PoliTutorias recomendarías automatizar con IA de forma permanente y qué parte prohibirías terminantemente que toque una IA en futuros proyectos de la facultad?

Sugerencia: Crea un pequeño párrafo final que sea un \"Manifiesto de Mejores Prácticas\" para futuros estudiantes que usen IA en DevOps.

Con estas respuestas:
Voy a responderte a las preguntas y en base a eso vamos a seguir constuyendo el ensayo

1. Sobre la Arquitectura y Selección de Servicios
Para la recomendacion de la IA esta tuvo que conocer sobre como se manejaba antes politutorias en Azure, que se trataba para base de datos, PostgresSQL flexible server para azure que tenia sus limitantes de configuracion. App Service para el levantamiento del backend, Key Vault para los secretos, VM para tener en esa maquina linux un agente que pueda construir las imagenes y desplegarlas, ademas el frontend estaba en Static Web App hasta que por limitantes de procesamiento del Static Web App se tuvo que migrar en el Sprint 3 hacia vercel donde ahi parmanece hasta ahora, resource group para mantener esta infraestructura, y ademas considerar que en azure se mantenia duplicada esta infraestrcutura para tener los dos entornos de produccion y de staging. En cambio la IA propuso el uso de una cuenta gratuita de AWS que nos otorgo 140 creditos, donde para un uso optimizado recomendo el uso de RDS para la base de datos igualmente con postgres, ademas construimos el agente de CI/CD en un EC2 que sigue en revision de cuanto consume, Elastic Beanstalk para el backend con dos entorno de staging y produccion, cada una con sus variables de entorno que en este caso no se usa un vault para las keys.

2. El Factor 10x y la Deuda Técnica
Para el pipeline de GitHub actions se usa control IAM principalmente para desplegar el backend en el Elastic Beanstalk, a nivel de seguridad y pruebas, el pipeline construido previamente sin uso de la IA pasaba por pruebas unitarias, pasaba por el linter configurado para verificar pruebas de esLint, verificaba endpoints para poder ejecutar el seed. El pipeline actual lo que hizo la IA fue traducir las tareas que se hacian en esos pipelines a los pipelines de github actions por lo que esta pasando por los mismos pasos

3. Supervisión Humana y Contexto de Negocio
Al inicio del realese sin IA es decir el realese 1 como componente definí las politicas de ramas y convenciones de los commits para lo cual siempre revisaba antes de cada PR, los commits, los cambios, que afecto en el codigo y si existia algun problema. Igualmente se notificaba al responsable y con una posible solucion. Esa parte es lo que la IA no pudo cubrir a nivel devOps. Ademas en la generacion de la IA en los pipelines toca revisar las llamadas a las variables de entorno principalmente porque sucedia que se inventaba nombres.

4. Integración del Equipo y Flujo de Valor
El impacto que sucedio en los daily esta mejora en la velocidad fue que no existian inconvenientes de desarollo e inconvenientes de commits ya que los otros compañeros al usar la IA de igual forma consumian la politicas de devOps estipuladas y podian cumplir a cabalidad la revision del eslint, comentarios, commits. 

5. Propuesta y Reflexión (Lo que se queda y lo que se va)
Como mencione la parte de monitorizacion es fundamental en DevOps por lo que esa parte siempre dejaria las decisiones a la parte humana sostenida por las sugerencias de la IA, ademas los recursos limitados de la suscripcion de estudiante en azure no me permitio el uso de IA de azure que tiene un mayor control y prevee fallos en los pipelines, por lo que una decision acertada bajo los resultados y entendiendo el concepto de la IA de azure es que cualquiera sea la IA lo mejor es estar soportado por una pero tomar la decision cirtica hasta para los pipelines, muchas veces tomaba versiones que eran muy actualizadas que requerian un costo o procesamiento adicional.

Quiero tener un ensayo con mi misma forma de escrbir que contenga toda la espcificidad necesaria
```

---

### Navegación

[Volver a Ensayo DevOps](/08-ensayo-devops/) &middot; [Prompt 002 →](/08-ensayo-devops/002/)
{% endraw %}
