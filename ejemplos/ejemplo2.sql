DECLARE
    V_NUMBER NUMBER(5) := 0;
BEGIN
    LOOP
        V_NUMBER := V_NUMBER + 1;
        DBMS_OUTPUT.PUT_LINE(V_NUMBER);
        IF V_NUMBER = 10 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/