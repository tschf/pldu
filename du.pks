create or replace package du
as

    -- Procedure: clean_table
    -- Drop the table and associated sequence. Assumes sequences follows the pattern
    -- of table name appended with `_SEQ`.
    procedure drop_table(
        p_table_name in varchar2
    );

end du;
/
