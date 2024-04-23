DECLARE
  CURSOR c_Alojamiento IS
    SELECT *
    FROM Alojamiento
    FOR UPDATE OF responsable
    ORDER BY alojamiento;
BEGIN
  FOR v_alojamiento IN c_Alojamiento LOOP
    dbms_output.put_line('Antes se llamaba '||v_alojamiento.responsable);
    UPDATE Alojamiento
    SET responsable=trim(responsable)||'S'
    WHERE CURRENT OF c_Alojamiento; 
    dbms_output.put_line('Su nuevo nombre'||v_alojamiento.responsable);
    dbms_output.put_line('Actualizados '||SQL%ROWCOUNT||' registros ');
    -- Prueba a poner el commit aquí y obtendrás un error, entre las causas pone
    -- 2) If the cursor has been opened with the FOR UPDATE clause,
    --    fetching after a COMMIT has been issued will return the error.
    -- COMMIT;
  END LOOP;
  -- Poner aquí el commit no da problemas
  COMMIT; 
END;
/