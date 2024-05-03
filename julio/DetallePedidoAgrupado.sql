DECLARE
  v_pedido DetallePedido%rowtype;
  -- Variable de acoplamiento utilizada en la consulta
  CURSOR c_DetallePedido IS
    select *
    from DetallePedido
    order by numpedido,lineaDetalle;
  v_numpedido DetallePedido.numpedido%type;
  v_cuantos pls_integer;
BEGIN
  v_numpedido:=-1; -- Valor fuera del dominio del problema
  OPEN c_DetallePedido;
  LOOP
    FETCH c_DetallePedido INTO v_pedido;
    EXIT WHEN c_DetallePedido%NOTFOUND;
    if c_DetallePedido%ROWCOUNT=1 then
      v_numpedido:=v_pedido.numpedido;
      v_cuantos:=1;
    else
      if v_pedido.numpedido=v_numpedido then
        v_cuantos:=v_cuantos+1;
      else 
        -- Es distinto
         dbms_output.put_line(v_numpedido||' con '||v_cuantos);
         v_numpedido:=v_pedido.numpedido;
         v_cuantos:=1;
      end if;
    end if;
  END LOOP;
  if c_DetallePedido%ROWCOUNT>0 then 
    dbms_output.put_line(v_numpedido||' con '||v_cuantos);
  end if;
  CLOSE c_DetallePedido;
  
END;
/