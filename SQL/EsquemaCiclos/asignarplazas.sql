create or replace PROCEDURE ASIGNAPLAZAS AS

 CURSOR C_SOL(P_ESTU ESTUDIANTE.IDESTUDIANTE%TYPE) IS
 SELECT * 
 FROM SOLICITA
 WHERE IDESTUDIANTE=P_ESTU
 ORDER BY PREFERENCIA;
 CURSOR C_EST IS
 SELECT *
 FROM ESTUDIANTE
 ORDER BY NOTAMEDIA DESC,NOMBRE;
 V_ESTU ESTUDIANTE%ROWTYPE;  
 V_SOL SOLICITA%ROWTYPE;
 TOTALPLAZAS NUMBER;
 SINPLAZA BOOLEAN;
 PLAZASCICLOOFERTADAS NUMBER;
 PLAZASCICLOASIGNADAS NUMBER;
BEGIN

  SELECT SUM(PLAZAS)
  INTO TOTALPLAZAS     -- TOTAL PLAZAS OFERTADAS.
  FROM OFERTAEDUCATIVA;
  DELETE FROM 
  ASIGNACION;
  COMMIT;
  
  OPEN C_EST;
  FETCH C_EST INTO V_ESTU;
  
  WHILE C_EST%FOUND AND TOTALPLAZAS>0 LOOP  -- MIENTRAS HAYA ESTUDIANTES Y PLAZAS POR CUBRIR
    OPEN C_SOL(V_ESTU.IDESTUDIANTE); -- ABRIMOS LAS PETICIONES DEL ESTUDIANTE EN CURSO
    FETCH C_SOL INTO V_SOL;
    SINPLAZA:=TRUE;
    
    WHILE C_SOL%FOUND AND SINPLAZA LOOP
      SELECT PLAZAS       -- OFERTA DE PLAZAS DEL CICLO SOLICITADO
      INTO PLAZASCICLOOFERTADAS
      FROM OFERTAEDUCATIVA
      WHERE IDIES=V_SOL.IDIES AND IDCICLO=V_SOL.IDCICLO
            AND IDTURNO=V_SOL.IDTURNO;
            
      SELECT COUNT(*)
      INTO PLAZASCICLOASIGNADAS  -- PLAZAS YA ASIGNADAS
      FROM ASIGNACION
      WHERE IDIES=V_SOL.IDIES AND IDCICLO=V_SOL.IDCICLO
            AND IDTURNO=V_SOL.IDTURNO; 
            
      IF PLAZASCICLOASIGNADAS<PLAZASCICLOOFERTADAS THEN  -- SI QUEDAN PLAZAS POR ASIGNAR
         SINPLAZA:=FALSE;
         TOTALPLAZAS:=TOTALPLAZAS-1;
         INSERT INTO ASIGNACION     -- HA CONSEGUIDO PLAZA
         VALUES(V_SOL.IDESTUDIANTE,V_SOL.IDIES,V_SOL.IDCICLO,V_SOL.IDTURNO);
         COMMIT;
         
      ELSE
      
        FETCH C_SOL INTO V_SOL; -- SIGUIENTE SOLICITUD DEL ESTUDIANTE
      END IF;
      
    END LOOP;
    CLOSE C_SOL;  
    FETCH C_EST INTO V_ESTU;
   END LOOP;  
  CLOSE C_EST;
  COMMIT;
END;