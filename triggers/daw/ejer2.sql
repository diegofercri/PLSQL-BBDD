CREATE OR REPLACE TRIGGER tr_excelente 
BEFORE INSERT ON OFICIOEMPLEADO
FOR EACH ROW
DECLARE
    v_contador NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_contador
    FROM OFICIOEMPLEADO
    WHERE EMPLEADO = :NEW.EMPLEADO;

    IF v_contador >= 2 THEN
        :NEW.CALIFICACION := 'EXCELENTE';
    END IF;
END;
/

SET AUTOCOMMIT OFF;
INSERT INTO OFICIOEMPLEADO (EMPLEADO, OFICIO) VALUES (11, 4);
SELECT * FROM OFICIOEMPLEADO WHERE EMPLEADO = 11;
ROLLBACK;