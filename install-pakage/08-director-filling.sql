SPOOL log_temp.txt

PROMPT Заполняем таблицу с задачами для примера

INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'engineer'), 'Разработать устройство приёма радиоволн по заказу военных');
INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'engineer'), 'Поменять в УЗПЗП схему закрытия крана на CR5');

INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'technologist'), 'Разработать тех процесс для двухстороннего монтажа КМП');
INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'technologist'), 'Подумать, надо ли закупать новое оборудование для производство');
INSERT INTO DIR_TASKS (Task_ID, Task_User_ID, Task_About)
    VALUES (S_DIR_TASKS.NEXTVAL, (SELECT User_ID FROM AUTH_USERS WHERE User_Login = 'technologist'), 'Оценить коэффициент технологичности имеющихся устройств');

SPOOL off;
quit;