DECLARE
 /* Comienzo de la sección declarativa */
    V_STUDENTID NUMBER(5) := 10000;
    V_FIRSTNAME VARCHAR2(20);
BEGIN
 /* Comienzo de la sección ejecutable */
 -- Obtener el nombre del estudiante con identificador 10000
    SELECT
        NAME INTO V_FIRSTNAME
    FROM
        STUDENTS S
    WHERE
        S.ID = V_STUDENTID;
 -- Comienzo de un bloque anidado que contiene solo una sección ejecutable
    BEGIN -- Es buena idea identar los bloques anidados
        INSERT INTO LOG_TABLE (
            INFO
        ) VALUES (
            'Hola desde un bloque anidado!'
        );
    END;
EXCEPTION
 /* Comienzo de la sección de manejo de excepciones */
    WHEN NO_DATA_FOUND THEN
 -- Comienzo de un bloque anidado, que el mismo contiene una sección ejecutable y manejo de excepciones
        BEGIN
 -- Tratamiento de la condición de error
        INSERT INTO LOG_TABLE (
            INFO
        ) VALUES (
            'El estudiante 10,000 no existe'
        );
        EXCEPTION
    WHEN OTHERS THEN
 -- Algo ha fallado en la inserción en la tabla log_table
        DBMS_OUTPUT.PUT_LINE('Error al insertar en log_table!');
END;
END;