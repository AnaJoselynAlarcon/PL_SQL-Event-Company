DELETE FROM ata_performance;
DELETE FROM ata_contract;
DELETE FROM ata_client;
DELETE FROM ata_entertainers_style;
DELETE FROM ata_musical_style;
DELETE FROM ata_entertainer;
DELETE FROM ata_agent;

COMMIT;

INSERT INTO ata_agent VALUES ('0000001','Bonham', 'Patricia',
SYSDATE - 350, '4032673134', '4032349876');
INSERT INTO ata_agent VALUES ('0000002','Fillion', 'Frank',
SYSDATE - 325, '6046657890', '6043345765');
INSERT INTO ata_agent VALUES ('0000003','Pascal', 'Blaise',
SYSDATE - 320, '7057523786', '7057454398');
INSERT INTO ata_agent VALUES ('0000004','Sandilands', 'Sandy',
SYSDATE - 307, '4032534907', '4032499987');
INSERT INTO ata_agent VALUES ('0000006','Leung', 'Larry',
SYSDATE - 299, '3067275678', '3067273341');

COMMIT;

INSERT INTO ata_client VALUES ('0000005','Michaels','Mary',
'4034329977','4034331234', '0000001');
INSERT INTO ata_client VALUES ('0000007','Thompson','Terry',
'4038387698','4034443456', '0000001');
INSERT INTO ata_client VALUES ('0000009','Angst','Amy',
'6043547890','6043547890', '0000002');
INSERT INTO ata_client VALUES ('0000020','Duval','Pierre',
'7057524488','7057529900', '0000003');
INSERT INTO ata_client VALUES ('0000030','Li', 'Xaio',
'7057538890','7057532052', '0000003');
INSERT INTO ata_client VALUES ('0000031','Bruchner','Barry',
'7057535674','7057523322', '0000003');
INSERT INTO ata_client VALUES ('0000032','Zoeller', 'Helmut',
'4035548800','4035545056', '0000004');
INSERT INTO ata_client VALUES ('0000033','Dvorak','Antonin',
'3067279876','3067277473', '0000006');
INSERT INTO ata_client VALUES ('0000035','Tidsbury', 'Allen',
'3067275532','3067275487', '0000006');
INSERT INTO ata_client VALUES ('0000037','Keller', 'Kerry',
'4035549099','4035543421', '0000004');
INSERT INTO ata_client VALUES ('0000038','Ellard','Jackie',
'7057525674','7057522250', '0000003');
INSERT INTO ata_client VALUES ('0000039','White', 'Wally',
'4034548900','4034552314', '0000001');
INSERT INTO ata_client VALUES ('0000040','Boston','Blackie',
'4032216704','4032216704', '0000004');

COMMIT;

INSERT INTO ata_entertainer VALUES ('0000011','Dunkenfield', 'William', 
'4037788991','Comedian','0000001');
INSERT INTO ata_entertainer VALUES ('0000013','Crosby','Bing',
'4037137890','Singer','0000001');
INSERT INTO ata_entertainer VALUES ('0000012','Elliot','Cass',
'7057439213','Singer','0000003');
INSERT INTO ata_entertainer VALUES ('0000015','Evans','Ernie',
'7057523421','Singer', '0000003');
INSERT INTO ata_entertainer VALUES ('0000017','Wheeler','Tammy',
'7057524312','Band', '0000003');
INSERT INTO ata_entertainer VALUES ('0000019','Eddy','Nelson',
'6045589000','Singer', '0000001');
INSERT INTO ata_entertainer VALUES ('0000022','Castle','Chrissy',
'7057520099','Band', '0000003');
INSERT INTO ata_entertainer VALUES ('0000023','Lee','Bruce',
'6043326778','Band', '0000002');
INSERT INTO ata_entertainer VALUES ('0000025','Boyd','Bill',
'7057549008','Singer', '0000003');
INSERT INTO ata_entertainer VALUES ('0000026','Ironsides','Irene',
'3069327890','Singer', '0000006');
INSERT INTO ata_entertainer VALUES ('0000027','Hamlin','Hannibal',
'4034446798','Band', '0000001');
INSERT INTO ata_entertainer VALUES ('0000028','Chong','Cherry',
'6046678907','Singer', '0000002');
INSERT INTO ata_entertainer VALUES ('0000029','Klein','Patricia',
'3068890012','Singer', '0000001');
INSERT INTO ata_entertainer VALUES ('0000051','Carson','Carrie',
'7057729900','Magician', '0000003');
INSERT INTO ata_entertainer VALUES ('0000052','Jones','Loudmouth',
'6048876996','Band', '0000002');
INSERT INTO ata_entertainer VALUES ('0000053','Martin','Maxie',
'4032881967','Comedian', '0000001');

COMMIT;

INSERT INTO ata_musical_style VALUES ('OPC','Opera and Concert');
INSERT INTO ata_musical_style VALUES ('CW','Country and Western');
INSERT INTO ata_musical_style VALUES ('HR', 'Hard Rock');
INSERT INTO ata_musical_style VALUES ('RB', 'Rythm and Blues');
INSERT INTO ata_musical_style VALUES ('JAZ', 'Jazz');
INSERT INTO ata_musical_style VALUES ('MNP','Mainline Pop');

COMMIT;

INSERT INTO ata_entertainers_style VALUES ('0000013', 'MNP');
INSERT INTO ata_entertainers_style VALUES ('0000012', 'OPC');
INSERT INTO ata_entertainers_style VALUES ('0000012', 'HR');
INSERT INTO ata_entertainers_style VALUES ('0000015', 'CW');
INSERT INTO ata_entertainers_style VALUES ('0000017', 'CW');
INSERT INTO ata_entertainers_style VALUES ('0000017', 'RB');
INSERT INTO ata_entertainers_style VALUES ('0000019', 'OPC');
INSERT INTO ata_entertainers_style VALUES ('0000019', 'CW');
INSERT INTO ata_entertainers_style VALUES ('0000022', 'MNP');
INSERT INTO ata_entertainers_style VALUES ('0000023', 'JAZ');
INSERT INTO ata_entertainers_style VALUES ('0000025', 'CW');
INSERT INTO ata_entertainers_style VALUES ('0000026', 'RB');
INSERT INTO ata_entertainers_style VALUES ('0000027', 'OPC');
INSERT INTO ata_entertainers_style VALUES ('0000028', 'CW');
INSERT INTO ata_entertainers_style VALUES ('0000029', 'CW');
INSERT INTO ata_entertainers_style VALUES ('0000052', 'HR');
INSERT INTO ata_entertainers_style VALUES ('0000027', 'HR');
INSERT INTO ata_entertainers_style VALUES ('0000026', 'OPC');
INSERT INTO ata_entertainers_style VALUES ('0000026', 'CW');

COMMIT;

INSERT INTO ata_contract VALUES (1,'0000011', '0000005', 'Childrens Party', 1000);
INSERT INTO ata_contract VALUES (2,'0000012', '0000020', 'Wedding', 1500);
INSERT INTO ata_contract VALUES (3,'0000019', '0000033', 'Concert', 5000);
INSERT INTO ata_contract VALUES (4,'0000051', '0000020', 'Divorce Party', 1200);

COMMIT;

INSERT INTO ata_performance VALUES (3, TRUNC (SYSDATE - 100), TRUNC(SYSDATE - 100) + 20/24,
TRUNC(SYSDATE - 100) + 22/24 + 30/(60*24));
INSERT INTO ata_performance VALUES (3,TRUNC (SYSDATE - 99), TRUNC(SYSDATE - 99) + 20/24,
TRUNC(SYSDATE - 99) + 22/24 + 30/(60*24));
INSERT INTO ata_performance VALUES (1, TRUNC (SYSDATE - 90), TRUNC(SYSDATE - 90) + 15/24,
TRUNC(SYSDATE - 90) + 18/24);
INSERT INTO ata_performance VALUES (2, TRUNC (SYSDATE - 89), TRUNC(SYSDATE -89) + 20/24,
TRUNC(SYSDATE - 88) + 1/24);
INSERT INTO ata_performance VALUES (4, TRUNC(SYSDATE - 20), TRUNC(SYSDATE - 20) + 19/24,
TRUNC(SYSDATE - 19) + 2/24);

INSERT INTO ata_performance VALUES (3, TRUNC (TO_DATE('20-FEB-2005','DD-MON-YYYY')), 
TRUNC(TO_DATE('20-FEB-2005','DD-MON-YYYY')) + 20/24,
TRUNC(TO_DATE('20-FEB-2005','DD-MON-YYYY')) + 22/24 + 30/(60*24));

INSERT INTO ata_performance VALUES (2, TRUNC (TO_DATE('28-FEB-2005','DD-MON-YYYY')), 
TRUNC(TO_DATE('28-FEB-2005','DD-MON-YYYY')) + 20/24,
TRUNC(TO_DATE('28-FEB-2005','DD-MON-YYYY')) + 1/24);

COMMIT;
