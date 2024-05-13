create or replace function fsuma(p_op1 number,
                                 p_op2 number) 
                           return number is
 v_aux number;
begin
  v_aux:=p_op1+p_op2;
  return v_aux;
end;
/