/* SQLPLUS tenemos tres tipos de variables 
  - 1) Variables de usuario
  - 2) Variables de sustitución
  - 3) Variables de enlace (bind variables) */
-- 1) Las variables de usuario se usan de la siguiente forma 
-- No confundas set con define , ejem: set autocommit off
define var_tabla='OficioEmpleado'
define var_empleado=11
-- Para ver valor
define var_tabla
-- Uso 
select count(*) from &var_tabla
where empleado=&var_empleado;
-- borrar variable
undef var_tabla
-- 2) Las de sustitución se usan igual pero sin definir, provoca que pida valor
select * from &var_tabla;
undef var_tabla;
-- Recuerda que las variables de sustitución se desactiva su uso con 
set define off
-- 3) Las variable de enlace son las que me van a permitir hablar con PLSQL
var bind_variable number
print bind_variable
begin
   :bind_variable:=11;
end;
/
print bind_variable
-- Aqui se usa con: dentro de una sentencia SQL
select count(*) from OficioEmpleado
where empleado=:bind_variable;
print bind_variable