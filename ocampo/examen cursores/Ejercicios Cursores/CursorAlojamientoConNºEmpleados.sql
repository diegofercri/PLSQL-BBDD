DECLARE
    -- CREAMOS LAS VARIABLES
    v_alojamiento Alojamiento.alojamiento%TYPE;
    v_num_emp NUMBER;
    v_max_emp NUMBER := 0;
    v_alojamiento_max Alojamiento.alojamiento%TYPE;
  
    -- CREAMOS EL CURSOR PARA SACAR EL NOMBRE Y EL NUMERO DE EMPLEADOS QUE SE ALOJAN
    CURSOR c_alojamiento IS
        SELECT a.alojamiento, COUNT(e.numemp) AS num_emp
        FROM Alojamiento a
        JOIN Empleado e ON a.numaloj = e.alojamiento
        GROUP BY a.alojamiento;

BEGIN
    -- ABRIMOS EL CURSOR
    OPEN c_alojamiento;
        -- BUCLE PARA IR SACANDO LAS FILAS
        LOOP
            -- ASIGNAMOS EL VALOR DEL CURSOR A LAS VARIABLES
            FETCH c_alojamiento INTO v_alojamiento, v_num_emp;
        
        -- SALIR DEL BUCLE EN CASO DE NO TENER DATOS
        EXIT WHEN c_alojamiento%NOTFOUND;

            -- MOSTRAMOS POR PANTALLA EL RESULTADO DE CADA ALOJAMIENTO Y CUANTOS EMPLEADOS TIENEN
            DBMS_OUTPUT.PUT_LINE('En el alojamiento "' || v_alojamiento || '" se alojan ' || v_num_emp || ' empleados.');
    
            -- COMPROBAREMOS QUE ALOJAMIENTO TIENE MAS EMPELADOS ALOJADOS
            IF v_num_emp > v_max_emp THEN
                v_max_emp := v_num_emp;
                v_alojamiento_max := v_alojamiento;
            END IF;
        END LOOP;
  
        -- MOSTRAMOS POR PANTALLA EL NOMBRE DEL ALOJAMIENTO CON MAS EMPLEADOS
        DBMS_OUTPUT.PUT_LINE('El alojamiento con m�s empleados es "' || v_alojamiento_max || '" con ' || v_max_emp || ' empleados.');
    
    -- CERRAMOS EL CURSOR
    CLOSE c_alojamiento;
END;
/
