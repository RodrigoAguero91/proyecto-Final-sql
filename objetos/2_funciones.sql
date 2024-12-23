USE carvent;


DELIMITER //
DROP FUNCTION IF EXISTS carvent.insertar_cliente //
CREATE FUNCTION carvent.insertar_cliente (
    p_nombre VARCHAR(100),
    p_apellido VARCHAR(100),
    p_email VARCHAR(100),
    p_telefono VARCHAR(15),
    p_direccion VARCHAR(255)
) RETURNS INT
BEGIN
    DECLARE nuevo_cliente_id INT;

    INSERT INTO carvent.Clientes (nombre, apellido, email, telefono, direccion)
    VALUES (p_nombre, p_apellido, p_email, p_telefono, p_direccion);

    SET nuevo_cliente_id = LAST_INSERT_ID();
    RETURN nuevo_cliente_id;
END ;

DELIMITER ;



DELIMITER //
DROP FUNCTION IF EXISTS carvent.insertar_vehiculo //
CREATE FUNCTION carvent.insertar_vehiculo (
    p_marca VARCHAR(50),
    p_modelo VARCHAR(50),
    p_año YEAR,
    p_precio DECIMAL(10, 2),
    p_color VARCHAR(30),
    p_kilometraje INT
) RETURNS INT
BEGIN
    DECLARE nuevo_vehiculo_id INT;

    INSERT INTO carvent.Vehiculos (marca, modelo, año, precio, color, kilometraje)
    VALUES (p_marca, p_modelo, p_año, p_precio, p_color, p_kilometraje);

    SET nuevo_vehiculo_id = LAST_INSERT_ID();
    RETURN nuevo_vehiculo_id;
END ;

DELIMITER ;


DELIMITER //
DROP FUNCTION IF EXISTS carvent.insertar_pago //
CREATE FUNCTION carvent.insertar_pago (
    p_venta_id INT,
    p_monto DECIMAL(10, 2),
    p_fecha_pago DATETIME,
    p_metodo_pago VARCHAR(50)
) RETURNS INT
BEGIN
    DECLARE nuevo_pago_id INT;

    INSERT INTO carvent.Pagos (venta_id, monto, fecha_pago, metodo_pago)
    VALUES (p_venta_id, p_monto, p_fecha_pago, p_metodo_pago);

    SET nuevo_pago_id = LAST_INSERT_ID();
    RETURN nuevo_pago_id;
END ;
DELIMITER ;


