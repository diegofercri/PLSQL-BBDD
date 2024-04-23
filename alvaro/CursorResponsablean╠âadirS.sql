--cursor para recorrer alojamiento con un ForUpdate de responsable y actualizar su valor

DECLARE
    CURSOR c_alojamiento IS
    SELECT
        responsable
    FROM
        alojamiento
    FOR UPDATE OF responsable
    ORDER BY
        alojamiento;

    v_responsable alojamiento.responsable%TYPE;
    v_alojamiento alojamiento%rowtype;
BEGIN
    OPEN c_alojamiento;
    LOOP
        FETCH c_alojamiento INTO v_alojamiento.responsable;
        EXIT WHEN c_alojamiento%notfound;
        v_responsable := trim(v_alojamiento.responsable)
                         || 'S';
        UPDATE alojamiento
        SET
            responsable = v_responsable
        WHERE
            CURRENT OF c_alojamiento;

    END LOOP;

    CLOSE c_alojamiento;
    ROLLBACK;
END;
/

SELECT
    responsable
FROM
    alojamiento
WHERE
    numaloj = 1;

