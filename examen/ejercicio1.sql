DECLARE
 -- Variables de salida para almacenar los resultados de la consulta
    V_STUDENTID STUDENTS.ID%TYPE;
    V_FIRSTNAME STUDENTS.FIRST_NAME%TYPE;
    V_LASTNAME  STUDENTS.LAST_NAME%TYPE;
 -- Variable de acoplamiento utilizada en la consulta
    V_MAJOR     STUDENTS.MAJOR%TYPE := 'Computer Science';
 /* Cursor declaration */
    CURSOR C_STUDENTS IS
    SELECT
        ID,
        FIRST_NAME,
        LAST_NAME
    FROM
        STUDENTS
    WHERE
        MAJOR = V_MAJOR;
BEGIN
 -- Identificar las filas del conjunto activo y preparar el
 -- procesamiento posterior de datos
    OPEN C_STUDENTS;
    LOOP
 -- Recuperar cada fila del conjunto activo y almacenarlas en
 -- variables PL/SQL
        FETCH C_STUDENTS INTO V_STUDENTID, V_FIRSTNAME, V_LASTNAME;
 -- Si no hay más filas salir de bucle
        EXIT WHEN C_STUDENTS%NOTFOUND;
    END LOOP;
 -- Liberar los recursos usados por la consulta
    CLOSE C_STUDENTS;
END;