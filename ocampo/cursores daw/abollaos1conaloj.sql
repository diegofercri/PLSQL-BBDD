DECLARE
  v_emp Empleado%rowtype;
  v_aloj Alojamiento%rowtype;
  
  CURSOR c_aloj IS
  SELECT *
  FROM Alojamiento
  ORDER BY alojamiento;
  
  CURSOR c_emp (p_aloj Empleado.alojamiento%type)IS
  SELECT *
  FROM Empleado
  WHERE p_aloj=alojamiento;
  
BEGIN

  OPEN c_aloj;
  LOOP
    FETCH c_aloj INTO v_aloj;
    EXIT WHEN c_aloj%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Alojamiento: ' || v_aloj.alojamiento);
    OPEN c_emp(v_aloj.numaloj);
    LOOP
      FETCH c_emp INTO v_emp;
      EXIT WHEN c_emp%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(chr(9)||'Empleado: ' || v_emp.nombre);
    END LOOP;
    CLOSE c_emp;
  END LOOP;
  CLOSE c_aloj;


END;
/