set define off  
DECLARE
  
  v_i NUMBER (1);
  v_MAX constant number(2):= 10;
BEGIN
  
  LOOP
   dbms_output.put_line(v_i);
   v_i:=v_i +1;
   
   /* if v_i > v_MAX THEN
   EXIT                         -- Esto para hacerlo con un IF
   END IF; */
   
   EXIT WHEN v_i > v_MAX;
   
  END LOOP;
END;  