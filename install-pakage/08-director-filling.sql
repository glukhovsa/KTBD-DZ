SPOOL log_temp.txt

PROMPT Заполняем таблицу с задачами для примера

INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About, Task_Check)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'engineer'), 'Разработать устройство приёма радиоволн по заказу военных', 0);
INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About, Task_Check)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'engineer'), 'Поменять в УЗПЗП схему закрытия крана на CR5', 0);

INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About, Task_Check)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'technologist'), 'Разработать тех процесс для двухстороннего монтажа КМП', 0);
INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About, Task_Check)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'technologist'), 'Подумать, надо ли закупать новое оборудование для производство', 1);
INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About, Task_Check)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'technologist'), 'Оценить коэффициент технологичности имеющихся устройств', 0);

SPOOL off;
quit;