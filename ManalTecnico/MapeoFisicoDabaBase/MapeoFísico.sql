CREATE DATABASE MiMuebleria;

use MiMuebleria;


create table Piezas(
id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipo VARCHAR(70) NOT NULL,
costo DOUBLE NOT NULL,
usada BOOLEAN NOT NULL
);

create table Usuarios(
id INT(15) PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50),
password CHAR(50) NOT NULL,
area INT(3) NOT NULL
);

create table Clientes(
nit VARCHAR(15) PRIMARY KEY NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
direccion VARCHAR(90) NOT NULL
);

CREATE TABLE Muebles (
codigo INT(10) PRIMARY KEY auto_increment NOT NULL,
piezasUsadas VARCHAR(50) not null,
usuarioEnsamblador INT(15) NOT NULL,
fechaEnsamble DATE NOT NULL,
costo DOUBLE NOT NULL,
tipo VARCHAR(80) NOT NULL,
aLaVenta BOOLEAN NOT NULL,
vendido BOOLEAN NOT NULL,
CONSTRAINT FK_TO_USUARIO FOREIGN KEY (usuarioEnsamblador) 
REFERENCES Usuarios(id)
);

CREATE TABLE Devolucion(
codigoDevolucion INT(15) NOT NULL PRIMARY KEY NOT NULL,
codigoMueble INT(10)NOT NULL,
perdida DOUBLE NOT NULL,
nitCliente VARCHAR(15) NOT NULL,
fechaDevolucion DATE NOT NULL,
CONSTRAINT FK_TO_CLIENTE FOREIGN KEY (nitCliente)
REFERENCES Clientes(nit), foreign key (codigoMueble)
REFERENCES Muebles(codigo)
);

CREATE TABLE CompraVenta(
codigoVenta INT(15) PRIMARY KEY AUTO_INCREMENT NOT NULL,
codigoMueble INT(10) NOT NULL,
nitCliente VARCHAR(15) NOT NULL,
idUsuario INT(15) NOT NULL,
fechaVenta DATE NOT NULL,
CONSTRAINT FOREIGN KEY (nitCliente)
REFERENCES Clientes(nit), FOREIGN KEY (idUsuario)
REFERENCES Usuarios(id)
);
create table inventario(
id INT (10) Primary key auto_increment not null,
gasto double not null,
ganancia double null,
motivo varchar(50) not null,
capital double null,
fecha DATE not null
);
create table tiendaPiezas(
id int(10) primary key auto_increment not null,
nombre varchar(70) not null,
precio double not null
);

create table tiendaMuebles(
id int(10) primary key auto_increment not null,
nombre varchar(70) not null,
precio double not null,
precioCompra double not null
);


/*aqui empieza el mapeo f??sico de la creaci??n del nuevo usuario*/
CREATE USER 'eiler'@'localhost' IDENTIFIED BY 'eiler123';
GRANT SELECT ON mimuebleria.* TO 'eiler'@'localhost';
GRANT DELETE ON mimuebleria.* TO 'eiler'@'localhost';
GRANT UPDATE ON mimuebleria.* TO 'eiler'@'localhost';
GRANT INSERT ON mimuebleria.* TO 'eiler'@'localhost';
/* EL HOSTNAME TIENE QUE SER 127.0.0.1 */
/* EL PUERTO TIENE QUE SER: 3306*/

/*agregar el primer usuario, el por defecto para que inicie el programa*/
use mimuebleria;
insert into usuarios (nombre,password,area) values('admin','admin',3);








