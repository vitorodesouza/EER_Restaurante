-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2023-11-20 18:55:19 CET
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE alcohólica (
    tipoalcohol        VARCHAR2(100 CHAR),
    bebida_producto_id NUMBER NOT NULL
);

ALTER TABLE alcohólica ADD CONSTRAINT alcohólica_pk PRIMARY KEY ( bebida_producto_id );

CREATE TABLE alergenos (
    alergeno           VARCHAR2(50 CHAR) NOT NULL,
    comida_producto_id NUMBER NOT NULL
);

ALTER TABLE alergenos ADD CONSTRAINT alergenos_pk PRIMARY KEY ( alergeno,
                                                                comida_producto_id );

CREATE TABLE bebida (
    volumen     FLOAT,
    fabricante  VARCHAR2(100 CHAR),
    producto_id NUMBER NOT NULL
);

ALTER TABLE bebida ADD CONSTRAINT bebida_pk PRIMARY KEY ( producto_id );

CREATE TABLE camarero (
    empleado_dni INTEGER NOT NULL
);

ALTER TABLE camarero ADD CONSTRAINT camarero_pk PRIMARY KEY ( empleado_dni );

CREATE TABLE cliente (
    id       NUMBER NOT NULL,
    nombre   VARCHAR2(50 CHAR),
    telefono INTEGER
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id );

CREATE TABLE clienteanonimo (
    usuario     VARCHAR2(50 CHAR) NOT NULL,
    sucursal_id NUMBER NOT NULL
);

ALTER TABLE clienteanonimo ADD CONSTRAINT clienteanonimo_pk PRIMARY KEY ( usuario,
                                                                          sucursal_id );

CREATE TABLE comida (
    producto_id NUMBER NOT NULL
);

ALTER TABLE comida ADD CONSTRAINT comida_pk PRIMARY KEY ( producto_id );

CREATE TABLE compuestopor (
    producto_id         NUMBER NOT NULL,
    pedido_numeropedido NUMBER NOT NULL
);

ALTER TABLE compuestopor ADD CONSTRAINT compuestopor_pk PRIMARY KEY ( producto_id,
                                                                      pedido_numeropedido );

CREATE TABLE director (
    fechanombramiento DATE,
    empleado_dni      INTEGER NOT NULL
);

ALTER TABLE director ADD CONSTRAINT director_pk PRIMARY KEY ( empleado_dni );

CREATE TABLE empleado (
    dni              INTEGER NOT NULL,
    nss              FLOAT,
    nombre           VARCHAR2(50 CHAR),
    fechanascimiento DATE,
    cargo            VARCHAR2(100 CHAR),
    calle            VARCHAR2(100 CHAR),
    ciudad           VARCHAR2(100 CHAR),
    cp               INTEGER,
    empleado_dni     INTEGER
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( dni );

ALTER TABLE empleado ADD CONSTRAINT empleado__un UNIQUE ( nss );

CREATE TABLE entrante (
    frioscalientes     VARCHAR2(50 CHAR),
    comida_producto_id NUMBER NOT NULL
);

ALTER TABLE entrante ADD CONSTRAINT entrante_pk PRIMARY KEY ( comida_producto_id );

CREATE TABLE gerente (
    fechanombramiento DATE,
    empleado_dni      INTEGER NOT NULL
);

ALTER TABLE gerente ADD CONSTRAINT gerente_pk PRIMARY KEY ( empleado_dni );

CREATE TABLE guarda (
    fecha               DATE,
    reserva_id          NUMBER NOT NULL,
    reserva_sucursal_id NUMBER NOT NULL,
    reserva_cliente_id  NUMBER NOT NULL,
    mesa_numero         NUMBER NOT NULL,
    mesa_sucursal_id    NUMBER NOT NULL
);

ALTER TABLE guarda
    ADD CONSTRAINT guarda_pk PRIMARY KEY ( reserva_id,
                                           reserva_sucursal_id,
                                           reserva_cliente_id,
                                           mesa_numero,
                                           mesa_sucursal_id );

CREATE TABLE ingrediente (
    id    NUMBER NOT NULL,
    costo FLOAT
);

ALTER TABLE ingrediente ADD CONSTRAINT ingrediente_pk PRIMARY KEY ( id );

CREATE TABLE mesa (
    numero      NUMBER NOT NULL,
    capacidad   INTEGER,
    sucursal_id NUMBER NOT NULL
);

ALTER TABLE mesa ADD CONSTRAINT mesa_pk PRIMARY KEY ( numero,
                                                      sucursal_id );

CREATE TABLE necesitade (
    cantidad       FLOAT,
    producto_id    NUMBER NOT NULL,
    ingrediente_id NUMBER NOT NULL
);

ALTER TABLE necesitade ADD CONSTRAINT necesitade_pk PRIMARY KEY ( producto_id,
                                                                  ingrediente_id );

CREATE TABLE noalcohólica (
    consingas          CHAR(1),
    bebida_producto_id NUMBER NOT NULL
);

ALTER TABLE noalcohólica ADD CONSTRAINT noalcohólica_pk PRIMARY KEY ( bebida_producto_id );

CREATE TABLE ofrece (
    sucursal_id NUMBER NOT NULL,
    producto_id NUMBER NOT NULL
);

ALTER TABLE ofrece ADD CONSTRAINT ofrece_pk PRIMARY KEY ( sucursal_id,
                                                          producto_id );

CREATE TABLE ordena (
    pedido_numeropedido NUMBER NOT NULL,
    mesa_numero         NUMBER NOT NULL,
    mesa_sucursal_id    NUMBER NOT NULL
);

CREATE TABLE pedido (
    numeropedido NUMBER NOT NULL,
    cuenta       FLOAT
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( numeropedido );

CREATE TABLE postre (
    frutadulce         VARCHAR2(50 CHAR),
    comida_producto_id NUMBER NOT NULL
);

ALTER TABLE postre ADD CONSTRAINT postre_pk PRIMARY KEY ( comida_producto_id );

CREATE TABLE principal (
    cubertería         VARCHAR2(50 CHAR),
    categoria          VARCHAR2(50 CHAR),
    comida_producto_id NUMBER NOT NULL
);

ALTER TABLE principal ADD CONSTRAINT principal_pk PRIMARY KEY ( comida_producto_id );

CREATE TABLE producto (
    id     NUMBER NOT NULL,
    precio FLOAT,
    costo  FLOAT,
    nombre VARCHAR2(50 CHAR)
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id );

CREATE TABLE proveedor (
    id              NUMBER NOT NULL,
    nif             NUMBER,
    fechaaprobación DATE,
    calle           VARCHAR2(100 CHAR),
    ciudad          VARCHAR2(100 CHAR),
    cp              INTEGER
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id );

ALTER TABLE proveedor ADD CONSTRAINT proveedor__un UNIQUE ( nif );

CREATE TABLE realiza (
    cliente_id          NUMBER NOT NULL,
    reserva_id          NUMBER NOT NULL,
    reserva_sucursal_id NUMBER NOT NULL,
    reserva_cliente_id  NUMBER NOT NULL,
    sucursal_id         NUMBER NOT NULL
);

CREATE TABLE reserva (
    id          NUMBER NOT NULL,
    nombre      VARCHAR2(50 CHAR),
    cantidad    FLOAT,
    sucursal_id NUMBER NOT NULL,
    cliente_id  NUMBER NOT NULL
);

ALTER TABLE reserva
    ADD CONSTRAINT reserva_pk PRIMARY KEY ( id,
                                            sucursal_id,
                                            cliente_id );

CREATE TABLE restaurante (
    id                    NUMBER NOT NULL,
    nombre                VARCHAR2(50 CHAR) NOT NULL,
    vision                VARCHAR2(100 CHAR) NOT NULL,
    estilo                VARCHAR2(100 CHAR) NOT NULL,
    director_empleado_dni INTEGER NOT NULL
);

ALTER TABLE restaurante ADD CONSTRAINT restaurante_pk PRIMARY KEY ( id );

ALTER TABLE restaurante ADD CONSTRAINT restaurante__un UNIQUE ( nombre );

CREATE TABLE resultadosfinanceiros (
    id          NUMBER NOT NULL,
    ingresos    FLOAT,
    costosop    FLOAT,
    ganancias   FLOAT,
    sucursal_id NUMBER NOT NULL
);

ALTER TABLE resultadosfinanceiros ADD CONSTRAINT resultadosfinanceiros_pk PRIMARY KEY ( id );

CREATE TABLE sucursal (
    id                   NUMBER NOT NULL,
    nif                  INTEGER,
    nombre               VARCHAR2(50 CHAR),
    fechainauguracion    DATE,
    calle                VARCHAR2(100 CHAR),
    ciudad               VARCHAR2(100 CHAR),
    cp                   INTEGER,
    restaurante_id       NUMBER NOT NULL,
    gerente_empleado_dni INTEGER NOT NULL
);

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( id );

ALTER TABLE sucursal ADD CONSTRAINT sucursal__un UNIQUE ( nif );

CREATE TABLE suministra (
    cantidad       FLOAT,
    ingrediente_id NUMBER NOT NULL,
    proveedor_id   NUMBER NOT NULL,
    sucursal_id    NUMBER NOT NULL
);

ALTER TABLE suministra
    ADD CONSTRAINT suministra_pk PRIMARY KEY ( ingrediente_id,
                                               proveedor_id,
                                               sucursal_id );

CREATE TABLE teléfonoempleado (
    teléfono     INTEGER NOT NULL,
    empleado_dni INTEGER NOT NULL
);

ALTER TABLE teléfonoempleado ADD CONSTRAINT teléfonoempleado_pk PRIMARY KEY ( teléfono,
                                                                              empleado_dni );

CREATE TABLE tomanotade (
    camarero_empleado_dni INTEGER NOT NULL,
    pedido_numeropedido   NUMBER NOT NULL
);

ALTER TABLE tomanotade ADD CONSTRAINT tomanotade_pk PRIMARY KEY ( camarero_empleado_dni,
                                                                  pedido_numeropedido );

CREATE TABLE trabajaen (
    sucursal_id  NUMBER NOT NULL,
    empleado_dni INTEGER NOT NULL
);

ALTER TABLE trabajaen ADD CONSTRAINT trabajaen_pk PRIMARY KEY ( sucursal_id,
                                                                empleado_dni );

CREATE TABLE valora (
    pontuación                 FLOAT,
    comentario                 VARCHAR2(100 CHAR),
    sucursal_id                NUMBER NOT NULL,
    clienteanonimo_usuario     VARCHAR2(50 CHAR) NOT NULL,
    clienteanonimo_sucursal_id NUMBER NOT NULL
);

ALTER TABLE valora ADD CONSTRAINT valora_pk PRIMARY KEY ( sucursal_id,
                                                          clienteanonimo_usuario );

ALTER TABLE alcohólica
    ADD CONSTRAINT alcohólica_bebida_fk FOREIGN KEY ( bebida_producto_id )
        REFERENCES bebida ( producto_id );

ALTER TABLE alergenos
    ADD CONSTRAINT alergenos_comida_fk FOREIGN KEY ( comida_producto_id )
        REFERENCES comida ( producto_id );

ALTER TABLE bebida
    ADD CONSTRAINT bebida_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE camarero
    ADD CONSTRAINT camarero_empleado_fk FOREIGN KEY ( empleado_dni )
        REFERENCES empleado ( dni );

ALTER TABLE clienteanonimo
    ADD CONSTRAINT clienteanonimo_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE comida
    ADD CONSTRAINT comida_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE compuestopor
    ADD CONSTRAINT compuestopor_pedido_fk FOREIGN KEY ( pedido_numeropedido )
        REFERENCES pedido ( numeropedido );

ALTER TABLE compuestopor
    ADD CONSTRAINT compuestopor_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE director
    ADD CONSTRAINT director_empleado_fk FOREIGN KEY ( empleado_dni )
        REFERENCES empleado ( dni );

ALTER TABLE empleado
    ADD CONSTRAINT dnisupervisor FOREIGN KEY ( empleado_dni )
        REFERENCES empleado ( dni );

ALTER TABLE entrante
    ADD CONSTRAINT entrante_comida_fk FOREIGN KEY ( comida_producto_id )
        REFERENCES comida ( producto_id );

ALTER TABLE gerente
    ADD CONSTRAINT gerente_empleado_fk FOREIGN KEY ( empleado_dni )
        REFERENCES empleado ( dni );

ALTER TABLE guarda
    ADD CONSTRAINT guarda_mesa_fk FOREIGN KEY ( mesa_numero,
                                                mesa_sucursal_id )
        REFERENCES mesa ( numero,
                          sucursal_id );

ALTER TABLE guarda
    ADD CONSTRAINT guarda_reserva_fk FOREIGN KEY ( reserva_id,
                                                   reserva_sucursal_id,
                                                   reserva_cliente_id )
        REFERENCES reserva ( id,
                             sucursal_id,
                             cliente_id );

ALTER TABLE mesa
    ADD CONSTRAINT mesa_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE necesitade
    ADD CONSTRAINT necesitade_ingrediente_fk FOREIGN KEY ( ingrediente_id )
        REFERENCES ingrediente ( id );

ALTER TABLE necesitade
    ADD CONSTRAINT necesitade_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE noalcohólica
    ADD CONSTRAINT noalcohólica_bebida_fk FOREIGN KEY ( bebida_producto_id )
        REFERENCES bebida ( producto_id );

ALTER TABLE ofrece
    ADD CONSTRAINT ofrece_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE ofrece
    ADD CONSTRAINT ofrece_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE ordena
    ADD CONSTRAINT ordena_mesa_fk FOREIGN KEY ( mesa_numero,
                                                mesa_sucursal_id )
        REFERENCES mesa ( numero,
                          sucursal_id );

ALTER TABLE ordena
    ADD CONSTRAINT ordena_pedido_fk FOREIGN KEY ( pedido_numeropedido )
        REFERENCES pedido ( numeropedido );

ALTER TABLE postre
    ADD CONSTRAINT postre_comida_fk FOREIGN KEY ( comida_producto_id )
        REFERENCES comida ( producto_id );

ALTER TABLE principal
    ADD CONSTRAINT principal_comida_fk FOREIGN KEY ( comida_producto_id )
        REFERENCES comida ( producto_id );

ALTER TABLE realiza
    ADD CONSTRAINT realiza_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE realiza
    ADD CONSTRAINT realiza_reserva_fk FOREIGN KEY ( reserva_id,
                                                    reserva_sucursal_id,
                                                    reserva_cliente_id )
        REFERENCES reserva ( id,
                             sucursal_id,
                             cliente_id );

ALTER TABLE realiza
    ADD CONSTRAINT realiza_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE reserva
    ADD CONSTRAINT reserva_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE reserva
    ADD CONSTRAINT reserva_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE restaurante
    ADD CONSTRAINT restaurante_director_fk FOREIGN KEY ( director_empleado_dni )
        REFERENCES director ( empleado_dni );

ALTER TABLE resultadosfinanceiros
    ADD CONSTRAINT resultfin_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_gerente_fk FOREIGN KEY ( gerente_empleado_dni )
        REFERENCES gerente ( empleado_dni );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_restaurante_fk FOREIGN KEY ( restaurante_id )
        REFERENCES restaurante ( id );

ALTER TABLE suministra
    ADD CONSTRAINT suministra_ingrediente_fk FOREIGN KEY ( ingrediente_id )
        REFERENCES ingrediente ( id );

ALTER TABLE suministra
    ADD CONSTRAINT suministra_proveedor_fk FOREIGN KEY ( proveedor_id )
        REFERENCES proveedor ( id );

ALTER TABLE suministra
    ADD CONSTRAINT suministra_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE teléfonoempleado
    ADD CONSTRAINT teléfonoempleado_empleado_fk FOREIGN KEY ( empleado_dni )
        REFERENCES empleado ( dni );

ALTER TABLE tomanotade
    ADD CONSTRAINT tomanotade_camarero_fk FOREIGN KEY ( camarero_empleado_dni )
        REFERENCES camarero ( empleado_dni );

ALTER TABLE tomanotade
    ADD CONSTRAINT tomanotade_pedido_fk FOREIGN KEY ( pedido_numeropedido )
        REFERENCES pedido ( numeropedido );

ALTER TABLE trabajaen
    ADD CONSTRAINT trabajaen_empleado_fk FOREIGN KEY ( empleado_dni )
        REFERENCES empleado ( dni );

ALTER TABLE trabajaen
    ADD CONSTRAINT trabajaen_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE valora
    ADD CONSTRAINT valora_clienteanonimo_fk FOREIGN KEY ( clienteanonimo_usuario,
                                                          clienteanonimo_sucursal_id )
        REFERENCES clienteanonimo ( usuario,
                                    sucursal_id );

ALTER TABLE valora
    ADD CONSTRAINT valora_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

CREATE SEQUENCE cliente_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cliente_id_trg BEFORE
    INSERT ON cliente
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := cliente_id_seq.nextval;
END;
/

CREATE SEQUENCE ingrediente_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ingrediente_id_trg BEFORE
    INSERT ON ingrediente
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := ingrediente_id_seq.nextval;
END;
/

CREATE SEQUENCE producto_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER producto_id_trg BEFORE
    INSERT ON producto
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := producto_id_seq.nextval;
END;
/

CREATE SEQUENCE proveedor_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER proveedor_id_trg BEFORE
    INSERT ON proveedor
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := proveedor_id_seq.nextval;
END;
/

CREATE SEQUENCE reserva_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reserva_id_trg BEFORE
    INSERT ON reserva
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := reserva_id_seq.nextval;
END;
/

CREATE SEQUENCE rest_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rest_id_trg BEFORE
    INSERT ON restaurante
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := rest_id_seq.nextval;
END;
/

CREATE SEQUENCE sucursal_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sucursal_id_trg BEFORE
    INSERT ON sucursal
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := sucursal_id_seq.nextval;
END;
/

CREATE SEQUENCE trabajaen_sucursal_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trabajaen_sucursal_id_trg BEFORE
    INSERT ON trabajaen
    FOR EACH ROW
    WHEN ( new.sucursal_id IS NULL )
BEGIN
    :new.sucursal_id := trabajaen_sucursal_id_seq.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            34
-- CREATE INDEX                             0
-- ALTER TABLE                             79
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           8
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          8
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
