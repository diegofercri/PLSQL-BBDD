undef user
undef ip
GRANT DEBUG ANY PROCEDURE TO &user;
GRANT DEBUG CONNECT SESSION TO &&user;
GRANT EXECUTE ON DBMS_DEBUG_JDWP To &&user;
COMMIT;
-- Here you want to again substitute the HR user with your user doing the debugging
BEGIN
DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
   ( host=>'&ip',
     lower_port=>null,
     upper_port=>null,
     ace=> SYS.XS$ACE_TYPE(privilege_list=>SYS.XS$NAME_LIST('JDWP'),
               principal_name=>'&&user',
               principal_type=>SYS.XS_ACL.PTYPE_DB) 
   );
END;
COMMIT;