CREATE SCHEMA ecommerce;

USE ecommerce;

CREATE TABLE IF NOT EXISTS clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
dni VARCHAR(10) NOT NULL UNIQUE,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
telefono INT NOT NULL UNIQUE,
direccion VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS proovedores (
id_proovedor INT AUTO_INCREMENT PRIMARY KEY,
nombre_proovedor VARCHAR(50) NOT NULL,
telefono INT NOT NULL UNIQUE,
website VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS vendedores (
id_vendedores INT AUTO_INCREMENT PRIMARY KEY,
dni VARCHAR(10) NOT NULL UNIQUE,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
telefono INT NOT NULL UNIQUE,
departamento VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS productos (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL UNIQUE,
categoria VARCHAR(50) NOT NULL,
descricion VARCHAR(100) NOT NULL,
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