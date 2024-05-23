DECLARE
    v_name empleado.nombre%type;
    v_numemp empleado.numemp%type;
    v_oficio oficio%rowtype;
    v_cuantos PLS_INTEGER;
    
   
    CURSOR c_emp IS 
        select nombre,numemp
        from empleado
        order by 1;
   CURSOR c_oficio(p_num empleado.numemp%type) IS
    SELECT o.*
        FROM oficio o left join oficioempleado oe on o.numoficio=oe.oficio
        WHERE oe.empleado=p_num
        ORDER BY 1;
    CURSOR c_cuantos(p_cuantos oficio.numoficio%type) IS
        select count(*)
        from  oficio o join oficioempleado oe on o.numoficio=oe.oficio
        WHERE numoficio=p_cuantos;

BEGIN
    
    OPEN c_emp;
        LOOP
            FETCH c_emp INTO v_name,v_numemp;
            EXIT WHEN c_emp%notfound;
            dbms_output.put_line(v_name);
                OPEN c_oficio(v_numemp);
                    LOOP
                        FETCH c_oficio INTO v_oficio;
                        EXIT WHEN c_oficio%NOTFOUND;
                       
                        OPEN c_cuantos(v_oficio.numoficio);
                            
                            LOOP
                                FETCH c_cuantos INTO v_cuantos;
                                EXIT WHEN c_cuantos%NOTFOUND;
                                dbms_output.put_line(chr(9) || v_oficio.oficio || 'CANTIDAD: '||v_cuantos); 
                            END LOOP;
                        CLOSE c_cuantos;
                    END LOOP;
                    IF c_oficio%rowcount=0 THEN
                                 dbms_output.put_line(chr(9) || 'VIVE DE LA PSOE');
                                 END IF; 
                CLOSE c_oficio;  
        END LOOP;
    CLOSE c_emp;


END;


--sacar oficio por empleado y cuantos 
--si vive del psoe poner paguita



