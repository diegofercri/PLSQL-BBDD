SET SERVEROUTPUT ON;
DECLARE
    v_Empleado EMPLEADO%ROWTYPE;

    FUNCTION getEmpleado ( v_numemp EMPLEADO.NUMEMP%TYPE) RETURN EMPLEADO%ROWTYPE IS
        v_Empleado EMPLEADO%ROWTYPE;
    BEGIN
        SELECT * INTO v_Empleado FROM EMPLEADO WHERE NUMEMP=v_numemp;
        RETURN v_Empleado;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END;

BEGIN
    v_Empleado := getEmpleado(6);
    DBMS_OUTPUT.PUT_LINE('id=' || v_Empleado.numemp || ' nombre=' || v_Empleado.nombre);
    v_Empleado := getEmpleado(34);
    DBMS_OUTPUT.PUT_LINE('id=' || v_Empleado.numemp || ' nombre=' || v_Empleado.nombre);
END;
/