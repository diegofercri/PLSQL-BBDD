create or replace trigger update_calculado_prestado
after update of fechadevolucion on prestamo
for each row
when (old.fechadevolucion is null and new.fechadevolucion is not null)
begin
    update ejemplar set calculado_prestado='N' where id=:new.ejemplar_id;
end;
/