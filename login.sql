set sqlprompt "_USER'@'_CONNECT_IDENTIFIER'➠ '";
set termout off
set serveroutput on size 600
set pagesize 200
set linesize 388
set long 5000
set trimspool on
set tab off
set timing on
set trimout on
set space 1
SET CHARWIDTH 20
SET COLSEP "|"
SET RECSEP WRAPPED
SET RECSEPCHAR "-"
def _editor = vim
ALTER SESSION SET nls_date_format = "mm/dd/yyyy hh24:mi:ss";
