DROP DATABASE IF EXISTS carvent;
CREATE DATABASE carvent;
USE carvent;


CREATE TABLE carvent.Clientes (
    cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(15),
    direccion VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE carvent.Vehiculos (
    vehiculo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    año YEAR,
    precio DECIMAL(10, 2),
    color VARCHAR(30),
    kilometraje INT
);

CREATE TABLE carvent.Ventas (
    venta_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    vehiculo_id INT,
    fecha_venta DATETIME,
    precio_venta DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(vehiculo_id)
);



CREATE TABLE carvent.Inventario (
    inventario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT,
    cantidad INT,
    fecha_ingreso DATETIME,
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(vehiculo_id)
);

CREATE TABLE carvent.Empleados (
    empleado_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   venta_id INT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    puesto VARCHAR(50),
    telefono VARCHAR(15),
     FOREIGN KEY (venta_id) REFERENCES Ventas(venta_id)
);

CREATE TABLE carvent.Pagos (
    pago_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    venta_id INT,
    monto DECIMAL(10, 2),
    fecha_pago DATETIME,
    metodo_pago VARCHAR(50),
    FOREIGN KEY (venta_id) REFERENCES Ventas(venta_id)
);

CREATE TABLE carvent.Comentarios (
    comentario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT,
    cliente_id INT,
    comentario TEXT,
    fecha_comentario DATETIME,
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(vehiculo_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

CREATE TABLE carvent.Historial_Mantenimiento (
    mantenimiento_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT,
    fecha_mantenimiento DATETIME,
    descripcion TEXT,
    costo DECIMAL(10, 2),
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(vehiculo_id)
);

CREATE TABLE carvent.Modelos (
    modelo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE carvent.Opciones_Vehiculo (
    opcion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_opcion VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE carvent.Vehiculos_Opciones (
    vehiculo_id INT,
    opcion_id INT,
    PRIMARY KEY (vehiculo_id, opcion_id),
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(vehiculo_id),
    FOREIGN KEY (opcion_id) REFERENCES Opciones_Vehiculo(opcion_id)
);

CREATE TABLE carvent.Proveedores (
    proveedor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100),
    contacto VARCHAR(100),
    direccion VARCHAR(255)
);

CREATE TABLE carvent.Compras (
    compra_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT,
    proveedor_id INT,
    fecha_compra DATE,
    precio_compra DECIMAL(10,2),
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(vehiculo_id),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

CREATE TABLE carvent.Repuestos (
    repuesto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_repuesto VARCHAR(100),
    descripcion TEXT,
    proveedor_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

CREATE TABLE carvent.Servicios (
    servicio_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT,
    fecha_servicio DATETIME,
    descripcion TEXT,
    costo DECIMAL(10,2),
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(vehiculo_id)
);