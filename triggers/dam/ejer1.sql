SET SERVEROUTPUT ON;
DECLARE
    p_tabla VARCHAR2(50) := 'diego';
    v_registros NUMBER;
    
    FUNCTION contar_registros(p_tabla VARCHAR2) RETURN NUMBER IS
        v_registros NUMBER;
    BEGIN
        EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_tabla INTO v_registros;
        RETURN v_registros;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN -1;
    END contar_registros;
    
BEGIN
    v_registros := contar_registros(p_tabla);
    DBMS_OUTPUT.PUT_LINE('La tabla ' || p_tabla || ' tiene ' || v_registros || ' registros.');
END;
/

SET SERVEROUTPUT ON;
DECLARE
    p_tabla VARCHAR2(50) := 'oficio';
    v_registros NUMBER;
    
    FUNCTION contar_registros(p_tabla VARCHAR2) RETURN NUMBER IS
        v_registros NUMBER;
    BEGIN
        EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_tabla INTO v_registros;
        RETURN v_registros;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN -1;
    END contar_registros;
    
BEGIN
    v_registros := contar_registros(p_tabla);
    DBMS_OUTPUT.PUT_LINE('La tabla ' || p_tabla || ' tiene ' || v_registros || ' registros.');
END;
/