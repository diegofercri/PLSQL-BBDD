DECLARE
  v_numemp pls_integer;
  v_numemp_max pls_integer;
  v_oficio_max Oficio.oficio%type;
  -- Registro de Oficio 
  v_Oficio Oficio%rowtype;
  -- declaración del cursor
  -- Si declaras antes el cursor que la variable de acoplamiento da error
  CURSOR c_Oficio IS
    SELECT *
    FROM Oficio;
    
    -- Procedimiento print para imprimir numaloj y alojamiento
  procedure Print(p_Oficio in Oficio%rowtype) is
    begin 
            dbms_output.put_line('Oficio: ' || p_Oficio.numoficio || ' ' || p_Oficio.oficio || 'tiene ' || v_numemp || ' empleados');
    end Print;
BEGIN
    v_numemp_max:=0;
  OPEN c_Oficio;
  LOOP    
    --Fetch guarda en un registro tipo rowtype
    FETCH c_Oficio INTO v_Oficio;
   
    -- Si no hay más filas salir de bucle
    EXIT WHEN c_Oficio%NOTFOUND;
   
    select count(*) cuantos into v_numemp
    from oficioempleado
    where oficio = v_oficio.numoficio;
    -- Imprime el resultado de la consulta
    Print (v_Oficio);
    
    if v_numemp > v_numemp_max THEN
        v_numemp_max := v_numemp;
        v_oficio_max := v_Oficio.oficio;
        END IF;        
  END LOOP;
    dbms_output.put_line('El oficio con más empleados es ' || v_oficio_max || ' con ' || v_numemp_max || ' empleados.');
  -- Liberar los recursos usados por la consulta
  CLOSE c_Oficio;
END;
/