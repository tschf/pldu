#!/bin/bash
${ORACLE_HOME}/bin/sqlplus -S -L scott/tiger @test.sql

exit $?
