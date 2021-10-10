Use Northwind;
 
--Uso de INNER JOIN
SELECT 
p.ProductName producto,
c.CategoryName  categoria
FROM
Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID


--Crear una vista que muestre el nombre del producto, categoria y proveedor
--ordenados por nombre de categoria
CREATE VIEW ListadoProducto
AS
SELECT 
p.ProductName producto,
c.CategoryName  categoria,
s.CompanyName proveedores
FROM
Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID
INNER JOIN Suppliers s
ON s.SupplierID = p.CategoryID;

--Modificar la vista anterior de tal manera que muestre los productos que esten 
--incluidos en las ordenes muestren: nombre producto, nombre categoria y el ordenamiento. 

ALTER VIEW ListadoProducto
AS
SELECT 
p.ProductName producto,
c.CategoryName  categoria
FROM
Products p
RIGHT JOIN Categories c
ON p.CategoryID = c.CategoryID

--Agregamos las ordenes
ALTER VIEW ListadoProducto
AS
SELECT 
p.ProductName producto,
c.CategoryName  categoria,
o.OrderID ordenes
FROM
Products p
RIGHT JOIN Categories c
ON p.CategoryID = c.CategoryID
RIGHT JOIN [Order Details] o
ON p.CategoryID = o.OrderID;


SELECT * FROM ListadoProducto ORDER BY producto;

--Uso de FULL JOIN
ALTER VIEW ListadoProducto
AS
SELECT 
p.ProductName producto,
c.CategoryName  categoria,
o.OrderID ordenes
FROM
Products p
FULL JOIN Categories c
ON p.CategoryID = c.CategoryID
FULL JOIN [Order Details] o
ON p.CategoryID = o.OrderID;