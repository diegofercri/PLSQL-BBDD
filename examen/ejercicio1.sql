SET SERVEROUTPUT ON;

DECLARE
    V_EMPLEADOID EMPLEADO.EMPLEADO_ID%TYPE;
    V_OFICIO     OFICIO.OFICIO%TYPE;
    CURSOR C_OFICIOS IS
    SELECT
        OFICIO_ID
    FROM
        OFICIO, OFICIOEMPLEADO, EMPLEADO
    WHERE
        OFICIO_ID = OFICIOEMPLEADO.OFICIO
        AND OFICIOEMPLEADO.EMPLEADO = EMPLEADO.EMPLEADO_ID;
BEGIN
    OPEN C_OFICIOS;
    LOOP
        FETCH C_OFICIOS INTO V_EMPLEADOID;
        EXIT WHEN C_OFICIOS%NOTFOUND;
        SELECT
            EMPLEADO_ID INTO V_EMPLEADOID
        FROM
            EMPLEADO
        WHERE
            EMPLEADO_ID = V_EMPLEADOID;
        DBMS_OUTPUT.PUT_LINE('EMPLEADO: '
                             || V_EMPLEADOID
                             || ' OFICIO: '
                             || V_OFICIO);
    END LOOP;

    CLOSE C_OFICIOS;
END;