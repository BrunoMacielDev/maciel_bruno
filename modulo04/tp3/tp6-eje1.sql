DROP DATABASE IF EXISTS elsistema;

CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);

CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);

CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);

CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);

CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades (id,nombre, cp,id_provincia).

CREATE TABLE paises (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(15) NOT NULL
);

CREATE TABLE provincias(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
id_pais INT NOT NULL,
FOREIGN KEY (id_pais) REFERENCES paises(id)
);

CREATE TABLE localidades (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
cp VARCHAR(15) NOT NULL,
id_provincia INT NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);

-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos: direccion, id_localidad, email, telefono, fecha_ingeso, tms.
ALTER TABLE empleados
	ADD COLUMN direccion VARCHAR(45) NULL,
	ADD COLUMN id_localidad INT NULL,
    ADD COLUMN email VARCHAR(45),
    ADD COLUMN telefono VARCHAR(30),
    ADD COLUMN fecha_ingreso DATE,
    ADD COLUMN tms TIMESTAMP,
    ADD CONSTRAINT id_localidad FOREIGN KEY (id_localidad) REFERENCES localidades (id);

-- 3. Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos: gastos, tms

ALTER TABLE departamentos
	ADD COLUMN gasto DOUBLE,
    ADD COLUMN tms TIMESTAMP;

-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.

-- INSERT INTO paises
INSERT INTO paises(nombre)values('Argentina');
INSERT INTO paises(nombre)values('Chile');
INSERT INTO paises(nombre)values('Paraguay');
INSERT INTO paises(nombre)values('Brasil');
INSERT INTO paises(nombre)values('Uruguay');
-- INSERT INTO provincias
INSERT INTO provincias(nombre,id_pais)VALUES('Corrientes',1);
INSERT INTO provincias(nombre,id_pais)VALUES('Misiones',1);
INSERT INTO provincias(nombre,id_pais)VALUES('Chaco',1);
INSERT INTO provincias(nombre,id_pais)VALUES('Formosa',1);
INSERT INTO provincias(nombre,id_pais)VALUES('Entre Rios',1);
-- INSERT INTO localidades
INSERT INTO localidades(nombre,cp,id_provincia)VALUES('Gdor. Virasoro','3342',1);
INSERT INTO localidades(nombre,cp,id_provincia)VALUES('Posadas','3300',2);
INSERT INTO localidades(nombre,cp,id_provincia)VALUES('Obera','3360',2);
INSERT INTO localidades(nombre,cp,id_provincia)VALUES('Ituzaingo','3302',1);
INSERT INTO localidades(nombre,cp,id_provincia)VALUES('Entre Rios','3100',5);
select * from localidades;
-- INSERT INTO departamentos
INSERT INTO departamentos(nombre,presupuesto,estado,gasto,tms)VALUES('I+D',240,1,120,NOW()); -- 2
INSERT INTO departamentos(nombre,presupuesto,estado,gasto,tms)VALUES('Administracion',120,1,80,NOW()); -- 3
INSERT INTO departamentos(nombre,presupuesto,estado,gasto,tms)VALUES('BD',350,1,300,NOW()); -- 4
INSERT INTO departamentos(nombre,presupuesto,estado,gasto,tms)VALUES('Servidores',430,1,410,NOW()); -- 5
INSERT INTO departamentos(nombre,presupuesto,estado,gasto,tms)VALUES('UX/UI',230,1,190,NOW()); -- 6
-- INSERT INTO empleados
INSERT INTO empleados(cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)VALUES('20-43318323-5','Bruno','Maciel',5,1,'Junin 2224',2,'brunomacielcf@gmail.com','+5493756412352','2019-10-24',NOW());
INSERT INTO empleados(cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)VALUES('27-38293123-2','Ignacio','Sanchez',2,1,'25 de Mayo 1210',3,'isanchez1@gmail.com','+5493755323912','2017-11-19',NOW());
INSERT INTO empleados(cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)VALUES('30-15555929-1','Hector','Hernandez',3,1,'Alberdi 1222',2,'hdezhector@gmail.com','+5493764514413','2015-11-05',NOW());
INSERT INTO empleados(cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)VALUES('25-39205505-5','Micaela','Stein',3,1,'Junin 1414',5,'stmica@gmail.com','+549343151593','2020-03-10',NOW());
INSERT INTO empleados(cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)VALUES('14-24394023-5','Sebastian','Baier',4,1,'Av. Libertador 2333',3,'sebastianaier@gmail.com','+5493755435360','2021-05-10',NOW());

-- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
ALTER TABLE pedidos RENAME TO  movimientos;

-- 6. Agregar las entidades:Productos, Marcas, Proveedores, Cajas

CREATE TABLE cajas(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    horainicio DATETIME NOT NULL,
    horacierre DATETIME NOT NULL,
    estado BOOLEAN NOT NULL,
    tms TIMESTAMP
);

CREATE TABLE proveedores(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(30) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    naturaleza VARCHAR(10) NULL,
    cuit VARCHAR(15) NOT NULL,
    id_localidad INT NOT NULL,
    estado BOOLEAN NOT NULL,
    tms TIMESTAMP,
    FOREIGN KEY (id_localidad) REFERENCES localidades(id)
);

CREATE TABLE marcas(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(45) NOT NULL,
    imagen VARCHAR(100) NULL,
    id_proveedor INT NOT NULL,
    estado BOOLEAN NOT NULL,
    tms TIMESTAMP,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id)
);

CREATE TABLE productos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(45) NOT NULL,
    id_marca INT NOT NULL,
    stock INT NOT NULL,
    precio INT NOT NULL,
    estado BOOLEAN NOT NULL,
    tms TIMESTAMP,
    FOREIGN KEY (id_marca)REFERENCES marcas(id)
);

-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.

-- INSERT INTO proveerdores
INSERT INTO proveedores(razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms)
VALUES('Hernandez SA','Alberto','Hernandez','Fisica','30-50279317-5',1,1,NOW());
INSERT INTO proveedores(razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms)
VALUES('San Patricio SRL','Juan Carlos','Esteche','Juridica','30-66631918-0',4,1,NOW());
INSERT INTO proveedores(razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms)
VALUES('Reverdito SA','Juan','Reverdito','Juridica','30-71113577-0',3,1,NOW());
INSERT INTO proveedores(razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms)
VALUES('Pancracio SA','Pancracio','Riquelme','Juridica','30-68681003-4',2,1,NOW());
INSERT INTO proveedores(razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms)
VALUES('Benitez SH','Anibal','Benitez','Juridica','30-65903074-4',5,1,NOW());

-- INSERT INTO marcas
INSERT INTO marcas(nombre,descripcion,imagen,id_proveedor,estado,tms)VALUES('La Campagnola','Alimentos',' ','3',1,NOW());
INSERT INTO marcas(nombre,descripcion,imagen,id_proveedor,estado,tms)VALUES('Arcor','Golosina',' ','1',1,NOW());
INSERT INTO marcas(nombre,descripcion,imagen,id_proveedor,estado,tms)VALUES('CocaCola','Bebidas',' ','5',1,NOW());
INSERT INTO marcas(nombre,descripcion,imagen,id_proveedor,estado,tms)VALUES('La Huerta','Verduras',' ','2',1,NOW());
INSERT INTO marcas(nombre,descripcion,imagen,id_proveedor,estado,tms)VALUES('Ilolay','Lacteos',' ','4',1,NOW());

-- INSERT INTO productos
INSERT INTO productos(nombre,descripcion,id_marca,stock,precio,estado,tms)VALUES('Queso Cremoso(kg)','Quesos',5,15,1125,1,NOW());
INSERT INTO productos(nombre,descripcion,id_marca,stock,precio,estado,tms)VALUES('CocaCola Lata 354ml','Gaseosas',3,48,250,1,NOW());
INSERT INTO productos(nombre,descripcion,id_marca,stock,precio,estado,tms)VALUES('Papas(kg)','Verduleria',4,10,500,1,NOW());
INSERT INTO productos(nombre,descripcion,id_marca,stock,precio,estado,tms)VALUES('Pure de Tomate','Alimentos',1,12,175,1,NOW());
INSERT INTO productos(nombre,descripcion,id_marca,stock,precio,estado,tms)VALUES('Bon O Bon','Golosinas',2,30,50,1,NOW());

-- INSERT INTO cajas
INSERT INTO cajas(horainicio,horacierre,estado,tms)VALUES('2022-11-14 06:00:00','2022-11-14 10:00:00',1,NOW());
INSERT INTO cajas(horainicio,horacierre,estado,tms)VALUES('2022-11-14 10:00:00','2022-11-14 14:00:00',1,NOW());
INSERT INTO cajas(horainicio,horacierre,estado,tms)VALUES('2022-11-14 14:00:00','2022-11-14 18:00:00',1,NOW());
INSERT INTO cajas(horainicio,horacierre,estado,tms)VALUES('2022-11-14 18:00:00','2022-11-14 22:00:00',1,NOW());
INSERT INTO cajas(horainicio,horacierre,estado,tms)VALUES('2022-11-14 22:00:00','2022-11-15 02:00:00',1,NOW());

-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1.
SELECT nombre, presupuesto, gasto, (presupuesto-gasto) diferencia FROM departamentos WHERE estado = 1;

-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad
SELECT l.nombre Localidad, p.nombre Pais FROM localidades l INNER JOIN provincias pro ON pro.id=l.id_provincia INNER JOIN paises p ON p.id=pro.id_pais;

-- 10. Modificar (UPADTE): el telefono de un empleado cuando el id es igual a uno que hayan declarado Y la fecha_ingreso y la localidad de otro empleado.
UPDATE empleados SET telefono='+5493764514228' WHERE idemplaedo=4;
UPDATE empleados SET fecha_ingreso='2020-04-10', id_localidad=1 WHERE idemplaedo=1;

-- 11. Insertar 5 vendedores
INSERT INTO vendedores(nombre,apellido,cuitcuil,comisión)VALUES('Gabriel','Sanchez','20-34513112-4',120.4);
INSERT INTO vendedores(nombre,apellido,cuitcuil,comisión)VALUES('Pablo','Fontana','20-36545100-4',99.7);
INSERT INTO vendedores(nombre,apellido,cuitcuil,comisión)VALUES('Agustina','Branchicci','20-39065132-4',111.3);
INSERT INTO vendedores(nombre,apellido,cuitcuil,comisión)VALUES('Juan Cruz','Perez','22-31555343-4',100.6);
INSERT INTO vendedores(nombre,apellido,cuitcuil,comisión)VALUES('Florencia','Pereira','20-38912243-3',134.4);

-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
ALTER TABLE movimientos
	ADD COLUMN id_producto int,
    ADD COLUMN estado boolean,
    ADD COLUMN tms timestamp,
    ADD COLUMN tipo_movimento varchar(15),
    ADD FOREIGN KEY (id_producto) REFERENCES productos (id);

-- PASO NECESARIO: INSERT de clientes
INSERT INTO clientes(nombre,apellido,cuitcuil,ciudad,categoría)VALUES('Gerardo','Benitez','20-14520613-5','Posadas',1);
INSERT INTO clientes(nombre,apellido,cuitcuil,ciudad,categoría)VALUES('Patricia','Rodriguez','20-15666535-5','Obera',2);
INSERT INTO clientes(nombre,apellido,cuitcuil,ciudad,categoría)VALUES('Victoria','Suarez','23-24256999-5','San Vicente',2);
INSERT INTO clientes(nombre,apellido,cuitcuil,ciudad,categoría)VALUES('Robledo','Caceres','20-34132333-5','Posadas',1);
INSERT INTO clientes(nombre,apellido,cuitcuil,ciudad,categoría)VALUES('Pedro','Espindola','20-40233222-5','Gdor. Virasoro',3);

-- 13. Insertar 5 movimientos distintos.
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('1','2022-11-14',2,4,3,1,NOW(),'PEDIDO');
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('1','2022-11-15',2,4,3,1,NOW(),'EGRESO');
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('1','2022-11-14',2,4,3,1,NOW(),'EGRESO'); -- 0
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('3','2022-11-13',2,5,3,1,NOW(),'PEDIDO'); -- 0
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('5','2022-11-15',1,2,5,1,NOW(),'INGRESO');
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('12','2022-11-15',3,5,2,1,NOW(),'INGRESO');
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('5','2022-11-15',1,3,1,1,NOW(),'INGRESO');
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('2','2022-11-15',3,2,1,1,NOW(),'EGRESO');
INSERT INTO movimientos(cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimento)VALUES('5','2022-11-13',1,5,4,1,NOW(),'EGRESO');

-- 14. Borrar lógicamente (UPDATE de la columna estado): ● 2 movimientos que fueron cargados mal ● un pais que tenga al menos 3 localidades
UPDATE movimientos SET estado=1 WHERE id=4;
UPDATE movimientos SET estado=0 WHERE id=5;

-- 15.Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber 5 updates de la tabla producto.

UPDATE productos SET stock=9 WHERE id=3; -- (10-1)
UPDATE productos SET stock=35 WHERE id=5; -- (30+5)
UPDATE productos SET stock=60 WHERE id=2; -- (48+12)
UPDATE productos SET stock=20 WHERE id=1; -- (15+5)
UPDATE productos SET stock=18 WHERE id=1; -- (20-2)
UPDATE productos SET stock=7 WHERE id=4; -- (12-5)

-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
CREATE TABLE parametros(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tms TIMESTAMP,
    cosas JSON,
    id_usuario INT
);

-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
INSERT INTO parametros(tms,cosas,id_usuario)VALUES(NOW(),'{"idDeLaCosa": 101, "permisos": "PUT, GET"}',2);
INSERT INTO parametros(tms,cosas,id_usuario)VALUES(NOW(),'{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo": "ventas"}',5);
INSERT INTO parametros(tms,cosas,id_usuario)VALUES(NOW(),'{"zonaHoraria": "America/Argentina/BuenosAires"}',3);
INSERT INTO parametros(tms,cosas,id_usuario)VALUES(NOW(),'{"fechaInicioActividades":"01/01/2019","mesAperturaCaja":"Enero","mesCierreCaja":"Diciembre"}',1);
INSERT INTO parametros(tms,cosas,id_usuario)VALUES(NOW(),'{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}',4);

