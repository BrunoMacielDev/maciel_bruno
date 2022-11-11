create schema tp5_eje1;
use tp5_eje1;

create table empleados (
	idempleado int unsigned auto_increment primary key,
    cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	id_departamento INT,
	estado BOOLEAN,
	FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);

create table departamentos (
	iddepartamento int auto_increment,
    nombre varchar(30) not null,
    presupuesto double not null,
    estado boolean not null,
    primary key(iddepartamento)
);

INSERT INTO departamentos VALUES(1, 'Desarrollo', 120000, true);
INSERT INTO departamentos VALUES(2, 'Sistemas', 150000, true);
INSERT INTO departamentos VALUES(3, 'Recursos Humanos', 280000, true);
INSERT INTO departamentos VALUES(4, 'Contabilidad', 110000, true);
INSERT INTO departamentos VALUES(5, 'I+D', 375000, true);
INSERT INTO departamentos VALUES(6, 'Proyectos', 0,true );
INSERT INTO departamentos VALUES(7, 'Publicidad', 0, true);
INSERT INTO departamentos VALUES(8, 'Comercial', 0, false);
INSERT INTO empleados VALUES(1, '27-32481596-3', 'Aarón', 'Rivero', 1, true);
INSERT INTO empleados VALUES(2, '27-29557532-1', 'Adela', 'Salas', 2, true);
INSERT INTO empleados VALUES(3, '20-36970642-1', 'Adolfo', 'Rubio', 3, true);
INSERT INTO empleados VALUES(4, '20-41705545-1', 'Adrián', 'Suárez', 4, true);
INSERT INTO empleados VALUES(5, '20-17087203-3', 'Marcos', 'Loyola', 5, true);
INSERT INTO empleados VALUES(6, '27-38382980-3', 'María', 'Santana', 1, true);
INSERT INTO empleados VALUES(7, '23-80576669-1', 'Pilar', 'Ruiz', 2, true);
INSERT INTO empleados VALUES(8, '24-71651431-3', 'Pepe', 'Ruiz', 3, true);
INSERT INTO empleados VALUES(9, '25-36399183-3', 'Juan', 'Gómez', 2, true);
INSERT INTO empleados VALUES(10, '20-34638446-3', 'Diego','Flores', 5, true);
INSERT INTO empleados VALUES(11, '27-36738983-3', 'Marta','Herrera', 1, true);
INSERT INTO empleados VALUES(12, '27-44123836-1', 'Irene','Salas', NULL, false);
INSERT INTO empleados VALUES(13, '20-38265162-1', 'Juan', 'Antonio', NULL, true);

select apellido from empleados;
select distinct apellido from empleados;
select * from empleados;
select nombre, apellido from empleados;
select cuil_cuit from empleados where id_departamento!=0;
select concat_ws(' ', nombre, apellido) nombre_apellido from empleados;
select concat_ws(' ', upper(nombre), upper(apellido)) nombre_apellido from empleados;
select concat_ws(' ', lower(nombre), lower(apellido)) nombre_apellido from empleados;
select nombre, presupuesto from departamentos order by presupuesto asc;
select nombre from departamentos order by nombre asc;
select nombre from departamentos order by nombre desc;
select apellido, nombre from empleados order by apellido asc;
select nombre, presupuesto from departamentos order by presupuesto desc limit 3;
select nombre, presupuesto from departamentos order by presupuesto asc limit 3;
select nombre, presupuesto from departamentos where presupuesto>=150000;
select nombre, presupuesto from departamentos where presupuesto>=100000 and presupuesto<=200000;
select nombre, presupuesto from departamentos where presupuesto<100000 or presupuesto>200000;
select * from empleados e inner join departamentos d on d.iddepartamento = e.id_departamento;
select * from empleados e inner join departamentos d on d.iddepartamento = e.id_departamento order by d.nombre asc, e.apellido asc, e.nombre asc;
select distinct d.iddepartamento, d.nombre from departamentos d right join empleados e on e.id_departamento = d.iddepartamento;
select d.nombre from departamentos d inner join empleados e on e.id_departamento = d.iddepartamento where e.cuil_cuit = '27-38382980-3';
select d.nombre from departamentos d inner join empleados e on e.id_departamento = d.iddepartamento where e.nombre='pepe' and e.apellido='ruiz';
select e.* from empleados e inner join departamentos d on d.iddepartamento = e.id_departamento where d.nombre='I+D' order by e.nombre asc;
select e.* from empleados e inner join departamentos d on d.iddepartamento = e.id_departamento where d.nombre='Sistemas' or d.nombre='Contabilidad' or d.nombre='I+D' order by e.nombre asc;
select e.nombre from empleados e inner join departamentos d on d.iddepartamento = e.id_departamento where d.presupuesto<100000 or d.presupuesto>200000;