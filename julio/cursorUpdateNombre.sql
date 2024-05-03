-- Procedamos ahora con el cursor
DECLARE
  CURSOR c_Alojamiento IS
    SELECT responsable
    FROM Alojamiento
    WHERE numaloj=1 -- para probar vale con uno
    FOR UPDATE OF responsable; -- Probar con y sin NOWAIT
  v_responsable Alojamiento.responsable%type;
  v_Alojamiento Alojamiento%rowtype;
BEGIN
  OPEN c_Alojamiento;
  LOOP
    FETCH c_Alojamiento INTO v_Alojamiento.responsable;
    EXIT WHEN c_Alojamiento%NOTFOUND;
    -- Pongo dos formas de actualizar, comenta la que no quieras probar
    -- Puedo actualizar de esta forma
    update Alojamiento
    set responsable=trim(responsable)||'S'
    where current of c_Alojamiento;
    -- O también de esta otra
    v_responsable:=trim(v_Alojamiento.responsable)||'S';
    /*update Alojamiento
    set responsable=v_responsable
    where current of c_Alojamiento;*/
  END LOOP;
  CLOSE c_Alojamiento;
END;
/
select responsable 
from Alojamiento
where numaloj=1;
rollback;