declare 
  type t_bonoloto is table of boolean index by pls_integer;
  v_bonoloto t_bonoloto;
begin
  v_bonoloto(3):=true;
  v_bonoloto(6):=true;
  -- Genera una excepción ya que no existe el 7
  -- después de probarlo comenta ese if
  /*if v_bonoloto(7) then
    dbms_output.put_line('Existe el 7');
  end if;*/
  dbms_output.put_line('sigo');
  if not v_bonoloto.exists(7) then 
    dbms_output.put_line(' El 7 no existe');
  end if;
  dbms_output.put_line('Tenemos '||v_bonoloto.count||' elementos ');
  for i in 1..10 loop
    if v_bonoloto.exists(i) then
      dbms_output.put_line(' Existe antes de delete '||i);      
    end if;
  end loop;
  v_bonoloto.delete(3);
  for i in 1..10 loop
    if v_bonoloto.exists(i) then
      dbms_output.put_line(' Existe después de delete '||i);      
    end if;
  end loop;
  Exception when OTHERS then  dbms_output.put_line('Cruje');
end;
/