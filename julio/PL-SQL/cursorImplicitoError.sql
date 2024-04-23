DECLARE
  v_valor pls_integer;
  TYPE t_valores IS TABLE OF A.valor%type INDEX BY pls_integer;
  v_valores t_valores;
BEGIN
  -- Me equivoco y obtengo mas de una fila
  -- lanzará una excepción, comenta este select para poder seguir
  /*SELECT valor into v_valor
  FROM A
  WHERE VALOR<7;*/
  -- Pues lo cargo en una tabla indexada 
  -- tampoco se puede hacer de esta forma
  -- lanzará una excepción, comenta el select para seguir
  /*SELECT valor into v_valores
  FROM A
  WHERE VALOR<7;*/
  -- De esta forma sí se puede pero sólo desde la versión 10g 
  SELECT valor BULK COLLECT INTO v_valores
  FROM A
  WHERE VALOR<7;
  dbms_output.put_line('Recuperadas '||SQL%ROWCOUNT||' filas ');
  -- No llegamos a ejecutar el if porque el select genera excepción
  SELECT valor INTO v_valor
  FROM A
  WHERE VALOR>7;
  IF SQL%NOTFOUND THEN
    dbms_output.put_line(' No he encontrado la fila ');
  END IF;
END;
/