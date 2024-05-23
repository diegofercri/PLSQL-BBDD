DECLARE
    -- AQUI LO QUE HACEMOS ES DECLARAR LAS VARIABLE DEL MISMO TIPO AL QUE HACEMOS REFERENCIA DE LA TABLA Empleado
    v_numemp Empleado.numemp%TYPE;
    v_nombre Empleado.nombre%TYPE;
    v_edad Empleado.edad%TYPE;
    v_alojamiento Empleado.alojamiento%TYPE;
    v_sueldo Empleado.sueldo%TYPE;
    
    -- CREAMOS EL CURSOR, QUE HARA ESTA BUSQUEDA, SELECCIONARA TODO DE LA TABLA Empleado DONDE numemp = 5
    CURSOR c_cursor IS
        SELECT *
        FROM Empleado
        WHERE numemp = 5;
BEGIN

    -- ABRIMOS EL CURSOR
    OPEN c_cursor;
    
    -- ASIGNAMOS LOS DATOS A LAS VARIABLES CON EL CURSOR USANDO FETCH 
    FETCH c_cursor INTO v_numemp, v_nombre, v_edad, v_alojamiento, v_sueldo;
    
    -- CERRAMOS EL CURSOR
    CLOSE c_cursor;
    
    -- MOSTRAMOS EL RESULTADO POR PANTALLA
    DBMS_OUTPUT.PUT_LINE('Numemp: ' || v_numemp);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Edad: ' || v_edad);
    DBMS_OUTPUT.PUT_LINE('Alojamiento: ' || v_alojamiento);
    DBMS_OUTPUT.PUT_LINE('Sueldo: ' || v_sueldo);
END;