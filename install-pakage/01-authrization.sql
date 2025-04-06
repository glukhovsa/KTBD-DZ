SPOOL log_temp.txt
PROMPT Модуль авторизации:
PROMPT Создаём таблицу пользователей

CREATE TABLE AUTH_USERS (
    User_ID         NUMBER      NOT NULL,
    User_Login      VARCHAR(255) NOT NULL,
    User_Name       VARCHAR(255) NOT NULL,
    User_Last_Name  VARCHAR(255) NOT NULL,
    User_Password   VARCHAR(255) NOT NULL,
    User_Phone      VARCHAR(15) NULL,
    User_Email      VARCHAR(50) NULL,
    User_Role       VARCHAR(20) NOT NULL
);

ALTER TABLE AUTH_USERS
    ADD CONSTRAINT C_AUTH_USERS_PK PRIMARY KEY ( User_ID );
ALTER TABLE AUTH_USERS
    ADD CONSTRAINT C_User_Role_CHK CHECK ( User_Role = 'admin' OR 
                                            User_Role = 'director' OR 
                                            User_Role = 'technologist' OR 
                                            User_Role = 'engineer' OR
                                            User_Role = 'guest');

CREATE SEQUENCE S_AUTH_USERS INCREMENT BY 1 START WITH 1;

INSERT INTO AUTH_USERS (
    User_ID, User_Login, User_Name, User_Last_Name, User_Password, User_Phone, User_Email, User_Role)
    VALUES (S_AUTH_USERS.NEXTVAL, 'gluhx', 'Степан', 'Глухов', '085ccfa329241ca2f35b684caf376e1f', 
        '+79254144429', 'stepa.gl@yandex.ru', 'admin');

INSERT INTO AUTH_USERS (
    User_ID, User_Login, User_Name, User_Last_Name, User_Password, User_Phone, User_Email, User_Role)
    VALUES (S_AUTH_USERS.NEXTVAL, 'director', 'Метвей', 'Царёв', '085ccfa329241ca2f35b684caf376e1f', 
        '', '', 'director');

INSERT INTO AUTH_USERS (
    User_ID, User_Login, User_Name, User_Last_Name, User_Password, User_Phone, User_Email, User_Role)
    VALUES (S_AUTH_USERS.NEXTVAL, 'technologist', 'Владислав', 'Рогозинский', '085ccfa329241ca2f35b684caf376e1f', 
        '', '', 'technologist');

INSERT INTO AUTH_USERS (
    User_ID, User_Login, User_Name, User_Last_Name, User_Password, User_Phone, User_Email, User_Role)
    VALUES (S_AUTH_USERS.NEXTVAL, 'engineer', 'Борис', 'Карышев', '085ccfa329241ca2f35b684caf376e1f', 
        '', '', 'engineer');

PROMPT Создаём публичные синонимы

DROP PUBLIC SYNONYM AUTH_USERS;
CREATE PUBLIC SYNONYM AUTH_USERS FOR AUTH_USERS;

DROP PUBLIC SYNONYM S_AUTH_USERS;
CREATE PUBLIC SYNONYM S_AUTH_USERS FOR S_AUTH_USERS;

SPOOL off;
quit;