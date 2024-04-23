DECLARE
    TYPE NumTab IS TABLE OF NUMBER;
-- Inicializamos una tabla anidada de 5 elementos
        v_Numbers NumTab := NumTab(-2, -1, 0, 1, 2);
-- Procedimiento local para imprimir la tabla.
-- Observe el uso de FIRST, LAST, and NEXT.
    PROCEDURE Print(p_Table IN NumTab) IS
        v_Index INTEGER;
BEGIN
    v_Index := p_Table.FIRST;
    WHILE v_Index <= p_Table.LAST LOOP
        DBMS_OUTPUT.PUT('Element ' || v_Index || ': ');
        DBMS_OUTPUT.PUT_LINE(p_Table(v_Index));
    v_Index := p_Table.NEXT(v_Index);
END LOOP;
END Print;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Al comienzo, v_Numbers contiene');
    Print(v_Numbers);
-- Borra el elemento 3. Esto borra el '0', pero deja un hueco donde estaba.

    v_Numbers.DELETE(3);
    DBMS_OUTPUT.PUT_LINE('Después de la orden delete, v_Numbers contiene');

    Print(v_Numbers);
-- Añade 2 copias del elemento 1 a la tabla. Añadirá los elementos 6 7.
    v_Numbers.EXTEND(2, 1);
    DBMS_OUTPUT.PUT_LINE('Después de extend, v_Numbers contiene');
    Print(v_Numbers);
    DBMS_OUTPUT.PUT_LINE('v_Numbers.COUNT = ' || v_Numbers.COUNT);
    DBMS_OUTPUT.PUT_LINE('v_Numbers.LAST = ' || v_Numbers.LAST);
END;
/