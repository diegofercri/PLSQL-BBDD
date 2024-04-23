DECLARE
  type t_Oficio is record (
    --Oficio Oficio.oficio%type,
    oficio char(25),
    Cuantos pls_integer
  );
  v_oficio t_Oficio;
  v_empleadosMAX pls_integer;
  -- Variable de acoplamiento utilizada en la consulta
  CURSOR c_Oficio IS
    select o.oficio, count(oe.empleado) Cuantos
    from Oficio o left join Oficioempleado oe on o.numoficio=oe.oficio
    where upper(trim(o.oficio))!='HERRERO'
    group by o.oficio;
  TYPE t_strings IS TABLE OF Oficio.oficio%type index by pls_integer;
  v_strings t_strings;
BEGIN
  v_empleadosMAX:=0;
  OPEN c_Oficio;
  LOOP
    FETCH c_Oficio INTO v_oficio;
    EXIT WHEN c_Oficio%NOTFOUND;
    -- Ahora es el rey de la montaña
    if v_oficio.cuantos > v_empleadosMAX then
      v_empleadosMAX:=v_oficio.cuantos;
      v_strings.delete;
      v_strings(1):=v_oficio.oficio;
    else
      if v_oficio.cuantos = v_empleadosMAX then
        v_strings(v_strings.count+1):=v_oficio.oficio;
      end if;
    end if;
   
    dbms_output.put_line(v_oficio.oficio||' tiene '||v_oficio.cuantos||' empleados ');
  END LOOP;
  CLOSE c_oficio;
  -- Ya se que alojamiento tiene mas empleados
  dbms_output.put_line(' Max empleados '||v_empleadosMAX);
  dbms_output.put_line(' He encontrado '||v_strings.count||' Alojamientos con esos empleados');
  for i in 1..v_strings.count loop
    dbms_output.put_line(v_strings(i));
  end loop;
END;
/