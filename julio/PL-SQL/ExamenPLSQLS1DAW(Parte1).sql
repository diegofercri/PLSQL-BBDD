DECLARE
  v_nombreOficio Oficio.oficio%type;
  v_nombreEmpleado Empleado.nombre%type;
BEGIN
  FOR v_Oficio IN (SELECT * FROM OficioEmpleado ORDER BY oficio,empleado desc) LOOP
    select oficio into v_nombreOficio
    from Oficio
    where numoficio=v_Oficio.oficio;
    select nombre into v_nombreEmpleado
    from Empleado
    where numemp=v_Oficio.empleado;
    dbms_output.put(CHR(9)||'Oficio('||v_Oficio.oficio||') '||v_nombreOficio);
    dbms_output.put_line(CHR(9)||' Empleado/a('||v_Oficio.empleado||') '||v_nombreEmpleado);
  END LOOP;
END;
/