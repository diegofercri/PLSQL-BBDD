DECLARE 
BEGIN
  UPDATE A
  SET VALOR=3
  WHERE VALOR=2;
  IF SQL%NOTFOUND THEN
    dbms_output.put_line('No he podido actualizar ninguna fila');
    dbms_output.put_line('Actualizadas '||SQL%ROWCOUNT||' filas ');
  END IF;
  -- Ejecuta el programa sin poner el commit o sin pulsar en commit en Developer
  -- obtendrás un error de operación paralela no permitida
  COMMIT;
END;
/