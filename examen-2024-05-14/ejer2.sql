CREATE OR REPLACE PACKAGE PaqueteExamen AS
    FUNCTION cuantoTiempo RETURN NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY PaqueteExamen AS
        v_fecha DATE := SYSDATE();
        v_segundos NUMBER;
    FUNCTION cuantoTiempo RETURN NUMBER IS
    BEGIN
        v_segundos := (SYSDATE() - v_fecha) * 24 * 60 * 60;
        v_fecha := SYSDATE();
        RETURN v_segundos;
    END;
END;

SELECT PaqueteExamen.cuantoTiempo() FROM DUAL;