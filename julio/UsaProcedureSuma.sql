declare
  v_op1 number(2);
  v_op2 number(2);
  v_res1 number(2);
  v_res2 number(2);
begin
  v_op1:=5;
  v_op2:=3;
  psuma(v_op1,v_op2,v_res1,v_res2);
  dbms_output.put_line('La suma es '||v_res1);
  dbms_output.put_line('La resta es '||v_res2);
end;
/