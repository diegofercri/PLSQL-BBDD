DECLARE
  v_alojamiento Alojamiento%rowtype;
  -- Variable de acoplamiento utilizada en la consulta
  CURSOR c_Alojamiento IS
    SELECT *
    FROM Alojamiento;
  PROCEDURE print(p_Alojamiento Alojamiento%rowtype) is
  BEGIN
    dbms_output.put_line(p_Alojamiento.numaloj);
    dbms_output.put_line(p_Alojamiento.Alojamiento);
    -- Asi con el resto de campos
  END;
BEGIN
  OPEN c_Alojamiento;
  LOOP
    FETCH c_Alojamiento INTO v_alojamiento;
    EXIT WHEN c_Alojamiento%NOTFOUND;
    print(v_alojamiento);
  END LOOP;
  CLOSE c_Alojamiento;
END;
/