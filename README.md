## Primer DER ontológico de CARVENT
![image](https://github.com/user-attachments/assets/ee4f9c47-83c4-40ef-8349-f68311d0c513)
## DER Workbench
![image](https://github.com/user-attachments/assets/6f04c873-8243-49e4-adc0-7d4d37f66bbc)


# Documentación de la Base de Datos "carvent"

## Descripción General
La base de datos "carvent" está diseñada para gestionar una concesionaria de vehículos. Su objetivo es facilitar el manejo de clientes, vehículos, ventas, inventario, empleados, pagos, comentarios y mantenimiento de vehículos.

## Estructura de la Base de Datos

### 1. Tabla: Clientes
- **cliente_id**: `INT` (Primary Key, Auto Increment)
- **nombre**: `VARCHAR(100)`
- **apellido**: `VARCHAR(100)`
- **email**: `VARCHAR(100)` (Unique)
- **telefono**: `VARCHAR(15)`
- **direccion**: `VARCHAR(255)` (Unique, Not Null)

**Relaciones:**
- Relacionada con la tabla **Ventas** a través de **cliente_id**.
- Relacionada con la tabla **Comentarios** a través de **cliente_id**.

---

### 2. Tabla: Vehículos
- **vehiculo_id**: `INT` (Primary Key, Auto Increment)
- **marca**: `VARCHAR(50)`
- **modelo**: `VARCHAR(50)`
- **año**: `YEAR`
- **precio**: `DECIMAL(10, 2)`
- **color**: `VARCHAR(30)`
- **kilometraje**: `INT`

**Relaciones:**
- Relacionada con la tabla **Ventas** a través de **vehiculo_id**.
- Relacionada con la tabla **Inventario** a través de **vehiculo_id**.
- Relacionada con la tabla **Comentarios** a través de **vehiculo_id**.
- Relacionada con la tabla **Historial_Mantenimiento** a través de **vehiculo_id**.

---

### 3. Tabla: Ventas
- **venta_id**: `INT` (Primary Key, Auto Increment)
- **cliente_id**: `INT`
- **vehiculo_id**: `INT`
- **fecha_venta**: `DATETIME`
- **precio_venta**: `DECIMAL(10, 2)`

**Relaciones:**
- Relacionada con la tabla **Clientes** a través de **cliente_id**.
- Relacionada con la tabla **Vehículos** a través de **vehiculo_id**.
- Relacionada con la tabla **Empleados** a través de **venta_id**.
- Relacionada con la tabla **Pagos** a través de **venta_id**.

---

### 4. Tabla: Inventario
- **inventario_id**: `INT` (Primary Key, Auto Increment)
- **vehiculo_id**: `INT`
- **cantidad**: `INT`
- **fecha_ingreso**: `DATETIME`

**Relaciones:**
- Relacionada con la tabla **Vehículos** a través de **vehiculo_id**.

---

### 5. Tabla: Empleados
- **empleado_id**: `INT` (Primary Key, Auto Increment)
- **venta_id**: `INT`
- **nombre**: `VARCHAR(100)`
- **apellido**: `VARCHAR(100)`
- **puesto**: `VARCHAR(50)`
- **telefono**: `VARCHAR(15)`

**Relaciones:**
- Relacionada con la tabla **Ventas** a través de **venta_id**.

---

### 6. Tabla: Pagos
- **pago_id**: `INT` (Primary Key, Auto Increment)
- **venta_id**: `INT`
- **monto**: `DECIMAL(10, 2)`
- **fecha_pago**: `DATETIME`
- **metodo_pago**: `VARCHAR(50)`

**Relaciones:**
- Relacionada con la tabla **Ventas** a través de **venta_id**.

---

### 7. Tabla: Comentarios
- **comentario_id**: `INT` (Primary Key, Auto Increment)
- **vehiculo_id**: `INT`
- **cliente_id**: `INT`
- **comentario**: `TEXT`
- **fecha_comentario**: `DATETIME`

**Relaciones:**
- Relacionada con la tabla **Vehículos** a través de **vehiculo_id**.
- Relacionada con la tabla **Clientes** a través de **cliente_id**.

---

### 8. Tabla: Historial_Mantenimiento
- **mantenimiento_id**: `INT` (Primary Key, Auto Increment)
- **vehiculo_id**: `INT`
- **fecha_mantenimiento**: `DATETIME`
- **descripcion**: `TEXT`
- **costo**: `DECIMAL(10, 2)`

**Relaciones:**
- Relacionada con la tabla **Vehículos** a través de **vehiculo_id**.

---

## Problemáticas que Resuelve
- **Gestión de Clientes**: Permite almacenar y gestionar información de los clientes de manera eficiente, incluyendo datos de contacto y dirección.
- **Control de Inventario**: Facilita el seguimiento del stock de vehículos disponibles, mejorando la planificación y evitando faltantes.
- **Registro de Ventas**: Documenta todas las ventas realizadas, proporcionando un historial claro para análisis futuros y auditorías.
- **Seguimiento de Pagos**: Ayuda a controlar los pagos realizados por los clientes, garantizando que se registren correctamente.
- **Comentarios y Opiniones**: Permite recoger feedback de los clientes sobre los vehículos, lo que puede ser útil para mejorar el servicio.
- **Mantenimiento de Vehículos**: Registra el historial de mantenimiento de cada vehículo, ayudando a mantenerlos en condiciones óptimas y mejora la satisfacción del cliente.
- **Gestión de Empleados**: Almacena información sobre los empleados y sus ventas, lo que facilita el seguimiento del rendimiento del equipo de ventas.

---

Esta base de datos integral mejora la eficiencia operativa de la concesionaria, facilitando la toma de decisiones informadas y el análisis de datos.
```

# proyecto-Final-sql
