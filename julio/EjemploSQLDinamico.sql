/* Vamos a hacer primero un programa que interacciona sql dinámico con estático 
   Dentro de EXCECUTE IMMEDIATE se pone la sentencia que pondríamos en sqlplus 
   NO SE PONE LA SENTENCIA QUE IRÍA DENTRO DE UN PLSQL                        */
declare 
  v_cuantas pls_integer;
begin
  -- Comunicación usando claúsula INTO de EXECUTE
  EXECUTE IMMEDIATE 'select count(*) from Empleado' INTO v_cuantas;
  dbms_output.put_line(' Tenemos ' || v_cuantas || ' empleados');
  -- Comunicación usando variables de enlace, se enlaza bind_variable a v_cuantas
  EXECUTE IMMEDIATE 'select count(*) from OficioEmpleado where empleado=:bind_variable' 
    INTO v_cuantas
    USING 1;
  dbms_output.put_line(' El empleado 1 tiene ' || v_cuantas || ' oficios');
end;
/
