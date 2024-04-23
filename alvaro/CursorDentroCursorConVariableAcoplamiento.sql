DECLARE
  v_alojamiento Alojamiento%rowtype;
  CURSOR c_Alojamiento IS
    SELECT *
    FROM Alojamiento
    ORDER BY alojamiento;
  
  v_empleado Empleado%rowtype;
  -- Variable de acoplamiento utilizada en la consulta
  -- Podría también haber usado v_alojamiento.numaloj pero 
  -- sería excesivo el grado de acoplamiento
  v_numaloj Alojamiento.numaloj%type; 
  CURSOR c_Empleado IS
    SELECT *
    FROM Empleado
    WHERE alojamiento=v_numaloj
    ORDER BY nombre;
BEGIN
  OPEN c_Alojamiento;
  LOOP
    FETCH c_Alojamiento INTO v_alojamiento;
    EXIT WHEN c_Alojamiento%NOTFOUND;
    dbms_output.put_line(v_alojamiento.alojamiento);
    v_numaloj:=v_alojamiento.numaloj;
    OPEN c_Empleado;
    LOOP
      FETCH c_Empleado INTO v_Empleado;
      EXIT WHEN c_Empleado%NOTFOUND;
      dbms_output.put_line(chr(9)||v_Empleado.nombre);
    END LOOP;
    CLOSE c_Empleado;
  END LOOP;
  CLOSE c_Alojamiento;
END;
/