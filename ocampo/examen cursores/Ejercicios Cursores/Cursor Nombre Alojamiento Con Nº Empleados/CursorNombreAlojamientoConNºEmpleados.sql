DECLARE 
    -- CREAMOS EL CURSOR QUE NOS DIRA EL NOMBRE DEL ALOJAMIENTO Y NOS DIRA CUANTOS EMPLEADOS HAY
    CURSOR c_empleados IS
        SELECT a.alojamiento, COUNT(e.numemp) AS Numero_Empleados
        FROM Empleado e
        JOIN Alojamiento a ON e.Alojamiento = a.numaloj
        GROUP BY a.alojamiento;
    
    -- CREAMOS LAS VARIABLES PARA ALMACENAR LOS DATOS    
    v_alojamiento Alojamiento.alojamiento%TYPE;
    v_numero_de_empleados NUMBER;
BEGIN
    -- ABRIMOS EL CURSOR
    OPEN c_empleados;
        -- BUCLE PARA IR SACANDO FILA A FILA LOS DATOS
        LOOP
            -- VAMOS SELECCIONADO LOS DATOS EN LAS VARIABLES
            FETCH c_empleados INTO v_alojamiento, v_numero_de_empleados;
            
            -- CUANDO EL CURSOR NO ENCUENTRE DATOS SALDRA DEL BUCLE
            EXIT WHEN c_empleados%NOTFOUND;
            
            -- SACAMOS LOS DATOS POR PANTALLA
            DBMS_OUTPUT.PUT_LINE('Alojamiento: ' || v_alojamiento || ', Empleados: ' || v_numero_de_empleados);
        END LOOP;
    -- CERRAMOS EL CURSOR
    CLOSE c_empleados;
END;
/