create schema ventas;
use ventas;

create table clientes(
	id int auto_increment primary key,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    cuitcuil varchar(20),
    ciudad varchar(100),
    categoria int
);

create table vendedores(
	id int auto_increment primary key,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    cuitcuil varchar(20),
    comision float
);

create table pedidos(
	id int auto_increment primary key,
    cantidad double not null,
    fecha date,
    id_cliente int not null,
    id_vendedor int not null,
    foreign key(id_cliente) references clientes(id),
    foreign key(id_vendedor) references vendedores(id)
);

INSERT INTO clientes VALUES(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape',100);
INSERT INTO clientes VALUES(2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi',200);
INSERT INTO clientes VALUES(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas',NULL);
INSERT INTO clientes VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO clientes VALUES(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas',200);
INSERT INTO clientes VALUES(6, 'María', 'Santana', '27-38771523-1', 'Obera',100);
INSERT INTO clientes VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO clientes VALUES(8, 'Pepe', 'Ruiz', '20-27436152-2', 'Iguazu', 200);
INSERT INTO clientes VALUES(9, 'Guillermo', 'López', '20-42481328-1','Andresito', 225);
INSERT INTO clientes VALUES(10, 'Daniel', 'Santana', '20-40159624-3','Apostoles', 125);
INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);
INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);
INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);
INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);
INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);
INSERT INTO vendedores VALUES(6, 'Manuel','Domínguez', '20-29876342-3', 0.13);
INSERT INTO vendedores VALUES(7, 'Antonio','Vega', '20-32521596-3', 0.11);
INSERT INTO vendedores VALUES(8, 'Alfredo','Ruiz', '20-42436477-3', 0.05);
INSERT INTO pedidos VALUES(1, 150.5, '2020-10-05', 5, 2);
INSERT INTO pedidos VALUES(2, 270.65, '2019-09-10', 1, 5);
INSERT INTO pedidos VALUES(3, 65.26, '2022-10-05', 2, 1);
INSERT INTO pedidos VALUES(4, 110.5, '2021-08-17', 8, 3);
INSERT INTO pedidos VALUES(5, 948.5, '2021-09-10', 5, 2);
INSERT INTO pedidos VALUES(6, 2400.6, '2021-07-27', 7, 1);
INSERT INTO pedidos VALUES(7, 5760, '2018-09-10', 2, 1);
INSERT INTO pedidos VALUES(8, 1983.43, '2021-10-10', 4, 6);
INSERT INTO pedidos VALUES(9, 2480.4, '2019-10-10', 8, 3);
INSERT INTO pedidos VALUES(10, 250.45, '2018-06-27', 8, 2);
INSERT INTO pedidos VALUES(11, 75.29, '2021-08-17', 3, 7);
INSERT INTO pedidos VALUES(12, 3045.6, '2022-04-25', 2, 1);
INSERT INTO pedidos VALUES(13, 545.75, '2022-01-25', 6, 1);
INSERT INTO pedidos VALUES(14, 145.82, '2022-02-02', 6, 1);
INSERT INTO pedidos VALUES(15, 370.85, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(16, 2389.23, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(17, 275.93, '2021-08-17', 2, 5);
INSERT INTO pedidos VALUES(18, 328.34, '2021-08-17', 1, 3);
INSERT INTO pedidos VALUES(19, 1838.66, '2020-03-19', 3, 4);
INSERT INTO pedidos VALUES(20, 2598.23, '2020-05-21', 5, 1);

-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedidos order by fecha desc;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor
select * from pedidos order by cantidad desc limit 2;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinct id_cliente from pedidos;

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya cantidad total sea superior a $500.
select * from pedidos where fecha>='2022-01-01' and cantidad>500;

-- 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
select nombre,apellido from vendedores where comision between 0.05 and 0.11;

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores
select comision from vendedores order by comision desc limit 1;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
select id, nombre, apellido from clientes where cuitcuil!=0 order by apellido asc, nombre asc;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
select nombre from clientes where nombre like 'A%n' or nombre like 'P%' order by nombre asc;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente
select nombre from clientes where nombre not like 'A%' order by nombre asc;

-- 10. Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en cuenta que se deberán eliminar los nombres repetidos.
select distinct nombre from vendedores where nombre like '%el' or nombre like '%o';

-- 11. Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos
select distinct c.id, c.nombre, c.apellido from clientes c inner join pedidos p on p.id_cliente=c.id order by nombre asc, apellido asc;

-- 12. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
select * from clientes c inner join pedidos p on p.id_cliente=c.id order by nombre asc, apellido asc;

-- 13. Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe mostrar los datos de los vendedores ordenados alfabéticamente.
select * from vendedores v inner join pedidos p on p.id_vendedor=v.id order by nombre asc, apellido asc;

-- 14. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los vendedores asociados a cada pedido.
select * from clientes c inner join pedidos p on p.id_cliente=c.id inner join vendedores v on v.id=p.id_vendedor order by c.nombre asc, c.apellido asc;

-- 15. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo monto esté entre $300 y $1000.
select c.* from clientes c inner join pedidos p on p.id_cliente=c.id where p.fecha>='2022-01-01' and p.cantidad between 300 and 1000;

-- 16. Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido realizado por María Santana
select v.nombre, v.apellido from vendedores v inner join pedidos p on p.id_vendedor=v.id inner join clientes c on c.id=p.id_cliente where c.nombre='Maria' and c.apellido='Santana';

-- 17. Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez.
select c.nombre from clientes c inner join pedidos p on p.id_cliente=c.id inner join vendedores v on v.id=p.id_vendedor where v.nombre='Daniel' and v.apellido='Saez';

-- 18. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
select * from clientes c left join pedidos p on p.id_cliente=c.id order by nombre asc, apellido asc;

-- 19. Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han realizado. Este listado también debe incluir los vendedores que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
select * from vendedores v left join pedidos p on p.id_vendedor=v.id order by v.nombre asc, v.apellido asc;

-- 20. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
select c.* from clientes c left join pedidos p on p.id_cliente=c.id where p.id_cliente is null;

-- 21. Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
select v.* from vendedores v left join pedidos p on p.id_vendedor=v.id where p.id_vendedor is null;

-- 22. Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.
select v.nombre, v.apellido, '' cliente_id, v.id id_vendedor from pedidos p right join vendedores v on p.id_vendedor=v.id where p.id_vendedor is null
union
select c.nombre, c.apellido, c.id id_cliente, '' from pedidos p right join clientes c on p.id_cliente=c.id where p.id_cliente is null
order by apellido asc, nombre asc;

-- 23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select count(*) from pedidos;

-- 24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedidos
select avg(cantidad) from pedidos;

-- 25.Calcula el número total de vendedores distintos que aparecen en la tabla pedidos
select count(distinct id_vendedor) from pedidos;

-- 26.Calcula el número total de clientes que aparecen en la tabla cliente.
select count(*) from clientes;

-- 27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido
select cantidad from pedidos order by cantidad desc limit 1;

-- 28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select cantidad from pedidos order by cantidad asc limit 1;

-- 29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select ciudad, max(categoria) from clientes group by ciudad;

-- 30. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes.
select c.id, c.nombre, c.apellido, p.fecha, max(p.cantidad) cantidad_maxima from pedidos p inner join clientes c on c.id = id_cliente group by fecha, c.id;

-- 31. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000.
select c.id, c.nombre, c.apellido, p.fecha, max(p.cantidad) cantidad_maxima from pedidos p inner join clientes c on c.id = id_cliente where p.cantidad > 2000 group by fecha, c.id;

-- 32. Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
select v.id, v.nombre, v.apellido, p.fecha, max(p.cantidad) cantidad_maxima from pedidos p inner join vendedores v on v.id = id_vendedor where fecha = '2021-08-17' group by fecha, v.id;

-- 33. Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de pedidos que ha realizado cada uno de los clientes.
select c.id, c.nombre, c.apellido, count(p.id) numero_pedidos from clientes c left join pedidos p on p.id_cliente=c.id group by c.id;

-- 34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de pedidos que ha realizado cada uno de clientes durante el año 2020.
select c.id, c.nombre, c.apellido, count(p.id) numero_pedidos from clientes c inner join pedidos p on p.id_cliente=c.id where p.fecha between '2020-01-01' and '2020-12-31' group by c.id;

-- 35. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select year(p.fecha) año, max(cantidad) from pedidos p group by year(p.fecha) order by p.cantidad desc;

-- 36. Devuelve el número total de pedidos que se han realizado cada año.
select year(p.fecha) año, count(p.id) pedidos_realizados from pedidos p group by year(p.fecha);

-- 37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN)
select p.id, p.fecha from pedidos p cross join clientes c on p.id_cliente=c.id where nombre='adela' and apellido='salas';

-- 38. Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáez. (Sin utilizar INNER JOIN)
select p.id from pedidos p cross join vendedores v on p.id_vendedor=v.id where nombre='Daniel' and apellido='Sáez';

-- 39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
select c.* from clientes c cross join pedidos p on p.id_cliente=c.id where p.fecha between '2020-01-01' and '2020-12-31' order by p.cantidad desc limit 1;

-- 40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
select p.fecha, p.cantidad from pedidos p inner join clientes c on c.id=p.id_cliente where c.nombre='Pepe' and c.apellido='Ruiz' order by p.cantidad asc limit 1;

-- 41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from clientes c left join pedidos p on c.id=p.id_cliente where coalesce(p.id_cliente, '') in ('');

-- 42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from vendedores v left join pedidos p on v.id=p.id_vendedor where coalesce(p.id_cliente, '') in ('');

-- 43. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM clientes c WHERE NOT EXISTS (SELECT id_cliente FROM pedidos p WHERE c.id = p.id_cliente);

-- 44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM vendedores v WHERE NOT EXISTS (SELECT id_vendedor FROM pedidos p WHERE v.id = p.id_vendedor);
