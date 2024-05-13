/* OPCION 1: Uso de tipo definido en paquete estandar 
declare
  v_lista dbms_utility.index_table_type;
  v_suma pls_integer;
begin
  for v_i in 1..100 loop
    v_lista(v_i):=v_i;
  end loop;
  sumaArrayOpcion1(v_lista,v_suma);
  dbms_output.put_line(' La suma opcion 1 es '||v_suma);
end;
/
-- FIN OPCION 1 */
/* OPCION 2: Crea un tipo en un paquete 
declare
  v_lista PaqueteEjemplo.index_table_type;
  v_suma pls_integer;
begin
  for v_i in 1..100 loop
    v_lista(v_i):=v_i;
  end loop;
  sumaArrayOpcion2(v_lista,v_suma);
  dbms_output.put_line(' La suma opcion 2 es '||v_suma);
end;
/
 -- FIN OPCION 2 */
/* OPCION 3: Crea un tipo a nivel de esquema */
declare
  v_lista nested_table_type;
  v_suma pls_integer;
begin
  v_lista:=nested_table_type();
  for v_i in 1..100 loop
    v_lista.extend;
    v_lista(v_i):=v_i;
  end loop;
  sumaArrayOpcion3(v_lista,v_suma);
  dbms_output.put_line(' La suma opcion 3 es '||v_suma);
end;
/
 -- FIN OPCION 3 */