declare 
  
  v_bonoloto t_bonoloto;
  v_random pls_integer;
  v_MAXR constant number(2):=6;
begin
  -- Fase de inicialización
  for i in 1..v_MAXR loop
    v_bonoloto(i):=0; -- Hemos convertido en denso una colección dispersa
  end loop;
  -- Fase de cálculo o proceso
  for i in 1..1000 loop
    v_random:=dbms_random.value(1,v_MAXR); -- Faltaría iniciar una semilla
    v_bonoloto(v_random):=v_bonoloto(v_random)+1;
  end loop;
  -- Fase de impresión de resultados
  for i in 1..v_MAXR loop
    dbms_output.put_line('V['||i||']='||v_bonoloto(i));
  end loop;
end;
/