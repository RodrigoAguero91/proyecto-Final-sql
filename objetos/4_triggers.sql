USE carvent;

--  Actualizar inventario después de una venta
DELIMITER //
CREATE TRIGGER after_sale_update_inventory
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
    -- Reducir la cantidad en inventario cuando se realiza una venta
    UPDATE Inventario
    SET cantidad = cantidad - 1
    WHERE vehiculo_id = NEW.vehiculo_id
    AND cantidad > 0;
    
    -- Registrar la fecha de la transacción
    INSERT INTO Servicios (vehiculo_id, fecha_servicio, descripcion, costo)
    VALUES (NEW.vehiculo_id, NEW.fecha_venta, 'Revisión pre-entrega', 0);
END;//

--  Validar precio de venta antes de insertar
CREATE TRIGGER before_sale_validate_price
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
    DECLARE vehicle_price DECIMAL(10,2);
    
    -- Obtener el precio base del vehículo
    SELECT precio INTO vehicle_price
    FROM Vehiculos
    WHERE vehiculo_id = NEW.vehiculo_id;
    
    -- Validar que el precio de venta no sea menor al 70% del precio base
    IF NEW.precio_venta < (vehicle_price * 0.7) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio de venta no puede ser menor al 70% del precio base del vehículo';
    END IF;
END;//
DELIMITER ;
