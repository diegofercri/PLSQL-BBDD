DECLARE
  v_empleadosMAX pls_integer;
  v_empleados pls_integer;
  v_alojamiento Alojamiento%rowtype;
  -- Variable de acoplamiento utilizada en la consulta
  CURSOR c_Alojamiento IS
    SELECT *
    FROM Alojamiento
    where upper(trim(alojamiento))!='ROSE HILL' -- así aparecen duplicados
    order by alojamiento;
  TYPE t_strings IS TABLE OF Alojamiento.alojamiento%type index by pls_integer;
  v_strings t_strings;
BEGIN
  v_empleadosMAX:=0;
  OPEN c_Alojamiento;
  LOOP
    FETCH c_Alojamiento INTO v_alojamiento;
    EXIT WHEN c_Alojamiento%NOTFOUND;
    select count(*) cuantos into v_empleados
    from Empleado
    where alojamiento=v_alojamiento.numaloj;
    -- Si coincide con el rey de la montaña añado
    if v_empleados = v_empleadosMAX then
      v_strings(v_strings.count+1):=v_alojamiento.alojamiento;
    end if;
    -- Ahora es el rey de la montaña
    if v_empleados > v_empleadosMAX then
      v_empleadosMAX:=v_empleados;
      v_strings.delete;
      v_strings(1):=v_alojamiento.alojamiento;
    end if;
   
    dbms_output.put_line(v_alojamiento.alojamiento||' tiene '||v_empleados||' empleados ');
  END LOOP;
  CLOSE c_Alojamiento;
  -- Ya se que alojamiento tiene mas empleados
  dbms_output.put_line(' Max empleados '||v_empleadosMAX);
  dbms_output.put_line(' He encontrado '||v_strings.count||' Alojamientos con esos empleados');
  for i in 1..v_strings.count loop
    dbms_output.put_line(v_strings(i));
  end loop;
END;
/