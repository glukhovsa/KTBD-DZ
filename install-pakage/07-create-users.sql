SPOOL log_temp.txt
PROMPT Создаём пользователя для пользовательского общения с БД
DROP USER guest;
CREATE USER guest IDENTIFIED BY iu4;
GRANT CONNECT TO guest;
GRANT SELECT ON AUTH_USERS TO guest;
GRANT INSERT ON AUTH_USERS TO guest;
GRANT SELECT ON S_AUTH_USERS TO guest;
GRANT ALTER ON S_AUTH_USERS TO guest;

GRANT SELECT ON ENG_DEVICE TO guest;
GRANT SELECT ON ENG_COMPONENT_CLASS TO guest;
GRANT SELECT ON ENG_COMPONENT_LIB TO guest;
GRANT SELECT ON ENG_COMPONENT TO guest;

GRANT SELECT ON ENG_HELP_GOSTS TO guest;

PROMPT Создаём пользователя тех директора
DROP USER director;
CREATE USER director IDENTIFIED BY qpalzm;
GRANT CONNECT TO director;
GRANT SELECT ON AUTH_USERS TO director;

GRANT SELECT ON ENG_DEVICE TO director;
GRANT ALTER ON ENG_DEVICE TO director;
GRANT DELETE ON ENG_DEVICE TO director;
GRANT INSERT ON ENG_DEVICE TO director;

GRANT SELECT ON S_ENG_DEVICE TO director;
GRANT ALTER ON S_ENG_DEVICE TO director;

GRANT SELECT ON ENG_COMPONENT_CLASS TO director;

GRANT SELECT ON ENG_COMPONENT_LIB TO director;
GRANT ALTER ON ENG_COMPONENT_LIB TO director;
GRANT DELETE ON ENG_COMPONENT_LIB TO director;
GRANT INSERT ON ENG_COMPONENT_LIB TO director;

GRANT SELECT ON S_ENG_COMPONENT_LIB TO director;
GRANT ALTER ON S_ENG_COMPONENT_LIB TO director;

GRANT SELECT ON ENG_COMPONENT TO director;
GRANT ALTER ON ENG_COMPONENT TO director;
GRANT DELETE ON ENG_COMPONENT TO director;

GRANT SELECT ON S_ENG_COMPONENT TO director;
GRANT ALTER ON S_ENG_COMPONENT TO director;

GRANT SELECT ON ENG_HELP_GOSTS TO director;

PROMPT Создаём пользователя технолога
DROP USER technologist;
CREATE USER technologist IDENTIFIED BY qwerty;
GRANT CONNECT TO technologist;
GRANT SELECT ON AUTH_USERS TO technologist;

GRANT SELECT ON ENG_DEVICE TO technologist;
GRANT SELECT ON ENG_COMPONENT_CLASS TO technologist;
GRANT SELECT ON ENG_COMPONENT_LIB TO technologist;
GRANT SELECT ON ENG_COMPONENT TO technologist;

GRANT SELECT ON ENG_HELP_GOSTS TO technologist;

PROMPT Создаём пользователя инженера-конструктора
DROP USER engineer;
CREATE USER engineer IDENTIFIED BY ijhgfdsaw;
GRANT CONNECT TO engineer;
GRANT SELECT ON ENG_DEVICE TO engineer;
GRANT ALTER ON ENG_DEVICE TO engineer;
GRANT DELETE ON ENG_DEVICE TO engineer;
GRANT INSERT ON ENG_DEVICE TO engineer;

GRANT SELECT ON S_ENG_DEVICE TO engineer;
GRANT ALTER ON S_ENG_DEVICE TO engineer;

GRANT SELECT ON ENG_COMPONENT_CLASS TO engineer;

GRANT SELECT ON ENG_COMPONENT_LIB TO engineer;
GRANT ALTER ON ENG_COMPONENT_LIB TO engineer;
GRANT DELETE ON ENG_COMPONENT_LIB TO engineer;
GRANT INSERT ON ENG_COMPONENT_LIB TO engineer;

GRANT SELECT ON S_ENG_COMPONENT_LIB TO engineer;
GRANT ALTER ON S_ENG_COMPONENT_LIB TO engineer;

GRANT SELECT ON ENG_COMPONENT TO engineer;
GRANT ALTER ON ENG_COMPONENT TO engineer;
GRANT DELETE ON ENG_COMPONENT TO engineer;
GRANT INSERT ON ENG_COMPONENT TO engineer;

GRANT SELECT ON S_ENG_COMPONENT TO engineer;
GRANT ALTER ON S_ENG_COMPONENT TO engineer;

GRANT SELECT ON ENG_HELP_GOSTS TO engineer;

SPOOL off;
quit;