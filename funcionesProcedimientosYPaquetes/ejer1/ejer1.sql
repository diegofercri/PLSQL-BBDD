DECLARE
    V_OFICIO OFICIO%ROWTYPE;
    V_RES BOOLEAN;

    PROCEDURE PRINT( P_RES BOOLEAN, P_OFICIO OFICIO%ROWTYPE ) IS
    BEGIN
        IF P_RES THEN
            DBMS_OUTPUT.PUT_LINE('id=' || P_OFICIO.NUMOFICIO || ' ofi=' || TRIM(P_OFICIO.OFICIO) || ' desc=' || TRIM(P_OFICIO.DESCRIPCION) );
        ELSE
            DBMS_OUTPUT.PUT_LINE('id=' || TRIM(P_OFICIO.OFICIO || ' no existe') );
        END IF;
    END;

    -- Cambio de nombre del oficio 1 de LEÑADOR a PROFESOR
    SELECT * INTO V_OFICIO FROM OFICIO WHERE NUMOFICIO = 1;
    V_OFICIO.OFICIO := 'PROFESOR';
    -- Devuelve true si lo ha podido encontrar
    V_RES := SETOFICIO(V_OFICIO);
    PRINT (V_RES, V_OFICIO);
    -- Hago trampa y digo que es id 30 (no existe)
    V_OFICIO.NUMOFICIO := 30;
    V_RES := SETOFICIO(V_OFICIO);
    PRINT (V_RES, V_OFICIO);
    
END;
/
ROLLBACK;