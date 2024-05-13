-- Aquí no se puede usar tablas indexadas
-- create or replace type index_table_type is table of pls_integer index by pls_integer;
-- Con tabla anidada no hay problema siempre que no uses pls_integer
-- create or replace type nested_table_type is table of pls_integer;
create or replace type nested_table_type is table of number;