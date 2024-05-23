SET SERVEROUTPUT ON;

DECLARE
    CURSOR c IS
        SELECT * FROM empleado;
    v_empleado empleado%ROWTYPE;
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO v_empleado;
        EXIT WHEN c%NOTFOUND;
        dbms_output.put_line('id='||v_empleado.numemp||' nombre='||v_empleado.nombre);
    END LOOP;
    CLOSE c;
END;
/