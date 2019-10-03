/*Crear base de datos*/
create database tumap;
use tumap;


/*Crear tabla rol*/
create table rol (id int not null primary key auto_increment , namerol varchar(20) not null );
insert into rol (namerol) values ('usuario');
insert into rol (namerol) values ('admin');

/*Crear usuarios*/
create table users (id int not null primary key auto_increment , nameuser varchar(20) not null,
password varchar(20) not null , email varchar(60) not null, id_rol int not null, foreign key (id_rol) references rol (id)
 );
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 2);

/*Código que deben correr en workbeanch 8*/
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345'

/*Crear tabla encuesta social*/
create table SEC_Encuesta_Social(
	id_Encuesta int not null auto_increment primary key, 
    Vinculo_Territorial varchar (10) not null
   );
   /*insertar datos en encuesta social*/
INSERT INTO SEC_Encuesta_Social (Vinculo_Territorial)
	VALUES ('vivo');
	INSERT INTO SEC_Encuesta_Social (Vinculo_Territorial)
	VALUES ('trabajo');
    INSERT INTO SEC_Encuesta_Social (Vinculo_Territorial)
	VALUES ('ambos');

/*Crear tabla necesidades basicas*/
create table SEC_Necesidades_Basicas(
	id_Necesidades int not null auto_increment primary key, 
    Nombre_Necesidad varchar (20) not null
    );
/*insertar datos en necesidades basicas*/
INSERT INTO SEC_Necesidades_Basicas (Nombre_Necesidad)
	VALUES ('alimentacion');
    INSERT INTO SEC_Necesidades_Basicas (Nombre_Necesidad)
	VALUES ('seguridad');
    INSERT INTO SEC_Necesidades_Basicas (Nombre_Necesidad)
	VALUES ('servicios publicos');
    INSERT INTO SEC_Necesidades_Basicas (Nombre_Necesidad)
	VALUES ('transporte');
    
    /*Crear tabla encuesta necesidades*/
create table SEC_Encuesta_Necesidades(
	id_EN int not null auto_increment primary key,
    Importancia int not null,
    id_Encuesta int not null, foreign key (id_Encuesta) references SEC_Encuesta_Social(id_Encuesta),
    id_Necesidades int not null, foreign key (id_Necesidades) references SEC_Necesidades_Basicas(id_Necesidades)
    );
    /*insertar datos en encuesta necesidades*/
		/*Encuesta 1*/
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (1, 1, 4);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (1, 2, 3);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (1, 3, 2);
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (1, 4, 1);
        /*Encuesta 2*/
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (2, 1, 1);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (2, 2, 2);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (2, 3, 3);
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (2, 4, 4);
        /*Encuesta 3*/
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (3, 1, 2);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (3, 2, 4);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (3, 3, 1);
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (3, 4, 3);
/*Crear tabla establecimiento comercial*/
create table SEC_Establecimiento_Comercial(
	id_CF int not null auto_increment primary key, 
    Nombre_Establecimiento varchar (50) not null,
    Productos_Servicios varchar (10) not null,
    Descripcion varchar (60) not null,
    N_Empleados int not null,
    Foto varchar (120) not null
    );    
    /*insertar datos en establecimiento comercial*/
    INSERT INTO SEC_Establecimiento_Comercial (Nombre_Establecimiento, Productos_Servicios, Descripcion , N_Empleados, Foto)
		VALUES ('doña segunda','producto','comida criolla','10','url'); 
	INSERT INTO SEC_Establecimiento_Comercial (Nombre_Establecimiento, Productos_Servicios, Descripcion , N_Empleados, Foto)
		VALUES ('gammer','servicios','video juegos','1','url'); 
	INSERT INTO SEC_Establecimiento_Comercial (Nombre_Establecimiento, Productos_Servicios, Descripcion , N_Empleados, Foto)
		VALUES ('norberta','ambos','salon de belleza','6','url'); 
    
    /*Crear tabla Comercio Informal*/
create table SEC_Comercio_Informal(
	id_CI int not null auto_increment primary key, 
    Productos_Servicios varchar (10) not null,
    Descripcion varchar (60) not null,
    Estatico_Movil varchar (10) not null,
    Periodicidad varchar (20) not null,
    Jornada varchar (20) not null,
    Foto varchar (120) not null
    );
     /*insertar datos en Comercio Informal*/  
    INSERT INTO SEC_Comercio_Informal (Productos_Servicios, Descripcion , Estatico_Movil, Periodicidad, Jornada, Foto)
		VALUES ('productos','videos','estatico','fin de semana','diurno','url'); 
	INSERT INTO SEC_Comercio_Informal (Productos_Servicios, Descripcion , Estatico_Movil, Periodicidad, Jornada, Foto)
		VALUES ('servicios','minutos','ambulante','entre semana','nocturno','url'); 
	INSERT INTO SEC_Comercio_Informal (Productos_Servicios, Descripcion , Estatico_Movil, Periodicidad, Jornada, Foto)
		VALUES ('ambos','dulceria y minutos','estatico','fin de semana','diurno y nocturno','url'); 
        