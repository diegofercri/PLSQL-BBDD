-- Primero vamos a comprobar cómo quedaría el nombre del responsable al añadir S
-- hacemos una prueba con uno
update Alojamiento
set responsable=responsable||'S'
where numaloj=1;
-- Obtendrás un error ya que el campo es de tipo char(25) por lo que el nombre
-- se rellena con blancos hasta llegar a 25, no queda espacio para la S

-- Probamos ahora usando Trim
update Alojamiento
set responsable=trim(responsable)||'S'
where numaloj=1;

select responsable
from Alojamiento
where numaloj=1;
-- Lo dejo como estaba
rollback;
-- MUY IMPORTANTE: Observa cómo aunque de error el primer update, se ejecuta el siguiente
-- Recuerda que no estamos en PL-SQL, si ponemos varios PL-SQL en un fichero .sql el que
-- uno de un error no impide la ejecución del siguiente.