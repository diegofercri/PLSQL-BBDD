DECLARE
    V_NUMBER NUMBER(5) := 0;
BEGIN
    LOOP
        V_NUMBER := V_NUMBER + 1;
        DBMS_OUTPUT.PUT_LINE(V_NUMBER);
        EXIT WHEN V_NUMBER = 10;
    END LOOP;
END;
/