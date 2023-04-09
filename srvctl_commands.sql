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
