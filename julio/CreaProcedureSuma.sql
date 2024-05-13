create or replace procedure psuma(p_op1 number,
                                 p_op2 number,
                                 p_res1 OUT number,
                                 p_res2 OUT number) is
begin
  p_res1:=p_op1+p_op2;
  p_res2:=p_op1-p_op2;
end;
/