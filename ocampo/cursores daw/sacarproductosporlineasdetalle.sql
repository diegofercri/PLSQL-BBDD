DECLARE 
  v_numPedido pls_integer;
  v_cuentaPedido pls_integer;
  v_producto detallepedido.producto%type;

  CURSOR c_cuentaPedido IS
    SELECT numpedido, count(lineadetalle)
    FROM detallepedido
    GROUP BY numpedido
    HAVING count(lineadetalle)>3
    ORDER BY numpedido;
    
  CURSOR c_producto IS
    select producto
    from detallepedido
    where numpedido=v_numpedido;

BEGIN
  OPEN c_cuentaPedido;
  LOOP
    FETCH c_cuentaPedido INTO v_numPedido, v_cuentaPedido;
    EXIT WHEN c_cuentaPedido%NOTFOUND;
    dbms_output.put_line(v_numPedido || ' ' || v_cuentaPedido);
        OPEN c_producto;
            LOOP
                FETCH c_producto into v_producto;
                EXIT WHEN c_producto%NOTFOUND;
                dbms_output.put_line(chr(9) || v_producto);
            END LOOP;
        CLOSE c_producto;
  END LOOP;
  CLOSE c_cuentaPedido;
END;
/