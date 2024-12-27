ENTREGA DEL PROYECTO FINAL
Alumno: Rodrigo Agüero 
Comisión: 59430
Profesor: Anderson Michel Torres
Tutor:Hugo Gonzalez

Tematica del proyecto
Este proyecto representa una base de datos para un sistema de gestión de una empresa de venta de vehículos (concesionario de autos) llamada "Carvent". La base de datos está diseñada para manejar múltiples aspectos del negocio.

Modelo de Negocio
1. Gestión de Clientes y Ventas:
-Registro de información de clientes
-Control de ventas de vehículos
-Seguimiento de pagos y transacciones
2.Inventario y Vehículos:
-Control detallado del inventario de vehículos
-Información específica de cada vehículo (marca, modelo, año, precio)
-Seguimiento de opciones y características de los vehículos
3. Mantenimiento y Servicios:
-Registro del historial de mantenimiento
-Control de servicios realizados
-Gestión de repuestos
4.Gestión de Empleados:
-Registro del personal
-Asociación de empleados con ventas
5.Proveedores y Compras:
-Gestión de proveedores
-Control de compras de vehículos
-Manejo de inventario de repuestos
6.Interacción con Clientes:
-Sistema de comentarios y feedback
-Seguimiento de la satisfacción del cliente

Diagrama entidad relacion (DER)
![der](https://github.com/user-attachments/assets/74f4d2f5-22c1-4514-a789-fa6e1e2588f2)

Listado de tablas y descripcion
I'll help you organize this SQL schema into a clear table format that shows the structure of each table and its columns. I'll create an artifact that presents this information in a more readable way.





# CarVent Database Schema

## Clientes (Customers)
| Column | Type | Constraints |
|--------|------|-------------|
| cliente_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre | VARCHAR(100) | |
| apellido | VARCHAR(100) | |
| email | VARCHAR(100) | UNIQUE |
| telefono | VARCHAR(15) | |
| direccion | VARCHAR(255) | UNIQUE NOT NULL |

## Vehiculos (Vehicles)
| Column | Type | Constraints |
|--------|------|-------------|
| vehiculo_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| marca | VARCHAR(50) | |
| modelo | VARCHAR(50) | |
| año | YEAR | |
| precio | DECIMAL(10, 2) | |
| color | VARCHAR(30) | |
| kilometraje | INT | |

## Ventas (Sales)
| Column | Type | Constraints |
|--------|------|-------------|
| venta_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| cliente_id | INT | FOREIGN KEY REFERENCES Clientes(cliente_id) |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| fecha_venta | DATETIME | |
| precio_venta | DECIMAL(10, 2) | |

## Inventario (Inventory)
| Column | Type | Constraints |
|--------|------|-------------|
| inventario_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| cantidad | INT | |
| fecha_ingreso | DATETIME | |

## Empleados (Employees)
| Column | Type | Constraints |
|--------|------|-------------|
| empleado_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| venta_id | INT | FOREIGN KEY REFERENCES Ventas(venta_id) |
| nombre | VARCHAR(100) | |
| apellido | VARCHAR(100) | |
| puesto | VARCHAR(50) | |
| telefono | VARCHAR(15) | |

## Pagos (Payments)
| Column | Type | Constraints |
|--------|------|-------------|
| pago_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| venta_id | INT | FOREIGN KEY REFERENCES Ventas(venta_id) |
| monto | DECIMAL(10, 2) | |
| fecha_pago | DATETIME | |
| metodo_pago | VARCHAR(50) | |

## Comentarios (Comments)
| Column | Type | Constraints |
|--------|------|-------------|
| comentario_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| cliente_id | INT | FOREIGN KEY REFERENCES Clientes(cliente_id) |
| comentario | TEXT | |
| fecha_comentario | DATETIME | |

## Historial_Mantenimiento (Maintenance History)
| Column | Type | Constraints |
|--------|------|-------------|
| mantenimiento_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| fecha_mantenimiento | DATETIME | |
| descripcion | TEXT | |
| costo | DECIMAL(10, 2) | |

## Modelos (Models)
| Column | Type | Constraints |
|--------|------|-------------|
| modelo_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre_modelo | VARCHAR(50) | |
| descripcion | TEXT | |

## Opciones_Vehiculo (Vehicle Options)
| Column | Type | Constraints |
|--------|------|-------------|
| opcion_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre_opcion | VARCHAR(50) | |
| descripcion | TEXT | |

## Vehiculos_Opciones (Vehicle Options Junction)
| Column | Type | Constraints |
|--------|------|-------------|
| vehiculo_id | INT | PRIMARY KEY, FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| opcion_id | INT | PRIMARY KEY, FOREIGN KEY REFERENCES Opciones_Vehiculo(opcion_id) |

## Proveedores (Suppliers)
| Column | Type | Constraints |
|--------|------|-------------|
| proveedor_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre_proveedor | VARCHAR(100) | |
| contacto | VARCHAR(100) | |
| direccion | VARCHAR(255) | |

## Compras (Purchases)
| Column | Type | Constraints |
|--------|------|-------------|
| compra_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| proveedor_id | INT | FOREIGN KEY REFERENCES Proveedores(proveedor_id) |
| fecha_compra | DATE | |
| precio_compra | DECIMAL(10,2) | |

## Repuestos (Spare Parts)
| Column | Type | Constraints |
|--------|------|-------------|
| repuesto_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre_repuesto | VARCHAR(100) | |
| descripcion | TEXT | |
| proveedor_id | INT | FOREIGN KEY REFERENCES Proveedores(proveedor_id) |
| cantidad | INT | |
| precio_unitario | DECIMAL(10,2) | |

## Servicios (Services)
| Column | Type | Constraints |
|--------|------|-------------|
| servicio_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| fecha_servicio | DATETIME | |
| descripcion | TEXT | |
| costo | DECIMAL(10,2) | |

Estructura e ingesta de datos
Se realiza principalmente por medio del archivo population.sql

Objetos de la base de datos

