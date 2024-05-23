declare
  v_Oficio Oficio%rowtype;
  v_res boolean;
  procedure print(p_res boolean,p_Oficio Oficio%rowtype) is
    begin
      if p_res then 
        dbms_output.put_line('id='||p_Oficio.numoficio||' ofi='||trim(p_Oficio.oficio)||' desc='||trim(p_Oficio.descripcion));
      else 
        dbms_output.put_line('id='||p_Oficio.numoficio||' no existe ');
      end if;
    end;
begin
  -- Cambio de nombre del oficio 1 de LEÑADOR a PROFESOR
  select * into v_Oficio from Oficio where numoficio=1;
  v_Oficio.oficio:='PROFESOR';
  -- Devuelve true si lo ha podido cambiar
  v_res:=setOficio(v_Oficio);
  print(v_res,v_Oficio);
  -- Hago trampa y digo que es id 30 (no existe)
  v_Oficio.numoficio:=30;
  v_res:=setOficio(v_Oficio);
  print(v_res,v_Oficio); 
end;
/
rollback;