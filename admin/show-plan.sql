set linesize 100;
set pagesize 0;
set markup html preformat on;
select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));
