DECLARE
    V_NUMBER NUMBER(5) := 0;
BEGIN
    WHILE V_NUMBER < 10 LOOP
        V_NUMBER := V_NUMBER + 1;
        DBMS_OUTPUT.PUT_LINE(V_NUMBER);
    END LOOP;
END;
/