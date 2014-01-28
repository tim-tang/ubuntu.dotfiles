
select
    used.tablespace_name,
    used.bytes bytes_used,
    free.bytes bytes_free,
    used.bytes/1e9 gb_used,
    free.bytes/1e9 gb_free
from
    (
        select tablespace_name, sum(bytes) bytes
        from dba_data_files
        group by tablespace_name
    ) used,
    (
        select tablespace_name, sum(bytes) bytes, max(bytes) largest
        from dba_free_space
        group by tablespace_name
    ) free
where
    used.tablespace_name = free.tablespace_name
order by gb_used desc;

