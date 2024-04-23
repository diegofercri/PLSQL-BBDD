DROP TABLE TRABAJADOR CASCADE CONSTRAINTS;
CREATE TABLE TRABAJADOR(
COD_EMP NUMBER(4),
NOMBRE VARCHAR2(15),
COD_JEFE NUMBER(4),
CONSTRAINT PK_TRABAJADOR
  PRIMARY KEY(COD_EMP),
CONSTRAINT FK_TRABAJADOR_COD_EMP
  FOREIGN KEY(COD_JEFE) REFERENCES TRABAJADOR(COD_EMP)
); 
insert into trabajador values(7839,'KING',NULL);
insert into trabajador values(7698,'BLAKE',7839);
insert into trabajador values(7782,'CLARK',7839);
insert into trabajador values(7566,'JONES',7839);
insert into trabajador values(7654,'MARTIN',7698);
insert into trabajador values(7499,'ALLEN',7698);
insert into trabajador values(7844,'TURNER',7698);
insert into trabajador values(7900,'JAMES',7698);
insert into trabajador values(7521,'WARD',7698);
insert into trabajador values(7902,'FORD',7566);
insert into trabajador values(7369,'SMITH',7902);
insert into trabajador values(7788,'SCOTT',7566);
insert into trabajador values(7876,'ADAMS',7788);
insert into trabajador values(7934,'MILLER',7782);
COMMIT;