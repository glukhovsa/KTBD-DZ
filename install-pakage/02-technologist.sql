SPOOL log_temp.txt
PROMPT Модуль технолога
PROMPT Создаём таблицу c названием групп технологических операций

CREATE TABLE TCHG_OPERATION_GROUP (
    Group_ID        NUMBER          NOT NULL,
    Group_Name      VARCHAR2(500)   NOT NULL,
    Group_Number    NUMBER          NOT NULL
);

ALTER TABLE TCHG_OPERATION_GROUP
    ADD CONSTRAINT C_Group_ID_PK PRIMARY KEY (Group_ID);

CREATE SEQUENCE S_TCHG_OPERATION_GROUP INCREMENT BY 1 START WITH 1;

PROMPT Создаём таблицу со всеми операциями из указателя

CREATE TABLE TCHG_OPERATION_LIST (
    Operation_ID        NUMBER          NOT NULL,
    Operation_Group_ID  NUMBER          NOT NULL,
    Operation_Number    NUMBER          NOT NULL,
    Operation_Name      VARCHAR2(1000)    NOT NULL
);

ALTER TABLE TCHG_OPERATION_LIST
    ADD CONSTRAINT C_Operation_ID_PK PRIMARY KEY (Operation_ID);
ALTER TABLE TCHG_OPERATION_LIST
    ADD CONSTRAINT C_COperation_Group_ID_FK FOREIGN KEY (Operation_Group_ID) REFERENCES TCHG_OPERATION_GROUP(Group_ID);

CREATE SEQUENCE S_TCHG_OPERATION_LIST INCREMENT BY 1 START WITH 1;

SPOOL off;
quit;