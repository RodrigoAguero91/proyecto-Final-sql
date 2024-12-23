USE carvent;

CREATE VIEW Ventas_de_Vehículos AS

        SELECT 
            YEAR(fecha_venta) AS año,
            MONTH(fecha_venta) AS mes,
            COUNT(venta_id) AS total_ventas
        FROM carvent.Ventas
        GROUP BY año, mes
        ORDER BY año DESC, mes DESC;


CREATE VIEW Ventas_por_marca_o_modelo AS

        SELECT 
            V.marca, 
            V.modelo, 
            COUNT(VT.venta_id) AS total_ventas
        FROM carvent.Ventas VT
        INNER JOIN Vehiculos V ON VT.vehiculo_id = V.vehiculo_id
        GROUP BY V.marca, V.modelo
        ORDER BY total_ventas DESC;


CREATE VIEW Cantidad_de_vehículos_en_inventario AS
        SELECT 
            SUM(cantidad) AS total_vehiculos_inventario
        FROM carvent.Inventario;


CREATE VIEW Vehículos_más_vendidos AS

        SELECT 
            V.marca, 
            V.modelo, 
            COUNT(VT.venta_id) AS total_ventas
        FROM carvent.Ventas VT
        INNER JOIN Vehiculos V ON VT.vehiculo_id = V.vehiculo_id
        GROUP BY V.marca, V.modelo
        ORDER BY total_ventas DESC;

CREATE VIEW Número_de_clientes_nuevos AS
        SELECT 
            COUNT(DISTINCT cliente_id) AS clientes_nuevos
        FROM carvent.Ventas
        WHERE fecha_venta BETWEEN '2024-01-01' AND '2024-12-31';


CREATE VIEW Valor_promedio_por_cliente AS
        SELECT 
            AVG(precio_venta) AS valor_promedio_por_cliente
        FROM carvent.Ventas;


CREATE VIEW Ventas_por_empleado AS 

        SELECT 
            E.empleado_id,
            CONCAT(E.nombre, ' ', E.apellido) AS empleado,
            COUNT(V.venta_id) AS ventas_realizadas
        FROM carvent.Empleados E
        LEFT JOIN Ventas V ON E.venta_id = V.venta_id
        GROUP BY E.empleado_id;


CREATE VIEW Total_de_pagos_realizados AS

        SELECT 
            SUM(monto) AS total_pagos
        FROM carvent.Pagos
        WHERE fecha_pago BETWEEN '2024-01-01' AND '2024-12-31';


CREATE VIEW Número_de_comentarios_por_vehículo AS

        SELECT 
            V.marca, 
            V.modelo, 
            COUNT(C.comentario_id) AS total_comentarios
        FROM carvent.Comentarios C
        INNER JOIN Vehiculos V ON C.vehiculo_id = V.vehiculo_id
        GROUP BY V.marca, V.modelo;


CREATE VIEW Costo_de_mantenimiento_por_vehículo AS

        SELECT 
            V.marca, 
            V.modelo, 
            SUM(HM.costo) AS costo_total_mantenimiento
        FROM carvent.Historial_Mantenimiento HM
        INNER JOIN Vehiculos V ON HM.vehiculo_id = V.vehiculo_id
        GROUP BY V.marca, V.modelo;
