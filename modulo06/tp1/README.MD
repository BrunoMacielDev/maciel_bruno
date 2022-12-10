# CURSO PROGRAMACIÓN WEB FULL STACK - NIVEL 2
### Módulo 6 - Programación FrontEnd

### HTML: Lenguaje de etiquetas de hipertexto
HTML no es un lenguaje de programación; es un lenguaje de marcado que define la estructura de tu contenido. Los elementos se componen de: etiquetas (tags) con atributos y de contenido.
```
<etiqueta_de_apertura> contenido <etiqueta_de_cierre>
```
HTML define el término elemento para referirse a las partes que componen los documentos HTML. La estructura general de una línea de código (elemento) en lenguaje HTML sería ésta:
```
<etiqueta atributo='valor'>...</etiqueta>
```
HTML define más de 140 etiquetas (algunas obsoletas en HTML5). La mayoría de las etiquetas van en pareja: una inicial, entre ángulos, y otra final, también entre ángulos pero con la barra inclinada derecha /, como por ejemplo la etiqueta de Título 1
```
<h1>Esto es un titulo</h1>
```
Una etiqueta por sí sola, a veces, no contiene la suficiente información para estar completamente definida. Para ello existen atributos que son pares nombre-valor separados por
un "=". Los atributos pueden ser opcionales, pero algunas etiquetas necesitan ciertos atributos para funcionar, como por ejemplo la etiqueta <img> para imágenes o la etiqueta <a> para
enlaces.
Además, los atributos siempre están escritos en la etiqueta inicial de un elemento, después del nombre del elemento. El valor puede estar encerrado entre "comillas dobles" o 'simples'.
Ejemplo:
```
<button id='boton1' class='boton rojo'>Pulsa</button>
<a href='http://www.google.com' target='_blank'>Ejemplo de enlace</a>  
```
Donde:
``<a>`` es la etiqueta o tag inicial y ``</a>`` es la final o de cierre.
``href`` y ``target`` son los atributos.
``http://www.google.com`` y ``_blank`` son los valores.
``Ejempo de enlace`` es el contenido
	
No todas las etiquetas van por pares, hay algunas que se componen de una sola (son etiquetas
vacías), sin contenido, por ejemplo:``<img src='/imagen.png'>``;``<br>``;``<hr>``
  
Ejercicio de ejemplo:
Copiar el siguiente código y guardarlo en un archivo mipagina.html. Luego abrir el archivo en el navegador.
```
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="aproximadamente unos 160cc"/>
    <meta name="author" content="(cc) 3con14" />
    <link rel="icon" href="favicon.ico" />
    <title>Título de la Página</title>
    <!-- Enlace a archivo/s de estilos CSS -->
    <link rel="stylesheet" href="css/normalize.css" />
    <link rel="stylesheet" href="css/estilos.css" />
  </head>
  <body>
    <h1>Esto es un título de nivel 1</h1>
    <p>
      <em>Párrafo con texto tipográfico:</em> Lorem ipsum dolor sit amet,
      consectetur adipisicing elit. Explicabo consectetur, eum dignissimos
      repudiandae dolores odio ex blanditiis commodi labore fuga, veniam nostrum
      iste, sapiente? Veniam eos deleniti officia nemo error!
    </p>
    <!-- Resto del contenido visible de la Página Web -->
    <!-- Enlace a archivo/s de programación JavaScript -->
    <script src="js/codigo.js"></script>
  </body>
</html>
```
#### Ejercicio 1:
1. Describe dos usos o funciones que proporciona la declaración DOCTYPE en una página web.
2. Para que se utilizan las siguientes etiquetas:
```
<head> </head>
<title> </title>
<meta>
<style> </style>
<body> </body>
<h1>,<h2>,<h3>,<h4>,<h5>,<h6>
<a>
<strong>
<br>
<ul>
<li>
<p>
<span>
<table> </table>
<tr> </tr>
<td> </td>
<img>
```
3. La etiqueta <script> puede ir dentro de las etiquetas de de <body> o <head>, hay alguna
diferencia donde pueda ir?
#### Ejercicio 2
A partir del texto que se proporciona, crear una página web que tenga el mismo aspecto que la
siguiente imagen:
  
Además, a tener en cuenta los siguientes requisitos:
- El título de la página debe ser Tim Berners-Lee.
- El texto "Tim Berners-Lee" como encabezado de nivel 1.
- El texto "Biografía" como encabezado de nivel 2.
- Todas las siglas, como HTTP, W3C o MIT deben aparecer como texto destacado.
- Los nombres de las instituciones o empresas, como Consorcio de la World Wide Web o Universidad de Oxford, deben aparecer como texto enfatizado.
##### Código inicial

  Tim Berners-Lee
Sir Timothy "Tim" John Berners-Lee (Londres, Reino Unido, 8 de junio de 1955) es un científico
de la computación británico, conocido por ser el padre de la Web. Estableció la primera
comunicación entre un cliente y un servidor usando el protocolo HTTP en noviembre de 1989.
En octubre de 1994 fundó el Consorcio de la World Wide Web (W3C) con sede en el MIT, para
supervisar y estandarizar el desarrollo de las tecnologías sobre las que se fundamenta la Web
y que permiten el funcionamiento de Internet.
Biografía
Nació en el sudoeste de Londres en 1955. Sus padres eran matemáticos y formaron parte del
equipo que construyó el Manchester Mark I (una de las primeras computadoras). Durante el
tiempo que estuvo en la universidad, construyó una computadora con una soldadora, circuitos
TTL, un procesador Motorola 68000 y un televisor viejo. Se graduó en física en 1976 en eQueen's College de la Universidad de Oxford. Conoció a su primera esposa en este periodo. En
1978, trabajó en D.G. Nash Limited (también en Poole) escribió un sistema operativo.
Desarrollo de su carrera
Berners-Lee trabajó en el CERN desde junio hasta diciembre de 1980. Durante ese tiempo,
propuso un proyecto basado en el hipertexto para facilitar la forma de compartir y la puesta al
día de la información entre investigadores. En este periodo también construyó un programa
llamado Enquire que no llegó a ver la luz.
Después de dejar el CERN, en 1980, se fue a trabajar a la empresa de John Poole Image
Computer Systems Ltd., pero regresó al CERN otra vez en 1984.
En 1989, el CERN era el nodo de Internet más grande de Europa y Berners-Lee vio la
oportunidad de unir Internet y el hipertexto (HTTP y HTML), de lo que surgiría la World Wide
Web. Desarrolló su primera propuesta de la Web en marzo de 1989, pero no tuvo mucho eco,
por lo que en 1990 y con la ayuda de Robert Cailliau, hicieron una revisión que fue aceptada
por su gerente, Mike Sendall. Usó ideas similares a las que había usado en el sistema Enquire
para crear la World Wide Web, para esto diseñó y construyó el primer navegador (llamado
WorldWideWeb y desarrollado con NextStep) y el primer servidor web al que llamó httpd
(HyperText Transfer Protocol daemon).
Fuente: Wikipedia
