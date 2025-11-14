/***** Ejemplo 1: Crear y añadir *****/

/* Creando una tabla de vehículos */
CREATE TABLE vehicles (
    ID INT,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Año INT,
    Precio DECIMAL(10, 2)
);

/* Insertando 3 vehículos a la tabla */
INSERT INTO vehicles (ID, Marca, Modelo, Año, Precio) 
VALUES (1, 'Toyota', 'Corolla', 2021, 25000.00);

INSERT INTO vehicles (ID, Marca, Modelo, Año, Precio) 
VALUES (2, 'Ford', 'Mustang', 2022, 45000.50);

INSERT INTO vehicles (ID, Marca, Modelo, Año, Precio) 
VALUES (3, 'Nissan', 'Versa', 2019, 29999.99);

/***** Ejemplo 2: Consultar y filtrar *****/

/* Mostrando los vehículos con un año igual o mayor a 2020 y un precio menor a 50,000 pesos. */
/* Estos se mostrarán de mayor a menor según su precio. */
SELECT Marca, Modelo, Precio
FROM vehicles
WHERE Año >= 2020 AND Precio < 50000.00
ORDER BY Precio DESC;

/***** Ejemplo 3: Actualizar y eliminar *****/

/* ¡El Mustang tiene un descuento del 15%! */
UPDATE vehicles
SET Precio = Precio - (Precio * 0.15)
WHERE ID = 2; /* También es posible "WHERE Marca = 'Ford' AND Modelo = 'Mustang' AND Año = 2022;", pero puede ocurrir que haya otro Mustang del mismo año a la venta. Por lo tanto, la mejor forma de identificar a cuál vehículo se le está aplicando la oferta es por su ID. */

/* El Corolla ha sido vendido. */
DELETE FROM vehicles
WHERE ID = 1;

/***** Ejemplo 4: Consulta más compleja *****/

/* Un cliente quiere un vehículo de Ford u Honda, o que el modelo empiece con la letra C. */
SELECT Marca, Modelo, Año
FROM vehicles
WHERE
    Marca IN ('Ford', 'Honda') /* Selecciona aquellos vehículos que tengan como valor 'Ford' u 'Honda' en la columna Marca. */
    OR Modelo LIKE 'C%'; /* Selecciona aquellos modelos que empiecen con la letra C. El signo de porcentaje indica que le puede seguir cualquier carácter. */