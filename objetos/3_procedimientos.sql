USE carvent;

DELIMITER //
CREATE PROCEDURE carvent.obtener_ventas_rango_fechas(IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
	
    SELECT v.venta_id, c.nombre AS cliente_nombre, c.apellido AS cliente_apellido, 
           ve.marca, ve.modelo, ve.año, ve.precio, v.fecha_venta, p.monto AS pago_monto, p.metodo_pago
    FROM carvent.Ventas v
    JOIN Clientes c ON v.cliente_id = c.cliente_id
    JOIN Vehiculos ve ON v.vehiculo_id = ve.vehiculo_id
    JOIN Pagos p ON v.venta_id = p.venta_id
    WHERE DATE(v.fecha_venta) BETWEEN fecha_inicio AND fecha_fin;
END;


DELIMITER ;


CALL obtener_ventas_rango_fechas('2024-01-01', '2024-11-28');
