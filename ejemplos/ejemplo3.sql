DECLARE
    TYPE T_BONOLOTO IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
    V_BONOLOTO T_BONOLOTO;
BEGIN
    V_BONOLOTO(3) := TRUE;
    IF V_BONOLOTO(3) THEN
        DBMS_OUTPUT.PUT_LINE('TRUE');
    END IF;
END;
/