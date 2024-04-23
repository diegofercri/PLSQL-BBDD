DECLARE

v_oficio Oficio%ROWTYPE;

CURSOR c_oficio IS
Select *
From Oficio;
PROCEDURE print(p_oficio Oficio%rowtype) is
  BEGIN
    dbms_output.put_line('Oficio: ' || p_oficio.numoficio || ' ' || p_oficio.oficio || ' ' || p_oficio.descripcion);
    
    
  END ;   
  BEGIN
  OPEN c_oficio;
  LOOP
    FETCH c_oficio INTO v_oficio;
    EXIT WHEN c_oficio%NOTFOUND;
    print(v_oficio);
  END LOOP;
  CLOSE c_oficio;
END;
/