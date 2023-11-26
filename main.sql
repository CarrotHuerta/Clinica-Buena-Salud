CREATE DATABASE Clinica_Buena_Salud;

USE Clinica_Buena_Salud;

CREATE TABLE SUCURSAL (
    Nombre_Sucursal VARCHAR(255) PRIMARY KEY,
    Calle VARCHAR(255),
    Numero_propiedad INT,
    Comuna VARCHAR(255),
    Region VARCHAR(255)
);

CREATE TABLE PACIENTE (
    RUT_Paciente VARCHAR(12) PRIMARY KEY,
    Nombre_Sucursal VARCHAR(255),
    Nombre_paciente VARCHAR(50),
    Apellido_Paciente VARCHAR(50),
    Calle VARCHAR(255),
    Numero_Domicilio INT,
    Comuna VARCHAR(255),
    Region VARCHAR(255),
    Sexo CHAR(1),
    Edad INT,
    Fecha_Nacimiento DATE,
    FOREIGN KEY (Nombre_Sucursal) REFERENCES SUCURSAL(Nombre_Sucursal)
);

CREATE TABLE TELEFONO_PACIENTE (
    RUT_Paciente VARCHAR(12),
    Numero_Telefono INT,
    PRIMARY KEY (RUT_Paciente, Numero_Telefono),
    FOREIGN KEY (RUT_Paciente) REFERENCES PACIENTE(RUT_Paciente)
);

CREATE TABLE CORREO_PACIENTE (
    RUT_Paciente VARCHAR(12),
    Correo VARCHAR(255),
    PRIMARY KEY (RUT_Paciente, Correo),
    FOREIGN KEY (RUT_Paciente) REFERENCES PACIENTE(RUT_Paciente)
);

CREATE TABLE FICHA_MEDICA (
    Cod_Ficha_medica INT PRIMARY KEY,
    RUT_Paciente VARCHAR(12),
    Medicamentos_actuales TEXT,
    Alergias TEXT,
    Cirugias_anteriores TEXT,
    FOREIGN KEY (RUT_Paciente) REFERENCES PACIENTE(RUT_Paciente)
);

CREATE TABLE HISTORIAL_FINANCIERO (
    Cod_Historial INT PRIMARY KEY,
    RUT_Paciente VARCHAR(12),
    Numero_Transaccion INT,
    Monto_total_deuda INT,
    Estado_de_pagos VARCHAR(255),
    Fecha_vencimiento DATE,
    FOREIGN KEY (RUT_Paciente) REFERENCES PACIENTE(RUT_Paciente)
);

CREATE TABLE ENCUESTA_DE_SATISFACCION (
    Cod_De_encuesta INT PRIMARY KEY,
    RUT_Paciente VARCHAR(12),
    Fecha DATE,
    Calificacion_atencion INT,
    Comentarios TEXT,
    FOREIGN KEY (RUT_Paciente) REFERENCES PACIENTE(RUT_Paciente)
);

CREATE TABLE RECEPCIONISTA (
    RUT_Recepcionista VARCHAR(12) PRIMARY KEY,
    RUT_Paciente VARCHAR(12),
    Nombre_Sucursal VARCHAR(255),
    Nombre_Recepcionista VARCHAR(50),
    Apellido_Recepcionista VARCHAR(50),
    FOREIGN KEY (RUT_Paciente) REFERENCES PACIENTE(RUT_Paciente),
    FOREIGN KEY (Nombre_Sucursal) REFERENCES SUCURSAL(Nombre_Sucursal)
);

CREATE TABLE CORREO_RECEPCIONISTA (
    RUT_Recepcionista VARCHAR(12),
    Correo VARCHAR(255),
    PRIMARY KEY (RUT_Recepcionista, Correo),
    FOREIGN KEY (RUT_Recepcionista) REFERENCES RECEPCIONISTA(RUT_Recepcionista)
);

CREATE TABLE MEDICO (
    RUT_Medico VARCHAR(12) PRIMARY KEY,
    Nombre_Sucursal VARCHAR(255),
    Nombre_Medico VARCHAR(50),
    Apellido_Medico VARCHAR(50),
    Calle VARCHAR(255),
    Numero_Domicilio INT,
    Comuna VARCHAR(255),
    Region VARCHAR(255),
    FOREIGN KEY (Nombre_Sucursal) REFERENCES SUCURSAL(Nombre_Sucursal)
);

CREATE TABLE ESPECIALIDAD_MEDICO (
    RUT_Medico VARCHAR(12),
    Nombre_especialidad VARCHAR(255),
    PRIMARY KEY (RUT_Medico, Nombre_especialidad),
    FOREIGN KEY (RUT_Medico) REFERENCES MEDICO(RUT_Medico)
);

CREATE TABLE TELEFONO_MEDICO (
    RUT_Medico VARCHAR(12),
    Numero_Telefono INT,
    PRIMARY KEY (RUT_Medico, Numero_Telefono),
    FOREIGN KEY (RUT_Medico) REFERENCES MEDICO(RUT_Medico)
);

CREATE TABLE CORREO_MEDICO (
    RUT_Medico VARCHAR(12),
    Correo VARCHAR(255),
    PRIMARY KEY (RUT_Medico, Correo),
    FOREIGN KEY (RUT_Medico) REFERENCES MEDICO(RUT_Medico)
);

CREATE TABLE CONSULTA (
    Numero_Consulta INT PRIMARY KEY,
    RUT_Paciente VARCHAR(12),
    RUT_Medico VARCHAR(12),
    RUT_Recepcionista VARCHAR(12),
    Cod_Ficha_medica INT,
    Codigo_Insumo INT,
    Fecha_consulta DATE,
    Receta TEXT,
    Sintomas TEXT,
    Tratamiento TEXT,
    FOREIGN KEY (RUT_Paciente) REFERENCES PACIENTE(RUT_Paciente),
    FOREIGN KEY (RUT_Medico) REFERENCES MEDICO(RUT_Medico),
    FOREIGN KEY (RUT_Recepcionista) REFERENCES RECEPCIONISTA(RUT_Recepcionista),
    FOREIGN KEY (Cod_Ficha_medica) REFERENCES FICHA_MEDICA(Cod_Ficha_medica)
);

CREATE TABLE TELEFONO_SUCURSAL (
    Nombre_Sucursal VARCHAR(255),
    Numero_Telefono INT,
    PRIMARY KEY (Nombre_Sucursal, Numero_Telefono),
    FOREIGN KEY (Nombre_Sucursal) REFERENCES SUCURSAL(Nombre_Sucursal)
);


CREATE TABLE CORREO_SUCURSAL (
    Nombre_Sucursal VARCHAR(255),
    Correo VARCHAR(255),
    PRIMARY KEY (Nombre_Sucursal, Correo),
    FOREIGN KEY (Nombre_Sucursal) REFERENCES SUCURSAL(Nombre_Sucursal)
);


CREATE TABLE TRANSACCIONES (
    Numero_Transaccion INT PRIMARY KEY,
    RUT_Paciente VARCHAR(12),
    Cod_Historial INT,
    Nombre_Sucursal VARCHAR(255),
    Monto INT,
    Forma_de_pago VARCHAR(255),
    Fecha_y_hora TIMESTAMP,
    FOREIGN KEY (RUT_Paciente) REFERENCES PACIENTE(RUT_Paciente),
    FOREIGN KEY (Cod_Historial) REFERENCES HISTORIAL_FINANCIERO(Cod_Historial),
    FOREIGN KEY (Nombre_Sucursal) REFERENCES SUCURSAL(Nombre_Sucursal)
);

CREATE TABLE PROVEEDOR (
    RUT_Proveedor VARCHAR(12) PRIMARY KEY,
    Nombre_Sucursal VARCHAR(255),
    Nombre_prov VARCHAR(50),
    Calle VARCHAR(255),
    Numero_Propiedad INT,
    Comuna VARCHAR(255),
    Region VARCHAR(255),
    Info_de_facturacion TEXT,
    FOREIGN KEY (Nombre_Sucursal) REFERENCES SUCURSAL(Nombre_Sucursal)
);

CREATE TABLE TELEFONO_PROVEEDOR (
    RUT_Proveedor VARCHAR(12),
    Numero_Telefono INT,
    PRIMARY KEY (RUT_Proveedor, Numero_Telefono),
    FOREIGN KEY (RUT_Proveedor) REFERENCES PROVEEDOR(RUT_Proveedor)
);
INSERT INTO TELEFONO_PROVEEDOR ( RUT_Proveedor, Numero_Telefono ) VALUES ("12862564-0", "976542345");
select * from TELEFONO_PROVEEDOR;

CREATE TABLE CORREO_PROVEEDOR (
    RUT_Proveedor VARCHAR(12),
    Correo VARCHAR(255),
    PRIMARY KEY (RUT_Proveedor, Correo),
    FOREIGN KEY (RUT_Proveedor) REFERENCES PROVEEDOR(RUT_Proveedor)
);

CREATE TABLE INSUMOS_MEDICOS (
    Codigo_Insumo INT PRIMARY KEY,
    RUT_Proveedor VARCHAR(12),
    Nombre_insumo VARCHAR(255),
    Valor_unitario INT,
    Fecha_de_caducidad DATE,
    Stock INT,
	FOREIGN KEY (RUT_Proveedor) REFERENCES PROVEEDOR(RUT_Proveedor)
);

INSERT INTO SUCURSAL ( Nombre_Sucursal, Calle, Numero_propiedad, Comuna, Region ) VALUES
("Clinica Buena Salud", "Antonio Varas", "555", "Providencia", "Metropolitana");
SELECT * FROM SUCURSAL;
INSERT INTO PACIENTE ( RUT_Paciente, Nombre_sucursal, Nombre_paciente, Apellido_Paciente, Calle, Numero_Domicilio, Comuna, Region, Sexo, Edad, Fecha_Nacimiento ) Values 
("12345678", "Clinica Buena Salud", "Fernando", "Pavez Llanten", "antonio varas", "235", "providencia", "metropolitana", "M", "19", "2004-05-25");
select * from PACIENTE;
INSERT INTO TELEFONO_PACIENTE (RUT_Paciente, Numero_Telefono ) VALUES ("12345678", "944806269");
select * from TELEFONO_PACIENTE;
INSERT INTO CORREO_PACIENTE (RUT_Paciente, Correo ) VALUES ("12345678", "f.pavezllantn@uandresbello.edu");
select * from CORREO_PACIENTE;
INSERT INTO FICHA_MEDICA (Cod_Ficha_medica, RUT_Paciente, Medicamentos_actuales, Alergias, Cirugias_anteriores ) VALUES ("1223","12345678", "Nastizol, diclofenaco, Movigil", "Pelos de gato, pasto", "transpalnte de hígado");
select * from FICHA_MEDICA;
INSERT INTO HISTORIAL_FINANCIERO ( Cod_Historial, RUT_Paciente, Numero_Transaccion, Monto_total_deuda, Estado_de_pagos, Fecha_vencimiento ) VALUES ("2202","12345678", "19910", "0", "Al dia", "2023-11-26");
select * from HISTORIAL_FINANCIERO;
INSERT INTO ENCUESTA_DE_SATISFACCION ( Cod_De_encuesta, RUT_Paciente, Fecha, Calificacion_atencion, Comentarios ) VALUES ("1111","12345678", "2023-11-25", "10", "Buena atencion, me encuentro satisfecho");
select * from ENCUESTA_DE_SATISFACCION;
INSERT INTO RECEPCIONISTA ( RUT_Recepcionista, RUT_Paciente, Nombre_Sucursal, Nombre_Recepcionista, Apellido_Recepcionista ) VALUES ("21565557-0","12345678", "Clinica Buena Salud", "Diego", "Miranda Caro");
select * from RECEPCIONISTA;
INSERT INTO CORREO_RECEPCIONISTA (RUT_Recepcionista, Correo ) VALUES ("21565557-0", "d.mirandacaro@uandresbello.edu");
select * from CORREO_RECEPCIONISTA;
INSERT INTO MEDICO ( RUT_Medico, Nombre_Sucursal, Nombre_Medico, Apellido_Medico, Calle, Numero_Domicilio, Comuna, Region ) VALUES ("10234356-k", "Clinica Buena Salud", "Rene", "Rojas Heinrich", "Alferez Real", 
"545", "Providencia", "Metropolitana");
select * from MEDICO;
INSERT INTO ESPECIALIDAD_MEDICO ( RUT_Medico,  Nombre_especialidad  ) VALUES ("10234356-k", "Pediatría");
select * from ESPECIALIDAD_MEDICO;
INSERT INTO TELEFONO_MEDICO ( RUT_Medico,  Numero_Telefono ) VALUES ("10234356-k", "943670987");
select * from TELEFONO_MEDICO;
INSERT INTO CORREO_MEDICO ( RUT_Medico, Correo ) VALUES ("10234356-k", "rojasheinrich@buenasalud.cl");
select * from CORREO_MEDICO;
INSERT INTO CONSULTA (Numero_Consulta, RUT_Paciente, RUT_Medico, RUT_Recepcionista, Cod_Ficha_medica, Codigo_Insumo, Fecha_consulta, Receta, Sintomas, Tratamiento ) VALUES ("1234", "12345678", "10234356-k", "21565557-0", "1223", "19020", "2023-11-24", "Se recepta Enalapril", "Dolores de cabeza, presion elevada", "una pastilla de 5mg cada 12 horas");
select * from CONSULTA;
INSERT INTO TELEFONO_SUCURSAL ( Nombre_Sucursal, Numero_Telefono ) VALUES ("Clinica Buena Salud", "982786545");
select * from TELEFONO_SUCURSAL;
INSERT INTO CORREO_SUCURSAL ( Nombre_Sucursal, Correo ) VALUES ("Clinica Buena Salud", "consultas.clinica@buenasalud.cl");
select * from CORREO_SUCURSAL;
INSERT INTO TRANSACCIONES ( Numero_Transaccion, RUT_Paciente, Cod_Historial, Nombre_Sucursal, Monto, Forma_de_pago, Fecha_y_hora ) VALUES ("19910","12345678", "2202", "Clinica Buena Salud", "200000", "Debito", "2023-11-26");
select * from TRANSACCIONES;
INSERT INTO PROVEEDOR ( RUT_Proveedor,  Nombre_Sucursal, Nombre_prov, Calle, Numero_Propiedad, Comuna, Region, Info_de_facturacion ) VALUES ("12862564-0","Clinica Buena Salud", "Francisco", "Avenida Francisco Bilbao", "154", "Providencia", "Metropolitana", "Compra de multiples medicamentos" );
select * from PROVEEDOR;
INSERT INTO CORREO_PROVEEDOR ( RUT_Proveedor, Correo ) VALUES ("12862564-0", "proveedor@buenasalud.cl");
select * from CORREO_PROVEEDOR;
INSERT INTO INSUMOS_MEDICOS ( Codigo_Insumo,  RUT_Proveedor, Nombre_insumo, Valor_unitario, Fecha_de_caducidad, Stock ) VALUES ("12345","12862564-0", "Enalapril", "20000", "2025-05-25", "100" );
select * from INSUMOS_MEDICOS;



USE Clinica_Buena_Salud;
SELECT TRANSACCIONES.*, PACIENTE.Nombre_paciente, SUCURSAL.Nombre_Sucursal
FROM TRANSACCIONES
JOIN PACIENTE ON TRANSACCIONES.RUT_Paciente = PACIENTE.RUT_Paciente
JOIN SUCURSAL ON TRANSACCIONES.Nombre_Sucursal = SUCURSAL.Nombre_Sucursal
WHERE TRANSACCIONES.Numero_Transaccion = 19910;

USE Clinica_Buena_Salud;
SELECT PACIENTE.*, HISTORIAL_FINANCIERO.*
FROM PACIENTE
JOIN HISTORIAL_FINANCIERO ON PACIENTE.RUT_Paciente = HISTORIAL_FINANCIERO.RUT_Paciente
WHERE PACIENTE.RUT_Paciente = '12345678';

USE Clinica_Buena_Salud;
SELECT MEDICO.*, GROUP_CONCAT(ESPECIALIDAD_MEDICO.Nombre_especialidad) AS Especialidades
FROM MEDICO
JOIN ESPECIALIDAD_MEDICO ON MEDICO.RUT_Medico = ESPECIALIDAD_MEDICO.RUT_Medico
WHERE MEDICO.RUT_Medico = '10234356-k'
GROUP BY MEDICO.RUT_Medico;

USE Clinica_Buena_Salud;
SELECT CONSULTA.*, PACIENTE.Nombre_paciente, MEDICO.Nombre_Medico, RECEPCIONISTA.Nombre_Recepcionista
FROM CONSULTA
JOIN PACIENTE ON CONSULTA.RUT_Paciente = PACIENTE.RUT_Paciente
JOIN MEDICO ON CONSULTA.RUT_Medico = MEDICO.RUT_Medico
JOIN RECEPCIONISTA ON CONSULTA.RUT_Recepcionista = RECEPCIONISTA.RUT_Recepcionista
WHERE CONSULTA.Numero_Consulta = 1234;

USE Clinica_Buena_Salud;
SELECT INSUMOS_MEDICOS.*, PROVEEDOR.Nombre_prov
FROM INSUMOS_MEDICOS
JOIN PROVEEDOR ON INSUMOS_MEDICOS.RUT_Proveedor = PROVEEDOR.RUT_Proveedor
WHERE INSUMOS_MEDICOS.Codigo_Insumo = 12345;



