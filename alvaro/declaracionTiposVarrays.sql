declare

--algunos tipos varray válidos.
--lista de numeros no nulos.
type NumberList is VARRAY(10) of number not null;

--una lista de regitros PL/SQL
type StudentList is varray(100) of students%rowtype;

--lista de objetos
type ObjectList is varray(25) of MyObject;

begin 
    null;
end;