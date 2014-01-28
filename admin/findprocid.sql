select s.sid, s.serial#, s.username, s.osuser, s.program, s.status
from v$session s, v$process p
where s.PADDR=p.ADDR and SPID=&PID;

