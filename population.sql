USE carvent;

-- Clientes
INSERT INTO Clientes (nombre, apellido, email, telefono, direccion) VALUES
('Juan', 'Pérez', 'juan@email.com', '555-0101', 'Calle 1 #123'),
('María', 'González', 'maria@email.com', '555-0102', 'Calle 2 #234'),
('Carlos', 'López', 'carlos@email.com', '555-0103', 'Calle 3 #345'),
('Ana', 'Martínez', 'ana@email.com', '555-0104', 'Calle 4 #456'),
('Pedro', 'Sánchez', 'pedro@email.com', '555-0105', 'Calle 5 #567');

-- Vehiculos
INSERT INTO Vehiculos (marca, modelo, año, precio, color, kilometraje) VALUES
('Toyota', 'Corolla', 2020, 25000.00, 'Rojo', 15000),
('Honda', 'Civic', 2019, 22000.00, 'Azul', 20000),
('Ford', 'Mustang', 2021, 45000.00, 'Negro', 5000),
('Chevrolet', 'Cruze', 2018, 18000.00, 'Blanco', 35000),
('Nissan', 'Sentra', 2020, 23000.00, 'Gris', 12000);

-- Ventas
INSERT INTO Ventas (cliente_id, vehiculo_id, fecha_venta, precio_venta) VALUES
(1, 1, '2024-01-15 10:00:00', 24500.00),
(2, 2, '2024-01-16 11:30:00', 21500.00),
(3, 3, '2024-01-17 14:15:00', 44000.00),
(4, 4, '2024-01-18 16:45:00', 17500.00),
(5, 5, '2024-01-19 09:30:00', 22500.00);

-- Inventario
INSERT INTO Inventario (vehiculo_id, cantidad, fecha_ingreso) VALUES
(1, 2, '2024-01-01 08:00:00'),
(2, 3, '2024-01-02 08:30:00'),
(3, 1, '2024-01-03 09:00:00'),
(4, 4, '2024-01-04 09:30:00'),
(5, 2, '2024-01-05 10:00:00');

-- Empleados
INSERT INTO Empleados (venta_id, nombre, apellido, puesto, telefono) VALUES
(1, 'Roberto', 'García', 'Vendedor', '555-0201'),
(2, 'Laura', 'Rodríguez', 'Vendedor', '555-0202'),
(3, 'Miguel', 'Torres', 'Gerente', '555-0203'),
(4, 'Carmen', 'Flores', 'Vendedor', '555-0204'),
(5, 'David', 'Ruiz', 'Vendedor', '555-0205');

-- Pagos
INSERT INTO Pagos (venta_id, monto, fecha_pago, metodo_pago) VALUES
(1, 24500.00, '2024-01-15 10:30:00', 'Tarjeta de crédito'),
(2, 21500.00, '2024-01-16 12:00:00', 'Efectivo'),
(3, 44000.00, '2024-01-17 14:45:00', 'Transferencia'),
(4, 17500.00, '2024-01-18 17:15:00', 'Tarjeta de débito'),
(5, 22500.00, '2024-01-19 10:00:00', 'Efectivo');

-- Comentarios
INSERT INTO Comentarios (vehiculo_id, cliente_id, comentario, fecha_comentario) VALUES
(1, 1, 'Excelente vehículo, muy satisfecho', '2024-01-20 11:00:00'),
(2, 2, 'Buena relación calidad-precio', '2024-01-21 12:00:00'),
(3, 3, 'Increíble rendimiento', '2024-01-22 13:00:00'),
(4, 4, 'Muy cómodo para la familia', '2024-01-23 14:00:00'),
(5, 5, 'Servicio de primera', '2024-01-24 15:00:00');

-- Historial_Mantenimiento
INSERT INTO Historial_Mantenimiento (vehiculo_id, fecha_mantenimiento, descripcion, costo) VALUES
(1, '2024-01-25 09:00:00', 'Cambio de aceite', 50.00),
(2, '2024-01-26 10:00:00', 'Rotación de neumáticos', 30.00),
(3, '2024-01-27 11:00:00', 'Revisión general', 100.00),
(4, '2024-01-28 12:00:00', 'Cambio de filtros', 45.00),
(5, '2024-01-29 13:00:00', 'Alineación y balanceo', 80.00);

-- Modelos
INSERT INTO Modelos (nombre_modelo, descripcion) VALUES
('Sedán', 'Vehículo de 4 puertas familiar'),
('SUV', 'Vehículo deportivo utilitario'),
('Coupé', 'Vehículo deportivo de 2 puertas'),
('Hatchback', 'Vehículo compacto con puerta trasera'),
('Pickup', 'Vehículo con área de carga descubierta');

-- Opciones_Vehiculo
INSERT INTO Opciones_Vehiculo (nombre_opcion, descripcion) VALUES
('GPS', 'Sistema de navegación satelital'),
('Sunroof', 'Techo solar eléctrico'),
('Leather', 'Asientos de cuero'),
('Camera', 'Cámara de reversa'),
('Bluetooth', 'Conectividad inalámbrica');

-- Vehiculos_Opciones
INSERT INTO Vehiculos_Opciones (vehiculo_id, opcion_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

-- Proveedores
INSERT INTO Proveedores (nombre_proveedor, contacto, direccion) VALUES
('AutoParts Inc', 'Juan Proveedor', 'Av. Industrial 123'),
('CarSupply SA', 'María Distribuidora', 'Calle Comercio 456'),
('Repuestos Express', 'Carlos Vendedor', 'Av. Principal 789'),
('Global Auto Parts', 'Ana Gerente', 'Blvd. Central 012'),
('Mayorista Autos', 'Pedro Director', 'Calle Mayor 345');

-- Compras
INSERT INTO Compras (vehiculo_id, proveedor_id, fecha_compra, precio_compra) VALUES
(1, 1, '2024-01-01', 20000.00),
(2, 2, '2024-01-02', 18000.00),
(3, 3, '2024-01-03', 40000.00),
(4, 4, '2024-01-04', 15000.00),
(5, 5, '2024-01-05', 19000.00);

-- Repuestos
INSERT INTO Repuestos (nombre_repuesto, descripcion, proveedor_id, cantidad, precio_unitario) VALUES
('Filtro de aceite', 'Filtro de alta calidad', 1, 50, 10.00),
('Pastillas de freno', 'Juego de pastillas', 2, 30, 45.00),
('Batería', 'Batería de 12V', 3, 20, 100.00),
('Amortiguadores', 'Par de amortiguadores', 4, 15, 150.00),
('Bujías', 'Set de bujías', 5, 100, 8.00);

-- Servicios
INSERT INTO Servicios (vehiculo_id, fecha_servicio, descripcion, costo) VALUES
(1, '2024-02-01 09:00:00', 'Mantenimiento preventivo', 200.00),
(2, '2024-02-02 10:00:00', 'Cambio de frenos', 300.00),
(3, '2024-02-03 11:00:00', 'Diagnóstico general', 150.00),
(4, '2024-02-04 12:00:00', 'Cambio de aceite', 80.00),
(5, '2024-02-05 13:00:00', 'Afinación mayor', 400.00);