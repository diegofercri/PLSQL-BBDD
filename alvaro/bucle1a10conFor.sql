-- Bucle de 1 a 10 que muestre el valor por consola (usando for)
set define off  
DECLARE
  
  v_i NUMBER (1);
  
BEGIN
  
  FOR v_i IN 1..10  LOOP
   dbms_output.put_line(v_i);
   
   
  END LOOP;
END;    
/