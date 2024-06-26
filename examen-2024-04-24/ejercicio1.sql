SET SERVEROUTPUT ON;

DECLARE
    V_OFICIO_ID   OFICIO.OFICIO_ID%TYPE;
    V_OFICIO      OFICIO.OFICIO%TYPE;
    V_EMPLEADO_ID EMPLEADO.EMPLEADO_ID%TYPE;
    CURSOR C_OFICIO IS
    SELECT
        OFICIO_ID,
        OFICIO
    FROM
        OFICIO
    ORDER BY
        OFICIO;
BEGIN
    OPEN C_OFICIO;
    LOOP
        FETCH C_OFICIO INTO V_OFICIO_ID, V_OFICIO;
        EXIT WHEN C_OFICIO%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('OFICIO: ' || V_OFICIO);

        FOR EMPLEADO_ID IN (
            SELECT
                EMPLEADO
            FROM
                OFICIOEMPLEADO
            WHERE
                OFICIO = V_OFICIO_ID
            ORDER BY
                EMPLEADO DESC
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('   EMPLEADO_ID: '
                                 || V_EMPLEADO_ID);
        END LOOP;
    END LOOP;

    CLOSE C_OFICIO;
END;