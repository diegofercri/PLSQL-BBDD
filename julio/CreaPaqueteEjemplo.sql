-- Aquí se puede usar tablas indexadas
create or replace package PaqueteEjemplo is
  type index_table_type is table of pls_integer index by pls_integer;
end PaqueteEjemplo;
