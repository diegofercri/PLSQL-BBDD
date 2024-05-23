DECLARE
    -- CREAMOS LAS VARIABLES
    v_numemp PLS_INTEGER;
    v_numemp_max PLS_INTEGER;
    v_oficio_max Oficio.oficio%TYPE;
    v_Oficio Oficio%ROWTYPE;

    CURSOR c_Oficio IS
        SELECT *
        FROM Oficio;
        
    -- PROCEDIMIENTI PARA IMPRIMIR 
    PROCEDURE Print(p_Oficio IN Oficio%rowtype) IS
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('Oficio: ' || p_Oficio.numoficio || ' ' || p_Oficio.oficio || ' tiene ' || v_numemp || ' empleados');
    END Print;
BEGIN
    -- VARIABLE PARA ALMACENAR EL Nº MAXIMO DE EMPLEADOS EN UN OFICIO
    v_numemp_max := 0;
    
    -- ABRIMOS EL CURSOR
    OPEN c_Oficio;
        -- BUCLE PARA IR SACANDO LAS FILAS
        LOOP    
            -- ASIGNAMOS A LA VARIABLE v_oficio LOS DATOS DEL CURSOR
            FETCH c_Oficio INTO v_Oficio;
   
        -- SI NO HAY DATOS SALIR DE BUCLE
        EXIT WHEN c_Oficio%NOTFOUND;
   
            -- HACEMOS UN COUNT PARA VER EL NUMERO DE EMPLEADOS
            SELECT COUNT(*) cuantos INTO v_numemp
            FROM OficioEmpleado
            WHERE oficio = v_oficio.numoficio;
            
            -- LLAMAMOS AL PROCEDIMIENTO PARA IMPRIMIR EL RESULTADO
            Print (v_Oficio);
    
            -- HACEMOS UNA COMPROBACION PARA ASI VER Y GUARDAR EL OFICIO CON MAS EMPLEADOS Y EL NUMERO DE EMPLEADOS QUE TIENEN ESE OFICIO
            IF v_numemp > v_numemp_max THEN
                v_numemp_max := v_numemp;
                v_oficio_max := v_Oficio.oficio;
            END IF;        
        END LOOP;

        -- CUANDO SALGA DEL BUCLE, POR ULTIMO MOSTRAREMOS EL OFICIO CON MAS EMPLEADOS
        DBMS_OUTPUT.PUT_LINE('El oficio con mas empleados es ' || v_oficio_max || ' con ' || v_numemp_max || ' empleados.');
        
    -- CERRAMOS EL CURSOR
    CLOSE c_Oficio;
END;
/