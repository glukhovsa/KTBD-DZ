PROMPT Создаём пользователя для пользовательского общения с БД
DROP USER guest;
CREATE USER guest IDENTIFIED BY iu4;
GRANT CONNECT TO guest;
GRANT SELECT ON AUTH_USERS TO guest;

PROMPT Создаём пользователя тех директора
DROP USER director;
CREATE USER director IDENTIFIED BY qpalzm;
GRANT CONNECT TO guest;

PROMPT Создаём пользователя технолога
DROP USER technologist;
CREATE USER technologist IDENTIFIED BY qwerty;
GRANT CONNECT TO guest;

PROMPT Создаём пользователя инженера
DROP USER engineer;
CREATE USER engineer IDENTIFIED BY ijhgfdsaw;
GRANT CONNECT TO guest;