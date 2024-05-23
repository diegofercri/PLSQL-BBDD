DECLARE
    -- CREAMOS UN  CURSOR QUE SELECCIONARA TODO DE LA TABLA Empleado
    CURSOR c_cursor IS
        SELECT * 
        FROM Empleado;
    
    -- CREAMOS UNA VARIABLE QUE GUARDARA TODO LOS DATOS DE LA TABLA Empleado
    v_empleado Empleado%ROWTYPE;
BEGIN
    -- ABRIMOS EL CURSOR
    OPEN c_cursor;
        -- HACEMOS UN BUCLE PARA IR SACANDO TODOS LOS DATOS FILA A FILA
        LOOP
            -- PARA PODER IR SACANDO UNA FILA, A LA SIGUIENTE VUELTA EN EL BUCLE SERIA LA SIGUIENTE FILA
            FETCH c_cursor INTO v_empleado;
            
        -- CUANDO EL CURSOR NO ENCUENTRE DATOS SALDRA DEL BUCLE
        EXIT WHEN c_cursor%NOTFOUND;
    
            -- MOSTRAMOS LOS DATOS
            DBMS_OUTPUT.PUT_LINE('Numemp: ' || v_empleado.numemp || ', Nombre: ' || v_empleado.nombre);
        END LOOP;
  
    -- CERRAMOS EL CURSOR
    CLOSE c_cursor;
END;
/