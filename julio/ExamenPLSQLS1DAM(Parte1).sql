DECLARE
  CURSOR c_Empleado(p_numoficio Oficio.numoficio%type) IS
    SELECT *
    FROM OficioEmpleado 
    WHERE oficio=p_numoficio
    ORDER BY empleado desc; 
BEGIN
  FOR v_Oficio IN (SELECT * FROM Oficio ORDER BY oficio) LOOP
    dbms_output.put_line(' Oficio '||v_Oficio.oficio);
    FOR v_empleado IN c_Empleado(v_Oficio.numoficio) LOOP
      dbms_output.put_line(CHR(9)||'Empleado '||v_empleado.empleado);
    END LOOP;
  END LOOP;
END;
/