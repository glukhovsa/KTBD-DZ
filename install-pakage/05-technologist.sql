SPOOL log_temp.txt
PROMPT Модуль технолога
PROMPT Создаём таблицу c названием групп технологических операций

CREATE TABLE TCHG_OPERATION_GROUP (
    Group_ID        NUMBER          NOT NULL,
    Group_Name      VARCHAR(255)    NOT NULL,
    Group_Number    NUMBER          NOT NULL
);

ALTER TABLE TCHG_OPERATION_GROUP
    ADD CONSTRAINT C_Group_ID_PK PRIMARY KEY (Group_ID);

CREATE SEQUENCE S_TCHG_OPERATION_GROUP INCREMENT BY 1 START WITH 1;

INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Операции общего назначения', 1);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Технический контроль', 2);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Технический контроль', 3);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Перемещение', 4);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Испытания', 6);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Испытания', 7);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Консервация и упаковывание', 8);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Литьё металлов и сплавов', 10);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Обработка давлением', 21);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Обработка резанием', 41);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Обработка резанием', 42);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Термообработка', 50);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Термообработка', 51);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Фотохимико-физическая обработка', 55);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Формообразование из полимерных материалов, керамики, стекла и резины', 60);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Порошковая металлургия', 65);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Получение покрытий', 71);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Получение органических покрытий', 73);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Получение органических покрытий', 74);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Электрофизическая, электрохимическая и радиационная обработка', 75);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Пайка', 80);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Пайка', 81);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Электромонтаж', 85);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Сборка', 88);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Сварка', 90);
INSERT INTO TCHG_OPERATION_GROUP (Group_ID, Group_Name, Group_Number)
    VALUES (S_TCHG_OPERATION_GROUP.NEXTVAL, 'Сварка', 91);

PROMPT Создаём таблицу со всеми операциями из указателя

CREATE TABLE TCHG_OPERATION_LIST (
    Operation_ID        NUMBER          NOT NULL,
    Operation_Group_ID  NUMBER          NOT NULL,
    Operation_Number    NUMBER          NOT NULL,
    Operation_Name      VARCHAR(255)    NOT NULL
);

ALTER TABLE TCHG_OPERATION_LIST
    ADD CONSTRAINT C_Operation_ID_PK PRIMARY KEY (Operation_ID);
ALTER TABLE TCHG_OPERATION_LIST
    ADD CONSTRAINT C_COperation_Group_ID_FK FOREIGN KEY (Operation_Group_ID) REFERENCES TCHG_OPERATION_GROUP(Group_ID);

CREATE SEQUENCE S_TCHG_OPERATION_LIST INCREMENT BY 1 START WITH 1;

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 1, 'Разметка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 2, 'Нарезка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 3, 'Нагревание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 4, 'Раскрой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 5, 'Охлаждение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 6, 'Выдержка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 7, 'Обдувка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 8, 'Слесарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 9, 'Зачистка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 13, 'Вакуумирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 14, 'Смазывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 15, 'Пломбирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 16, 'Распломбирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 17, 'Герметизация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 18, 'Регенерация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 19, 'Ориентация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 20, 'Галтовка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 21, 'Сбор технологических отходов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 22, 'Сдача ехнологических отходов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 23, 'Корректировка составов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 24, 'Дефектация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 25, 'Промывка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 26, 'Промывка водой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 27, 'Промывка растворителями');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 28, 'Термостатирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 29, 'Фильтрование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 30, 'Очистка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 31, 'Очистка пескоструйная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 32, 'Очистка гидроструйная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 33, 'Очистка струйно-абразивная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 34, 'Очистка дробеметная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 35, 'Очистка ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 36, 'Очистка дробеструйная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 37, 'Очистка газопламенная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 38, 'Очистка электрохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 39, 'Очистка виброабразивная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 43, 'Очистка химическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 44, 'Очистка ионная, плазменная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 45, 'Изолирование, защита');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 46, 'Изолирование, защита составами органическими');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 47, 'Изолирование, защита составами неорганическими');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 48, 'Изолирование, защита лентами, трубками и др.');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 50, 'Травление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 51, 'Травление химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 52, 'Травление электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 53, 'Травление ультразвуковое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 54, 'Травление ионное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 55, 'Травление плазменное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 56, 'Дозирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 57, 'Дозирование по счёту');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 58, 'Дозирование по объёму');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 59, 'Дозирование по массе');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 60, 'Пропитка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 61, 'Пропитка под давлением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 62, 'Пропитка в вакууме');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 63, 'Пропитка при атмосферном давлении');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 64, 'Заливка, засыпка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 65, 'Протирка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 66, 'Разгерметизация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 67, 'Раз вакуумирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 68, 'Подготовка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 69, 'Приготовление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 70, 'Сушка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 71, 'Сушка атмосферная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 72, 'Сушка конвективная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 73, 'Сушка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID WHERE Group_Number = 1), 98, '');

SPOOL off;
quit;