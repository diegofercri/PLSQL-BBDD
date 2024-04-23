create or replace trigger insert_calculado_prestado
after insert on prestamo
for each row
begin
    update ejemplar set calculado_prestado='Y' where id=:new.ejemplar_id;
end;
/
