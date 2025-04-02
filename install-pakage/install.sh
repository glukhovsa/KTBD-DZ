#!/bin/bash
sqlplus SYS/root@//localhost:1521/FREE as SYSDBA @00-preparing.sql
grep . log_temp.txt > installing_log.txt
echo '' >> installing_log.txt

sqlplus admin_user/root1@//localhost:1521/FREE @01-authrization.sql
grep . log_temp.txt >> installing_log.txt
echo '' >> installing_log.txt

sqlplus admin_user/root1@//localhost:1521/FREE @02-technologist.sql
grep . log_temp.txt >> installing_log.txt
echo '' >> installing_log.txt

sqlplus admin_user/root1@//localhost:1521/FREE @03-technologist-filling.sql
grep . log_temp.txt >> installing_log.txt
echo '' >> installing_log.txt

sqlplus admin_user/root1@//localhost:1521/FREE @04-engineer.sql
grep . log_temp.txt >> installing_log.txt
echo '' >> installing_log.txt

sqlplus admin_user/root1@//localhost:1521/FREE @05-engineer-filling.sql
grep . log_temp.txt >> installing_log.txt
echo '' >> installing_log.txt

sqlplus admin_user/root1@//localhost:1521/FREE @06-engineer-help.sql
grep . log_temp.txt >> installing_log.txt
echo '' >> installing_log.txt

sqlplus SYS/root@//localhost:1521/FREE as SYSDBA @07-create-users.sql
grep . log_temp.txt >> installing_log.txt
echo '' >> installing_log.txt

rm log_temp.txt

echo "------------------- Вывод ошибок установки ---------------------"
cat installing_log.txt | grep ORA-