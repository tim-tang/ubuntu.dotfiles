select s.sid,
       s.username,
       optimizer_mode,
       hash_value,
       address,
       cpu_time,
       elapsed_time,
       sql_text
  from v$sqlarea sqlarea, v$session s
 where s.sql_hash_value = sqlarea.hash_value
   and s.sql_address    = sqlarea.address
   and s.username is not null;
