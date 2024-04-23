--Una vez que ejecutes el programa se pide rehacerlo con los siguientes cambios:
-- fetch guardará los datos en un registro de tipo rowtype en vez de hacerlo en campos sueltos
-- Usará un procedimiento para mostar cada registro con los datos de la fila obtenida



DECLARE
  v_alojamiento Alojamiento%rowtype;
  -- Variable de acoplamiento utilizada en la consulta
  CURSOR c_Alojamiento IS
    SELECT *
    FROM Alojamiento;
  PROCEDURE print(p_Alojamiento in Alojamiento%rowtype) is
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