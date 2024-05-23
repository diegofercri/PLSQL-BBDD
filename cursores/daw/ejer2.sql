SET SERVEROUTPUT ON;

DECLARE
    v_DetallePedido DETALLEPEDIDO.NUMPEDIDO%type;
    v_LineaDetalle DETALLEPEDIDO%rowtype;

    v_subtotal NUMBER := 0;
    v_total NUMBER := 0;

    CURSOR c_DetallePedido IS
        SELECT NUMPEDIDO
        FROM DETALLEPEDIDO
        GROUP BY NUMPEDIDO;

    CURSOR c_LineaDetalle (p_NumPedido DETALLEPEDIDO.NUMPEDIDO%type) IS
        SELECT *
        FROM DETALLEPEDIDO
        WHERE NUMPEDIDO = p_NumPedido;

BEGIN
    OPEN c_DetallePedido;
        LOOP
            FETCH c_DetallePedido INTO v_DetallePedido;
            EXIT WHEN c_DetallePedido%NOTFOUND;
            dbms_output.put_line('PEDIDO:' || chr(9) || v_DetallePedido);
            OPEN c_LineaDetalle (v_DetallePedido);
                LOOP
                    FETCH c_LineaDetalle INTO v_LineaDetalle;
                    EXIT WHEN c_LineaDetalle%NOTFOUND;
                    v_subtotal := v_LineaDetalle.PRECIOACTUAL * v_LineaDetalle.CANTIDAD;
                    dbms_output.put_line(chr(9) || chr(9) || chr(9) || v_subtotal);
                    v_total := v_total + v_subtotal;
                END LOOP;
                    dbms_output.put_line('TOTAL:' || chr(9) || chr(9) || chr(9) || v_total);
                    v_total := 0;
            CLOSE c_LineaDetalle;
        END LOOP;
    CLOSE c_DetallePedido;
END;
/
