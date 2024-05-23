DECLARE
    -- VARIABLE QUE ALMACENA TODOS LOS DATOS DE LA TABLA Oficio
    v_oficio Oficio%ROWTYPE;
   
   -- CREAMOS EL CURSOR QUE SELECCIONARA TODO DE LA TABLA Oficio Y LO ORDENARA POR numoficio
    CURSOR c_oficio IS
        SELECT * 
        FROM Oficio
        ORDER BY numoficio;
   
    -- VARIABLE QUE ALMACENA TODOS LOS DATOS DE LA TABLA OficioEmpleado
    v_oficioEmpleado OficioEmpleado%ROWTYPE;
   
    -- VARIABLE QUE ALMACENARA EL numoficio
    v_numoficio Oficio.numoficio%TYPE;
   
    -- CREAMOS EL CURSOR QUE COGERA COMO PARAMETRO EL numoficio Y SELECCIONARA TODO DE LA TABLA OficioEmpleado DONDE oficio SEA IGUAL AL PARAMETRO
    CURSOR c_oficioEmpleado (p_numoficio Oficio.numoficio%TYPE) IS
        SELECT *
        FROM OficioEmpleado
        WHERE Oficio = p_numoficio;
BEGIN
    -- ABRIMSO EL CURSOR DE Oficio
    OPEN c_oficio;
    
        -- BUCLE PARA IR SACANDO TODAS LAS FILAS DE Oficio, SACARA EL NOMBRE DEL OFICIO
        LOOP
            -- ASIGNAMOS A v_oficio EL RESULTADO DEL CURSOR
            FETCH c_oficio INTO v_oficio;
        
        -- SALE DEL BUCLE CUANDO NO ENCUENTRE DATOS
        EXIT WHEN c_oficio%NOTFOUND;
        
            -- SACAMOS POR PANTALLA EL NOMBRE DEL OFICIO
            DBMS_OUTPUT.PUT_LINE('Oficio: ' || v_oficio.oficio);
        
        -- ABRIMOS EL CURSOR DE OificoEmpleado CON EL PARAMETRO numemp DEL CURSOR ANTERIOR
        OPEN c_oficioEmpleado(v_oficio.numoficio);
            -- BUCLE PARA IR SACANDO TODAS LAS FILAS DE OficioEmpleado, SACARA EL numemp DE CADA EMPLEADO ASIGNADO AL OFICIO
            LOOP
                -- ASIGNAMOS A v_oficio EL RESULTADO DEL CURSOR
                FETCH c_oficioEmpleado INTO v_oficioEmpleado;
                
            -- SALE DEL BUCLE CUANDO NO ENCUENTRE DATOS
            EXIT WHEN c_oficioEmpleado%NOTFOUND;
            
                -- SACAMOS POR PANTALLA EL NUMEMP DE CADA EMPLEADO QUE TENGA ESE OFICIO
                DBMS_OUTPUT.PUT_LINE(' Empleado: ' || v_oficioEmpleado.empleado);
            END LOOP;
        
        -- CERRAMOS EL CURSOR OficioEmpleado
        CLOSE c_oficioEmpleado;
        END LOOP;
    -- CERRAMOS EL CURSOR OficioEmpleado
    CLOSE c_oficio;
END;
/