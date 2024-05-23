/* En esta ocasión no vamos a controlar que se produzcan excepciones */
/* NOTA: SI ejecutamos varias veces el programa debe insertar correctamente */
declare
  v_Oficio Oficio%rowtype;
  procedure print(p_Oficio Oficio%rowtype) is
    begin
      dbms_output.put_line('id='||p_Oficio.numoficio||' ofi='||trim(p_Oficio.oficio)||' desc='||trim(p_Oficio.descripcion));
    end;
begin
  /* Crear un nuevo Oficio, no pasamos el id por lo que lo debe crear
  el procedimiento usando una secuencia */
  v_Oficio.oficio:='pasota';
  v_Oficio.descripcion:='vamos, que pasa de todo como algunos de clase';
  print(v_oficio); -- Antes sale sin id
  addOficio(v_Oficio);
  print(v_oficio); -- Ahora tiene que salir con el id
end;
/
rollback;