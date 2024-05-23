DECLARE
    -- CURSOR QUE PASAREMOS POR PARAMETRO UN VALOR, EN ESTE CASO LE PARASAREMOS numemp DE TIPO NUMBER
    CURSOR c_cursor(p_numemp NUMBER) IS
        SELECT * 
        FROM Empleado 
        WHERE numemp = p_numemp;
    
    -- CREAMOS UNA VARIABLE PARA ALMACENAR TODOS LOS DATOS DE LA TABLA Empleado
    v_empleado Empleado%ROWTYPE;
  
    -- VARIABLE QUE USAREMOS PARA BUSCAR EL numemp DEL EMPLEADO, EN ESTE CASO LE HEMOS DADO UN VALOR DE 1, CON LO CUAL BUSCARA EL EMPLEADO CON EL numemp = 1
    v_numemp NUMBER := 1;
BEGIN
    -- ABRIMOS EL CURSOR Y LE PASAMOS EL PARAMETRO
    OPEN c_cursor(v_numemp);
        
        -- SACAMOS DEL CURSOR EL VALOR Y LO INTRODUCIMOS EN v_empleado
        FETCH c_cursor INTO v_empleado;
    
        -- MOSTRAMOS LOS DATOS POR PANTALLA
        DBMS_OUTPUT.PUT_LINE('Numemp: ' || v_empleado.numemp || ', Nombre: ' || v_empleado.nombre);

    -- CERRAMOS EL CURSOR
    CLOSE c_cursor;
END;
/