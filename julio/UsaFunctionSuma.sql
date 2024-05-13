declare
  v_op1 number(2);
  v_op2 number(2);
  v_res number(2);
begin
  v_op1:=5;
  v_op2:=3;
  v_res:=fsuma(v_op1,v_op2);
  dbms_output.put_line('La suma es '||v_res);
end;
/