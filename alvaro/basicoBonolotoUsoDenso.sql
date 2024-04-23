declare 
  type t_bonoloto is table of boolean index by pls_integer;
  v_bonoloto t_bonoloto;
  v_cuantos pls_integer;
  v_random pls_integer;
  v_MAXR constant pls_integer:=49; -- Número aleatorios de 1 a 19
  v_MAXC constant pls_integer:=6; -- La combinación está formado por 6 números aleatorios
begin
  -- Fase de inicialización
  v_cuantos:=0;
  for i in 1..v_MAXR loop
    v_bonoloto(i):=false; -- Hemos convertido en denso una colección dispersa
  end loop;
  -- Fase de cálculo o proceso
  while v_cuantos<v_MAXC loop
    v_random:=dbms_random.value(1,v_MAXR); -- Faltaría iniciar una semilla
    if not v_bonoloto(v_random) then 
      v_bonoloto(v_random):=true;
      v_cuantos:=v_cuantos+1;
    end if;
  end loop;
  -- Fase de impresión de resultados
  for i in 1..v_MAXR loop
    if v_bonoloto(i) then
      dbms_output.put_line(i);
    end if;
  end loop;
end;
/