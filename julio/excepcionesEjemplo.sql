-- Antes de ejecutar el programa tendríamos que crear la tabla log_table
DROP TABLE log_table;
CREATE TABLE log_table (
  code NUMBER(3),
  message VARCHAR2(200),
  info VARCHAR2(200)
);
DECLARE
  -- Excepción que indica una condición de error.
  e_DemasiadosOficios EXCEPTION;
  -- Número actual de oficios del empleado de id número 11
  v_OficiosActuales NUMBER(3);
  -- Número máximo de oficios permitidos
  v_MaxOficios NUMBER(3);
  -- Código y texto de otros errores de tiempo de ejecución.
  v_ErrorCode log_table.code%TYPE;
  v_ErrorText log_table.message%TYPE;
BEGIN
  -- Defino como máximo 2 oficios por empleado/a
  v_MaxOficios:=2;
  -- Obtener el número de oficios del empleado 11
  SELECT count(*) INTO v_OficiosActuales
  FROM OficioEmpleado
  WHERE empleado=11; 
  IF v_OficiosActuales > v_MaxOficios THEN
    -- Demasiados oficios
    RAISE e_DemasiadosOficios;
  END IF;
EXCEPTION
  WHEN e_DemasiadosOficios THEN
    -- Registro el evento
    INSERT INTO log_table (info) VALUES (' El empleado 11 tiene '||v_OficiosActuales||' oficios');
  WHEN OTHERS THEN
    -- Rutina de tratamiento que se ejecuta para el resto de errores.
    v_ErrorCode := SQLCODE;
    -- Observar el uso de SUBSTR.
    v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    INSERT INTO log_table (code, message, info) VALUES
    (v_ErrorCode, v_ErrorText, 'Oracle error occurred');
END;
/
commit;
select info from log_table;
