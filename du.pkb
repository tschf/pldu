create or replace package body du
as

    -- find the object count for `p_object_name`
    function obj_count(
        p_object_name in user_objects.object_name%type
    )
    return NUMBER
    as
        l_obj_count NUMBER;
    begin

        select count(1)
        into l_obj_count
        from user_objects
        where object_name = p_object_name;

        return l_obj_count;

    end obj_count;

    procedure drop_table(
        p_table_name in varchar2
    )
    as
        l_table_count NUMBER;
        l_sequence_count NUMBER;

        l_sequence_name user_Sequences.sequence_name%type;
        l_table_name user_tables.table_name%type;
    begin

        l_table_name := upper(p_table_name);
        l_sequence_name := l_table_name || '_SEQ';

        l_table_count := obj_count(l_table_name);

        if l_table_count >= 1
        then
            execute immediate 'drop table ' || l_table_name;
        end if;

        l_sequence_count := obj_count(l_sequence_name);

        if l_sequence_count >= 1
        then
            execute immediate 'drop sequence ' || l_sequence_name;
        end if;


    end drop_table;

end du;
/
