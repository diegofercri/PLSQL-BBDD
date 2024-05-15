DECLARE
    v_table VARCHAR2(30) := 'Diego';
    v_sql VARCHAR2(100);
BEGIN
    BEGIN
        v_sql := 'DROP TABLE ' || v_table;
        EXECUTE IMMEDIATE v_sql;
    -- Con este codigo manejamos una excepcion para que si la tabla no existe continue con la ejecucion
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN
                RAISE;
            END IF;
    END;
    v_sql := 'CREATE TABLE ' || v_table || ' (id NUMBER)';
    EXECUTE IMMEDIATE v_sql;
    v_sql := 'INSERT INTO ' || v_table || ' VALUES (2)';
    EXECUTE IMMEDIATE v_sql;
END;
/

SELECT * FROM DIEGO;
DROP TABLE DIEGO;