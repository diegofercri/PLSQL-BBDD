DECLARE
  CURSOR C1 IS SELECT * FROM REGIONS;
  V1 REGIONS%ROWTYPE;
BEGIN
  OPEN C1;
  LOOP
      FETCH C1 INTO  V1;
      EXIT WHEN C1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(V1.REGION_NAME);
  END LOOP;
  CLOSE C1;
END;