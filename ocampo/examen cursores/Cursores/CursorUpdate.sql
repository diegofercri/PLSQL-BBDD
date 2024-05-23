DECLARE
    
    -- CREAMOS LAS VARIABLES
    v_nombre Alojamiento.responsable%type;
    v_alojamiento Alojamiento%rowtype;
    
    -- CREAMOS UN CURSOR, QUE SELECCIONARA AL responsable DE Alojamiento DONDE numaloj SEA = 1
    CURSOR c_cursor IS
        SELECT responsable
        FROM Alojamiento
        WHERE numaloj = 1 
        FOR UPDATE OF responsable; 
    
BEGIN
    -- ABRIMOS EL CURSOR
    OPEN c_cursor;
    
    LOOP
    
        -- SACAMOS EL VALOR DEL CURSOR A LA VARIABLE, EN ESTE CASO ES DE TIPO %ROWTYPE, PERO LE HEMOS PUESTO .responsable PARA QUE SEA ESE CAMPO EN CONCRETO
        FETCH c_cursor INTO v_alojamiento.responsable;
        
    -- SALIMOS DEL BUCLE SI EL CURSOR NO ENCUENTRA NADA   
    EXIT WHEN c_cursor%NOTFOUND;
    
        -- AÑADIMOS LA LETRA 'S' A LA VARIABLE, EN ESTE CASO USAMOS EL TRIM PARA QUE NOS DEJE METER LA LETRA, YA QUE ES DE TIPO CHAR Y TIENE ESPACIOS EN BLANCO
        v_nombre := TRIM(v_alojamiento.responsable) || 'S';
    
        -- ACTUALIZAMOS EL CAMPO EN LA TABLA
        UPDATE Alojamiento
        SET responsable = v_nombre
        WHERE CURRENT OF c_cursor;
    END LOOP;
    
    -- CERRAMOS EL CURSOR
    CLOSE c_cursor;
END;
/
    -- MOSTRAMOS LA TABLA
    SELECT responsable 
    FROM Alojamiento
    WHERE numaloj = 1;
    
    -- HACEMOS ROLLBACK PARA QUITAR LOS CAMBIOS
    ROLLBACK;
    
   