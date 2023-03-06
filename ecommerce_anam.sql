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
(50323236,'Alejandra','Munoz',2992365874,'Mitre 232'),
(20325245,'Marcelo','Perez',2995255874,'Av Olascoaga 1050'),
(96013956,'Mariana','Alvarez',2996357485,'Ministro Gonzalez 256'),
(91233527,'Jonathan','Zambrano',2983265487,'Ruta 22 100'),
(32654852,'Rosalba','Gonzalez',2994562485,'Pehuen 38'),
(35632569,'Karen','Ramos',2995554826,'Ilia 633'),
(40526874,'Ivanna','Altuve',2996520364,'Godoy Cruz 929'),
(41562365,'Micaela','Rosas',2994587410,'Fotheringham 265')
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
VALUES ('Monitor Dell 32"','Tecnologia','Monitor Dell 32", HD, para escritorio', 100, 120, 1),
('Teclado gamer','Tecnologia','Teclado gamer RGB, mecánico, retroiluminado', 40, 50, 1),
('Mouse gamer','Tecnologia','Mouse inalambrico, 8000 dpi, color negro RGB', 25, 35, 1),
('Impresora hp inkject 415','Tecnologia','Inpresora inalambrica, scanner, color negro de inyeccion de tinta continua',68,85,1),
('Maceta mediana','Jardineria','Maceta mediana plástico color rojo', 10, 12, 2),
('Semillas de Lechuga','Jardineria','Semillas organicas de lechuga, 5 g', 1, 1.5, 2),
('Semillas de Albahaca','Jardineria','Semillas organicas de albahaca, 5 g', 1, 1.5, 2),
('Semillas de Melon','Jardineria','Semillas organicas de melon, 5 g', 1, 1.5, 2),
('Semillas de Rabano','Jardineria','Semillas organicas de rabano, 5 g', 1, 1.5, 2),
('Zapatilla Nike modelo 236-2','Zapatería','Zapatilla nike Talle 36, color negro', 100, 120, 3),
('Zapatilla Nike modelo 236-2','Zapatería','Zapatilla nike Talle 37, color negro', 100, 120, 3),
('Zapatilla Nike modelo 236-2','Zapatería','Zapatilla nike Talle 38, color negro', 100, 120, 3),
('Zapatilla Nike modelo 236-2','Zapatería','Zapatilla nike Talle 39, color negro', 100, 120, 3),
('Zapatilla Adidad modelo classic','Zapatería','Zapatilla adidas Talle 36, color blanco', 112, 140, 3),
('Zapatilla Adidad modelo classic','Zapatería','Zapatilla adidas Talle 37, color blanco', 112, 140, 3),
('Zapatilla Adidad modelo classic','Zapatería','Zapatilla adidas Talle 38, color blanco', 112, 140, 3),
('Zapatilla Adidad modelo classic','Zapatería','Zapatilla adidas Talle 39, color blanco', 112, 140, 3),
('Tijera escolar','Libreria','Tijera escolar punta roma color azul', 10, 12, 4),
('Block de papel 210 g','Libreria','Blosk de hojas blancas para dibuejar, 210 g', 8, 10, 4),
('Pinturas acrilicas 12 colores','Libreria','Kit de pinturas acrilicas 12 colores', 16, 20, 4),
('Juego de escuadras','Libreria','Juego de escuadras geometrico, 4 piezas', 3, 4, 4),
('Caja de Lapices HB marca Mongol','Libreria','Caja de 12 lapices HB', 10, 12, 4),
('Caja de creyones prismacolor','Libreria','Caja de 24 lapices de colores', 16, 20, 4),
('Lampara Led e27 14W','Ferreteria','Lampara led 14w e27',5,6,5),
('Pintura alba para exteriores, blanco','Ferreteria','pintura alba, exteriores, color blanco, 1 gal',20,24,5),
('Pintura alba para exteriores, celeste','Ferreteria','pintura alba, exteriores, color celeste, 1 gal',20,24,5),
('Pintura alba para exteriores, marfil','Ferreteria','pintura alba, exteriores, color marfil',20,24,5),
('Pintura alba para exteriores, turquesa','Ferreteria','pintura alba, exteriores, color turquesa',20,24,5),
('Pintura alba para exteriores, lila','Ferreteria','pintura alba, exteriores, color lila',20,24,5)
;

INSERT INTO ventas (id_cliente,dni,nombre_cliente,id_producto,cantidad,precio_venta,total,id_vendedor)
VALUES (1,71327638,'Viola',10,1,120,120,1),
(2,35652365,'Pauli',19,1,10,10,1),
(3,33236589,'Marina',4,1,85,85,6),
(4,40568945,'Javier',3,1,35,35,6),
(5,50323236,'Alejandra',11,1,120,120,3)
;

/*CREACION DE TABLAS VISTAS*/

CREATE VIEW productos_proovedor AS
SELECT p.nombre_producto, pv.nombre_proovedor, pv.telefono
FROM productos AS p
JOIN proovedores AS pv ON p.id_proovedor = pv.id_proovedor
;
SELECT * FROM productos_proovedor
;

CREATE VIEW clientes_ventas AS 
SELECT c.id_cliente, c.nombre, c.apellido, v.id_producto, v.cantidad, v.precio_venta, v.total 
FROM clientes AS c 
INNER JOIN ventas AS v ON c.id_cliente = v.id_cliente
;
SELECT * FROM clientes_ventas
;

CREATE VIEW ventas_vendedores AS
SELECT v.id_ventas, ve.nombre AS nombre_vendedor, ve.departamento, v.total
FROM ventas AS v
JOIN vendedores AS ve ON v.id_vendedor = ve.id_vendedor
;
SELECT * FROM ventas_vendedores
;

CREATE VIEW ventas_clientes_vendedores AS
SELECT v.id_ventas, c.nombre AS nombre_cliente, v.dni, v.id_producto, v.cantidad, v.precio_venta, v.total, ve.nombre AS nombre_vendedor
FROM ventas AS v
LEFT JOIN clientes AS c ON v.id_cliente = c.id_cliente
LEFT JOIN vendedores AS ve ON v.id_vendedor = ve.id_vendedor
;
SELECT * FROM ventas_clientes_vendedores
;

CREATE VIEW ventas_producto_info AS
SELECT v.id_ventas, p.nombre_producto, p.categoria, p.descripcion, p.precio, pv.nombre_proovedor, v.cantidad, v.precio_venta, v.total
FROM ventas AS v
LEFT JOIN productos AS p ON v.id_producto = p.id_producto
LEFT JOIN proovedores AS pv ON p.id_proovedor = pv.id_proovedor
;
SELECT * FROM ventas_producto_info
;

/*FUNCIONES*/

DELIMITER //
CREATE FUNCTION total_ventas_cliente(cliente_id INT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_ventas FLOAT;
    SELECT SUM(total) INTO total_ventas
    FROM ventas
	WHERE id_cliente = cliente_id;
    RETURN total_ventas;
END;
//

select total_ventas_cliente (1);

DELIMITER //
CREATE FUNCTION obtener_proovedor_producto (id_producto_entrada INT) 
RETURNS VARCHAR (100)
DETERMINISTIC
BEGIN
    DECLARE proveedor_nombre VARCHAR(100);
    SELECT nombre_proovedor INTO proveedor_nombre 
    FROM proovedores 
    WHERE id_proovedor = (SELECT id_proovedor FROM productos WHERE id_producto = id_producto_entrada);
    RETURN proveedor_nombre;
END;
// 

select obtener_proovedor_producto (1);

/*SENTENCIAS SUBLENGUAJE TCL
TABLAS SELECCIONADAS: CLIENTES Y PRODUCTOS*/

START TRANSACTION; 
DELETE FROM products
WHERE id_product=1;

ROLLBACK;

COMMIT;

START TRANSACTION; 
DELETE FROM products
WHERE id_product=1;

ROLLBACK;

COMMIT;

START TRANSACTION; 
INSERT INTO clientes (dni, nombre, apellido, telefono, direccion)
VALUES (98563215, Ana, Mendez, 2995642356, Av El trabajador 542),
(32154896, Alberto, Marquez, 2994526235, Paseo de la Costa 2000),
(35865452, Orlando, Guillen, 2996357472, Tucuman 466),
(30569852, Maria, Addy, 2994728525, Santa Fe 261);
SAVEPOINT savepoint_1;

INSERT INTO clientes (dni, nombre, apellido, telefono, direccion)
VALUES (92563215, Victor, Abreu, 2995558896, Buenos Aires 563),
(42685326, Marco, Tarazona, 2995684215, San Luis 425),
(36852410, Susana, Rosas, 2992223366, La Rioja 1500),
(29565321, Jose, Roman, 2998503265, Cordoba 2025);
SAVEPOINT savepoint_2;

ROLLBACK;

COMMIT;
