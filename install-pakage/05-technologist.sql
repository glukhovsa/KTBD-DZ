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
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    97, '');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    1, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    2, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    3, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    4, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    5, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    6, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    7, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    8, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    9, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    10, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    11, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    12, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    13, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    14, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    15, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    16, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    17, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    18, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    19, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    20, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    21, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    22, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    23, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    24, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    25, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    26, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    27, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    28, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    29, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    30, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    31, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    32, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    33, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    34, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    35, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    36, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    37, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    38, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    39, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    40, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    41, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    42, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    43, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    44, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    45, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    46, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    47, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    48, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    49, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    50, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    51, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    52, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    53, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    54, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    55, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    56, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    57, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    58, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    59, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    60, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    61, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    62, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    63, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    64, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    65, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    66, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    67, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    68, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    69, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    70, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    71, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    72, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    73, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    74, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    75, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    76, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    77, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    78, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    79, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    80, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    81, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    82, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    83, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    84, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    85, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    86, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    87, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    88, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    89, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    90, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    91, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    92, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    93, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    94, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    95, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    96, '');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2), 
    97, '');

SPOOL off;
quit;