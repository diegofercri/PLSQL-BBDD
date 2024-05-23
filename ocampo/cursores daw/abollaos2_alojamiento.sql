DECLARE
  v_Empleado Empleado%rowtype;
  v_numAlojamiento Alojamiento.numaloj%type;
  v_nombreAlojamiento Alojamiento.alojamiento%type;
  v_cuentaEmpleados pls_integer;
  
  CURSOR c_Empleado IS
    SELECT *
    FROM Empleado
    ORDER BY nombre;
    
  CURSOR c_Alojamiento (p_numaloj Alojamiento.numaloj%type) IS
    SELECT numaloj, alojamiento
    FROM Alojamiento
    WHERE numaloj = p_numaloj
    ORDER BY numaloj DESC;
    
  CURSOR c_cuentaEmpleadosPorAlojamiento(p_numAloj Alojamiento.numaloj%type) IS
    SELECT count(*)
    FROM Empleado
    WHERE alojamiento=p_numAloj
    GROUP BY alojamiento;
    
BEGIN
  OPEN c_Empleado;
  LOOP
    FETCH c_Empleado INTO v_Empleado;
    EXIT WHEN c_Empleado%NOTFOUND;
    dbms_output.put_line('Empleado/a ' || v_Empleado.nombre);
    
    OPEN c_Alojamiento(v_Empleado.alojamiento);
    LOOP
      FETCH c_Alojamiento INTO v_numAlojamiento, v_nombreAlojamiento;
      EXIT WHEN c_Alojamiento%NOTFOUND;
      
      OPEN c_cuentaEmpleadosPorAlojamiento(v_numAlojamiento);
      LOOP
        FETCH c_cuentaEmpleadosPorAlojamiento INTO v_cuentaEmpleados;
        EXIT WHEN c_cuentaEmpleadosPorAlojamiento%NOTFOUND;
        dbms_output.put_line(chr(9) || 'Alojamiento ' || v_nombreAlojamiento || ' tiene ' || v_cuentaEmpleados || ' empleados');
      END LOOP;
      CLOSE c_cuentaEmpleadosPorAlojamiento;
      
    END LOOP;
    IF (c_Alojamiento%ROWCOUNT = 0) THEN
     dbms_output.put_line(chr(9) ||  'Sin Alojamiento');
    END IF;
    CLOSE c_Alojamiento;
    
  END LOOP;
  CLOSE c_Empleado;
END;
/