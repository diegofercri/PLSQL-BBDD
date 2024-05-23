SET SERVEROUTPUT ON;
DECLARE
    v_alojamiento Alojamiento%rowtype;

    v_empleado Empleado%rowtype;

    -- Variable de acoplamiento utilizada en la consulta
    -- Podría también haber usado v_alojamiento.numaloj pero sería excesivo el grado de acoplamiento
    v_numaloj Alojamiento.numaloj%type;

    -- !!CUIDADO AQUI!! Si no iniciamos la variable contador en 0 no lo sumara ya que no puede sumar nulos
    v_contador PLS_INTEGER := 0;

    CURSOR c_Alojamiento IS
        SELECT *
        FROM Alojamiento
        ORDER BY alojamiento;

    CURSOR c_Empleado (p_numaloj Alojamiento.numaloj%type) IS
        SELECT *
        FROM Empleado
        WHERE alojamiento=p_numaloj
        ORDER BY nombre;

BEGIN
    OPEN c_Alojamiento;
        LOOP
            FETCH c_Alojamiento INTO v_alojamiento;
            EXIT WHEN c_Alojamiento%NOTFOUND;
            dbms_output.put_line(v_alojamiento.alojamiento);
            OPEN c_Empleado(v_alojamiento.numaloj);
                LOOP
                    FETCH c_Empleado INTO v_Empleado;
                    EXIT WHEN c_Empleado%NOTFOUND;
                        v_contador := v_contador + 1;
                END LOOP;
                    dbms_output.put_line(chr(9)||v_contador);
            CLOSE c_Empleado;
        END LOOP;
    CLOSE c_Alojamiento;
END;
/