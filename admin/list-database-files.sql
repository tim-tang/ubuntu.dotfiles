select file_name, tablespace_name, status,
    bytes/1000000 as MB, maxbytes/1000000 as MB_max
from dba_data_files;
