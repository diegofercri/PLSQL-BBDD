declare
  a number;
  b number;
begin
  a:=null;
  b:=true;
  if not a>2 then
    dbms_output.put_line('cierto');
  else
    dbms_output.put_line('false');
  end if;
end;
/