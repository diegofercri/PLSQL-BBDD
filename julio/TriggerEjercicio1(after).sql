-- Este da error, descubre por qué
create or replace trigger TriggerEjercicio1After 
after insert on Empleado
for each row
when (new.edad is null) -- Si no pones paréntesis da error
begin
  :new.edad:=:new.numemp;
end;
/

 