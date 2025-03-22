PROMPT Модуль авторизации:
PROMPT Создаём таблицу пользователей

DROP TABLE AUTH_USERS CASCADE CONSTRAINTS;
CREATE TABLE AUTH_USERS (
    User_ID         NUMBER      NOT NULL,
    User_Login      VARCHAR(30) NOT NULL,
    User_Name       VARCHAR(30) NOT NULL,
    User_Last_Name  VARCHAR(30) NOT NULL,
    User_Password   VARCHAR(50) NOT NULL,
    User_Number     VARCHAR(15) NULL,
    User_Email      VARCHAR(50) NULL,
    User_Role       VARCHAR(20) NOT NULL
);

ALTER TABLE AUTH_USERS
    ADD CONSTRAINT C_AUTH_USERS_PK PRIMARY KEY ( User_ID );
ALTER TABLE AUTH_USERS
    ADD CONSTRAINT C_User_Role_CHK CHECK ( User_Role = 'admin' OR 
                                            User_Role = 'Technical director' OR 
                                            User_Role = 'Technologist' OR 
                                            User_Role = 'Engineer' OR
                                            User_Role = 'guest');

DROP SEQUENCE S_AUTH_USERS;
CREATE SEQUENCE S_AUTH_USERS INCREMENT BY 1 START WITH 1;

INSERT INTO AUTH_USERS (
    User_ID, User_Login, User_Name, User_Last_Name, User_Password, User_Number, User_Email, User_Role)
    VALUES (S_AUTH_USERS.NEXTVAL, 'gluhx', 'Stepan', 'Gluhov', '085ccfa329241ca2f35b684caf376e1f', 
        '+79254144429', 'stepa.gl@yandex.ru', 'admin');
