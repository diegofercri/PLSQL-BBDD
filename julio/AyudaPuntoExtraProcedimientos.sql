/* Antes de la ejecución del programa tenemos que tener creada la secuencia */
declare
  v_Empleado Empleado%rowtype;
  v_aux Empleado%rowtype;
  v_newId pls_integer;
  procedure imprime(p_Empleado Empleado%rowtype) is
    begin
      dbms_output.put('Empleado con id:'||p_empleado.numemp);
      dbms_output.put(' Nombre:'||trim(p_empleado.nombre));
      dbms_output.put_line(' Edad:'||p_empleado.edad);
      -- p_empleado.numemp:=17; -- Si descomentas esto da error al usar modo IN
    end;
  procedure cargoIdModoOUT(p_Empleado OUT Empleado%rowtype,p_id pls_integer) is
   begin
      p_empleado.numemp:=p_id; 
   end;
  procedure cargoIdModoINOUT(p_Empleado IN OUT Empleado%rowtype,p_id pls_integer) is
   begin
      p_empleado.numemp:=p_id; 
   end;
begin
  -- Inserción
  v_Empleado.nombre:='Juan';
  v_Empleado.edad:=17;
  -- CUIDADO: Ésto sólo se puede usar desde la versión 11g sino hacer select into from dual
  /* select seq_empleado_id.nextval into v_newid from dual; */
  v_newId:=seq_empleado_id.nextval;
  Insert into Empleado (numemp,nombre,edad) values (v_newId,v_Empleado.nombre,v_Empleado.edad);
  dbms_output.put_line('El id no está todavía en el registro pero si en la BD ');
  imprime(v_Empleado);
  
  v_aux:=v_Empleado; -- Hago una copia
  dbms_output.put_line('SI lo cargo con el procedure modo OUT esto es lo que se queda ');
  cargoIdModoOUT(v_aux,v_newId);
  imprime(v_aux);
  
  dbms_output.put_line('SI lo cargo con el procedure modo IN OUT esto es lo que se queda ');
  v_aux:=v_Empleado;
  cargoIdModoINOUT(v_aux,v_newId);
  imprime(v_aux);
  
  -- Selección, aquí no se puede usar la sequencia en el where
  select * into v_Empleado
  from Empleado
  where numemp=v_newId;
  dbms_output.put_line('SI recuperamos de la BD si está el id ');
  imprime(v_Empleado);
end;
/
-- Aunque hagas rollback, el número de secuencia se pierde
rollback;
  