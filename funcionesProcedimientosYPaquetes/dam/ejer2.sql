CREATE OR REPLACE PACKAGE PaqueteExamen AS
    FUNCTION Biestable RETURN NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY PaqueteExamen AS
        v_contador NUMBER := 0;
    FUNCTION Biestable RETURN NUMBER IS
    BEGIN
        v_contador := 1 - v_contador;
        RETURN v_contador;
    END;
END;

SELECT PaqueteExamen.Biestable() FROM DUAL;
