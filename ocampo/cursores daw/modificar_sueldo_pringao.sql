DECLARE
    v_aloj alojamiento.alojamiento%type;
    v_nombre_aloj alojamiento.nombre%type;

    CURSOR c_alojamiento (p_aloj alojamiento.alojamiento%type) IS
        SELECT numaloj, nombre
        FROM alojamiento
        WHERE UPPER(TRIM(alojamiento)) LIKE p_aloj;

    CURSOR c_empleado (p_nombre_aloj alojamiento.alojamiento%type) IS 
        SELECT e.*, a.alojamiento
        FROM empleado e JOIN alojamiento a ON e.alojamiento = a.numaloj
        WHERE a.alojamiento = p_nombre_aloj FOR UPDATE;
BEGIN 
    OPEN c_alojamiento('CRAMMER');
    LOOP
        FETCH c_alojamiento INTO v_aloj, v_nombre_aloj;
        EXIT WHEN c_alojamiento%NOTFOUND;
        dbms_output.put_line('Alojamiento: ' || v_nombre_aloj);
        
        FOR i IN c_empleado(v_nombre_aloj) LOOP
            dbms_output.put_line(chr(9) || i.nombre || ' ' || i.sueldo);
            UPDATE empleado SET sueldo = sueldo * 20 WHERE CURRENT OF c_empleado;
        END LOOP;
    END LOOP;
    
    CLOSE c_alojamiento;
END;