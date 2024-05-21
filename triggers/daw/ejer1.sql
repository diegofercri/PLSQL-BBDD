SET SERVEROUTPUT ON;
DECLARE
    v_table VARCHAR2(30) := 'OFICIOEMPLEADO';
    FUNCTION borraTabla (v_table VARCHAR2) RETURN BOOLEAN IS
        v_sql VARCHAR2(100);
    BEGIN
        v_sql := 'DROP TABLE ' || v_table;
        EXECUTE IMMEDIATE v_sql;      
        RETURN TRUE;
        -- Con este codigo manejamos una excepcion para que si la tabla no existe continue con la ejecucion
        EXCEPTION
            WHEN OTHERS THEN
                IF SQLCODE = -942 THEN
                    RETURN FALSE;
                END IF;
    END;

    BEGIN
        IF borraTabla(v_table) THEN
            DBMS_OUTPUT.PUT_LINE('Tabla borrada');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Tabla no existente');
        END IF;
    END;