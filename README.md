[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/VFwGcsAz)
# Trabajo Final PDDL

El trabajo final del bloque de PDDL consistirá en una comparación de distintos planificadores, analizando qué features de PDDL están soportadas por cada uno.

*Nota:* Este trabajo se realizará por grupos de 4 personas. Todas las personas del grupo debéis aceptar la tarea en Github Classroom y entrar en el repositorio creado automáticamente para el grupo.

## Planificadores

Los planificadores a comparar serán POPF, OPTIC y uno más a elección del grupo. Indicad aquí cuál es el planificador adicional escogido, cuál es la web oficial, dónde se encuentra su documentación y cuáles son los pasos para poder instalarlo y ejecutarlo:

*[Respuesta: Información de planificador escogido]*


## Estudio de compatibilidad con features de PDDL
A continuación, seleccionad un subset de features que os parezcan interesantes del lenguaje. Por ejemplo: `durative-actions`, `existential-preconditions`, `negative-precontitions`, etc... Después, verificad si están soportadas por cada uno de los planificadores.

Para demostrar el soporte de cada feature, es necesario hacer dos cosas:

1. Comprobar en la documentación (si la hubiese) si el planificador soporta dicha feature.
2. Crear un ejemplo mínimo, con un dominio y un problema sencillos en el que se utilice dicha feature para demostrarlo, comprobando el comportamiento de cada uno de los planificadores.

*[Respuesta: Análisis features]*

:disjunctive-preconditions
- Carpeta con un [ejemplo](Examples/disjunctive-preconditions) sencillo.
- Carpeta con [test](tests/disjunctive-preconditions) básico.
- POPF: No son admitidas explícitamente en PDDL, ya que no están incluidas en las especificación estándar de PDDL, pero sí lo son en STRIPS o ADL, ya que POPF se centra en que las acciones tengan precondiciones y efectos, pero sin admitir las disyuntivas directamente.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:existential-preconditions
- POPF: No est�n directamente soportadas por PDDL, ya que establecen que al menos una de las precondiciones debe ser verdadera, algo que difiere con las precondiciones conjuntivas, ya que �stas establecen que todas deben ser verdaderas (exist es de PDDL 1.1).

:universal-preconditions
- POPF: S� est�n soportadas, ya que establecen que todas las condiciones de la precondici�n deben ser verdaderas, ya que POPF se centra en la generaci�n de planes parcialmente ordenados a partir de un espacio de estados, algo que todav�a no se ha optimizado en esta versi�n de PDDL. Aunque el forall en el goal no est� soportado (PDDL 1.1).

:conditional-effects
- POPF: No los soporta, ya que PDDL s�lo permite la especificaci�n de efectos deterministas, es decir, los que ocurren siempre cuando se ejecuta una acci�n.

:numeric-fluents
- POPF: S� est�n soportados, permitiendo definir funciones que manejen valores num�ricos.

:durative-actions
- POPF: S�, permiten modelar acciones con una duraci�n de tiempo determinada.

:continuous-effects
- POPF: S� est�n soportados, afectando al estado del mundo de forma cont�nua en vez de instant�nea.

:negative-preconditions
- POPF: No est�n soportadas, ya que PDDL no admite precondiciones negativas ni en el dominio ni en el problema.

:equality
- POPF: S� est� soportada, permitiendo establecer relaciones de igualdad entre objetos.

:domain-axioms
- POPF: S� est�n soportados, permitiendo especificar restricciones en las acciones y estados del dominio.

:action-expansions
- POPF: S� est�n soportadas, permitiendo definir acciones compactas y parametrizadas que a su vez contienen otras acciones.


Finalmente, generad una tabla en la que se resuma la compatibilidad de cada planificador, con las features analizadas por filas y los planificadores por columnas. Podéis encontrar información de cómo generar tablas en formato Markdown de Github [aquí](https://docs.github.com/es/get-started/writing-on-github/working-with-advanced-formatting/organizing-information-with-tables).

*[Respuesta: Tabla comparativa]*

| Features | POPF | OPTIC | FD |
| --- | --- | --- | --- |
| `:disjunctive-preconditions` | No soportado | No soportado | Si |
| `:existential-preconditions` | No soportado | No soportado | Si |
| `:universal-preconditions` | Si, no en el goal | Si | Soporte Medio |
| `:conditional-effects` | No soportado | No soportado | Si |
| `:numeric-fluents` | Si | Si | No soportado |
| `:durative-actions` | Si | Si | No soportado |
| `:continuous-effects` | Si | Da error | No soportado |
| `:negative-preconditions` | No soportado | No soportado | Si |
| `:equality` | Si | Si | Si |
| `:domain-axioms` | Si | Si | No soportado |
| `:action-expansion` | Si | Si | Si |

## Entrega del trabajo
El trabajo se presentará en clase el próximo lunes 26 de febrero. Además, en este repositorio deberéis añadir los ficheros PDDL para los ejemplos generados, debidamente referenciados en el README.

Es recomendable preparar diapositivas para la presentación, las cuales deberéis añadir también al repositorio.
