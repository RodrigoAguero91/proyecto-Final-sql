## Información del Proyecto
- **Alumno:** Rodrigo Agüero
- **Comisión:** 59430
- **Profesor:** Anderson Michel Torres
- **Tutor:** Hugo Gonzalez

## Descripción del Proyecto
Este proyecto implementa una base de datos para "Carvent", un sistema de gestión integral para concesionarios de automóviles. La base de datos está diseñada para manejar todos los aspectos operativos del negocio, desde la gestión de inventario hasta el seguimiento de clientes.

## Modelo de Negocio

### 1. Gestión de Clientes y Ventas
- Registro de información de clientes
- Control de ventas de vehículos
- Seguimiento de pagos y transacciones

### 2. Inventario y Vehículos
- Control detallado del inventario de vehículos
- Información específica de cada vehículo (marca, modelo, año, precio)
- Seguimiento de opciones y características de los vehículos

### 3. Mantenimiento y Servicios
- Registro del historial de mantenimiento
- Control de servicios realizados
- Gestión de repuestos

### 4. Gestión de Empleados
- Registro del personal
- Asociación de empleados con ventas

### 5. Proveedores y Compras
- Gestión de proveedores
- Control de compras de vehículos
- Manejo de inventario de repuestos

### 6. Interacción con Clientes
- Sistema de comentarios y feedback
- Seguimiento de la satisfacción del cliente

## Estructura de la Base de Datos

## Diagrama entidad relacion (DER)
![der](https://github.com/user-attachments/assets/74f4d2f5-22c1-4514-a789-fa6e1e2588f2)

## Clientes 
| Column | Type | Constraints |
|--------|------|-------------|
| cliente_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre | VARCHAR(100) | |
| apellido | VARCHAR(100) | |
| email | VARCHAR(100) | UNIQUE |
| telefono | VARCHAR(15) | |
| direccion | VARCHAR(255) | UNIQUE NOT NULL |

## Vehiculos 
| Column | Type | Constraints |
|--------|------|-------------|
| vehiculo_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| marca | VARCHAR(50) | |
| modelo | VARCHAR(50) | |
| año | YEAR | |
| precio | DECIMAL(10, 2) | |
| color | VARCHAR(30) | |
| kilometraje | INT | |

## Ventas
| Column | Type | Constraints |
|--------|------|-------------|
| venta_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| cliente_id | INT | FOREIGN KEY REFERENCES Clientes(cliente_id) |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| fecha_venta | DATETIME | |
| precio_venta | DECIMAL(10, 2) | |

## Inventario 
| Column | Type | Constraints |
|--------|------|-------------|
| inventario_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| cantidad | INT | |
| fecha_ingreso | DATETIME | |

## Empleados 
| Column | Type | Constraints |
|--------|------|-------------|
| empleado_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| venta_id | INT | FOREIGN KEY REFERENCES Ventas(venta_id) |
| nombre | VARCHAR(100) | |
| apellido | VARCHAR(100) | |
| puesto | VARCHAR(50) | |
| telefono | VARCHAR(15) | |

## Pagos
| Column | Type | Constraints |
|--------|------|-------------|
| pago_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| venta_id | INT | FOREIGN KEY REFERENCES Ventas(venta_id) |
| monto | DECIMAL(10, 2) | |
| fecha_pago | DATETIME | |
| metodo_pago | VARCHAR(50) | |

## Comentarios 
| Column | Type | Constraints |
|--------|------|-------------|
| comentario_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| cliente_id | INT | FOREIGN KEY REFERENCES Clientes(cliente_id) |
| comentario | TEXT | |
| fecha_comentario | DATETIME | |

## Historial_Mantenimiento
| Column | Type | Constraints |
|--------|------|-------------|
| mantenimiento_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| fecha_mantenimiento | DATETIME | |
| descripcion | TEXT | |
| costo | DECIMAL(10, 2) | |

## Modelos 
| Column | Type | Constraints |
|--------|------|-------------|
| modelo_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre_modelo | VARCHAR(50) | |
| descripcion | TEXT | |

## Opciones_Vehiculo 
| Column | Type | Constraints |
|--------|------|-------------|
| opcion_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre_opcion | VARCHAR(50) | |
| descripcion | TEXT | |

## Vehiculos_Opciones 
| Column | Type | Constraints |
|--------|------|-------------|
| vehiculo_id | INT | PRIMARY KEY, FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| opcion_id | INT | PRIMARY KEY, FOREIGN KEY REFERENCES Opciones_Vehiculo(opcion_id) |

## Proveedores
| Column | Type | Constraints |
|--------|------|-------------|
| proveedor_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre_proveedor | VARCHAR(100) | |
| contacto | VARCHAR(100) | |
| direccion | VARCHAR(255) | |

## Compras 
| Column | Type | Constraints |
|--------|------|-------------|
| compra_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| proveedor_id | INT | FOREIGN KEY REFERENCES Proveedores(proveedor_id) |
| fecha_compra | DATE | |
| precio_compra | DECIMAL(10,2) | |

## Repuestos 
| Column | Type | Constraints |
|--------|------|-------------|
| repuesto_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| nombre_repuesto | VARCHAR(100) | |
| descripcion | TEXT | |
| proveedor_id | INT | FOREIGN KEY REFERENCES Proveedores(proveedor_id) |
| cantidad | INT | |
| precio_unitario | DECIMAL(10,2) | |

## Servicios
| Column | Type | Constraints |
|--------|------|-------------|
| servicio_id | INT | NOT NULL AUTO_INCREMENT PRIMARY KEY |
| vehiculo_id | INT | FOREIGN KEY REFERENCES Vehiculos(vehiculo_id) |
| fecha_servicio | DATETIME | |
| descripcion | TEXT | |
| costo | DECIMAL(10,2) | |

## Estructura e ingesta de datos
Se realiza principalmente por medio del archivo population.sql

### Objetos de la base de datos
## Documentación de Funciones

## insertar_cliente
Descripción: Registra nuevos clientes en el sistema.
Parámetros: nombre, apellido, email, teléfono y dirección del cliente
Retorno: ID del cliente insertado
Uso: Gestión de la cartera de clientes

insertar_vehiculo: Descripción: Registra nuevos vehículos en el inventario.

Parámetros: marca, modelo, año, precio, color y kilometraje del vehículo
Retorno: ID del vehículo insertado
Uso: Control de inventario de vehículos
insertar_pago:
Descripción: Registra los pagos asociados a las ventas.
Parámetros: ID de venta, monto, fecha y método de pago
Retorno: ID del pago insertado
Uso: Gestión financiera y seguimiento de pagos
## Documentación de Triggers
1. after_sale_update_inventory:
Se ejecuta automáticamente después de que se inserta un nuevo registro en la tabla Ventas.
Actualiza el inventario: Reduce la cantidad disponible de un vehículo en una unidad cada vez que se registra una venta, asegurando que el inventario se mantenga actualizado en tiempo real.
Registra un servicio: Agrega un registro a la tabla Servicios para indicar que se realizó una revisión pre-entrega al vehículo vendido.
2. before_sale_validate_price:
 Se ejecuta antes de que se inserte un nuevo registro en la tabla Ventas.
Valida el precio de venta: Compara el precio de venta ingresado con el precio base del vehículo y verifica que no sea inferior al 70% de este último.
Impide inserciones inválidas: Si el precio de venta no cumple con la condición, se genera un error y se impide que el registro se inserte en la tabla Ventas.

## Roles y permisos
1. vista_reader:
Permisos: Este rol solo permite seleccionar datos (realizar consultas). Los usuarios con este rol podrán ver la información almacenada en las tablas y vistas, pero no podrán modificarlos.
2. tabla_admin:
Este rol otorga todos los permisos sobre las tablas: seleccionar, insertar, actualizar y eliminar datos.
3. user_admin:
 Este rol se encarga de la administración de usuarios y sus permisos. Permite crear nuevos usuarios, eliminarlos y otorgar permisos a otros usuarios.

## Como levantar el proyecto en CodeSpaces GitHub
env: Archivo con contraseñas y data secretas
Makefile: Abstracción de creacción del proyecto
docker-compose.yml: Permite generar las bases de datos en forma de contenedores

