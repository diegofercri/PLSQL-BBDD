DECLARE
  v_ContadorError pls_integer;
  v_nombre Empleado.nombre%type;
BEGIN
  -- Añade/quita where imposibles a los distintos select para ver quien falla
  -- Select 1
  v_ContadorError:=1;
  SELECT nombre INTO v_nombre
  FROM Empleado
  WHERE numemp=11;
  dbms_output.put_line('Llegue a ejecutar el select '||v_ContadorError);
  -- Select 2
  v_ContadorError:=2;
  SELECT nombre INTO v_nombre
  FROM Empleado
  WHERE numemp=111;
  dbms_output.put_line('Llegue a ejecutar el select '||v_ContadorError);
  -- Select 3
  v_ContadorError:=3;
  SELECT nombre INTO v_nombre
  FROM Empleado
  WHERE numemp=11;
  dbms_output.put_line('Llegue a ejecutar el select '||v_ContadorError);
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('El error se produjo en el punto de control '||v_ContadorError); 
END;
/