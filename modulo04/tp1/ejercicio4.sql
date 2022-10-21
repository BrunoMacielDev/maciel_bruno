CREATE SCHEMA `ejercicio_1`;
USE ejercicio_1;

CREATE TABLE IF NOT EXISTS `ejercicio_1`.`ALUMNO` (
  `Cod_Matricula` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `FechaNacimiento` DATE NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Matricula`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_1`.`CURSO` (
  `Cod_Curso` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Curso`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_1`.`PROFESOR` (
  `Id_Profesor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Especialidad` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Profesor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_1`.`CURSO_has_ALUMNO` (
  `CURSO_Cod_Curso` INT NOT NULL,
  `ALUMNO_Cod_Matricula` INT NOT NULL,
  PRIMARY KEY (`CURSO_Cod_Curso`, `ALUMNO_Cod_Matricula`),
  INDEX `fk_CURSO_has_ALUMNO_ALUMNO1_idx` (`ALUMNO_Cod_Matricula` ASC) VISIBLE,
  INDEX `fk_CURSO_has_ALUMNO_CURSO1_idx` (`CURSO_Cod_Curso` ASC) VISIBLE,
  CONSTRAINT `fk_CURSO_has_ALUMNO_CURSO1`
    FOREIGN KEY (`CURSO_Cod_Curso`)
    REFERENCES `ejercicio_1`.`CURSO` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURSO_has_ALUMNO_ALUMNO1`
    FOREIGN KEY (`ALUMNO_Cod_Matricula`)
    REFERENCES `ejercicio_1`.`ALUMNO` (`Cod_Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_1`.`CURSO_has_PROFESOR` (
  `CURSO_Cod_Curso` INT NOT NULL,
  `PROFESOR_Id_Profesor` INT NOT NULL,
  PRIMARY KEY (`CURSO_Cod_Curso`, `PROFESOR_Id_Profesor`),
  INDEX `fk_CURSO_has_PROFESOR_PROFESOR1_idx` (`PROFESOR_Id_Profesor` ASC) VISIBLE,
  INDEX `fk_CURSO_has_PROFESOR_CURSO1_idx` (`CURSO_Cod_Curso` ASC) VISIBLE,
  CONSTRAINT `fk_CURSO_has_PROFESOR_CURSO1`
    FOREIGN KEY (`CURSO_Cod_Curso`)
    REFERENCES `ejercicio_1`.`CURSO` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURSO_has_PROFESOR_PROFESOR1`
    FOREIGN KEY (`PROFESOR_Id_Profesor`)
    REFERENCES `ejercicio_1`.`PROFESOR` (`Id_Profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into ejercicio_1.alumno(Nombre,DNI,FechaNacimiento,email)values('Bruno','43747371','2001-11-26','bruno@gmail.com');
insert into ejercicio_1.alumno(Nombre,DNI,FechaNacimiento,email)values('Jorge','42940782','2000-05-07','jorge@gmail.com');
insert into ejercicio_1.alumno(Nombre,DNI,FechaNacimiento,email)values('Franco','37892419','1993-04-22','franco@gmail.com');

select * from ejercicio_1.alumno;

insert into ejercicio_1.curso(Nombre)values('Matematicas');
insert into ejercicio_1.curso(Nombre)values('Ingles');
insert into ejercicio_1.curso(Nombre)values('Logica');

select * from ejercicio_1.curso;

insert into ejercicio_1.profesor(nombre,especialidad,email)values('Tomas','Calculo','tomas@gmail.com');
insert into ejercicio_1.profesor(nombre,especialidad,email)values('Jorge','Lenguaje','jorge@gmail.com');
insert into ejercicio_1.profesor(nombre,especialidad,email)values('Silvia','Matematicas','silvia@gmail.com');

select * from ejercicio_1.profesor;

insert into ejercicio_1.curso_has_alumno(curso_cod_curso,alumno_cod_matricula)values(1,1);
insert into ejercicio_1.curso_has_alumno(curso_cod_curso,alumno_cod_matricula)values(3,1);
insert into ejercicio_1.curso_has_alumno(curso_cod_curso,alumno_cod_matricula)values(2,2);

select * from ejercicio_1.curso_has_alumno;

insert into ejercicio_1.curso_has_profesor(curso_cod_curso,profesor_id_profesor)values(1,1);
insert into ejercicio_1.curso_has_profesor(curso_cod_curso,profesor_id_profesor)values(3,1);
insert into ejercicio_1.curso_has_profesor(curso_cod_curso,profesor_id_profesor)values(2,2);

select * from ejercicio_1.curso_has_profesor;

-- FIN EJERCICIO 1 | COMIENZO EJERCICIO 2

CREATE SCHEMA `ejercicio_2`;
USE ejercicio_2;

CREATE TABLE IF NOT EXISTS `ejercicio_2`.`PAIS` (
  `ID_Pais` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Pais` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Pais`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_2`.`PROVINCIA` (
  `ID_Provincia` INT NOT NULL AUTO_INCREMENT,
  `Nombre_provincia` VARCHAR(45) NULL,
  `PAIS_ID_Pais` INT NOT NULL,
  PRIMARY KEY (`ID_Provincia`),
  INDEX `fk_PROVINCIA_PAIS1_idx` (`PAIS_ID_Pais` ASC) VISIBLE,
  CONSTRAINT `fk_PROVINCIA_PAIS1`
    FOREIGN KEY (`PAIS_ID_Pais`)
    REFERENCES `ejercicio_2`.`PAIS` (`ID_Pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_2`.`LOCALIDAD` (
  `Codigo_localidad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `EMPLEADO_Id_Empleado` INT NOT NULL,
  `PROVINCIA_ID_Provincia` INT NOT NULL,
  PRIMARY KEY (`Codigo_localidad`),
  INDEX `fk_LOCALIDAD_EMPLEADO1_idx` (`EMPLEADO_Id_Empleado` ASC) VISIBLE,
  INDEX `fk_LOCALIDAD_PROVINCIA1_idx` (`PROVINCIA_ID_Provincia` ASC) VISIBLE,
  CONSTRAINT `fk_LOCALIDAD_EMPLEADO1`
    FOREIGN KEY (`EMPLEADO_Id_Empleado`)
    REFERENCES `ejercicio_2`.`EMPLEADO` (`Id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LOCALIDAD_PROVINCIA1`
    FOREIGN KEY (`PROVINCIA_ID_Provincia`)
    REFERENCES `ejercicio_2`.`PROVINCIA` (`ID_Provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_2`.`EMPLEADO` (
  `Id_Empleado` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Fecha_alta` DATE NULL,
  PRIMARY KEY (`Id_Empleado`))
ENGINE = InnoDB;

INSERT INTO ejercicio_2.empleado(DNI,nombre,Telefono,email,fecha_alta)values('43747371','Bruno','3756424943','bruno@gmail.com','2022-10-15');
INSERT INTO ejercicio_2.empleado(DNI,nombre,Telefono,email,fecha_alta)values('42940782','Jorge','3764424940','jorge@gmail.com','2022-10-13');
INSERT INTO ejercicio_2.empleado(DNI,nombre,Telefono,email,fecha_alta)values('37892419','Franco','3755234133','franco@gmail.com','2022-10-17');

insert into ejercicio_2.pais(nombre_pais)values('Argentina');
insert into ejercicio_2.pais(nombre_pais)values('Paraguay');
insert into ejercicio_2.pais(nombre_pais)values('Brasil');

insert into ejercicio_2.provincia(nombre_provincia,pais_id_pais)values('Misiones',1);
insert into ejercicio_2.provincia(nombre_provincia,pais_id_pais)values('Corrientes',1);
insert into ejercicio_2.provincia(nombre_provincia,pais_id_pais)values('Entre Rios',1);

insert into ejercicio_2.localidad(nombre,codigo_postal,empleado_id_empleado,provincia_id_provincia)values('Gobernador Virasoro','3342',1,2);
insert into ejercicio_2.localidad(nombre,codigo_postal,empleado_id_empleado,provincia_id_provincia)values('Posadas','3300',2,1);
insert into ejercicio_2.localidad(nombre,codigo_postal,empleado_id_empleado,provincia_id_provincia)values('Obera','3360',3,1);

-- FIN EJERCICIO 2 | COMIENZO EJERCICIO 3

CREATE SCHEMA `ejercicio_3`;
USE ejercicio_3;

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`CLIENTE` (
  `Id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Cliente`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`RESERVA` (
  `Id_Reserva` INT NOT NULL AUTO_INCREMENT,
  `CLIENTE_Id_Cliente` INT NOT NULL,
  `Fecha_inicio` VARCHAR(45) NULL,
  `Fecha_final` VARCHAR(45) NULL,
  `Precio_Total` VARCHAR(45) NULL,
  `Cant_coches` VARCHAR(45) NULL,
  `Lts_gasolina` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Reserva`, `CLIENTE_Id_Cliente`),
  INDEX `fk_RESERVA_CLIENTE1_idx` (`CLIENTE_Id_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVA_CLIENTE1`
    FOREIGN KEY (`CLIENTE_Id_Cliente`)
    REFERENCES `ejercicio_3`.`CLIENTE` (`Id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`COCHE` (
  `Id_coche` INT NOT NULL,
  `Matricula` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Precio_hora` VARCHAR(45) NULL,
  `RESERVA_Id_Reserva` INT NOT NULL,
  `RESERVA_CLIENTE_Id_Cliente` INT NOT NULL,
  PRIMARY KEY (`Id_coche`, `RESERVA_Id_Reserva`, `RESERVA_CLIENTE_Id_Cliente`),
  INDEX `fk_COCHE_RESERVA1_idx` (`RESERVA_Id_Reserva` ASC, `RESERVA_CLIENTE_Id_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_COCHE_RESERVA1`
    FOREIGN KEY (`RESERVA_Id_Reserva` , `RESERVA_CLIENTE_Id_Cliente`)
    REFERENCES `ejercicio_3`.`RESERVA` (`Id_Reserva` , `CLIENTE_Id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into ejercicio_3.cliente(dni,nombre,direccion,telefono)values('43747371','Bruno','Junin 2222','3756424943');
insert into ejercicio_3.cliente(dni,nombre,direccion,telefono)values('42940782','Jorge','Sarmiento 1148','3764424940');
insert into ejercicio_3.cliente(dni,nombre,direccion,telefono)values('37892419','Franco','Av. Uruguay 2002','3755234133');

insert into ejercicio_3.reserva(cliente_id_cliente,fecha_inicio,fecha_final,precio_total,cant_coches,lts_gasolina)values('1','2022-10-14','2022-10-16','240','2','13');
insert into ejercicio_3.reserva(cliente_id_cliente,fecha_inicio,fecha_final,precio_total,cant_coches,lts_gasolina)values('1','2022-10-21','2022-10-23','270','2','10');
insert into ejercicio_3.reserva(cliente_id_cliente,fecha_inicio,fecha_final,precio_total,cant_coches,lts_gasolina)values('2','2022-10-13','2022-10-15','200','1','11');

insert into ejercicio_3.coche(matricula,modelo,color,marca,precio_hora,reserva_id_reserva,reserva_cliente_id_cliente)values('AB123CD','SW4 SRX','Negro','Toyota','35','1','1');
insert into ejercicio_3.coche(matricula,modelo,color,marca,precio_hora,reserva_id_reserva,reserva_cliente_id_cliente)values('AC133HD','Corolla SEG','Plateado','Toyota','35','1','1');
insert into ejercicio_3.coche(matricula,modelo,color,marca,precio_hora,reserva_id_reserva,reserva_cliente_id_cliente)values('AC133HD','Corolla SEG','Plateado','Toyota','25','3','2');