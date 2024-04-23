-- Bucle de 1 a 10 que muestre el valor por consola (usando for)
set define off  
DECLARE
  
  v_i NUMBER (1);
  v_MAX constant number(2):= 10;
BEGIN
  
  WHILE v_i <= v_max  LOOP
   dbms_output.put_line(v_i);
   v_i:=v_i +1;
   
  END LOOP;
END;    
/