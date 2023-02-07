CREATE SCHEMA ecommerce;

USE ecommerce;

CREATE TABLE IF NOT EXISTS clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
dni VARCHAR(10) NOT NULL UNIQUE,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
telefono VARCHAR(20) NOT NULL UNIQUE,
direccion VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS proovedores (
id_proovedor INT AUTO_INCREMENT PRIMARY KEY,
nombre_proovedor VARCHAR(50) NOT NULL,
telefono VARCHAR (20) NOT NULL UNIQUE,
website VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS vendedores (
id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
dni VARCHAR(10) NOT NULL UNIQUE,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
telefono VARCHAR (20) NOT NULL UNIQUE,
departamento VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS productos (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
precio FLOAT NOT NULL,
precio_venta FLOAT NOT NULL,
id_proovedor INT, 
FOREIGN KEY (id_proovedor) REFERENCES proovedores (id_proovedor) 
);

CREATE TABLE IF NOT EXISTS ventas (
id_ventas INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
dni VARCHAR(10),
nombre_cliente VARCHAR(20) NOT NULL,
id_producto INT,
cantidad FLOAT NOT NULL,
precio_venta FLOAT,
total FLOAT NOT NULL,
id_vendedor INT, 
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
FOREIGN KEY (dni) REFERENCES clientes (dni),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto))
;

INSERT INTO clientes (dni, nombre, apellido,telefono, direccion)
VALUES (71327638,'Viola','Gash',2994561236,'Indepencia 238'),
(35652365,'Pauli','Twiddell',2986523265,'General Roca 100'),
(33236589,'Marina','Andrew',2984523655,'Leloir 456'),
(40568945,'Javier','Alonso',2995682362,'Av Argentina 1200'),
(50323236,'Alejandra','Munoz',2992365874,'Mitre 232')
;

INSERT INTO proovedores (nombre_proovedor, telefono,website, direccion)
VALUES ('Tu cocina S.A','2995648722','tucocina.com.ar','Linares 800'),
('Suministros Glue S.A','2992030405','suministrosglue.com.ar','Caviahue 222'),
('La Mesita kids','2985622722','lamesitakids.com.ar','Rio Negro 720'),
('Distribuidora Alejandria','2983225689','alejandriadist.com.ar','Calle Buenos Aires 962'),
('Confluencia Mezclas','2984528796','mezclasconfluencia.com.ar','Diagonal España 321')
;

INSERT INTO vendedores (dni, nombre, apellido,telefono,departamento)
VALUES (25933535,'Claudio','Nazoa','2995426359','Textiles'),
(95991956,'Carlos','Mendoza','2995422259','Ferreteria'),
(91966523,'Wilfredo','Rauseo','2994520591','Zapateria'),
(32659879,'Bejamin','Suarez','2991234567','Papeleria'),
(29632652,'Merlina','Sanchez','2985126359','Jardineria'),
(336954123,'Luis','Alvarez','2995487236','Computacion')
;

INSERT INTO productos (nombre_producto,categoria,descripcion,precio,precio_venta,id_proovedor)
VALUES ('Monitor Dell 32"','Monitores','Monitor Dell 32", HD, para escritorio',100,120,1),
('Maceta mediana','Jardineria','Maceta mediana plástico color rojo',10,12,2),
('Zapatilla Nike modelo 236-2','Zapatería','Zapatilla nike Talle 36, coolor negro',100,120,3),
('Tijera escolar"','Libreria','Tijera escolar punta roma color azul',10,12,4),
('Lampara Led e27 14W','Ferreteria','Lampara led 14w e27',5,6,5)
;

INSERT INTO ventas (id_cliente,dni,nombre_cliente,id_producto,cantidad,precio_venta,total,id_vendedor)
VALUES ()
;
