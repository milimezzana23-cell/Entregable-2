----------------------------------DDL

#Crear base de datos
create schema retail_project


#crear tabla clientes
create table clientes (
id_cliente serial primary key,
mail varchar (50) unique not null,);
edad integer check (edad >= 10)
);

alter table clientes
add column nombre varchar (50) not null,
add column apellido varchar (50) not null,
add column telefono varchar (50) not null,
add column fecha_registro date not null;

#Crear tabla productos
create table productos (
id_producto serial primary key,
precio numeric (10,2) check (precio > 0),
stock integer check (stock >= 0) 
);

begin;
alter table productos
add column nombre varchar(50) not null,
add column categoria varchar(50) not null;
select * from productos;
commit;


#Crear tabla ventas
create table ventas (
id_venta serial primary key,
cliente_id int references clientes(id_cliente),
producto_id int references productos(id_producto),
fecha date not null, 
cantidad integer not null check (cantidad >0)
);

----------------------------------DML
#insertar registro en la tabla clientes
begin;
	insert into clientes (mail, nombre, apellido, telefono, fecha_registro, edad)
	values 
	('lucia.gomez@gmail.com', 'lucia', 'gomez', '1145123456', '2026-01-15', 28),
	('martin.rodriguez@hotmail.com', 'martin', 'rodriguez', '1156789012', '2026-02-20', 35),
	('sofia.martinez@yahoo.com', 'sofia', 'martinez', '1134567890', '2026-02-10', 22),
	('gonzalo.lopez@gmail.com', 'gonzalo', 'lopez', '1167890123', '2026-03-01', 41),
	('valentina.fernandez@gmail.com', 'valentina', 'fernandez', '1123456789', '2026-11-28', 19);

select * from clientes;

commit;


#insertar registro en la tabla productos
begin;
insert into productos (nombre, categoria, precio, stock)
values
('remera algodon basica', 'indumentaria', 15000.00, 50),
('pantalon jean classic', 'indumentaria', 45000.50, 25),
('zapatillas running', 'calzado', 8999.99, 15),
('mochila urbana', 'accesorios', 32000.00, 10),
('gorra deportiva', 'accesorios', 12500.00, 30);
select * from productos;
commit;

#insertar registro en la tabla ventas
begin;
insert into ventas (cliente_id, producto_id, fecha, cantidad)
values
(1, 3, '2026-02-01', 1),
(2, 1, '2026-02-15', 3),
(3, 2, '2026-02-20', 1),
(4, 5, '2026-03-01', 2),
(5, 4, '2026-03-03', 1);
select * from ventas;
commit;

#UPDATE que modifica una categoría de productos (utilizar el where)
begin;
update productos
set precio = 20000.00
where nombre = 'remera algodon basica';
select * from productos; 
commit;


#DELETE que elimine una venta (utilizar el where)
begin;
select * from ventas;
delete from ventas
where cliente_id = 3;
select * from ventas;
commit;
