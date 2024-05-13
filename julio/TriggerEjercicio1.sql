create or replace trigger TriggerEjercicio1 
before insert on Empleado
for each row
when (new.edad is null) -- Si no pones paréntesis da error
begin
  :new.edad:=:new.numemp;
end;
/

 