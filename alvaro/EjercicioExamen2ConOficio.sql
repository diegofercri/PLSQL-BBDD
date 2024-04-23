


DECLARE
  v_empleadosMAX pls_integer;
  v_empleados pls_integer;
  v_Oficio oficio%rowtype;
  -- Variable de acoplamiento utilizada en la consulta
  CURSOR c_Oficio IS
    SELECT *
    FROM Oficio
    where upper(trim(Oficio))!='ROSE HILL' -- así aparecen duplicados
    order by Oficio;
  TYPE t_strings IS TABLE OF Oficio.oficio%type index by pls_integer;
  v_strings t_strings;
BEGIN
  v_empleadosMAX:=0;
  OPEN c_Oficio;
  LOOP
    FETCH c_Oficio INTO v_Oficio;
    EXIT WHEN c_Oficio%NOTFOUND;
    select count(*) cuantos into v_empleados
    from Empleado
    where Oficio=v_Oficio.numaloj;
    -- Si coincide con el rey de la montaña añado
    if v_empleados = v_empleadosMAX then
      v_strings(v_strings.count+1):=v_Oficio.oficio;
    end if;
    -- Ahora es el rey de la montaña
    if v_empleados > v_empleadosMAX then
      v_empleadosMAX:=v_empleados;
      v_strings.delete;
      v_strings(1):=v_Oficio.oficio;
    end if;
   
    dbms_output.put_line(v_Oficio.oficio||' tiene '||v_empleados||' empleados ');
  END LOOP;
  CLOSE c_Oficio;
  -- Ya se que Oficio tiene mas empleados
  dbms_output.put_line(' Max empleados '||v_empleadosMAX);
  dbms_output.put_line(' He encontrado '||v_strings.count||' Oficios con esos empleados');
  for i in 1..v_strings.count loop
    dbms_output.put_line(v_strings(i));
  end loop;
END;
/