-- Antes de ejecutar el programa tendríamos que crear la tabla log_table
DROP TABLE log_table;
CREATE TABLE log_table (
  info VARCHAR2(100);
);
DECLARE
  -- Excepción que indica una condición de error.
  e_DemasiadosOficios EXCEPTION;
  -- Número actual de oficios del estudiantes matriculados en HIS-101
  v_CurrentStudents NUMBER(3);
  -- Número máximo de estudiantes permitidos en HIS-101
  v_MaxStudents NUMBER(3);
  -- Código y texto de otros errores de tiempo de ejecución.
  v_ErrorCode log_table.code%TYPE;
  v_ErrorText log_table.message%TYPE;
BEGIN
  /* Hallar el número de estudiantes registrados y el número máximo de alumnos permitidos. */
  SELECT current_students, max_students
  INTO v_CurrentStudents, v_MaxStudents
  FROM classes
  WHERE department = 'HIS' AND course = 101;
  /* Comprobar el número de alumnos en ese curso. */
  IF v_CurrentStudents > v_MaxStudents THEN
  /* Demasiados alumnos matriculados -- generar excepción. */
    RAISE e_TooManyStudents;
  END IF;
EXCEPTION
  WHEN e_TooManyStudents THEN
    /* Rutina de tratamiento que se ejecuta cuando hay demasiados alumnos matriculados en HIS-101.
    Insertará un mensaje que registre lo sucedido. */
    INSERT INTO log_table (info)
    VALUES ('History 101 has ' || v_CurrentStudents ||
    'students: max allowed is ' || v_MaxStudents);
  WHEN OTHERS THEN
    -- Rutina de tratamiento que se ejecuta para el resto de errores.
    v_ErrorCode := SQLCODE;
    -- Observar el uso de SUBSTR.
    v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    INSERT INTO log_table (code, message, info) VALUES
    (v_ErrorCode, v_ErrorText, 'Oracle error occurred');
END;