column username format A12
column sid_serial format a9
column program format A20
select username,status,sid ||','||serial# as sid_serial,program from v$session
where username is not null and username<>'SYS';
