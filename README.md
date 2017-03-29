# PL/SQL Dev Util

## Motivation

I found when developing a new table, it's useful to be able to quickly drop and recreate said table. Note, a current design pattern my projects follow is that the sequence name is the table name + _SEQ. So, the drop_table procedure follows along from that dropping the table and corresponding sequence following that pattern.

## Install

```
@/path/to/project/du.pks
@/path/to/project/du.pkb
```

## Usage

Here is a possible example scenario:

```
begin
    du.drop_table('EMP');
end;
/

create table EMP(
    ID NUMBER PRIMARY KEY,
    EMPNO VARCHAR2(20),
    ENAME VARCHAR2(200),
    SAL NUMBER
);

create sequence EMP_SEQ;

create or replace trigger BI_EMP
before insert on EMP
for each row
begin
    :NEW.ID := EMP_SEQ.nextval;
end BI_EMP;
/
```
## License

The Unlicense - do with this what you will :)

## Author

Trent Schafer
