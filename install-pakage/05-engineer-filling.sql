SPOOL log_temp.txt
PROMPT Заполняем таблицы модуля Engineer
PROMPT Заполняем таблицу устройств

INSERT INTO ENG_DEVICE (Device_ID, Device_Name, Device_About, Device_TechProcess_ID)
    VALUES(S_ENG_DEVICE.NEXTVAL, 'The device protects the room from flooding and leaks', 
        'This device helps to protect the room from the negative effects of spilled water', '');

PROMPT Заполняем таблицу библиотеки компонентов

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Converters'),
        'Buzzer SPT-1750A', 'SMD', 'KEPO', 2);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Condensators'),
        'Ceramic 50V 0603', 'SMD', 'Murata', 2);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Condensators'),
        'Electrolite 9V', 'SMD', 'Murata', 2);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Analog Chips'),
        'TP4056', 'SMD', 'UMW', 8);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Analog Chips'),
        'DW01A', 'SMD', 'PUOLOP', 6);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Analog Chips'),
        'FS82005A', 'SMD', 'FUXINSEMI', 6);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Analog Chips'),
        'NCP114ASN330T1G', 'SMD', 'ON Semiconductors', 5);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Analog Chips'),
        'MT3608', 'SMD', 'AEROSEMI', 6);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Digital Chips'),
        'ESP-01S', 'SMD', 'XIND', 22);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Converters'),
        'EK-HL1206RGBWY Blue', 'SMD', 'SmartModule', 2);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Converters'),
        'EK-HL1206RGBWY Green', 'SMD', 'SmartModule', 2);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Converters'),
        'EK-HL1206RGBWY Yellow', 'SMD', 'SmartModule', 2);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Inductors'),
        'SPQ105-220M', 'SMD', 'CODACA', 2);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Resistors'),
        'RC-0603FR', 'SMD', 'Yageo', 2);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Switches'),
        'KLS7-TS6604-4.3-180', 'SMD', 'KLS electronic', 4);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Diods'),
        'Shottki 15MQ040N', 'SMD', 'Hottech', 2);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Field effect Transistors'),
        'AO3422A', 'SMD', 'UMW', 3);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Field effect Transistors'),
        'FND352AP', 'SMD', 'UMW', 3);

INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Connectors'),
        'JST XH2.0 6PIN', 'THT', 'JST Corporation', 6);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Connectors'),
        'JST XH2.0 2PIN', 'THT', 'JST Corporation', 2);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Connectors'),
        'MF3-1x03RA', 'THT', 'KLS electronic', 3);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Connectors'),
        'MF3-1x02RA', 'THT', 'KLS electronic', 2);
INSERT INTO ENG_COMPONENT_LIB (Lib_Component_ID,Component_Class_ID,Component_PartNumber,Component_Instalation,Component_Manufacturer, Component_Count_Pad)
    VALUES (S_ENG_COMPONENT_LIB.NEXTVAL, (SELECT Class_ID FROM ENG_COMPONENT_CLASS WHERE Class_Name = 'Connectors'),
    'PLS 2.54 1x4pin', 'THT', 'Connfly electronic', 4);

PROMPT Заполняем таблицу компонентов

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Buzzer SPT-1750A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'BA1', '');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Ceramic 50V 0603'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'C1', '0.1uF');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Ceramic 50V 0603'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'C2', '0.1uF');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Ceramic 50V 0603'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'C3', '1uF');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Ceramic 50V 0603'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'C4', '1uF');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Ceramic 50V 0603'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'C5', '22uF');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Ceramic 50V 0603'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'C6', '22uF');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Electrolite 9V'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'C7', '470uF');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'TP4056'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'DA1', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'DW01A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'DA2', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'FS82005A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'DA3', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'NCP114ASN330T1G'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'DA4', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'MT3608'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'DA5', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'ESP-01S'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'DD1', '');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'EK-HL1206RGBWY Blue'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'HL1', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'EK-HL1206RGBWY Green'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'HL2', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'EK-HL1206RGBWY Yellow'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'HL3', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'EK-HL1206RGBWY Yellow'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'HL4', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'EK-HL1206RGBWY Yellow'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'HL5', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'EK-HL1206RGBWY Yellow'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'HL6', '');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'SPQ105-220M'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'L1', '22uH');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R1', '5.1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R1', '5.1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R3', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R4', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R5', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R6', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R7', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R8', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R9', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R10', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R11', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R12', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R13', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R14', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R18', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R24', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R33', '1k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R15', '1.2k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R16', '100');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R25', '100');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R27', '100');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R28', '100');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R17', '100k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R23', '100k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R26', '100k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R29', '100k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R32', '100k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R19', '10k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R20', '10k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R21', '10k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R22', '10k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R30', '10k');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'RC-0603FR'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'R31', '2.7k');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'KLS7-TS6604-4.3-180'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'SB1', '');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Shottki 15MQ040N'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VD1', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'Shottki 15MQ040N'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VD2', '');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT1', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT2', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT3', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT4', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT5', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT7', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT8', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT9', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'AO3422A'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT10', '');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'FND352AP'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT6', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'FND352AP'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'VT11', '');

INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'JST XH2.0 6PIN'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X1', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'JST XH2.0 2PIN'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X7', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'MF3-1x03RA'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X2', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'MF3-1x03RA'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X3', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'MF3-1x03RA'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X4', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'MF3-1x03RA'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X5', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'MF3-1x03RA'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X6', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'MF3-1x03RA'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X7', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'MF3-1x02RA'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X9', '');
INSERT INTO ENG_COMPONENT (Component_ID, Component_ID_in_Lib, Component_Device_ID, Component_Designator, Component_Nominal)
    VALUES (S_ENG_COMPONENT.NEXTVAL, (SELECT Lib_Component_ID FROM ENG_COMPONENT_LIB WHERE Component_PartNumber = 'PLS 2.54 1x4pin'),
        (SELECT Device_ID FROM ENG_DEVICE WHERE Device_Name = 'The device protects the room from flooding and leaks'),
        'X8', '');

SPOOL off;
quit;