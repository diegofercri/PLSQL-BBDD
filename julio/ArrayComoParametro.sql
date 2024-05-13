/* OPCION 1: Uso de tipo definido en paquete estandar 
create or replace procedure sumaArrayOpcion1(p_lista dbms_utility.index_table_type,
                                             p_suma out pls_integer) is
  v_suma pls_integer;
begin
  v_suma:=0;
  for v_i in 1..p_lista.count loop
    v_suma:=v_suma+p_lista(v_i);
  end loop;
  p_suma:=v_suma;
end;
/
-- FIN OPCION 1 */
/* OPCION 2: Crea un tipo en un paquete 
create or replace procedure sumaArrayOpcion2(p_lista paqueteEjemplo.index_table_type,
                                             p_suma out pls_integer) is
  v_suma pls_integer;
begin
  v_suma:=0;
  for v_i in 1..p_lista.count loop
    v_suma:=v_suma+p_lista(v_i);
  end loop;
  p_suma:=v_suma;
end;
/
-- FIN OPCION 2 */
/* OPCION 3: Crea un tipo a nivel de esquema */
create or replace procedure sumaArrayOpcion3(p_lista nested_table_type,
                                             p_suma out pls_integer) is
  v_suma pls_integer;
begin
  v_suma:=0;
  for v_i in 1..p_lista.count loop
    v_suma:=v_suma+p_lista(v_i);
  end loop;
  p_suma:=v_suma;
end;
/
-- FIN OPCION 3 */