#!/bin/bash
sqlplus SYS/root@//localhost:1521/FREE as SYSDBA @00-preparing.sql
sqlplus admin_user/root1@//localhost:1521/FREE @01-authrization.sql
sqlplus admin_user/root1@//localhost:1521/FREE @02-engineer.sql
sqlplus admin_user/root1@//localhost:1521/FREE @03-engineer-filling.sql
sqlplus admin_user/root1@//localhost:1521/FREE @04-engineer-help.sql
sqlplus SYS/root@//localhost:1521/FREE as SYSDBA @05-create-users.sql