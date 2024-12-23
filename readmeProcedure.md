Dentro del procedimiento, se realiza una consulta SELECT que obtiene los siguientes datos:
venta_id: El identificador de la venta.
cliente_nombre y cliente_apellido: El nombre y apellido del cliente.
marca, modelo, año, precio: Los detalles del vehículo vendido.
fecha_venta: La fecha en que ocurrió la venta.
pago_monto: El monto pagado por la venta.
metodo_pago: El método de pago utilizado.
JOIN: La consulta se realiza mediante JOIN entre las tablas Ventas, Clientes, Vehiculos, y Pagos para obtener toda la información necesaria sobre la venta, el cliente, el vehículo y el pago.
WHERE DATE(v.fecha_venta) = fecha:

Esta condición filtra las ventas realizadas en la fecha proporcionada como parámetro. DATE(v.fecha_venta) asegura que solo se compare la fecha (sin la parte de la hora) de la venta con el parámetro fecha.
