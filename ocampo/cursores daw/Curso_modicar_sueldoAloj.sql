DECLARE
  v_aloj Alojamiento%rowtype;
  v_emp Empleado%rowtype;
  v_lugar varchar2(10);

  CURSOR c_emp (p_emp Empleado.alojamiento%type)  IS
  SELECT *
  FROM Empleado
  WHERE alojamiento=p_emp
  ORDER BY nombre
  FOR UPDATE OF SUELDO;

  CURSOR c_aloj (p_aloj Alojamiento.alojamiento%type) IS
  SELECT numaloj
  FROM Alojamiento
  WHERE UPPER(TRIM(alojamiento)) = p_aloj;

BEGIN
  v_lugar:='CRAMMER';
  
  OPEN c_aloj(v_lugar);
  LOOP
    FETCH c_aloj INTO v_aloj.numaloj;
    EXIT WHEN c_aloj%NOTFOUND;
    OPEN c_emp(v_aloj.numaloj);
    LOOP
      FETCH c_emp INTO v_emp;
      EXIT WHEN c_emp%NOTFOUND;
      UPDATE Empleado SET sueldo = sueldo*5 WHERE CURRENT OF c_emp;
      DBMS_OUTPUT.PUT_LINE(v_emp.nombre || ' ' || v_emp.sueldo);
    END LOOP;
    CLOSE c_emp;
  END LOOP;
  CLOSE c_aloj;
END;
/