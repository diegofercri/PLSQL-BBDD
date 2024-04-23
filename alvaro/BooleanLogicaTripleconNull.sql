declare 
a boolean;
b boolean;

begin

    a:= null;
    b:= true;    -- Revisar el Cuadro tema 4 pagina 15.
    
    if  a or b then
    
         dbms_output.put_line('then');
    else
         dbms_output.put_line('else');
         
    end if;

end;
/