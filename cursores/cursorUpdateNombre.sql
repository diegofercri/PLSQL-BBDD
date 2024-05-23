SET SERVEROUTPUT ON;
SET AUTOCOMMIT OFF;

SELECT responsable FROM alojamiento WHERE numaloj=1;

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
            UPDATE Alojamiento
            -- Añado una S al final del nombre de responsable
            SET responsable=TRIM(responsable)||'S' WHERE CURRENT OF c_Alojamiento;

            -- O también de esta otra
            -- Añado una S al final del nombre de responsable
            v_responsable:=TRIM(v_Alojamiento.responsable)||'S';
            UPDATE Alojamiento
            SET responsable=v_responsable WHERE CURRENT OF c_Alojamiento;

        END LOOP;
    CLOSE c_Alojamiento;
END;
/

SELECT responsable FROM alojamiento WHERE numaloj=1;

ROLLBACK;