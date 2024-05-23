column "OS User" format A8
column "usuario" format A10
column "Nombre" format A10
colum "Tipo" format A8
column "PROCESS" format A11
column "filas" format A5
select substr(a.os_user_name,1,8) "OS User"
,substr(e.username,1,10) "usuario"
, substr(d.used_urec,1,8) "filas"
, substr(b.object_type,1,8) "Tipo"
, substr(b.object_name,1,30) "Nombre"
, e.process "PROCESS"
, e.sid
, e.serial#
from v$locked_object a
, dba_objects b
, dba_rollback_segs c
, v$transaction d
, v$session e
where a.object_id = b.object_id
and a.xidusn = c.segment_id
and a.xidusn = d.xidusn
and a.xidslot = d.xidslot
and d.addr = e.taddr
/
