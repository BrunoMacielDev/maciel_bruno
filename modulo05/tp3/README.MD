# CURSO PROGRAMACIÓN WEB FULL STACK - NIVEL 2
### MÓDULO 5 - Programación Backend (TP 9.a)

#### Ejercicio 1
Investigar y dar una definición con sus palabras los siguientes términos:
- REST
- API
- Endpoint
- Encabezados (headers)

#### Ejercicio 2
1. Realizar un fork, descargar y luego configurar el proyecto para que funcione localmente:
```
https://github.com/FacundoRauber/alpha-silicon
```
2. Crear las siguientes tablas en la base de datos:
- **CURSOS**
  - **idcurso** (int pk unique ai);
  - **nombre** (varchar(100));
  - **descripcion** (text);
  - **estado** (char(1) default '1')
- **USUARIOS**
  - **idusuario** (int pk unique ai);
  - **nickname** (varchar(100) unique);
  - **email** (varchar(100) unique);
  - **password** (varchar(100));
  - **estado** (char(1) default '1')
- **MATERIAS**
  - **idmateria** (int pk unique ai);
  - **nombre** (varchar(100));
  - **objetivo** (text);
  - **plan_estudio** (text);
  - **estado** (char(1) default '1')
- **SEDES**
  - **idsede** (int pk unique ai);
  - **nombre** (varchar(100));
  - **direccion** (text);
  - **localidad** (varchar(50));
  - **cod_postal** (varchar(10));
  - **telcontacto1** (varchar(15));
  - **telcontacto2** (varchar(15));
  - **estado** (char(1) default '1')

3. Dar de alta como mínimo 5 cursos, materias y usuarios.Algunos ejemplos pueden ser:
- Cursos: Introduccion a la programacion; Programacion FullStack, ...
- Materias: Ingles 1; Ingles 2; Programacion Web; Base de datos; Programacion de Apps; ...


4. Agregar al proyecto los controllers y datasource para poder realizar un alta, baja (solo lógica) y modificación de cursos, materias, sedes y usuarios. _verificar que los endpoints funcionen bien_

#### Ejercicio 3
1. Hacer un backup (dump) de la base de datos.
2. Subir los cambios al repositorio personal y compartir el enlace.

##### Bibliografia | Instaladores | Herramientas | y mas.
- https://www.w3schools.com/nodejs/nodejs_mysql.asp
- https://jsdoc.app/tags-param.html
- https://siliconmisiones.gob.ar/programacion-garupa-2-de-mayo-obera/
- Opcional Hosting MySQL:
  - https://www.db4free.net/
  - https://www.freesqldatabase.com/


