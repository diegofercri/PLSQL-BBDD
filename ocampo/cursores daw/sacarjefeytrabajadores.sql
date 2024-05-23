DECLARE
  v_Trabajador Trabajador%rowtype;
  v_nombreTrabajador Trabajador.nombre%type;
  v_cuentaEmpleados pls_integer;
  
  CURSOR c_Trabajador IS
  SELECT *
  FROM Trabajador
  WHERE cod_emp in (
    SELECT cod_jefe
    FROM Trabajador
    GROUP BY cod_jefe);
  
  CURSOR c_nombreTrabajador(p_codEmp Trabajador.cod_emp%type) IS
  SELECT nombre
  FROM Trabajador
  WHERE cod_jefe=p_codEmp
  FOR UPDATE OF nombre;
  
BEGIN
  OPEN c_Trabajador;
  LOOP
    FETCH c_Trabajador INTO v_Trabajador;
    EXIT WHEN c_Trabajador%NOTFOUND;
    dbms_output.put_line(v_Trabajador.nombre || ' es jefe de:');
    
    OPEN c_nombreTrabajador(v_Trabajador.cod_emp);
    LOOP
      FETCH c_nombreTrabajador INTO v_nombreTrabajador;
      EXIT WHEN c_nombreTrabajador%NOTFOUND;
      dbms_output.put_line(v_nombreTrabajador);
    END LOOP;
    CLOSE c_nombreTrabajador;
    
    dbms_output.new_line;
  END LOOP;
  CLOSE  c_Trabajador;
END;
/