declare
  v_Empleado Empleado%rowtype;
begin
  v_Empleado:=getEmpleado(6);
  dbms_output.put_line('id='||v_Empleado.numemp||' nombre='||v_Empleado.nombre);
  v_empleado:=getEmpleado(34);
  dbms_output.put_line('id='||v_Empleado.numemp||' nombre='||v_Empleado.nombre);
end;
/