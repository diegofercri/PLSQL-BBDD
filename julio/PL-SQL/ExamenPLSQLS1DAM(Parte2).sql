DECLARE
  CURSOR c_Oficio(p_numemp Empleado.numemp%type) IS
    SELECT o.oficio,count(oe.oficio) cuantos
    FROM Oficio o join OficioEmpleado oe on o.numoficio=oe.oficio
    WHERE o.numoficio IN (SELECT oficio
                          FROM OficioEmpleado oe2
                          WHERE oe2.empleado=p_numemp)
    GROUP BY o.oficio
    ORDER BY o.oficio desc;
  v_oficio Oficio.oficio%type;
  v_cuantos PLS_INTEGER;
BEGIN
  FOR v_Empleado IN (SELECT * FROM Empleado ORDER BY nombre) LOOP
    dbms_output.put_line('Empleado/a '||v_Empleado.nombre);
    OPEN c_oficio(v_Empleado.numemp);
    LOOP
      FETCH c_Oficio into v_oficio,v_cuantos;
      EXIT WHEN c_Oficio%NOTFOUND;
      dbms_output.put_line(CHR(9)||' Oficio '||v_oficio||' tiene '||v_cuantos||' empleados ');
    END LOOP;
    IF c_Oficio%ROWCOUNT=0 THEN 
      dbms_output.put_line(CHR(9)||' Sin Oficio ');
    END IF;
    CLOSE c_Oficio;
  END LOOP;
END;