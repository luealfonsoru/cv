# Taller de shaders

## Propósito

Estudiar los [patrones de diseño de shaders](http://visualcomputing.github.io/Shaders/#/4).

## Tarea

Escoja una de las siguientes dos:

1. Hacer un _benchmark_ entre la implementación por software y la de shaders de varias máscaras de convolución aplicadas a imágenes y video.
2. Estudiar e implementar el [shadow mapping](http://www.opengl-tutorial.org/intermediate-tutorials/tutorial-16-shadow-mapping/). Se puede emplear la escena del [punto 2 del taller de transformaciones](https://github.com/VisualComputing/Transformations_ws), así como la librería [frames](https://github.com/VisualComputing/frames). Ver el ejemplo [ShadowMap](https://github.com/VisualComputing/frames/tree/master/examples/demos/ShadowMap).

## Integrantes

Máximo tres.

Complete la tabla:

|  Integrante  | github nick |  Grupo  |
|--------------|-------------|---------|
| Ángel Rendón |             |L-C 9-11 |
| Diego Cruz   |             |L-C 9-11 |
| Luis Alfonso |luealfonsoru |L-C 9-11 |

## Informe

### Introducción
Se realizón una aplicación interactiva que usando un micrófono como método de entrada, modifica la posición de un personaje mediante los tonos que se ingresen.

### Estructura
Se tiene una escena proncipal del juego, a la cual se encuentra anidado el frame "level" que a su vex tiene anidados los frames "character" que es el personaje con el que se interactúa y el frame "bar" que tiene un ancho determinado y está contituido por dos box shapes separados a una distancia determinada: este además se desplaza por el escenario con una velocidad determinada. Desde el punto de vista musical, la altura del level significa los diferentes tonos o notas musicales, el ancho de la barra la longitud de la nota y la velocidad de la barra los BPM de la canción
### Interacción
El frame character se desplaza verticalmente por la escena dependiendo del tono que el usuaio ingrese por medio del micrófono, la detección se logra por medio de la transformada rápida de fourier y correlación de tonos. El juego consiste en cantar un tono determinado para evitar que el personaje chocque con las barras que se desplazan horizontalmente en el escenario. Usamos un sistema de cámara fija y perspectiva "pseudo" isométrica. 
### Shaders
Implementamos el shader MunchShader que emula las pinceladas y esquema de colores en las obras del artista Edvar Munch, específicamente "El Grito". Esto de forma procedural usando variables aleatorias y el tiempo en escena (millis() en processing parseado a la variable u_time en el shader) y con una animación sutil que emula el movimiento implicito en la obra. 

## Entrega

Fecha límite Domingo 10/3/19 a las 24h.
