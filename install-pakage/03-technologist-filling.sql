SPOOL log_temp.txt

PROMPT Заполняем таблицу групп операций

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

PROMPT Заполняем таблицу всех операций

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
    12, 'Изготовление литейных моделей неметаллических разовых растворяемых');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    13, 'Изготовление литейных моделей неметаллических разовых выплавляемых');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    14, 'Изготовление литейных моделей неметаллических разовых выжигаемых');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    16, 'Изготовление литейных моделей металлических многократных');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    20, 'Изготовление песчаных литейных форм');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    40, 'Изготовление песчаных стержней');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    43, 'Изготовление песчаных стержней ручным уплотнением стержневой смеси с  последующей  сушкой по стержневому ящику сушкой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    44, 'Изготовление песчаных стержней ручным уплотнением стержневой смеси с  последующей  сушкой по стержневому ящику химическим отверждением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    45, 'Изготовление песчаных стержней ручным уплотнением стержневой смеси с  последующей  сушкой по шаблону химическим отверждением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    46, 'Изготовление песчаных стержней ручным уплотнением стержневой смеси с  последующей  сушкой по шаблону сушкой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    47, 'Изготовление песчаных стержней машинным уплотнением стержневой смеси по стержневому ящику по горячей модельной оснастке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    48, 'Изготовление песчаных стержней машинным уплотнением стержневой смеси по стержневому ящику сушкой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    49, 'Изготовление песчаных стержней машинным уплотнением стержневой смеси по стержневому ящику химическим отверждением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    51, 'Завалка шихтовых материалов в плавильный агрегат');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    53, 'Плавка металлов и сплавов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    60, 'Заливка формы');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    61, 'Заливка формы свободная в оболочковые формы с применением песчаной смесей без вращательного движения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    62, 'Заливка формы свободная в оболочковые формы с применением песчаной смесей с вращательный движением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    63, 'Заливка формы свободная в керамические формы без вращательного движения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    64, 'Заливка формы свободная в керамические формы с вращательным движением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    65, 'Заливка формы свободная в песчаные формы');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    66, 'Заливка формы свободная в кокиль');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 10), 
    67, 'Заливка формы свободная по выплавляемым моделям');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    1, 'Отрезка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    2, 'Разрезка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    3, 'Обрезка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    4, 'Надрезка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    5, 'Пробивка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    6, 'Проколка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    7, 'Отрубка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    8, 'Разрубка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    9, 'Вырубка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    11, 'Надрубка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    12, 'Ломка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    14, 'Высечка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    15, 'Просечка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    21, 'Осадка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    22, 'Высадка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    23, 'Протяжка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    24, 'Разгонка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    25, 'Радиальное обжатие');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    26, 'Передача');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    27, 'Прошивка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    28, 'Раскатка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    29, 'Гибка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    31, 'Скручивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    32, 'Закатка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    33, 'Завивка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    34, 'Навивка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    35, 'Вытяжка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    36, 'Вытяжка с утонением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    37, 'Вытяжка ротационная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    38, 'Отбортовка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =21), 
    39, 'Раздача');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    41, 'Обжим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =21), 
    42, 'Рельефная формовка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    43, 'Чеканка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    44, 'Кернение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    45, 'Выдавливание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    47, 'Приглаживание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    48, 'Обкатка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    49, 'Калибровка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    52, 'Волочение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    53, 'Накатка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    54, 'Профилирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    55, 'Редуцирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    56, 'Правка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    57, 'Обтяжка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    58, 'Поверхностное пластическое деформирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    59, 'Подкатка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    60, 'Ковка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    70, 'Штамповка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    71, 'Штамповка объемная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    72, 'Штамповка вальцовкой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    73, 'Штамповка листовая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    75, 'Штамповка импульсная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    76, 'Штамповка импульсная взрывная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    77, 'Штамповка импульсная электрогидравлическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    78, 'Штамповка импульсная электромагнитная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    80, 'Штамповка эластичными средствами');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    81, 'Штамповка эластичными средами жидкостью');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    82, 'Штамповка эластичными средами резиной');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 21), 
    83, 'Штамповка эластичными средами полиуретаном');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    1, 'Агрегатная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    2, 'Автоматно-линейная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    5, 'Автоматно-линейная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    7, 'Гайконарезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    8, 'Болтонарезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    10, 'Токарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    11, 'Токарно-револьверная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    12, 'Автоматно токарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    13, 'Токарно-карусельная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    14, 'Токарно-винторезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    15, 'Лоботокарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    16, 'Токарно-затыловочная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    17, 'Токарно-копировальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    18, 'Специальная токарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    19, 'Торцеподрезная-центровальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    21, 'Вальцетокарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    22, 'Резьботокарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    23, 'Токарнобесцентровальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    30, 'Шлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    31, 'Круглошлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    32, 'Внутpишлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    33, 'Плоскошлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    34, 'Бесцентрово-шлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    35, 'Реьбошлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    36, 'Координатно-шлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    37, 'Обдирочно-шлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    38, 'Ленточно-шлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    39, 'Шлифовально-затыловочная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    41, 'Шлицешлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    42, 'Заточная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    43, 'Заточная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    44, 'Карусельно-шлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    45, 'Торцешлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    46, 'Специальная шлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    47, 'Вальцешлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    50, 'Зубообрабатывающая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    51, 'Зубошлифовальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    52, 'Зубодолбежная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    53, '3убофрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    54, 'Зубострогальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    55, 'Зубопротяжная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    56, '3убозакругляющая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    57, 'Зубошевинговальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    58, 'Зубопритирочная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    59, 'Зубопритирочная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    61, 'Зубообкатывающая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    62, 'Специальная зубообрабатывающая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    63, 'Зубохонинговальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    64, 'Зуботокарная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    65, 'Шлицефрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    66, 'Шлицестрогальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    67, 'Комбинированная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    70, 'Комбинированная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    71, 'Продольно-строгальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    72, 'Поперечно-строгальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    73, 'Специальная строгальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    75, 'Долбежная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    80, 'Протяжная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    81, 'Горизонтально-протяжная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    82, 'Вертикально-протяжная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    83, 'Специальная протяжная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    90, 'Отделочная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    92, 'Хонинговальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    93, 'Суперфиниширование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    94, 'Доводочная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    95, 'Притирочная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    96, 'Полировальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 41), 
    97, 'Глянцовальная');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    10, 'Сверлильная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    11, 'Сверлильно-центровальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    12, 'Радиально-сверлильная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    13, 'Горизонтально-сверлильная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    14, 'Вертикально-сверлильная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    16, 'Координатно-сверлильная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    20, 'Расточная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    21, 'Горизонтально-расточная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    22, 'Вертикально-расточная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    23, 'Координатно-расточная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    24, 'Алмазно-расточная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    30, 'Программная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    31, 'Расточная с ЧПУ');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    32, 'Сверлильная с ЧПУ');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    33, 'Токарная с ЧПУ');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    34, 'Фрезерная с ЧПУ');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    36, 'Шлифовальная с ЧПУ');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    37, 'Шлифовальная с ЧПУ');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    60, 'Фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    61, 'Вертикально-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    62, 'Горизонтально-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    63, 'Карусельно-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    64, 'Карусельно-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    65, 'Барабанно-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    67, 'Копировально-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    68, 'Гравировально-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    69, 'Фрезерно-центровальная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    71, 'Шпоночно-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    72, 'Специальная фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    73, 'Универсально-фрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    74, 'Резьбофрезерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    80, 'Отрезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    81, 'Ножовочно-отрезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    82, 'Ленточно (проволочно)-отрезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    83, 'Алмазно-отрезая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    84, 'Токарно-отрезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    85, 'Пило-oтрезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    86, 'Фрезерно-отрезная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 42), 
    87, 'Абразивно-отрезная');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    10, 'Отжиг');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    11, 'Отжиг без фазовых превращений гомогенизационный');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    12, 'Отжиг без фазовых превращений увеличивающий зерно');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    14, 'Отжиг без фазовых превращений графитизирующий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    15, 'Отжиг без фазовых превращений релаксационный (уменьшающий напряжение)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    16, 'Отжиг без фазовых превращений промежуточный на возврат');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    17, 'Отжиг без фазовых превращений рекристаллизационный полный');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    18, 'Отжиг без фазовых превращений рекристаллизационный неполный');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    19, 'Отжиг без фазовых превращений дорекристаллизационный упрочняющий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    21, 'Отжиг без фазовых превращений дорекристаллизационный смягчаюший на отдых');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    22, 'Отжиг без фазовых превращений дорекристаллизационный смягчаюший на возврат');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    23, 'Отжиг с фазовыми превращениями полный гетерогенизирующий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    24, 'Отжиг с фазовыми превращениями полный гомогенизирующий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    25, 'Отжиг с фазовыми превращениями изотермический');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    26, 'Отжиг с фазовыми превращениями неполный гетерогенизирующий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    27, 'Отжиг с фазовыми превращениями неполный гомогенизирующий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    28, 'Отжиг с фазовыми превращениями сфероидизирующий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    29, 'Отжиг с фазовыми превращениями нормализационный');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    30, 'Закалка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    31, 'Закалка общая непрерывная в одной среде');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    32, 'Закалка общая непрерывная возврат после старения');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    33, 'Закалка общая прерывистая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    34, 'Закалка общая прерывистая в двух средах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    35, 'Закалка общая прерывистая многократная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    36, 'Закалка общая прерывистая с обработкой холодом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    37, 'Закалка общая прерывистая программированная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    38, 'Закалка общая прерывистая ступенчатая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    39, 'Закалка общая прерывистая ступенчатая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    41, 'Закалка общая прерывистая изотермическая с подстуживанием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    42, 'Закалка общая от субкритических температур');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    43, 'Закалка местная объемная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    44, 'Закалка местная поверхностная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    45, 'Термоциклическая обработка (ТЦО)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    50, 'Отпуск');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    51, 'Отпуск высокий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    52, 'Отпуск средний');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    53, 'Отпуск вязкий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    54, 'Отпуск упрочняющий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    56, 'Отпуск смягчающий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    57, 'Отпуск ступенчатый');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    60, 'Старение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =51), 
    61, 'Старение естественное (без нагрева)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =51), 
    62, 'Старение искусственное (упрочняющее) полное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    63, 'Старение искусственное (упрочняющее) неполное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    64, 'Старение искусственное (упрочняющее) без предварительной закалки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    66, 'Старение смягчающее (перестраивание)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    67, 'Старение ступенчатое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 51), 
    68, 'Старение стабилизирующее');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    10, 'Изготовление оригинала');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    11, 'Изготовление оригинала пересчетом таблицы координат');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    12, 'Изготовление оригинала вырезанием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    13, 'Изготовление оригинала вырезанием на автоматическом координатографе');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    14, 'Изготовление оригинала вырезанием на координатографе в режиме ручного ввода информации');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    15, 'Изготовление оригинала фотонабором');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    16, 'Изготовление оригинала аппликацией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    17, 'Изготовление оригинала комбинированным способом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    20, 'Изготовление фотошаблонов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    21, 'Съемка репродукционной камерой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    22, 'Обработка фотоматериалов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    23, 'Фотопечать');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    24, 'Ретуширование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    25, 'Мультиплицирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    26, 'Изготовление промежуточного фотошаблона');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    27, 'Изготовление копий промежуточного фотошаблона');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    28, 'Изготовление эталонного фотошаблона');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    29, 'Изготовление рабочего фотошаблона');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    40, 'Фотолитография');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    41, 'Экспонирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    42, 'Экспонирование контактное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    43, 'Экспонирование бесконтактное (проекционное)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    44, 'Экспонирование совмещенное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    45, 'Проявление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    46, 'Задубливание (полимеризация), фиксирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 55), 
    47, 'Сенсибилизация');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    9, 'Смешивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    11, 'Окрашивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    12, 'Дробление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    13, 'Гранулирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    14, 'Таблетирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    15, 'Таблетирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    16, 'Шприцевание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    17, 'Набор пакета');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    20, 'Прессование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    21, 'Прессование прямое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    22, 'Прессование литьевое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    23, 'Прессование с декорированием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    30, 'Литье');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    31, 'Литье под давлением термопластов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    32, 'Литье под давлением реактопластов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    33, 'Литье под давлением со вспениванием физическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    34, 'Литье под давлением со вспениванием химическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    36, 'Литье многокомпонентное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    37, 'Литье центробежное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    40, 'Вспенивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    41, 'Вспенивание прессовое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    42, 'Вспенивание беспрессовое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    50, 'Вспенивание беспрессовое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    51, 'Экструзия заготовок');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    52, 'Экструзия с непрерывным калиброванием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    53, 'Экструзия с непрерывным раздувом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    56, 'Соэкструзия');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    57, 'Интрузия');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    60, 'Формование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    61, 'Формование герметичной эластичной упаковкой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    62, 'Формование пуансоном и матрицей');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    63, 'Формование на оправке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    64, 'Формование контактное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    65, 'Формование протяжным кольцом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    66, 'Формование протяжным кольцом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    67, 'Формование термопневматическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    68, 'Формование комбинированное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    69, 'Формование экструзионно-раздувное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    73, 'Армирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    74, 'Термоштампование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    76, 'Дублирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =60), 
    77, 'Ламинирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    78, 'Каландрирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    79, 'Каландрирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    81, 'Тиснение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    82, 'Спекание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    83, 'Растяжение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    84, 'Стерилизация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    85, 'Вулканизация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    86, 'Вулканизация горячая в прессах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    87, 'Вулканизация горячая в автоклав-прессах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    88, 'Вулканизация горячая на открытом вoздухе');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    89, 'Вулканизация холодная радиационная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    90, 'Гуммирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    91, 'Гуммирование горячее');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    92, 'Гуммирование холодное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    93, 'Желатинирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    94, 'Прорезинивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    95, 'Девулканизация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    96, 'Девулканизация в прессах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    97, 'Девулканизация радиационная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =60), 
    98, 'Пластикация каучука');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 60), 
    99, 'Выдувание');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    30, 'Формование порошков');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    31, 'Формование с приложением статического давления без нагрева прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    32, 'Формование с приложением статического давления без нагрева прессованием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    33, 'Формование с приложением статического давления без нагрева прокаткой без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    34, 'Формование с приложением статического давления без нагрева прокаткой в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    35, 'Формование с приложением статического давления без нагрева протяжкой без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    36, 'Формование с приложением статического давления без нагрева протяжкой в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    37, 'Формование с приложением статического давления без нагрева выдавливанием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    39, 'Формование с приложением статического давления с нагревом прессованием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    41, 'Формование с приложением статического давления с нагревом прокаткой без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    42, 'Формование с приложением статического давления с нагревом прокаткой в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    44, 'Формование с приложением статического давления с нагревом выдавливанием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    45, 'Формование с приложением динамического давления без нагрева прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    46, 'Формование с приложением динамического давления без нагрева прессованием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    48, 'Формование с приложением динамического давления с нагревом прессованием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    51, 'Формование с приложением динамического давления с нагревом выдавливанием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    52, 'Формование с приложением динамического давления с нагревом ковкой в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    53, 'Формование с приложением циклического давления без нагрева прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    54, 'Формование с приложением циклического давления с нагревом прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    55, 'Формование без нагрева под воздействием вибрации');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    56, 'Формование без нагрева и приложения давления пластифицированных масс');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    57, 'Формование без нагрева и приложения давления свободно насыпного порошка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    58, 'Формование без нагрева и приложения давления шликера');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    60, 'Уплотнением порошковых формовок');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    61, 'Уплотнение с приложением статического давления без нагрева прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    62, 'Уплотнение с приложением статического давления без нагрева прессованием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    63, 'Уплотнение с приложением статического давления без нагрева прокаткой без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    64, 'Уплотнение с приложением статического давления без нагрева прокаткой в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    65, 'Уплотнение с приложением статического давления без нагрева выдавливанием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    66, 'Уплотнение с приложением статического давления без нагрева выдавливанием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    67, 'Уплотнение с приложением статического давления с нагревом прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    68, 'Уплотнение с приложением статического давления с нагревом прессованием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    69, 'Уплотнение с приложением статического давления с нагревом прокаткой в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    71, 'Уплотнение с приложением статического давления с нагревом выдавливанием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    72, 'Уплотнение с приложением динамического давления без нагрева прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    73, 'Уплотнение с приложением динамического давления без нагрева прессованием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    74, 'Уплотнение с приложением динамического давления с нагревом прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    75, 'Уплотнение с приложением динамического давления с нагревом прессованием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    76, 'Уплотнение с приложением динамического давления с нагревом выдавливанием в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    77, 'Уплотнение с приложением динамического давления с нагревом ковкой в оболочке');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    78, 'Уплотнение с приложением циклического давления с нагревом прессованием без оболочки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    80, 'Спекание порошковых формовок');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    81, 'Спекание при низком давлении (в вакууме) защитной (газовой) среды неактивированное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    82, 'С введением активирующих факторов в порошковую формовку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    83, 'Спекание при низком давлении (в вакууме) защитной (газовой) среды активированное с приложением к порошковой формовке давления статического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    84, 'Спекание при низком давлении (в вакууме) защитной (газовой) среды активированное с приложением к порошковой формовке давления циклического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    85, 'Спекание при низком давлении (в вакууме) защитной (газовой) среды активированное с циклическим изменением температуры');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    86, 'Спекание при низком давлении (в вакууме) защитной (газовой) среды активированное с инфильтрацией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    87, 'Спекание при нормальном давлении защитной (газовой, сыпучей, жидкой среды) неактивированное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    88, 'Спекание при нормальном давлении защитной (газовой, сыпучей, жидкой среды) активированное с введением активирующих факторов в защитную среду');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    89, 'Спекание при нормальном давлении защитной (газовой, сыпучей, жидкой среды) активированное с введением активирующих факторов в порошковую формовку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    91, 'Спекание при нормальном давлении защитной (газовой, сыпучей, жидкой среды) активированное с приложением к порошковой формовке давления статического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    92, 'Спекание при нормальном давлении защитной (газовой, сыпучей, жидкой среды) активированное с приложением к порошковой формовке давления циклического');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    93, 'Спекание при нормальном давлении защитной (газовой, сыпучей, жидкой среды) активированное с циклическим изменением температуры');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    94, 'Спекание при нормальном давлении защитной (газовой, сыпучей, жидкой среды) активированное с инфильтрацией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    95, 'Спекание при высоком давлении защитной (газовой, сыпучей, жидкой) среды неактивированное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    96, 'Спекание при высоком давлении защитной (газовой, сыпучей, жидкой) среды активированное с введением активирующих факторов в защитную среду');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    97, 'Спекание при высоком давлении защитной (газовой, сыпучей, жидкой) среды активированное с введением активирующих факторов в порошковую формовку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65), 
    98, 'Спекание при высоком давлении защитной (газовой, сыпучей, жидкой) среды активированное с циклическим изменением температуры');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    1, 'Крацевание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    2, 'Сатинирование химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    3, 'Сатинирование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    4, 'Эмалирование, глазурование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    5, 'Тонирование xимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    6, 'Тонирование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    7, 'Матирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    8, 'Осветление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    9, 'Хроматирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    10, 'Металлизация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    11, 'Металлизация газотермическая пламенная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    12, 'Металлизация газотермическая электродуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    13, 'Металлизация газотермическая плазменная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    14, 'Металлизация газотермическая детонационная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    15, 'Металлизация газотермическая высокочастотная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    16, 'Металлизация конденсационная (вакуумная) катодная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    17, 'Металлизация конденсационная (вакуумная) термическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    18, 'Металлизация конденсационная (вакуумная) ионная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    19, 'Нейтрализация');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    21, 'Золочение химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    22, 'Золочение электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    23, 'Амальгамирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    24, 'Восстановление катодное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    25, 'Плакирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    26, 'Активация химическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    27, 'Активация электрохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    28, 'Наполнение покрытия в воде');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    29, 'Наполнение покрытия в растворе красителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    31, 'Гидрофобизирование покрытия');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    32, 'Оплавление покрытия');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    33, 'Алюминирование металлизационное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    34, 'Алюминирование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    35, 'Пассивирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    36, 'Фосфатирование химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    37, 'Фосфатирование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    39, 'Флюсование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    41, 'Окисление химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    42, 'Окисление электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    43, 'Окисление термическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    44, 'Эмалирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    45, 'Железнение электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    46, 'Железнение металлизационное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    47, 'Индирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    48, 'Кадмирование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    49, 'Кадмирование металлизационное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    51, 'Оловянирование металлизационное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    52, 'Оловянирование химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    53, 'Оловянирование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    54, 'Оловянирование горячее');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    55, 'Меднение химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    56, 'Меднение электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    57, 'Меднение металлизационное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    58, 'Родирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    59, 'Палладирование химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    61, 'Палладирование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    62, 'Платинирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    63, 'Никелерование химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    64, 'Никелерование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    65, 'Свинцевание химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    66, 'Свинцевание электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    67, 'Свинцевание горячее');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    68, 'Свинцевание металлизационное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    69, 'Серебрение химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    71, 'Серебрение электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    72, 'Хромирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    73, 'Цинкование химическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    74, 'Цинкование электрохимическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    75, 'Цинкование горячее');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    76, 'Цинкование металлизационное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 71), 
    80, 'Получение покрытия сплавами');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    1, 'Преобразование ржавчины распылением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    2, 'Преобразование ржавчины кистью, тампоном');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    3, 'Порозаполнение древесины');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    4, 'Крашение древесины');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    10, 'Грунтование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    11, 'Грунтование распылением пневматическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    12, 'Грунтование распылением безвоздушным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    13, 'Грунтование распылением электростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    14, 'Грунтование распылением пневмоэлектростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    15, 'Грунтование распылением безвоздушным электростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    25, 'Грунтование распылением аэрозольным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    26, 'Грунтование распылением центробежным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    27, 'Грунтование распылением ультразвуковым');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    28, 'Грунтование окунанием без выдержки в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    29, 'Грунтование окунанием с выдержкой в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    31, 'Грунтование электроосаждением анодным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    32, 'Грунтование электроосаждением катодным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    33, 'Грунтование наливом, обливом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    34, 'Грунтование струйным обливом без выдержки в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    35, 'Грунтование струйным обливом с выдержкой в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    36, 'Грунтование в барабанах, центрифугах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    37, 'Грунтование кистью, валиком, тампоном и др.');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    38, 'Грунтование валками');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    39, 'Грунтование автоосаждением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    40, 'Подгрунтовывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    41, 'Подгрунтовывание кистью, валиком, тампоном и др.');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    42, 'Подгрунтовывание распылением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    50, 'Шпатлевание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    51, 'Шпатлевание местное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    52, 'Шпатлевание сплошное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    56, 'Получение выявительного слоя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    60, 'Окрашивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    61, 'Окрашивание распылением пневматическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    62, 'Окрашивание распылением воздушным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    63, 'Окрашивание распылением электростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    64, 'Окрашивание распылением пневмоэлектростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    66, 'Окрашивание распылением безвоздушным электростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    67, 'Окрашивание распылением аэрозольным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    68, 'Окрашивание распылением ультразвуковым');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    69, 'Окрашивание окунанием без выдержки в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    71, 'Окрашивание окунанием с выдержкой в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    72, 'Окрашивание электроосаждением анодным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    73, 'Окрашивание электроосаждением катодным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    74, 'Окрашивание автоосаждением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    75, 'Окрашивание обливом, наливом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    76, 'Окрашивание валками');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    77, 'Окрашивание в барабанах, центрифугах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    78, 'Окрашивание кистью, валиком, тампоном, иглой и др.');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    79, 'Окрашивание струйным обливом без выдержки в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    81, 'Окрашивание струйным обливом с выдержкой в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    82, 'Окрашивание в псевдоожиженном слое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    85, 'Подкрашивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    86, 'Подкрашивание кистью, валиком, тампоном, иглой и др.');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73), 
    87, 'Подкрашивание распылением');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    10, 'Лакирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    11, 'Лакирование распылением пневматическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    12, 'Лакирование распылением безвоздушным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    13, 'Лакирование распылением электростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    14, 'Лакирование распылением пневмоэлектростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    15, 'Лакирование распылением безвоздушным электростатическим');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    16, 'Лакирование распылением аэрозольным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    17, 'Лакирование распылением центробежным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    18, 'Лакирование распылением ультразвуковым');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    19, 'Лакирование окунанием без выдержки в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    21, 'Лакирование окунанием с выдержкой в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    22, 'Лакирование электроосаждением катодным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    23, 'Лакирование электроосаждением анодным');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    24, 'Лакирование наливом, обливом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    25, 'Лакирование валками');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    26, 'Лакирование в барабанах центрифугах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    27, 'Лакирование кистью, валиком, тампоном и др.');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    28, 'Лакирование автоосаждением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    29, 'Лакирование струйным обливом без выдержки в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    31, 'Лакирование струйным обливом с выдержкой в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    32, 'Лакирование струйным обливом с выдержкой в парах растворителя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =74), 
    33, 'Разравнивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    39, 'Загрубление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    40, 'Напыление');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    41, 'Напыление в псевдоожиженном слое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    42, 'Напыление электростатическое');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    43, 'Напыление струйное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    44, 'Напыление газопламенное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    45, 'Напыление плазменное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    46, 'Напыление вакуумное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    47, 'Насыпание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    50, 'Нанесение рисунка и надписей (в том числе имитация текстуры древесины, кожи, камня, ткани)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    51, 'Нанесение рисунка и надписей декалькоманией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    52, 'Нанесение рисунка и надписей синтетическими материалами');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    53, 'Нанесение рисунка и надписей печатанием');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    54, 'Нанесение рисунка и надписей аэрографией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    56, 'Нанесение рисунка и надписей шелкографией');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    57, 'Нанесение рисунка и надписей по трафарету');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74), 
    58, 'Облицовывание');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    1, 'Копировально-прошивочная электрофизическая электроэрозионная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    2, 'Копировально-прошивочная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    3, 'Копировально-прошивочная электрохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    4, 'Копировально-прошивочная комбинированная электроэрозионно-химическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    5, 'Прошивочная электрофизическая лучевая лазерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    6, 'Прошивочная электрофизическая лучевая электроннолучевая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    7, 'Прошивочная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    9, 'Профильно-вырезная электрофизическая электроэрозионная электроискровая проволочным электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    11, 'Профильно-вырезная электрофизическая электроэрозионная электроискровая дисковым электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    12, 'Профильно-вырезная электрофизическая лучевая лазерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    13, 'Профильно-вырезная электрофизическая лучевая электроннолучевая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    14, 'Профильно-вырезная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    15, 'Профильно-вырезная электрохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =75), 
    16, 'Профильно-вырезная комбинированная электроэрозионно-химическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    19, 'Отрезная электрофизическая электроэрозионная электроискровая проволочным электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    21, 'Отрезная электрофизическая электроэрозионная электроискровая дисковым электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    23, 'Отрезная электрофизическая лучевая лазерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    24, 'Отрезная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    25, 'Отрезная электрофизическая плазменная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    26, 'Отрезная электрохимическая размерная анодно-механическая дисковым электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    27, 'Отрезная электрохимическая размерная анодно-механическая дисковым электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    29, 'Заточная электрохимическая размерная анодно-механическая абразивная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    31, 'Заточная электрохимическая размерная анодно-механическая алмазная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    35, 'Расточная электрофизическая электроэрозионная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    36, 'Расточная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    41, 'Плоскошлифовальная электрофизическая электроэрозионная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    42, 'Плоскошлифовальная электрохимическая размерная анодно-механическая абразивная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    43, 'Плоскошлифовальная электрохимическая размерная анодно-механическая алмазная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    45, 'Круглошлифовальная электрохимическая размерная анодно-механическая абразивная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    46, 'Круглошлифовальная электрохимическая размерная анодно-механическая алмазная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    48, 'Круглошлифовальная электрофизическая электроэрозионная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    55, 'Гравировальная электрохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    56, 'Гравировальная электрофизическая электроэрозионная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    57, 'Гравировальная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number =75), 
    58, 'Гравировальная комбинированная электрофотохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    61, 'Отделочно-зачистная электрохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    62, 'Отделочно-зачистная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    65, 'Доводочная электрохимическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    66, 'Доводочная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    71, 'Упрочняюще-легирующая электрофизическая электроэрозионная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    72, 'Упрочняюще-легирующая электрофизическая лучевая лазерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    73, 'Упрочняюще-легирующая электрофизическая лучевая электроннолучевая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    76, 'Резьбонарезная электрофизическая электроэрозионная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    77, 'Резьбонарезная электрофизическая электромеханическая ультразвуковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    78, 'Обработка ионизирующим излучением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    79, 'Обработка терморадиационная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 75), 
    81, 'Обработка радиационная');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    6, 'Ограничение растекания припоя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    10, 'Пайка готовым припоем');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    11, 'Пайка готовым припоем флюсовая тепловым контактом (паяльником, нагретым газом, нагревательными матами)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    12, 'Пайка готовым припоем флюсовая газопламенная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    13, 'Пайка готовым припоем флюсовая индукционная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    14, 'Пайка готовым припоем флюсовая в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    15, 'Пайка готовым припоем флюсовая электросопротивлением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    16, 'Пайка готовым припоем флюсовая дуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    17, 'Пайка готовым припоем флюсовая экзотермическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    18, 'Пайка готовым припоем флюсовая волной припоя');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    19, 'Пайка готовым припоем флюсовая погружением в расплавленный припой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    21, 'Пайка готовым припоем флюсовая погружением в расплавленный припой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    22, 'Пайка готовым припоем флюсовая плазменная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    35, 'Пайка готовым припоем в нейтральной газовой среде в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    36, 'Пайка готовым припоем в нейтральной газовой среде индукционная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    37, 'Пайка готовым припоем в нейтральной газовой среде радиационная (световыми лучами, инфракрасными лучами, лазерная)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    38, 'Пайка готовым припоем в активной газовой среде в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    39, 'Пайка готовым припоем в активной газовой среде индукционная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    41, 'Пайка готовым припоем в активной газовой среде радиационная (световыми лучами, инфракрасными лучами, лазерная)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    42, 'Пайка готовым припоем в вакууме в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    43, 'Пайка готовым припоем в вакууме индукционная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    44, 'Пайка готовым припоем в вакууме радиационная (световыми лучами, инфракрасными лучами, лазерная)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    45, 'Пайка готовым припоем в вакууме электроннолучевая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    46, 'Пайка готовым припоем в вакууме тлеющим разрядом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    50, 'Контактно-реактивная пайка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    51, 'Контактно-реактивная пайка в нейтральной газовой среде в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    52, 'Контактно-реактивная пайка в нейтральной газовой среде индукционная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    53, 'Контактно-реактивная пайка в нейтральной газовой среде радиационная (световыми лучами, инфракрасными лучами, лазерная)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    54, 'Контактно-реактивная пайка в активной газовой среде в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    55, 'Контактно-реактивная пайка в активной газовой среде индукционная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    56, 'Контактно-реактивная пайка в активной газовой среде радиационная (световыми лучами, инфракрасными лучами, лазерная)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    57, 'Контактно-реактивная пайка в вакууме в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    58, 'Контактно-реактивная пайка в вакууме индукционная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    59, 'Контактно-реактивная пайка в вакууме радиационная (световыми лучами, инфракрасными лучами, лазерная)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    61, 'Контактно-реактивная пайка в вакууме электроннолучевая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    62, 'Контактно-реактивная пайка в вакууме тлеющим разрядом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    70, 'Реактивно-флюсовая пайка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    71, 'Реактивно-флюсовая пайка в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    72, 'Реактивно-флюсовая пайка газопламенная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    73, 'Реактивно-флюсовая пайка погружением в расплавленный флюс');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    74, 'Реактивно-флюсовая пайка экзотермическая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80), 
    77, 'Электролитная пайка');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    10, 'Пайкосварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    11, 'Пайкосварка флюсовая газопламенная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    12, 'Пайкосварка флюсовая дуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    20, 'Сваркопайка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    21, 'Сваркопайка флюсовая газопламенная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    22, 'Сваркопайка флюсовая дуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    23, 'Сваркопайка в нейтральной газовой среде дуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    30, 'Комбинированная пайка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    31, 'Комбинированная пайка диффузионная контактно-реактивная в печи в газовой среде в нейтральной');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    32, 'Комбинированная пайка диффузионная контактно-реактивная в печи в газовой среде в активной');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    33, 'Комбинированная пайка диффузионная контактно-реактивная в печи в вакууме');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    34, 'Комбинированная пайка диффузионная готовым припоем в печи в газовой среде в нейтральной');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    35, 'Комбинированная пайка диффузионная готовым припоем в печи в газовой среде в активной');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    36, 'Комбинированная пайка диффузионная готовым припоем в печи в вакууме');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    41, 'Комбинированная пайка диффузионная контактно-реактивная электронно-лучевая в вакууме');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    42, 'Комбинированная пайка диффузионная готовым припоем электронно-лучевая в вакууме');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    60, 'Лужение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    61, 'Лужение абразивное паяльником');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    62, 'Лужение абразивное газопламенное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    63, 'Лужение абразивно-кристаллическое паяльником');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    64, 'Лужение абразивно-кристаллическое газопламенное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    65, 'Лужение абразивно-кавитационное погружением в расплавленный припой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    67, 'Лужение ультразвуковое паяльником');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    68, 'Лужение ультразвуковое погружением в расплавленный припой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    71, 'Лужение флюсовое паяльником');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    72, 'Лужение флюсовое газопламенное');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    73, 'Лужение флюсовое в печи');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 81), 
    74, 'Лужение флюсовое погружением в расплавленный припой');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    1, 'Регулировка, настройка, юстировка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    2, 'Бaхромирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    4, 'Разделка провода, кабеля, жилы');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    5, 'Раскладка провода, кабеля');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    8, 'Бандажирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    9, 'Плетение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    11, 'Свивание, скручивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    12, 'Мерная резка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    21, 'Протягивание провода, кабеля, жгута');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    22, 'Размотка провода, кабеля');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    31, 'Формовка выводов электрорадиоэлементов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    35, 'Намотка, перемотка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    36, 'Намотка, перемотка каркасная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    37, 'Намотка, перемотка бескаркасная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    51, 'Вощение шпагата');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85), 
    52, 'Экранирование');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    1, 'Базирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    3, 'Балансировка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    21, 'Стопорение');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    22, 'Штифтование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    23, 'Запрессовывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    24, 'Контровка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    31, 'Свинчивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    32, 'Застегивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    41, 'Клепка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    42, 'Развальцовка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    43, 'Фальцевание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    44, 'Накручивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    46, 'Склеивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    47, 'Сшивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    48, 'Сколачивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    49, 'Центрирование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    51, 'Шплинтование');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    52, 'Распрессовывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    53, 'Расштифтовывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    54, 'Расшплинтовывание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    56, 'Рязвинчивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    57, 'Расстегивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    58, 'Монтаж');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    59, 'Демонтаж');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    61, 'Разборка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    62, 'Сборочно-подготовительная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    63, 'Сборочно-монтажная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    64, 'Слесарно-сборочная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    66, 'Приклеивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    67, 'Отклеивание');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    70, 'Сборка и монтаж изделий электронной техники (ИЭТ)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    71, 'Сборка и монтаж изделий электронной техники (ИЭТ)');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    72, 'Сборка блока арматуры');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    73, 'Монтаж ножки собранной');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    74, 'Монтаж блока арматуры на ножку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    76, 'Монтаж блока арматуры (кристалла) на ножку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    77, 'Монтаж  кристалла в корпус');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    78, 'Монтаж комплектующих изделий');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    79, 'Загрузка кассет комплектующими изделиями');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    81, 'Загрузка кассет комплектующими изделиями');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88), 
    82, 'Распайка и «тару-спутник»');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    1, 'Индукционно-прессовая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    2, 'Газопрессовая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    3, 'Термокомпрессионная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    4, 'Дугопрессовая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    5, 'Шлакопрессовая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    6, 'Термитно-прессовая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    7, 'Печная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    10, 'Контактная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    11, 'Контактная сварка точечная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    12, 'Контактная сварка шовная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    13, 'Контактная сварка стыковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    14, 'Контактная сварка рельефная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    15, 'Контактная сварка шовно-стыковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    20, 'Диффузионная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    21, 'Диффузионная сварка в инертных газах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    22, 'Диффузионная сварка в активных газах');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    23, 'Диффузионная сварка в вакууме');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    25, 'Световая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    26, 'Световая сварка лазерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    27, 'Световая сварка энергией лучей оптического диапазона');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    28, 'Световая сварка инфракрасным излучением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    30, 'Дуговая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    31, 'Дуговая сварка покрытым электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    32, 'Дуговая сварка пучком покрытых электродов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    33, 'Дуговая сварка самозащитной проволокой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    34, 'Дуговая сварка порошковой проволокой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    35, 'Дуговая сварка под флюсом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    36, 'Дуговая сварка под флюсом плавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    37, 'Дуговая сварка под флюсом неплавящимся электродом с присадочным металлом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    38, 'Дуговая сварка под флюсом неплавящимся электродом без присадочного металла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    39, 'Дуговая сварка в инертных газах плавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    41, 'Дуговая сварка в инертных газах плавящимся электродом с присадочным металлом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    42, 'Дуговая сварка в инертных газах плавящимся электродом без присадочного металла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    43, 'Дуговая сварка в углекислом газе сплошной проволокой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    44, 'Дуговая сварка в углекислом газе порошковой проволокой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    45, 'Дуговая сварка в углекислом газе неплавящимся электродом с присадочным металлом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    46, 'Дуговая сварка в углекислом газе неплавящимся электродом без присадочного металла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    47, 'Дуговая сварка в азоте плавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    48, 'Дуговая сварка в азоте неплавящимся электродом с присадочным металлом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    49, 'Дуговая сварка в азоте неплавящимся электродом без присадочного металла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    51, 'Дуговая сварка в смеси инертных и активных газов плавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    52, 'Дуговая сварка в концентрических потоках инертного и активного газов плавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    53, 'Дуговая сварка в концентрических потоках инертного и активного газов неплавящимся электродом с присадочным металлом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    54, 'Дуговая сварка в концентрических потоках инертного и активного газов неплавящимся электродом без присадочного металла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    55, 'Дуговая сварка в водяном паре');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    56, 'Дуговая сварка в вакууме плавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    57, 'Дуговая сварка в вакууме неплавящимся электродом с присадочным металлом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    58, 'Дуговая сварка в вакууме неплавящимся электродом без присадочного металла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    61, 'Электрошлаковая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    62, 'Электронно-лучевая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    63, 'Плазменная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    64, 'Ионно-лучевая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    65, 'Сварка тлеющим разрядом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    66, 'Термоимпульсная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    67, 'Индукционная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    68, 'Газовая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    69, 'Термитная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    71, 'Литейная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    72, 'Сварка взрывом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    73, 'Сварка трением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    74, 'Магнито-импульсная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    75, 'Сварка газовым теплоносителем');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    76, 'Сварка экструдированной присадкой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    80, 'Ультразвуковая сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    81, 'Ультразвуковая сварка точечная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    82, 'Ультразвуковая сварка шовная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    83, 'Ультразвуковая сварка стыковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    90, 'Холодная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    91, 'Холодная сварка точечная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    92, 'Холодная сварка шовная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 90), 
    93, 'Холодная сварка стыковая');

INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    10, 'Наплавка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    11, 'Наплавка дуговая покрытым электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    12, 'Наплавка дуговая пучком покрытых электродов');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    13, 'Наплавка дуговая самозащитной проволокой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    14, 'Наплавка дуговая порошковой проволокой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    15, 'Наплавка дуговая под флюсом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    16, 'Наплавка дуговая по флюсу');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    17, 'Наплавка дуговая в инертных газах плавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    18, 'Наплавка дуговая в инертных газах неплавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    19, 'Наплавка дуговая сплошной проволокой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    21, 'Наплавка дуговая в углекислом газе порошковой проволокой');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    22, 'Наплавка дуговая в углекислом газе неплавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    23, 'Наплавка дуговая в азоте плавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    24, 'Наплавка дуговая в азоте неплавящимся электродом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    25, 'Наплавка вибродуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    26, 'Наплавка индукционная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    27, 'Наплавка электрошлаковая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    28, 'Наплавка плазменная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    29, 'Наплавка трением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    30, 'Наплавка с помощью контактной сварки');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    32, 'Наплавка газопламенная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    33, 'Наплавка с использованием жидкого присадочного металла');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    70, 'Термическая резка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    71, 'Термическая резка лазерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    72, 'Термическая резка кислородная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    73, 'Термическая резка кислородно-флюсовая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    74, 'Термическая резка дуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    75, 'Термическая резка воздушно-дуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    76, 'Термическая резка плазменно-дуговая');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    77, 'Термическая резка кислородно-лазерная');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    80, 'Термоконтактная сварка');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    81, 'Термоконтактная сварка оплавлением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    82, 'Термоконтактная сварка проплавлением');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    83, 'Термоконтактная сварка нагретым инструментом ленточным теплоносителем');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    84, 'Термоконтактная сварка нагретым инструментом роликом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    85, 'Термоконтактная сварка нагретым инструментом полозом');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    86, 'Термоконтактная сварка внахлестку');
INSERT INTO TCHG_OPERATION_LIST (Operation_ID, Operation_Group_ID, Operation_Number, Operation_Name)
    VALUES (S_TCHG_OPERATION_LIST.NEXTVAL, (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 91), 
    87, 'Термоконтактная сварка встык');

PROMPT Заполняем таблицу оборудования

INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Стол монтажный');
INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Автомат для нанесения паяльной пасты');
INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Автоматизированные линия поверхностного монтажа');
INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Пятизонная печь');
INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Система монтажа с роботом SCARA');
INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Установка для пайки волной');
INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Установка для промывки');
INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Шкаф сушильный');
INSERT INTO TCHG_TOOLS (Tool_ID, Tool_Name)
    VALUES (S_TCHG_TOOLS.NEXTVAL, 'Установка для нанесения лака');


PROMPT Заполняем таблицу ТП примером

INSERT INTO TCHG_PROCESS (Process_ID, Process_Note)
    VALUES (S_TCHG_PROCESS.NEXTVAL, 'ТП используется при изготовлении устройства защиты помещения от затопления и протечек. Также может использовать для других плат с комбинированным одностронним монтажём');

PROMPT Заполняем операции ТП примерами

INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 7
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)),
        'Распаковка ЭРЭ', 200, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)),
        'Комплектование ЭРЭ', 200, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65)),
        'Нанесение паяльной пасты', 300, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
        'Установка КМП', 300, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автоматизированные линия поверхностного монтажа'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
        'Пайка в печи', 600, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
        'Установка КМО на ПП', 150, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
        'Пайка волной', 300, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для пайки волной'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
        'Промывка платы', 100, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
        'Сушка', 300, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74)),
        'Нанесение лака', 60, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения лака'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 23
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
        'Установка резьбовых втулок плавлением', 540, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
        'Установка электронной ячейки в основание корпуса ', 300, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
        'Установка батарейного отсека в основание корпуса ', 300, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 23
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
        'Подключение батарейного отсека к разъёму электронной ячейки', 60, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID)
    VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, 1, (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1
        AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
        'Установка крышки в основании корпуса', 180, (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));


SPOOL off;
quit;