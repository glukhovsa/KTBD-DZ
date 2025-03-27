PROMPT Создаём таблицу с ГОСТами для инженеров
CREATE TABLE ENG_HELP_GOSTS(
    GOST_ID     NUMBER          NOT NULL,
    GOST_Number VARCHAR(255)     NOT NULL,
    GOST_Name   VARCHAR2(1000)    NOT NULL
);

ALTER TABLE ENG_HELP_GOSTS
    ADD CONSTRAINT C_GOST_ID_PK PRIMARY KEY (GOST_ID);

CREATE SEQUENCE S_ENG_HELP_GOSTS INCREMENT BY 1 START WITH 1;

INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 7.32-2017', 'Система стандартов по информации, библиотечному и издательскому делу. Отчет о научно-исследовательской работе. Структура и правила оформления');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 8.417-2002', 'Государственная система обеспечения единства измерений. Единицы величин.');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ Р 2.103-2023', 'Основные надписи');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ Р 2.105-2019', 'Общие требования к текстовым документам');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ Р 2.201-2023', 'Обозначение изделий и конструкторских документов');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.109-73', 'Основные требования к чертежам');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ Р 2.106-2019', 'Текстовые документы');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.701-2008', 'Схемы');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.102-2012', 'Виды и комплектность конструкторских документов');

INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.721-74', 'Обозначения условные графические в схемах. Обозначения общего применения ');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.722-68', 'Обозначения условные графические в схемах. Машины электрические');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.727-68', 'Обозначения условные графические в схемах. Разрядники, предохранители');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.728-74', 'Обозначения условные графические в схемах. Резисторы, конденсаторы');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.729-68', 'Обозначения условные графические в схемах. Приборы электроизмерительные');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.730-73', 'Обозначения условные графические в схемах. Приборы полупроводниковые');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.731-81', 'Обозначения условные графические в схемах. Приборы электровакуумные');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.735-68', 'Обозначения условные графические в схемах. Антенны и радиостанции');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.743-91', 'Обозначения условные графические в схемах. Элементы цифровой техники');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.702-2011', 'Единая система конструкторской документации. Правила выполнения электрических схем');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.710—81', 'Обозначения буквенно-цифровые в электрических схемах');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.755-87', 'Единая система конструкторской документации. Обозначения условные графические в электрических схемах. Устройства коммутационные и контактные соединения');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.709-89', 'Обозначения условные проводов и контактных соединений электрических элементов, оборудования и участков цепей в электрических схемах.');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.708-81', 'Правила выполнения электрических схем цифровой вычислительной техники');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.764-84', 'Интегральные оптоэлектронные системы индикации');

INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.123-93', 'Единая система конструкторской документации (ЕСКД). Комплектность конструкторских документов на печатные платы при автоматизированном проектировании');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2.417-91', 'Единая система конструкторской документации. Платы печатные. Правила выполнения чертежей');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 2789 -73', 'Шероховатость поверхности. Параметры и характеристики');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ Р 53429-2009', 'Платы печатные. Основные параметры конструкции');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ Р 51040-97', 'Платы печатные. Шаги координатной сетки');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 26246.5-89', 'Материал электроизоляционный фольгированный нормированной. Горючести для печатных плат на основе стеклоткани, пропитанной эпоксидным связующим');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 23752-99', 'Платы печатные. Общие технические требования');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ Р 54849-2011', 'Маска паяльная защитная для печатных плат');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ Р 55744-2013', 'Платы печатные. Методы испытаний физических параметров');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 55693-2013', 'Платы печатные жёсткие. Технические требования');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ОСТ4 ГО 0.070.014-75', 'Отраслевой стандарт. Детали радиоэлектронной аппаратуры. Общие технические условия');
INSERT INTO ENG_HELP_GOSTS (GOST_ID, GOST_Number, GOST_Name) 
    VALUES (S_ENG_HELP_GOSTS.NEXTVAL, 'ГОСТ 11284-75', 'Отверстия сквозные под крепёжные детали. Размеры');

    


quit;