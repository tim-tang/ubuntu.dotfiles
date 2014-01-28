declare
    owner_name VARCHAR(10) := '&1';
begin
    select object_name, object_type, status
    from all_objects
    where owner = owner_name and status <> 'VALID'
    order by object_name;
end;
/

