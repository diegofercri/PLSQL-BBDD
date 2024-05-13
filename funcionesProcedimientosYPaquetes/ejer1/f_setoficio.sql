CREATE OR REPLACE FUNCTION setOficio (v_oficio OFICIO%ROWTYPE) RETURN BOOLEAN IS
    v_numoficio OFICIO.NUMOFICIO%TYPE;
BEGIN
    SELECT OFICIO.NUMOFICIO INTO v_numoficio FROM OFICIO WHERE NUMOFICIO = v_oficio.NUMOFICIO;
    IF v_numoficio IS NOT NULL THEN
        RETURN TRUE;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;