declare 
  type t_bonoloto is table of boolean index by pls_integer;
  v_bonoloto t_bonoloto;
  v_random pls_integer;
  v_MAXR constant number(2):=49;
  v_MAXC constant number(2):=6;
  v_i pls_integer;
begin
  -- Fase de inicialización
  -- Fase de cálculo o proceso
  while v_bonoloto.count<v_MAXC loop
    v_random:=dbms_random.value(1,v_MAXR);
    v_bonoloto(v_random):=true; 
  end loop;
  v_i:=v_bonoloto.first;
  while v_i is not null loop
     dbms_output.put_line(v_i);
     v_i:=v_bonoloto.next(v_i);
  end loop;
end;
/