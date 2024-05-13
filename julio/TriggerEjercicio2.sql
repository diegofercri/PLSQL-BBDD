create or replace trigger TriggerEjercicio2 
before insert or update of oficio on Oficio
for each row
begin
  -- Si no pongo update of oficio no sabré lo que se ha modificado
  -- tocaría comprobar lo que se ha cambiado
  :new.oficio:=upper(trim(:new.oficio));
end;
/

 