DECLARE
  v_distanciamax Alojamiento.distancia%type; 
  -- Registro para Alojamiento
  type t_Alojamiento is record(
        NUMALOJ	NUMBER(2,0),
        ALOJAMIENTO	CHAR(15 BYTE),
        NOMBRECOMPLETO	CHAR(40 BYTE),
        RESPONSABLE	CHAR(25 BYTE),
        DIRECCION	CHAR(30 BYTE),
        DISTANCIA	NUMBER
  );
  -- Declaracion de Alojamiento 
  v_Alojamiento Alojamiento%rowtype;
  -- declaración del cursor
  -- Si declaras antes el cursor que la variable de acoplamiento da error
  CURSOR c_alojamiento IS
    SELECT *
    FROM Alojamiento
    WHERE distancia < v_distanciamax
    order by distancia desc;
    
    -- Procedimiento print para imprimir numaloj y alojamiento
  procedure Print(p_Aloj in Alojamiento%rowtype) is
    begin 
            dbms_output.put_line('Numaloj: ' || p_Aloj.numaloj);
            dbms_output.put_line('Alojamiento: ' || p_Aloj.alojamiento);
    end Print;
BEGIN
  -- Identificar las filas del conjunto activo y preparar el
  -- procesamiento posterior de datos
  v_distanciamax:=11;
  OPEN c_Alojamiento;
  LOOP
    -- Recuperar cada fila del conjunto activo y almacenarlas en
    -- variables PL/SQL
    -- MI: Si no hay más filas no carga nada
    
    --Fetch guarda en un registro tipo rowtype
    FETCH c_alojamiento INTO v_Alojamiento;
   
    -- Si no hay más filas salir de bucle
    EXIT WHEN c_alojamiento%NOTFOUND;
    
    -- Imprime el resultado de la consulta
    Print (v_Alojamiento);

  END LOOP;
  -- Liberar los recursos usados por la consulta
  CLOSE c_alojamiento;
END;
/