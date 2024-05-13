/* OPCION 2: Crea un tipo en un paquete */
declare
  v_lista PaqueteEjemplo.index_table_type;
  v_suma pls_integer;
begin
  for v_i in 1..100 loop
    v_lista(v_i):=v_i;
  end loop;
  v_suma:=f_sumaArrayOpcion2(v_lista);
  dbms_output.put_line(' La suma opcion 2 es '||v_suma);
end;
/
 -- FIN OPCION 2 */