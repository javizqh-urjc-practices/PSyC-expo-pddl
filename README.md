[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/VFwGcsAz)
# Trabajo Final PDDL

El trabajo final del bloque de PDDL consistirá en una comparación de distintos planificadores, analizando qué features de PDDL están soportadas por cada uno.

*Nota:* Este trabajo se realizará por grupos de 4 personas. Todas las personas del grupo debéis aceptar la tarea en Github Classroom y entrar en el repositorio creado automáticamente para el grupo.

## Planificadores

Los planificadores a comparar serán POPF, OPTIC y uno más a elección del grupo. Indicad aquí cuál es el planificador adicional escogido, cuál es la web oficial, dónde se encuentra su documentación y cuáles son los pasos para poder instalarlo y ejecutarlo:

*[Respuesta: Información de planificador escogido]*

El planificador elegido ha sido **Fast-Downward** una variante de fast-forward lanzada en 2004.
La pagina oficial se puede encontrar [aqui](https://www.fast-downward.org/), donde encontraras informacion adicional sobre casos de uso y ejemplos.

La instalación de fd se puede realizar siguiendo los pasos de esta [guía](https://github.com/aibasel/downward/blob/main/BUILD.md), donde los validadores son opcionales.

Puedes comprobar que la instalación ha sido exitosa ejecutando los tests implementados en `/tests`
Para ello ejecuta los siguientes comandos:

```bash
# Source all planners if not done previously
export LD_PATH='/home/<path-to-fd>/fast-downward.py'
source <your_popf_workspace_path>/install/setup.sh
source <your_optic_workspace_path>/install/setup.sh

# Clone and execute tests
git clone https://github.com/Docencia-fmrico/trabajo-pddl-forocoches
cd trabajo-pddl-forocoches/tests/

python3 ./test_all.py
```


En cuanto a información adicional puedes obtener la leyenda de características admitidas en PDDL a traves de la [wiki](https://planning.wiki/ref/planners/fd) de PDDL. Además nuestra presentación inicial esta basada en la documentación de diseño original de fd publicado por Helmert en 2004 a traves de este [artículo](https://www.jair.org/index.php/jair/article/view/10457).



## Estudio de compatibilidad con features de PDDL
A continuación, seleccionad un subset de features que os parezcan interesantes del lenguaje. Por ejemplo: `durative-actions`, `existential-preconditions`, `negative-precontitions`, etc... Después, verificad si están soportadas por cada uno de los planificadores.

Para demostrar el soporte de cada feature, es necesario hacer dos cosas:

1. Comprobar en la documentación (si la hubiese) si el planificador soporta dicha feature.
2. Crear un ejemplo mínimo, con un dominio y un problema sencillos en el que se utilice dicha feature para demostrarlo, comprobando el comportamiento de cada uno de los planificadores.

*[Respuesta: Análisis features]*

:disjunctive-preconditions
- Carpeta con un [ejemplo](Examples/disjunctive-preconditions) sencillo.
- Carpeta con [test](tests/disjunctive-preconditions) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:existential-preconditions
- Carpeta con un [ejemplo](Examples/existential-preconditions) sencillo.
- Carpeta con [test](tests/existential-preconditions) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:universal-preconditions
- Carpeta con un [ejemplo](Examples/universal-preconditions) sencillo.
- Carpeta con [test](tests/universal-preconditions) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:conditional-effects
- Carpeta con un [ejemplo](Examples/conditional-effects) sencillo.
- Carpeta con [test](tests/conditional-effects) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:numeric-fluents
- Carpeta con un [ejemplo](Examples/numeric-fluents) sencillo.
- Carpeta con [test](tests/numeric-fluents) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:durative-actions
- Carpeta con un [ejemplo](Examples/durative-actions) sencillo.
- Carpeta con [test](tests/durative-actions) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:continuous-effects
- Carpeta con un [ejemplo](Examples/continuous-effects) sencillo.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.
:negative-preconditions
- POPF: No est�n soportadas, ya que PDDL no admite precondiciones negativas ni en el dominio ni en el problema.

:equality
- Carpeta con [test](tests/equality) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:domain-axioms
- Carpeta con [test](tests/domain-axioms) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.

:action-expansion
- Carpeta con [test](tests/action-expansion) básico.
- POPF: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- OPTIC: En la documentación se menciona que la feature no está soportada, y al comprobarlo con el ejemplo se ve que el planificador se queda pillado, es decir, no funciona.
- Fast-Downward: En la documentación se menciona que la feature está soportada, y al comprobarlo al ejecutar el ejemplo obtiene un plan coherente. Por lo tanto si está soportado.


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
