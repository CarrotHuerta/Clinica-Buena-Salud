# Base de Datos Clínica Buena Salud

Este repositorio contiene scripts SQL para la creación y población de una base de datos llamada "Clinica_Buena_Salud". La base de datos está diseñada para gestionar información relacionada con una clínica de salud, incluyendo registros de pacientes, consultas médicas, transacciones financieras, y más.

## Tablas

### SUCURSAL
- Representa información sobre las sucursales de la clínica.

### PACIENTE
- Almacena detalles de los pacientes y está vinculada a la sucursal de la clínica.

### TELEFONO_PACIENTE
- Gestiona números de teléfono asociados con los pacientes.

### CORREO_PACIENTE
- Almacena direcciones de correo electrónico asociadas con los pacientes.

### FICHA_MEDICA
- Contiene registros médicos de los pacientes.

### HISTORIAL_FINANCIERO
- Gestiona la historia financiera y transacciones de los pacientes.

### ENCUESTA_DE_SATISFACCION
- Almacena respuestas de encuestas de satisfacción de los pacientes.

### RECEPCIONISTA
- Representa a los recepcionistas y su asociación con pacientes y sucursales de la clínica.

### CORREO_RECEPCIONISTA
- Gestiona direcciones de correo electrónico asociadas con los recepcionistas.

### MEDICO
- Almacena información sobre profesionales médicos y su asociación con sucursales de la clínica.

### ESPECIALIDAD_MEDICO
- Gestiona las especialidades de los profesionales médicos.

### TELEFONO_MEDICO
- Gestiona números de teléfono asociados con profesionales médicos.

### CORREO_MEDICO
- Almacena direcciones de correo electrónico asociadas con profesionales médicos.

### CONSULTA
- Contiene información sobre consultas médicas, vinculando pacientes, médicos, recepcionistas y registros médicos.

### TELEFONO_SUCURSAL
- Gestiona números de teléfono asociados con las sucursales de la clínica.

### CORREO_SUCURSAL
- Almacena direcciones de correo electrónico asociadas con las sucursales de la clínica.

### TRANSACCIONES
- Gestiona transacciones financieras, vinculando pacientes, historial financiero y sucursales de la clínica.

### PROVEEDOR
- Almacena información sobre proveedores y su asociación con sucursales de la clínica.

### TELEFONO_PROVEEDOR
- Gestiona números de teléfono asociados con proveedores.

### CORREO_PROVEEDOR
- Almacena direcciones de correo electrónico asociadas con proveedores.

### INSUMOS_MEDICOS
- Gestiona suministros médicos, vinculando proveedores con artículos específicos.

## Datos de Ejemplo

El script SQL incluye inserción de datos de ejemplo en diversas tablas, proporcionando una visión de cómo se puede poblar la base de datos.

## Consultas de Ejemplo

Se proporciona un conjunto de consultas SQL de ejemplo para demostrar cómo recuperar información de la base de datos. Estas consultas incluyen detalles de transacciones, información de pacientes, especialidades médicas, detalles de consultas y más.
