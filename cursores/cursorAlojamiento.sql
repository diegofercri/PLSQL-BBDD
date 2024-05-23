SET SERVEROUTPUT ON;
DECLARE
    v_numaloj Alojamiento.numaloj%type;
    v_alojamiento Alojamiento.alojamiento%type;
    -- Variable de acoplamiento utilizada en la consulta
    v_distanciamax Alojamiento.distancia%type;
    -- Si declaras antes el cursor que la variable de acoplamiento da error
    CURSOR c_Alojamiento IS
        SELECT numaloj,alojamiento
        FROM Alojamiento
        WHERE distancia < v_distanciamax
        ORDER BY distancia desc;
BEGIN
    v_distanciamax:=11;
    OPEN c_Alojamiento;
    LOOP
        FETCH c_Alojamiento INTO v_numaloj, v_alojamiento;
        -- No imprimiremos las filas antes del notfound, ya que si lo hacemos la ultima fila aparecera duplicada
        dbms_output.put_line(' Antes del notfound ');
        dbms_output.put_line(v_numaloj||'-'||v_alojamiento);
        EXIT WHEN c_Alojamiento%NOTFOUND;
        dbms_output.put_line(' Después del notfound ');
        dbms_output.put_line(v_numaloj||'-'||v_alojamiento);
    END LOOP;
    CLOSE c_Alojamiento;
END;
/