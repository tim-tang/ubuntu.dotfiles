set sqlprompt "_USER'@'_CONNECT_IDENTIFIER'➠ '";
set termout off
set serveroutput on size unlimited
set pagesize 50000
set linesize 135
set long 50000
set trimspool on
set tab off
set timing on
set trimout on
def _editor = vim
ALTER SESSION SET nls_date_format = "mm/dd/yyyy hh24:mi:ss";
