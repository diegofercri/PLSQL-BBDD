declare

    v_random pls_integer;

begin
    for v_i in 1..10 loop
        v_random:= dbms_random.value(1,49);
        dbms_output.put_line(v_random);
    end loop;
    
end;
/