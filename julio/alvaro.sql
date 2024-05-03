DECLARE
    CURSOR c_Empleado IS
        SELECT *
        FROM Empleado
        ORDER BY nombre;
    v_Empleado Empleado%ROWTYPE;    
    

    

    CURSOR c_Oficio (p_numemp OficioEmpleado.empleado%type) IS
    SELECT O.Oficio, COUNT(oe.empleado) AS cuantos
    FROM Oficio o JOIN OficioEmpleado oe ON oe.oficio=o.numoficio
    WHERE o.numoficio IN 
                (SELECT oficio FROM oficioempleado WHERE empleado = p_numemp)
    GROUP BY o.Oficio
    ORDER BY o.Oficio desc;
    
    v_cuantos PLS_INTEGER;
    v_oficio Oficio.oficio%type;

BEGIN
    OPEN c_Empleado;
    LOOP
        FETCH c_Empleado INTO v_Empleado;
        EXIT WHEN c_Empleado%NOTFOUND;
        dbms_output.put_line('Empleado/a ' || v_Empleado.nombre);
        OPEN c_Oficio (v_Empleado.numemp);
        LOOP
            FETCH c_Oficio INTO v_Oficio, v_cuantos;
            EXIT WHEN c_Oficio%NOTFOUND;
            dbms_output.put_line(chr(9) || 'Oficio ' || v_Oficio || ' tiene ' || v_cuantos || ' empleados');
        END LOOP;
        IF c_Oficio%ROWCOUNT=0 THEN
            dbms_output.put_line(chr(9) || 'Sin Oficio');
        END IF;
        CLOSE c_Oficio;
    END LOOP;
    CLOSE c_Empleado;
END;
/




