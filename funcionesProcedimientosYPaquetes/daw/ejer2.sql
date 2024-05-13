CREATE OR REPLACE PACKAGE PaqueteExamen AS
    FUNCTION Mostrar RETURN NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY PaqueteExamen AS
        v_contador NUMBER := 0;
    FUNCTION Mostrar RETURN NUMBER IS
    BEGIN
        v_contador := v_contador + 1;
        RETURN v_contador;
    END;
END;

SELECT PaqueteExamen.Mostrar() FROM DUAL;