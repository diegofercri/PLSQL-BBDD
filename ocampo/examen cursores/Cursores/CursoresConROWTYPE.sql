DECLARE
    -- AQUI LO QUE HACEMOS ES DECLARAR UNA VARIABLE DEL MISMO TIPO AL QUE HACEMOS REFERENCIA DE LA TABLA Empleado
    v_empleado Empleado%ROWTYPE;
    
    -- CREAMOS EL CURSOR, QUE HARA ESTA BUSQUEDA, SELECCIONARA TODO DE LA TABLA Empleado DONDE numemp = 5
    CURSOR c_cursor IS
        SELECT *
        FROM Empleado
        WHERE numemp = 5;
BEGIN

    -- ABRIMOS EL CURSOR
    OPEN c_cursor;
    
    -- ASIGNAMOS LOS DATOS A LAS VARIABLES CON EL CURSOR USANDO FETCH 
    FETCH c_cursor INTO v_empleado;
    
    -- CERRAMOS EL CURSOR
    CLOSE c_cursor;
    
    -- MOSTRAMOS EL RESULTADO POR PANTALLA
    DBMS_OUTPUT.PUT_LINE('Numemp: ' || v_empleado.numemp);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_empleado.nombre);
    DBMS_OUTPUT.PUT_LINE('Edad: ' || v_empleado.edad);
    DBMS_OUTPUT.PUT_LINE('Alojamiento: ' || v_empleado.alojamiento);
    DBMS_OUTPUT.PUT_LINE('Sueldo: ' || v_empleado.sueldo);
END;