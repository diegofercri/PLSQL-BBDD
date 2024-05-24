SET SERVEROUTPUT ON;

DECLARE
    v_Empleado EMPLEADO%rowtype;

    v_OficioEmpleado OFICIOEMPLEADO%rowtype;

    v_numemp EMPLEADO.NUMEMP%type;

    v_contador NUMBER := 0;

    v_porcentaje NUMBER (4, 2);

    CURSOR c_Empleado IS
        SELECT *
        FROM EMPLEADO
        ORDER BY EDAD DESC;

    CURSOR c_OficioEmpleado (p_numemp EMPLEADO.NUMEMP%type) IS
        SELECT *
        FROM OFICIOEMPLEADO
        WHERE OFICIO=p_numemp
        ORDER BY OFICIO DESC;

BEGIN
    OPEN c_Empleado;
        LOOP
            FETCH c_Empleado INTO v_Empleado;
            EXIT WHEN c_Empleado%NOTFOUND;
            dbms_output.put('EMPLEADO: ' || v_Empleado.NOMBRE);
            OPEN c_OficioEmpleado(v_Empleado.NUMEMP);
                LOOP
                    FETCH c_OficioEmpleado INTO v_OficioEmpleado;
                    EXIT WHEN c_OficioEmpleado%NOTFOUND;
                    dbms_output.put(chr(9) || v_OficioEmpleado.OFICIO);
                    v_contador := v_contador + 1;
                END LOOP;
                v_porcentaje := (v_contador * 100) / 6;
                dbms_output.put_line('');
                dbms_output.put_line(chr(9) || 'Porcentaje: ' || chr(9) || v_porcentaje || '%');
                v_contador := 0;
            CLOSE c_OficioEmpleado;
        END LOOP;
    CLOSE c_Empleado;
END;
/
