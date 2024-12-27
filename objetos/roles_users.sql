USE carvent;

FLUSH PRIVILEGES;

USE carvent;

-- 1. Rol para lectura de vistas 
CREATE ROLE 'vista_reader';
GRANT SELECT ON carvent.* TO 'vista_reader';

-- 2. Rol para CRUD en tablas
CREATE ROLE 'tabla_admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON carvent.* TO 'tabla_admin';

-- 3. Rol para administración de usuarios
CREATE ROLE 'user_admin';
GRANT CREATE USER, DROP USER ON *.* TO 'user_admin';
GRANT GRANT OPTION ON *.* TO 'user_admin';



-- Ejemplo de cómo asignar roles a usuarios:
CREATE USER 'viewer'@'localhost' IDENTIFIED BY 'password1';
GRANT 'vista_reader' TO 'viewer'@'localhost';

CREATE USER 'editor'@'localhost' IDENTIFIED BY 'password2';
GRANT 'tabla_admin' TO 'editor'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password3';
GRANT 'user_admin' TO 'admin'@'localhost';

-- Activar los roles para los usuarios
SET DEFAULT ROLE ALL TO
    'viewer'@'localhost',
    'editor'@'localhost',
    'admin'@'localhost';

FLUSH PRIVILEGES;