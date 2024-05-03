DECLARE
  -- Variables de salida para almacenar los resultados de la consulta
  -- No pongo todos porque estoy vaguete
  v_numaloj Alojamiento.numaloj%type;
  v_alojamiento Alojamiento.alojamiento%type;
  -- Variable de acoplamiento utilizada en la consulta
  v_distanciamax Alojamiento.distancia%type;
  -- declaración del cursor
  -- Si declaras antes el cursor que la variable de acoplamiento da error
  CURSOR c_Alojamiento IS
    SELECT numaloj,alojamiento
    FROM Alojamiento
    WHERE distancia < v_distanciamax
    order by distancia desc;
BEGIN
  -- Identificar las filas del conjunto activo y preparar el
  -- procesamiento posterior de datos
  v_distanciamax:=11;
  OPEN c_Alojamiento;
  LOOP
    -- Recuperar cada fila del conjunto activo y almacenarlas en
    -- variables PL/SQL
    -- MI: Si no hay más filas no carga nada
    FETCH c_Alojamiento INTO v_numaloj, v_alojamiento;
    dbms_output.put_line(' Antes del notfound ');
    dbms_output.put_line(v_numaloj||'-'||v_alojamiento);
    -- Si no hay más filas salir de bucle
    EXIT WHEN c_Alojamiento%NOTFOUND;
    dbms_output.put_line(' Después del notfound ');
    dbms_output.put_line(v_numaloj||'-'||v_alojamiento);
  END LOOP;
  -- Liberar los recursos usados por la consulta
  CLOSE c_Alojamiento;
END;
/