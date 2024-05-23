SET SERVEROUTPUT ON;
DECLARE

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

    FOR v_alojamiento IN (SELECT * FROM Alojamiento ORDER BY alojamiento) LOOP
        
        dbms_output.put_line(v_alojamiento.alojamiento);

        FOR v_empleado IN c_Empleado(v_alojamiento.numaloj) LOOP
            dbms_output.put_line(chr(9)||v_Empleado.nombre);
        END LOOP;

    END LOOP;

    -- Aquí Hay un close implícito
    -- A priori parece mejor opción pero intenta resolver el ejercicio DetallePedidoAgrupado con FOR

END;
/