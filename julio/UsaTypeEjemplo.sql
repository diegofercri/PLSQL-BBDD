drop table PruebaType;
create table PruebaType (
  id number(3),
  lista nested_table_type)
nested table lista store as PruebaTypeLista;
-- Insercion desde PLSQL
declare
  v_lista nested_table_type;
begin
  v_lista:=nested_table_type(1,2,3);
  insert into PruebaType values (1,v_lista);
  commit;
end;
/
-- Inserción sin plsql
insert into PruebaType values(2,new nested_table_type(1,2,3));
commit;
