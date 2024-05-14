SET SERVEROUTPUT ON;
SET AUTOCOMMIT OFF;
/* En esta ocasión no vamos a controlar que se produzcan excepciones */
/* NOTA: SI ejecutamos varias veces el programa debe insertar correctamente */
DECLARE
    v_Oficio OFICIO%ROWTYPE;
    PROCEDURE print(p_Oficio OFICIO%ROWTYPE) IS
    BEGIN
        dbms_output.put_line('id='||p_Oficio.NUMOFICIO||' ofi='||trim(p_Oficio.OFICIO)||' desc='||trim(p_Oficio.DESCRIPCION));
    END;
  
    PROCEDURE addOficio(p_Oficio IN OUT OFICIO%rowtype) IS
    BEGIN
        p_Oficio.numoficio := sec_oficio.NEXTVAL;
        INSERT INTO OFICIO (NUMOFICIO, OFICIO, DESCRIPCION) VALUES (p_Oficio.numoficio, p_Oficio.oficio, p_Oficio.descripcion);
    END;

BEGIN
    /* Crear un nuevo Oficio, no pasamos el id por lo que lo debe crear
    el procedimiento usando una secuencia */
    v_Oficio.OFICIO:='pasota';
    v_Oficio.DESCRIPCION:='vamos, que pasa de todo como algunos de clase';
    print(v_Oficio); -- Antes sale sin id
    addOficio(v_Oficio);
    print(v_Oficio); -- Ahora tiene que salir con el id
END;
/
ROLLBACK;