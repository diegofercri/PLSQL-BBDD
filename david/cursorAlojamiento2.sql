DECLARE
    -- Declarar variables
  v_alojamiento Alojamiento.alojamiento%TYPE;
  v_num_emp NUMBER;
  -- Almacenar numero maximo de empleados en el bucle
  v_max_emp NUMBER := 0;
  -- Almacenar alojamiento con mas empleados en el bucle
  v_alojamiento_max Alojamiento.alojamiento%TYPE;
  
  -- Consulta con el count 
  CURSOR c_alojamiento IS
    SELECT A.alojamiento, COUNT(E.numemp) AS num_emp
    FROM Alojamiento A
    JOIN Empleado E ON A.numaloj = E.alojamiento
    GROUP BY A.alojamiento;
    --ORDER BY num_emp DESC;
BEGIN
  OPEN c_alojamiento;
  LOOP
    FETCH c_alojamiento INTO v_alojamiento, v_num_emp;
    EXIT WHEN c_alojamiento%NOTFOUND;

    -- Mostrar resultado por pantalla
    DBMS_OUTPUT.PUT_LINE('En el alojamiento "' || v_alojamiento || '" se alojan ' || v_num_emp || ' empleados.');
    
    -- Actualizar alojamiento con más empleados si es necesario
    IF v_num_emp > v_max_emp THEN
      v_max_emp := v_num_emp;
      v_alojamiento_max := v_alojamiento;
    END IF;
  END LOOP;
  
  -- Mostrar el alojamiento con más empleados al final del recorrido
  DBMS_OUTPUT.PUT_LINE('El alojamiento con más empleados es "' || v_alojamiento_max || '" con ' || v_max_emp || ' empleados.');
  
  CLOSE c_alojamiento;
END;
/
