-- Tablas indexadas 

declare

    type t_bonoloto is table of boolean index by PLS_INTEGER;
    v_bonoloto t_bonoloto;
    
begin
    v_bonoloto(3):= true;
    if v_bonoloto(3) then
    dbms_output.put_line('3 es cierto');
    end if;
    
end;
/