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
    Operation_Name      VARCHAR2(500)    NOT NULL
);

ALTER TABLE TCHG_OPERATION_LIST
    ADD CONSTRAINT C_Operation_ID_PK PRIMARY KEY (Operation_ID);
ALTER TABLE TCHG_OPERATION_LIST
    ADD CONSTRAINT C_COperation_Group_ID_FK FOREIGN KEY (Operation_Group_ID) REFERENCES TCHG_OPERATION_GROUP(Group_ID);

CREATE SEQUENCE S_TCHG_OPERATION_LIST INCREMENT BY 1 START WITH 1;

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    1, 'Разметка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    2, 'Нарезка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    3, 'Нагревание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    4, 'Раскрой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    5, 'Охлаждение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    6, 'Выдержка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    7, 'Обдувка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    8, 'Слесарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    9, 'Зачистка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    13, 'Вакуумирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    14, 'Смазывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    15, 'Пломбирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    16, 'Распломбирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    17, 'Герметизация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    18, 'Регенерация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    19, 'Ориентация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    20, 'Галтовка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    21, 'Сбор технологических отходов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    22, 'Сдача ехнологических отходов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    23, 'Корректировка составов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    24, 'Дефектация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    25, 'Промывка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    26, 'Промывка водой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    27, 'Промывка растворителями');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    28, 'Термостатирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    29, 'Фильтрование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    30, 'Очистка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    31, 'Очистка пескоструйная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    32, 'Очистка гидроструйная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    33, 'Очистка струйно-абразивная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    34, 'Очистка дробеметная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    35, 'Очистка ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    36, 'Очистка дробеструйная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    37, 'Очистка газопламенная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    38, 'Очистка электрохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    39, 'Очистка виброабразивная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    43, 'Очистка химическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    44, 'Очистка ионная, плазменная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    45, 'Изолирование, защита');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    46, 'Изолирование, защита составами органическими');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    47, 'Изолирование, защита составами неорганическими');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    48, 'Изолирование, защита лентами, трубками и др.');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    50, 'Травление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    51, 'Травление химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    52, 'Травление электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    53, 'Травление ультразвуковое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    54, 'Травление ионное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    55, 'Травление плазменное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    56, 'Дозирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    57, 'Дозирование по счёту');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    58, 'Дозирование по объёму');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    59, 'Дозирование по массе');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    60, 'Пропитка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    61, 'Пропитка под давлением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    62, 'Пропитка в вакууме');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    63, 'Пропитка при атмосферном давлении');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    64, 'Заливка, засыпка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    65, 'Протирка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    66, 'Разгерметизация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    67, 'Раз вакуумирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    68, 'Подготовка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    69, 'Приготовление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    70, 'Сушка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    71, 'Сушка атмосферная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    72, 'Сушка конвективная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    73, 'Сушка терморадиационная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    74, 'Сушка вакуумная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    75, 'Сушка в электромагнитном поле');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    76, 'Сушка фотохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    77, 'Сушка световыми лучами');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    78, 'Сушка ультразвуковым, электронным облучением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    79, 'Сушка в активной, пассивной среде');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    80, 'Маркирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    81, 'Маркирование ударом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    82, 'Маркирование гравированием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    83, 'Маркирование травлением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    84, 'Маркирование лазерное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    85, 'Маркирование литьём под давлением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    86, 'Маркирование лентой, краской, трубкой, биркой, этикеткой и др.');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    87, 'Маркирование вжиганием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    88, 'Маркирование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    89, 'Маркирование электроэрозионное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    90, 'Обезжиревание, обессмоливание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    91, 'Обезжиревание химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    92, 'Обезжиревание электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    93, 'Обезжиревание ультравуковое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    94, 'Обезжиревание плазмохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    95, 'Удаление покрытий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    96, 'Удаление изоляции');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    97, 'намагничивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1), 
    98, 'Размагничивание');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    10, 'Контроль величин пространства и времени');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    11, 'Контроль времени');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    12, 'Контроль площади');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    13, 'Контроль объёма');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    14, 'Контроль скорости');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    15, 'Контроль ускорения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    16, 'Контроль плоского угла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    17, 'Контроль телесного угла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    18, 'Контроль длины');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    20, 'Контроль линейных размеров');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    21, 'Контроль линейных размеров между плоскими поверхностями');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    22, 'Контроль линейных размеров между криволинейными поверхностями');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    23, 'Контроль линейных размеров между осями поверхностей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    24, 'Контроль линейных размеров между координатами');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    25, 'Контроль размеров криволинейных поверхностей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    26, 'Контроль кривизны');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    27, 'Контроль диаметра');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    28, 'Контроль радиуса');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    30, 'Контроль расположения поверхности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    31, 'Контроль параллельности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    32, 'Контроль перпендикулярности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    33, 'Контроль наклона');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    35, 'Контроль соостности (концентричности)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    36, 'Контроль симметричности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    37, 'Контроль пересечения осей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    38, 'Контроль позиционного расположения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    40, 'Контроль формы поверхности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    41, 'Контроль плоскостности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    42, 'Контроль прямолинейности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    45, 'Цилиндричности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    46, 'Контроль круглости');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    47, 'Контроль профиля продольного сечения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    50, 'Контроль формы и расположения поверхностей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    51, 'Контроль биения радиального');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    52, 'Контроль биения торцевого');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    53, 'Контроль биения в заданном направлении');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    54, 'Контроль формы заданного профия');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    55, 'контроль формы заданной поверхности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    60, 'Комплексный контроль геометрических параметров');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    61, 'Контроль резьбовых параметров');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    62, 'Контроль среднего лиаметра');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    63, 'Контроль приведённого диаметра');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    64, 'Контроль шага резьбы');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    65, 'Контроль шлицевых деталей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    66, 'Контроль шероховатостей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    70, 'Контроль зубчатых деталей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    71, 'Контроль кинематической погрешности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    72, 'Контроль радиального биения зубчетого венца');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    73, 'Контроль накоплений погрешности шага');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    74, 'Контроль окружности шара');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    75, 'Контроль циклической погрешности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    76, 'Контроль межосевого расстояния на одном зубце');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    77, 'Контроль профиля зубьев');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    78, 'Контроль колебания длины общей нормали');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    81, 'Контроль суммарного пятна контакта');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    82, 'Контроль суммарного пятна контакта');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    83, 'Контроль шага зацепления');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    84, 'Контроль элементов колеса');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    85, 'Контроль элементов колеса');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    86, 'Контроль гарантированного бокового зазора');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    87, 'Контроль гарантированного бокового зазора');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    90, 'Контроль червячных деталей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    91, 'Контроль винтовой линии червяка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    92, 'Контроль осевого шага червяка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    93, 'Контроль кинематической погрешности червяка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    94, 'Контроль биения витков червяка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    95, 'Контроль элементов колеса');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    96, 'Контроль пятна контакта');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    97, 'Контроль угла и формы червяка');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    10, 'Контроль механических величин');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    11, 'Контроль массы');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    12, 'Контроль плотности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    14, 'Контроль момента инерции');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    15, 'Контроль момента инерции');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    16, 'Контроль давления');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    17, 'Контроль вязкости динамической');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    18, 'Контроль вязкости кинематической');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    20, 'Контроль электрических и магнитных величин');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    21, 'Контроль силы электрического тока');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    22, 'Контроль электрического напряжения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    23, 'Контроль электрического сопротивления');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    24, 'Контроль электрического сопротивления');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    26, 'Контроль магнитного потока');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    27, 'Контроль индуктивности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    28, 'Контроль магнитного потока');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    29, 'Контроль динамических электрических величин');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    30, 'Контроль тепловых величин');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    31, 'Контроль температуры');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    32, 'Контроль теплоемкости');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    33, 'Контроль теплового потока');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    34, 'Контроль теплопроводности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    35, 'Контроль акустических величин');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    36, 'Контроль звукового давления');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    37, 'Контроль объемной скорости');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    38, 'Контроль интенсивности звука');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    40, 'Контроль световых величин и величин электромагнитных излучении');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    41, 'Контроль силы света');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    42, 'Контроль светового потока');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    43, 'Контроль освещенности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    44, 'Контроль яркости');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    46, 'Контроль энергии излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    47, 'Контроль потока излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    48, 'Контроль энергетической освещенности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    49, 'Контроль энергетической яркости');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    50, 'Контроль величин физической оптики');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    51, 'Контроль оптических параметров и характеристик');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    54, 'Контроль теплового излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    55, 'Контроль периодических величин');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    56, 'Контроль частоты периодического процесса');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    57, 'Контроль частоты вращения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    60, 'Контроль величин ионизирующих излучений');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    61, 'Контроль активности нуклида в радиоактивном источнике');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    62, 'Контроль поглощенной дозы излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    65, 'Контроль величин физической химии и молекулярной физики');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    66, 'Контроль молярной массы');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    67, 'Контроль молярного объема');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    68, 'Контроль химического потенциала');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    69, 'Контроль химического потенциала');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    71, 'Контроль количества вещества');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    72, 'Контроль концентрации');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    75, 'Контроль качественных характеристик');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    76, 'Контроль неразрушающий акустический (ультразвуковой)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    77, 'Контроль неразрушающий вихретоковый');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    78, 'Контроль неразрушающий магнитный');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    79, 'Контроль неразрушающий оптический');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    81, 'Контроль неразрушающий радиационный');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    82, 'Контроль неразрушающий радиоволновый');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    83, 'Контроль неразрушающий тепловой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    84, 'Контроль неразрушающий электрический');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    86, 'Контроль неразрушающий проникающими веществами');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    87, 'Контроль внешнего вида изделий, наличия клейм');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    90, 'Контроль прочих величин и характеристик');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    91, 'Контроль технического состояния');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    92, 'Контроль функционирования');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    93, 'Контроль работоспособности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    94, 'Контроль надежности');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    96, 'Контроль количества штук');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3), 
    97, 'Контроль расхода');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    1, 'Транспортирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    4, 'Погрузка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    5, 'Загрузка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    6, 'Разгрузка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    7, 'Выгрузка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    8, 'Перегрузка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    9, 'Перекладка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    11, 'Кантование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    12, 'Штабелирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    13, 'Дештабелирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    14, 'Стеллажирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    15, 'Дестеллажирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    16, 'Переливание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    17, 'Пересыпание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    18, 'Комплектование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    19, 'Раскладка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    21, 'Сортирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    22, 'Пакетирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    23, 'Распакетирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    24, 'Укладывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    25, 'Укладывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    26, 'Разравнивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    27, 'Раскрепление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    28, 'Раскрепление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    29, 'Накопление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    30, 'Хранение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    31, 'Поворотная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    32, 'Укрывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    33, 'Раскрывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    34, 'Раскомплектование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    35, 'Перекачивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    36, 'Торцевыравнивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4), 
    40, 'Складирование');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    10, 'Испытания на надежность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    11, 'Испытания на безотказность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    12, 'Испытания на сохраняемость');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    13, 'Испытания на ремонтопригодность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    14, 'Испытания на долговечность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    15, 'Испытания на функциональность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    20, 'Испытания механические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    21, 'Испытания механические на воздействие статической нагрузки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    22, 'Испытания механические на воздействие статической нагрузки на растяжение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    23, 'Испытания механические на воздействие статической нагрузки на срез');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    24, 'Испытания механические на воздействие статической нагрузки на ползучесть');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    25, 'Испытания механические на воздействие статической нагрузки на кручение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    26, 'Испытания механические на воздействие статической нагрузки на изгиб');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    27, 'Испытания механические на воздействие статической нагрузки на сжатие');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    28, 'Испытания механические на воздействие статической нагрузки на длительную прочность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    29, 'Испытания механические на воздействие статической нагрузки на твердость, микротвердость');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    31, 'Испытания механические на воздействие статической нагрузки на релаксацию');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    32, 'Испытания механические на воздействие статической нагрузки на прокаливаемость');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    33, 'Испытания механические на воздействие статической нагрузки на адгезию');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    34, 'Испытания механические на воздействие статической нагрузки на пластичность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    35, 'Испытания механические на воздействие динамической нагрузки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    36, 'Испытания механические на воздействие динамической нагрузки на усталость');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    37, 'Испытания механические на воздействие динамической нагрузки на усталость при растяжении-сжатии');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    38, 'Испытания механические на воздействие динамической нагрузки на усталость при изгибе');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    39, 'Испытания механические на воздействие динамической нагрузки на усталость при кручении');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    41, 'Испытания механические на воздействие динамической нагрузки на ударную вязкость');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    42, 'Испытания механические на воздействие динамической нагрузки на механическое старение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    43, 'Испытания механические на воздействие динамической нагрузки на прочность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    44, 'Испытания механические на воздействие динамической нагрузки на адгезию');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    45, 'Испытания механические на воздействие трения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    46, 'Испытания механические на воздействие трения при вращательном движении');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    47, 'Испытания механические на воздействие трения при возвратно-поступательном движении');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    50, 'Испытания механические на воздействие удара');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    51, 'Испытания механические на воздействие удара механического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    52, 'Испытания механические на воздействие удара однократного действия');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    53, 'Испытания механические на воздействие удара многократного действия');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    54, 'Испытания механические на воздействие удара при свободном падении');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    55, 'Испытания механические на воздействие удара гидравлического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    56, 'Испытания механические на воздействие удара аэродинамического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    57, 'Испытания механические на воздействие удара сейсмического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    58, 'Испытания механические на воздействие удара баллистического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    59, 'Испытания механические на воздействие удара ударной (взрывной) волны');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    60, 'Испытания механические на воздействие ускорения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    61, 'Испытания механические на воздействие ускорения линейного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    62, 'Испытания механические на воздействие ускорения углового (центробежного)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    63, 'Испытания механические на воздействие ускорения центростремительного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    64, 'Испытания механические на воздействие ускорения невесомости');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    65, 'Испытания механические на воздействие колебаний');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    66, 'Испытания механические на воздействие колебаний качки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    67, 'Испытания механические на воздействие колебаний наклона (крена)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    68, 'Испытания механические на воздействие колебаний акустического шума');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    69, 'Испытания механические на воздействие колебаний вибрации');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    70, 'Испытания механические на воздействие давления');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    71, 'Испытания механические на воздействие давления гидравлического повышенного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    72, 'Испытания механические на воздействие давления гидравлического пониженного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    73, 'Испытания механические на воздействие давления пневматического повышенного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    74, 'Испытания механические на воздействие давления пневматического пониженного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    75, 'Испытания на герметичность');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    76, 'Испытания на герметичность пневматические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    77, 'Испытания на герметичность гидравлические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    78, 'Испытания на отрыв');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6), 
    79, 'Испытания на безопасность');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    10, 'Испытания климатические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    12, 'Испытания климатические на воздействие температуры среды повышенной');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    13, 'Испытания климатические на воздействие температуры среды пониженной');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    14, 'Испытания климатические на воздействие смены температур (термоциклирования)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    16, 'Испытания климатические на воздействие атмосферного давления	повышенного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    17, 'Испытания климатические на воздействие атмосферного давления	пониженного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    19, 'Испытания климатические на воздействие атмосферных осадков выпадающих');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    21, 'Испытания климатические на воздействие атмосферных осадков конденсированных');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    22, 'Испытания климатические на воздействие влажности (брызг)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    23, 'Испытания климатические на воздействие солнечного излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    24, 'Испытания климатические на воздействие тумана');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    25, 'Испытания климатические на воздействие ледово-грунтовой среды');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    26, 'Испытания климатические на воздействие пыли, песка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    29, 'Испытания климатические на воздействие потока воздуха скоростного дозвукового');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    31, 'Испытания климатические на воздействие потока воздуха скоростного сверхзвукового');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    32, 'Испытания климатические на воздействие ветра');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    35, 'Испытания термические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    36, 'Испытания термические на воздействие теплового удара');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    37, 'Испытания термические на воздействие теплового удара светового излучения взрыва');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    38, 'Испытания термические на воздействие теплового удара термического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    39, 'Испытания термические на воздействие нагрева');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =7), 
    41, 'Испытания термические на воздействие нагрева аэродинамического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    42, 'Испытания термические на воздействие нагрева трением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    43, 'Испытания термические на воздействие нагрева тепловым потоком');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    44, 'Испытания термические на воздействие нагрева пламенем');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    50, 'Испытания химические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    51, 'Испытания химические на воздействие кислот');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    52, 'Испытания химические на воздействие щелочей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    53, 'Испытания химические на воздействие масел, смазок, красок');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    54, 'Испытания химические на воздействие специальных сред');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    55, 'Испытания химические на воздействие топлива');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    57, 'Испытания химические на воздействие среды с коррозионно-активными агентами атмосферы');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    58, 'Испытания химические на воздействие среды с коррозионно-активными агентами водой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    59, 'Испытания химические на воздействие среды с коррозионно-активными агентами почвенно-грунтовой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    60, 'Испытания биологические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    61, 'Испытания биологические на воздействие позвоночных животных');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    62, 'Испытания биологические на воздействие беспозвоночных  животных');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    63, 'Испытания биологические на воздействие беспозвоночных  животных');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    65, 'Испытания электрические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    66, 'Испытания электрические на воздействие постоянного тока (напряжения)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    67, 'Испытания электрические на воздействие переменного тока (напряжения) однофазного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    68, 'Испытания электрические на воздействие переменного тока (напряжения) многофазного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    69, 'Испытания электрические на воздействие электрического импульса тока (напряжения)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    70, 'Испытания электротермические');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    71, 'Испытания электротермические на воздействие постоянного тока (напряжения) при температуре выше °С');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    72, 'Испытания электротермические на воздействие постоянного тока (напряжения) при температуре ниже °С');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    73, 'Испытания электротермические на воздействие переменного тока однофазного при температуре выше °С');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    74, 'Испытания электротермические на воздействие переменного тока однофазного при температуре ниже °С');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    75, 'Испытания электротермические на воздействие переменного тока многофазного при температуре выше °С');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    76, 'Испытания электротермические на воздействие переменного тока многофазного при температуре ниже °С');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    77, 'Испытания электротермические на воздействие электрического импульса тока (напряжения) при температуре выше °С');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    78, 'Испытания электротермические на воздействие электрического импульса тока (напряжения) при температуре ниже °С');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    80, 'Испытания радиационные');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    82, 'Испытания радиационные на воздействие ионизирующего альфа- и бета-излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    83, 'Испытания радиационные на воздействие ионизирующего гамма-излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    84, 'Испытания радиационные на воздействие ионизирующего рентгеновского излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    85, 'Испытания радиационные на воздействие ионизирующего нейтронного, электронного и протонного излучений');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    86, 'Испытания радиационные на воздействие ионизирующего излучения многозарядных частиц');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    90, 'Испытания магнитные и электромагнитные');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    91, 'Испытания магнитные и электромагнитные на воздействие импульсного электрополя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    93, 'Испытания магнитные и электромагнитные на воздействие магнитного поля низкочастотного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    94, 'Испытания магнитные и электромагнитные на воздействие магнитного поля высокочастотного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    95, 'Испытания магнитные и электромагнитные на воздействие магнитного поля сверхвысокочастотного');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    96, 'Испытания магнитные и электромагнитные на воздействие лазерного излучения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 7), 
    97, 'Испытания магнитные и электромагнитные на воздействие электромагнитного импульса взрыва');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    1, 'Консервация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    2, 'Консервация окунанием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    3, 'Консервация обливом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    4, 'Консервация смазыванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    5, 'Консервация прокачиванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    6, 'Консервация продуванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    9, 'Консервация распылением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    11, 'Консервация завертыванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    12, 'Консервация заливкой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    13, 'Консервация летучими ингибиторами на носителях');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    14, 'Консервация в процессе испытаний');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    15, 'Консервация герметизацией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    16, 'Консервация герметизацией осушением статическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    17, 'Консервация герметизацией осушением динамическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    18, 'Консервация герметизацией ингибированным воздухом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    19, 'Консервация герметизацией инертными газами');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    21, 'Консервация герметизацией летучими ингибиторами');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    22, 'Консервация внутренним упаковыванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    30, 'Упаковывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    31, 'Упаковывание в бумагу');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    32, 'Упаковывание в полимерную пленку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    34, 'Упаковывание герметизированным покрытием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    36, 'Упаковывание в потребительскую тару');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    37, 'Упаковывание в ящик, коробку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    38, 'Упаковывание в контейнер');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    39, 'Упаковывание в мешок');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    41, 'Упаковывание в связку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    42, 'Упаковывание в обрешетку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    43, 'Упаковывание на поддон');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    44, 'Обандероливание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    46, 'Обвязываем тары (упаковочной единицы)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    50, 'Распаковывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    51, 'Распаковывание вскрытием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    52, 'Распаковывание разборкой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    53, 'Распаковывание развязыванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    54, 'Распаковывание развертыванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    56, 'Распаковывание потребительской тары');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    60, 'Расконсервация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    65, 'Распаковывание удалением консервационного материала');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    66, 'Распаковывание удалением консервационного материала протиранием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    67, 'Распаковывание удалением консервационного материала окунанием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    68, 'Распаковывание удалением консервационного материала разгерметизацией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    69, 'Распаковывание удалением консервационного материала разгерметизацией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    71, 'Распаковывание удалением консервационного материала продуванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    72, 'Распаковывание удалением консервационного материала смыванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    73, 'Распаковывание удалением консервационного материала срезанием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    74, 'Распаковывание удалением консервационного материала сливом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8), 
    76, 'Распаковывание удалением консервационного материала летучих ингибиторов на носителях');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    10, 'Изготовление литейных моделей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    11, 'Изготовление литейных моделей неметаллических многократных');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =10), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    97, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    98, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ), 
    99, '');


SPOOL off;
quit;