var bind_variable number;

BEGIN
    :bind_variable := '1';
END;
/

print bind_variable;

SELECT COUNT(*) FROM OFICIOEMPLEADO, EMPLEADO WHERE EMPLEADO.NUMEMP = :bind_variable;
INTO v_cuantas
USING 1;