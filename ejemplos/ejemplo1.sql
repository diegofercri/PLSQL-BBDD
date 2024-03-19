DECLARE
 /* Comienzo de la sección declarativa */
    V_STUDENTID NUMBER(5) := 10000;
    V_NAME      VARCHAR2(20);
BEGIN /* Comienzo de la sección ejecutable */
 -- Obtener el nombre del estudiante con identificador 10000
    SELECT
        NAME INTO V_NAME
    FROM
        STUDENTS
    WHERE
        STUDENTS.ID = V_STUDENTID;
EXCEPTION /* Comienzo de la sección de manejo de excepciones */
    WHEN NO_DATA_FOUND THEN
 -- Manejar la condición de error
        INSERT INTO LOG_TABLE (
            INFO
        ) VALUES (
            'Student 10,000 does not exist!'
        );
END;
/