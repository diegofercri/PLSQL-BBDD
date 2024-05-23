DECLARE
    -- CREAMOS LAS VARIABLES
    v_alojamiento Alojamiento.alojamiento%TYPE;
    v_num_emp NUMBER;
    
    -- ESTAS VARIABLES SERAN LAS QUE TENDRAN EL MAXIMO NUMERO DE EMPLEADOS ALOJADOS CON EL NOMBRE DE SU RESPECTIVO ALOJAMIENTO
    v_max_emp NUMBER := 0;
    v_alojamiento_max Alojamiento.alojamiento%TYPE; 
  
    -- CURSOR  QUE BUSCAR EL NOMBRE Y CUENTA CUANTOS EMPLEADOS HAY Y LO ORDENA DE MAYOR A MENOR (DESC)
    CURSOR c_alojamiento IS
        SELECT a.alojamiento, COUNT(e.numemp) AS num_emp
        FROM Alojamiento a, Empleado e
        WHERE a.numaloj = e.alojamiento
        GROUP BY a.alojamiento
        ORDER BY num_emp DESC;
BEGIN
    -- ABRIMOS EL CURSOR
    OPEN c_alojamiento;
        -- BUCLE PARA IR SACANDO UNA A UNA CADA FILA
        LOOP
            -- ASIGNAMOS A LAS VARIABLES LOS VALORES OBTENIDOS DEL CURSOR, TANTO COMO EL NOMBRE DEL ALOJAMIENTO Y EL NUMERO DE EMPLEADOS QUE HAY
            FETCH c_alojamiento INTO v_alojamiento, v_num_emp;
        
        -- SI NO HAY REGGISTROS SE SALE DEL BUCLE
        EXIT WHEN c_alojamiento%NOTFOUND;
        
            -- MOSTRAMOS EL RESULTADO POR PANTALLA
            DBMS_OUTPUT.PUT_LINE('Alojamiento: ' || v_alojamiento || ' Empleados alojados: ' || v_num_emp);
                
            -- VAMOS GUARDANDO LOS VALORES EN EL CASO DE QUE SEA MAYOR EL NUMERO DE EMPLEADOS QUE SE ALOJAN EN x PARA LUEGO SACAR EL ALOJAMIENTO CON MAS EMPLEADOS
            IF v_num_emp > v_max_emp THEN
                v_max_emp := v_num_emp;
                v_alojamiento_max := v_alojamiento;
            END IF;
        END LOOP;
      
        -- MOSTRAMOS EL ALOJAMIENTO CON MAS EMPLEADOS
        DBMS_OUTPUT.PUT_LINE('El alojamiento con mas empleados es: ' || v_alojamiento_max || ' Empleados alojados: ' || v_max_emp );
    
    -- CERRAMOS EL CURSOR
    CLOSE c_alojamiento;
END;
/