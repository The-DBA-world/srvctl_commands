-- SYNTAX FOR STOP DB
--- srvctl stop database -d db_name [-o stop_options] where stop_options is normal/immediate(default)/transactional/abort
e.g
srvctl stop database -d PRODB -o normal
srvctl stop database -d PRODB -o immediate
srvctl stop database -d PRODB -o transactional
srvctl stop database -d PRODB -o abort

-- SYNTAX FOR START DB
-- srvctl start database -d db_name [-o start_options] where start_option is nomount/mount/open(default)

e.g 
srvctl start database -d PRODB -o nomount
srvctl start database -d PRODB -o mount
srvctl start database -d PRODB -o open

SYNTAX FOR REMOVING DB SERVICE: 
---srvctl remove database -d db_unique_name [-f] [-y] [-v]
e.g:
srvctl remove database -d PRODB -f -y

SYNTAX FOR ADDING DB SERVICE :
-- srvctl add database -d db_unique_name -o ORACLE_HOME  [-p spfile]
e.g:
srvctl add database -d PRODB -o /u01/app/oracle/product/12.1.0.2/dbhome_1 -p +DATA/PRODDB/parameterfile/spfilePRODB.ora

SYNTAX FOR REMOVING INSTANCE
---srvctl remove instance -d DB_UNIQUE_NAME -i INSTANCE_NAME
e.g
srvctl remove instance -d PRODB - I PRODB1

SYNTAX FOR ADDING INSTANCE 
--- srvctl add instance –d db_unique_name –i inst_name -n node_name
e.g
srvctl add instance -d PRODB - i PRODB1 -n rachost1

SYNTAX FOR STOPPING INSTANCE
-- srvctl stop instance -d db_unique_name [-i "instance_name_list"]} [-o stop_options] [-f]
e.g
srvctl stop instance -d PRODB  -i PRODB1 

SYNTAX FOR STARTING INSTANCE
-- srvctl start instance -d db_unique_name  [-i "instance_name_list"} [-o start_options]
e.g
srvctl start instance -d PRODB -i PRODB1 

-- ENABLE - Reenables management by Oracle Restart for a component.
-- DISABLE - Disables management by Oracle Restart for a component.

srvctl enable instance -d DB_UNIQUE_NAME-i INSTANCE_NAME
srvctl disable instance -d DB_UNIQUE_NAME-i INSTANCE_NAME
srvctl enable database -d DB_UNIQUE_NAME
srvctl disable database -d DB_UNIQUE_NAME

SYNTAX -

srvctl relocate service -d  {database_name}  -s  {service_name}  -i  {old_inst_name}  -r  {new_inst_name}

EXAMPLE:(Relocating service PRDB_SRV from PREDB2 to PREDB1)

srvctl relocate service -d PREDB -s PRDB_SVC -i PREDB2 -t PREDB1

Check the status of service

srvctl status service -d PREDB -s PRDB_SVC

SYNTAX:
---------
srvctl start service -d {DB_NAME} -s {SERVICE_NAME}
srvctl stop service -d {DB_NAME} -s {SERVICE_NAME}

EXAMPLE:
---------------
srvctl start service -d PREDB -s PRDB_SRV
srvctl stop service -d PREDB -s PRDB_SRV

ADDING A SERVICE:
--------------------
SYNTAX:
------------
srvctl add service -d {DB_NAME} -s {SERVICE_NAME} -r {"preferred_list"} -a {"available_list"} [-P {BASIC | NONE | PRECONNECT}]

EXAMPLE:
---------------
srvctl add service -d PREDB -s PRDB_SRV -r "PREDB1,PREDB2" -a "PREDB2" -P BASIC

REMOVING A SERVICE:
------------------------------------------

SYNTAX:
-------------
srvctl remove service -d {DB_NAME} -s {SERVICE_NAME}

EXAMPLE:
--------
srvctl remove service -d PREDB -s PRDB_SRV


-- set this to enable trace at os

SRVM_TRACE=true
export SRVM_TRACE

-- run any srvctl command
srvctl status database -d ORACL

-- setenv to set env variables.(ORCL is the db_unique_name)

srvctl setenv database -db ORCL -env "ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome_1"
srvctl setenv database -db ORCL -env "TNS_ADMIN=/oracle/app/oracle/product/12.1.0.2/dbhome_1/network/admin"

--getenv to view the env setting:

srvctl getenv database -db ORCL

--asm config using srvctl
srvctl config asm

srvctl config asm -detail
