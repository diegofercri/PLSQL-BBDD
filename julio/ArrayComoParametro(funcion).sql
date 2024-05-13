/* OPCION 2: Crea un tipo en un paquete */
create or replace function f_sumaArrayOpcion2(p_lista paqueteEjemplo.index_table_type) 
                                            RETURN PLS_INTEGER is
  v_suma pls_integer;
begin
  v_suma:=0;
  for v_i in 1..p_lista.count loop
    v_suma:=v_suma+p_lista(v_i);
  end loop;
  RETURN v_suma;
end;
/
-- FIN OPCION 2 */