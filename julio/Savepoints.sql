drop table temp_table;
create table temp_table (
  char_col varchar2(20));
BEGIN
  INSERT INTO temp_table(char_col)VALUES('UNO');
  SAVEPOINT A;
  INSERT INTO temp_table(char_col)VALUES('DOS');
  SAVEPOINT B;
  INSERT INTO temp_table(char_col)VALUES('TRES');
  SAVEPOINT C;
  -- OTRAS INSTRUCCIONES
  rollback to b;
  rollback to a;
  COMMIT;
END;
/
select * from temp_table;