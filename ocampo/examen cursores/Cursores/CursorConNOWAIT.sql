DECLARE
    -- CREAMOS EL CURSOR QUE SELECCIONARA TODO DE LA TABLA Empleado, EL NOWAIT DEVUELVE UN ERROR DE ORACLE SI LAS FILAS HAN SIDO BLOQUEADAS POR OTRA SESIÓN, DE LO CONTRARIO SE ESPERA
    CURSOR c_empleado IS
        SELECT *
        FROM Empleado
        FOR UPDATE NOWAIT;
   
    -- CREAMOS UNA VARIABLE QUE ALMACENARA TODOS LOS DATOS DE LA TABLA Empleado
    v_empleado Empleado%ROWTYPE;
BEGIN
    -- ABRIMOS EL CURSOR
    OPEN c_empleado;
   
        -- SACAMOS DEL CURSOR EL VALOR Y LO INTRODUCIMOS EN v_empleado
        FETCH c_empleado INTO v_empleado;
   
        -- EL %FOUND EN ESTE CASO ES PARA VERIFICAR SI SE A ENCONTRADO ALGUN VALOR, EL CASO DE QUE SI, SE EJECUTARA LA PRIMERA SENTENCIA, EN EL CASO CONTRARIO SALTARA AL ELSE
        IF c_empleado%FOUND THEN
            -- MUESTRA UN MENSAJE CON EL NOMBRE DEL EMPLEADO
            DBMS_OUTPUT.PUT_LINE('EMPLEADO ENCONTRADO: ' || v_empleado.NOMBRE);
        ELSE
            -- MUESTRA UN MENSAJE DE AVISO SI NO SE ENCONTRARON REGISTROS
            DBMS_OUTPUT.PUT_LINE('NO SE ENCONTRARON EMPLEADOS');
        END IF;
   
    -- CERRAMOS EL CURSOR
    CLOSE c_empleado;
END;
/

-- ROLLBACK
ROLLBACK;