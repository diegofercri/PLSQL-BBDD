SET SERVEROUTPUT ON;
DECLARE
    -- VARIABLE PARA GUARDAR LOS DATOS DE Alojamiento
    v_alojamiento Alojamiento%ROWTYPE;
  
    -- CURSOR PARA LA TABLA DE Alojamiento Y SACAR TODOS LOS DATOS
    CURSOR c_Alojamiento IS
        SELECT *
        FROM Alojamiento
        ORDER BY alojamiento;

    -- VARIABLE PARA GUARDAR LOS DATOS DE Empleado 
    v_empleado Empleado%ROWTYPE;
  
    -- VARIABLE PARA GUARDAR numaloj DE LA TABLA Alojamiento
    v_numaloj Alojamiento.numaloj%TYPE; 
  
    -- CURSOR PARA LA TABLA DE Empleado --
    CURSOR c_Empleado (p_numaloj Alojamiento.numaloj%TYPE) IS
        SELECT *
        FROM Empleado
        WHERE alojamiento = p_numaloj
        ORDER BY nombre;
    
BEGIN
    -- ABRIMOS EL CURSOR DE Alojamiento
    OPEN c_Alojamiento;
        LOOP
            -- ASIGANMOS EL VALOR DEL CURSOR A v_alojamiento
            FETCH c_Alojamiento INTO v_alojamiento;
    
        -- SALE DEL BUCLE SI NO ENCUENTRA NINGUN REGISTRO
        EXIT WHEN c_Alojamiento%NOTFOUND;
    
            -- SACAMOS POR PANTALLA EL NOMBRE DEL ALOJAMIENTO
            DBMS_OUTPUT.PUT_LINE(v_alojamiento.alojamiento);
    
            -- ABRIMOS EL CURSOR DE Empleado CON EL PARAMETRO DEL CURSOR ANTERIOR
            OPEN c_Empleado(v_alojamiento.numaloj);
                LOOP
                    -- ASIGANMOS EL VALOR DEL CURSOR A v_Empleado
                    FETCH c_Empleado INTO v_Empleado;
                          
                -- SALE DEL BUCLE SI NO ENCUENTRA NINGUN REGISTRO
                EXIT WHEN c_Empleado%NOTFOUND;
                          
                    -- SACAMOS POR PANTALLA EL NOMBRE DEL EMPLEADO   
                    DBMS_OUTPUT.PUT_LINE(chr(9)||v_Empleado.nombre);
                END LOOP;
                        
            -- CERRAMOS EL CURSOR
            CLOSE c_Empleado;
        END LOOP;
      
    -- CERRAMOS EL CURSOR
    CLOSE c_Alojamiento;
END;
/