﻿/* Задание 6 */
CREATE SEQUENCE seq_caterer
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_deliver
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_employer
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_group
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_inprice
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_material
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_messure
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_section
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_store
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_supply
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE seq_surplus
  START WITH 1
  INCREMENT BY 1;

/* Задание 7 */
INSERT INTO T_MESSURE (ID_MESSURE, NAME)
  VALUES (SEQ_MESSURE.NEXTVAL, 'ШТ');
INSERT INTO T_MESSURE (ID_MESSURE, NAME)
  VALUES (SEQ_MESSURE.NEXTVAL, 'М');
INSERT INTO T_MESSURE (ID_MESSURE, NAME)
  VALUES (SEQ_MESSURE.NEXTVAL, 'КГ');
INSERT INTO T_MESSURE (ID_MESSURE, NAME)
  VALUES (SEQ_MESSURE.NEXTVAL, 'Т');
INSERT INTO T_MESSURE (ID_MESSURE, NAME)
  VALUES (SEQ_MESSURE.NEXTVAL, 'МЛ');
-----
INSERT INTO T_GROUP (ID_GROUP, NAME)
  VALUES (SEQ_GROUP.NEXTVAL, 'Группа 1');
INSERT INTO T_GROUP (ID_GROUP, NAME)
  VALUES (SEQ_GROUP.NEXTVAL, 'Группа 2');
INSERT INTO T_GROUP (ID_GROUP, NAME)
  VALUES (SEQ_GROUP.NEXTVAL, 'Группа 3');
INSERT INTO T_GROUP (ID_GROUP, NAME)
  VALUES (SEQ_GROUP.NEXTVAL, 'Группа 4');
INSERT INTO T_GROUP (ID_GROUP, NAME)
  VALUES (SEQ_GROUP.NEXTVAL, 'Группа 5');
-----
INSERT INTO T_MATERIAL (ID_MATERIAL, NAME, ID_MESSURE, ID_GROUP)
  VALUES (SEQ_MATERIAL.NEXTVAL, 'Материал 1', 1, 1);
INSERT INTO T_MATERIAL (ID_MATERIAL, NAME, ID_MESSURE, ID_GROUP)
  VALUES (SEQ_MATERIAL.NEXTVAL, 'Материал 2', 2, 2);
INSERT INTO T_MATERIAL (ID_MATERIAL, NAME, ID_MESSURE, ID_GROUP)
  VALUES (SEQ_MATERIAL.NEXTVAL, 'Материал 3', 1, 1);
INSERT INTO T_MATERIAL (ID_MATERIAL, NAME, ID_MESSURE, ID_GROUP)
  VALUES (SEQ_MATERIAL.NEXTVAL, 'Материал 4', 3, 3);
INSERT INTO T_MATERIAL (ID_MATERIAL, NAME, ID_MESSURE, ID_GROUP)
  VALUES (SEQ_MATERIAL.NEXTVAL, 'Материал 5', 4, 3);
-----
INSERT INTO T_INPRICE (ID_MATERIAL, PRICE_DATE, PRICE)
  VALUES (SEQ_INPRICE.NEXTVAL, '15.12.2000', 100);
INSERT INTO T_INPRICE (ID_MATERIAL, PRICE_DATE, PRICE)
  VALUES (SEQ_INPRICE.NEXTVAL, '1.1.1', 1);
INSERT INTO T_INPRICE (ID_MATERIAL, PRICE_DATE, PRICE)
  VALUES (SEQ_INPRICE.NEXTVAL, '10.09.2017', 160);
INSERT INTO T_INPRICE (ID_MATERIAL, PRICE_DATE, PRICE)
  VALUES (SEQ_INPRICE.NEXTVAL, '12.02.2003', 345);
INSERT INTO T_INPRICE (ID_MATERIAL, PRICE_DATE, PRICE)
  VALUES (SEQ_INPRICE.NEXTVAL, '16.07.1998', 98);
-----
INSERT INTO T_STORE (ID_STORE, NAME)
  VALUES (SEQ_STORE.NEXTVAL, 'Склад 1');
INSERT INTO T_STORE (ID_STORE, NAME)
  VALUES (SEQ_STORE.NEXTVAL, 'Склад 2');
INSERT INTO T_STORE (ID_STORE, NAME)
  VALUES (SEQ_STORE.NEXTVAL, 'Склад 3');
INSERT INTO T_STORE (ID_STORE, NAME)
  VALUES (SEQ_STORE.NEXTVAL, 'Склад 4');
INSERT INTO T_STORE (ID_STORE, NAME)
  VALUES (SEQ_STORE.NEXTVAL, 'Склад 5');
-----
INSERT INTO T_CATERER (ID_CATERER, NAME, PHONE, FAX, LEGAL_ADDRES, ACTUAL_ADDERS, E_MAIL)
  VALUES (SEQ_CATERER.NEXTVAL, 'Поставщик 1', 89007861149, NULL, 'Город, улица, дом', 'Город, улица, дом', 'caterer1@mail.ru');
INSERT INTO T_CATERER (ID_CATERER, NAME, PHONE, FAX, LEGAL_ADDRES, ACTUAL_ADDERS, E_MAIL)
  VALUES (SEQ_CATERER.NEXTVAL, 'Поставщик 2', 89005741200, NULL, 'Город, улица, дом', 'Город, улица, дом', 'caterer2@mail.ru');
INSERT INTO T_CATERER (ID_CATERER, NAME, PHONE, FAX, LEGAL_ADDRES, ACTUAL_ADDERS, E_MAIL)
  VALUES (SEQ_CATERER.NEXTVAL, 'Поставщик 3', 89003348568, NULL, 'Город, улица, дом', 'Город, улица, дом', 'caterer3@mail.ru');
INSERT INTO T_CATERER (ID_CATERER, NAME, PHONE, FAX, LEGAL_ADDRES, ACTUAL_ADDERS, E_MAIL)
  VALUES (SEQ_CATERER.NEXTVAL, 'Поставщик 4', 89006874511, NULL, 'Город, улица, дом', 'Город, улица, дом', 'caterer4@mail.ru');
INSERT INTO T_CATERER (ID_CATERER, NAME, PHONE, FAX, LEGAL_ADDRES, ACTUAL_ADDERS, E_MAIL)
  VALUES (SEQ_CATERER.NEXTVAL, 'Поставщик 5', 89004458974, NULL, 'Город, улица, дом', 'Город, улица, дом', 'caterer5@mail.ru');
----
INSERT INTO T_SUPPLY (ID_SUPPLY, ID_CATERER, ID_MATERIAL, ID_STORE, SUPPLY_DATE, VOLUME)
  VALUES (SEQ_SUPPLY.NEXTVAL, 1, 2, 4, SYSDATE, 12);
INSERT INTO T_SUPPLY (ID_SUPPLY, ID_CATERER, ID_MATERIAL, ID_STORE, SUPPLY_DATE, VOLUME)
  VALUES (SEQ_SUPPLY.NEXTVAL, 3, 5, 1, SYSDATE, 123);
INSERT INTO T_SUPPLY (ID_SUPPLY, ID_CATERER, ID_MATERIAL, ID_STORE, SUPPLY_DATE, VOLUME)
  VALUES (SEQ_SUPPLY.NEXTVAL, 5, 3, 5, SYSDATE, 12);
INSERT INTO T_SUPPLY (ID_SUPPLY, ID_CATERER, ID_MATERIAL, ID_STORE, SUPPLY_DATE, VOLUME)
  VALUES (SEQ_SUPPLY.NEXTVAL, 1, 2, 4, SYSDATE, 1);
INSERT INTO T_SUPPLY (ID_SUPPLY, ID_CATERER, ID_MATERIAL, ID_STORE, SUPPLY_DATE, VOLUME)
  VALUES (SEQ_SUPPLY.NEXTVAL, 2, 2, 2, SYSDATE, 4567);
-----
INSERT INTO T_SURPLUS (ID_MATERIAL, ID_STORE, VOLUME)
  VALUES (1, 1, 45);
INSERT INTO T_SURPLUS (ID_MATERIAL, ID_STORE, VOLUME)
  VALUES (1, 3, 10);
INSERT INTO T_SURPLUS (ID_MATERIAL, ID_STORE, VOLUME)
  VALUES (2, 5, 456);
INSERT INTO T_SURPLUS (ID_MATERIAL, ID_STORE, VOLUME)
  VALUES (5, 2, 6);
INSERT INTO T_SURPLUS (ID_MATERIAL, ID_STORE, VOLUME)
  VALUES (3, 4, 32);
-----
INSERT INTO T_EMPLOYER (ID_EMPLOYER, NAME, SURNAME, FATHER_NAME)
  VALUES (SEQ_EMPLOYER.NEXTVAL, 'Имя', 'Фамилия', 'Отчество');
INSERT INTO T_EMPLOYER (ID_EMPLOYER, NAME, SURNAME, FATHER_NAME)
  VALUES (SEQ_EMPLOYER.NEXTVAL, 'Имя', 'Фамилия', 'Отчество');
INSERT INTO T_EMPLOYER (ID_EMPLOYER, NAME, SURNAME, FATHER_NAME)
  VALUES (SEQ_EMPLOYER.NEXTVAL, 'Имя', 'Фамилия', 'Отчество');
INSERT INTO T_EMPLOYER (ID_EMPLOYER, NAME, SURNAME, FATHER_NAME)
  VALUES (SEQ_EMPLOYER.NEXTVAL, 'Имя', 'Фамилия', 'Отчество');
INSERT INTO T_EMPLOYER (ID_EMPLOYER, NAME, SURNAME, FATHER_NAME)
  VALUES (SEQ_EMPLOYER.NEXTVAL, 'Имя', 'Фамилия', 'Отчество');
-----
INSERT INTO T_SECTION (ID_SECTION, NAME, ID_EMPLOYER)
  VALUES (SEQ_SECTION.NEXTVAL, 'Цех 1', 1);
INSERT INTO T_SECTION (ID_SECTION, NAME, ID_EMPLOYER)
  VALUES (SEQ_SECTION.NEXTVAL, 'Цех 2', 2);
INSERT INTO T_SECTION (ID_SECTION, NAME, ID_EMPLOYER)
  VALUES (SEQ_SECTION.NEXTVAL, 'Цех 3', 3);
INSERT INTO T_SECTION (ID_SECTION, NAME, ID_EMPLOYER)
  VALUES (SEQ_SECTION.NEXTVAL, 'Цех 4', 4);
INSERT INTO T_SECTION (ID_SECTION, NAME, ID_EMPLOYER)
  VALUES (SEQ_SECTION.NEXTVAL, 'Цех 4', 5);
-----
INSERT INTO T_DELIVER (ID_DELIVER, ID_SECTION, ID_MATERIAL, ID_STORE, DELIVER_DATE)
  VALUES (SEQ_DELIVER.NEXTVAL, 1, 1, 1, SYSDATE);
INSERT INTO T_DELIVER (ID_DELIVER, ID_SECTION, ID_MATERIAL, ID_STORE, DELIVER_DATE)
  VALUES (SEQ_DELIVER.NEXTVAL, 1, 2, 3, SYSDATE);
INSERT INTO T_DELIVER (ID_DELIVER, ID_SECTION, ID_MATERIAL, ID_STORE, DELIVER_DATE)
  VALUES (SEQ_DELIVER.NEXTVAL, 3, 4, 2, SYSDATE);
INSERT INTO T_DELIVER (ID_DELIVER, ID_SECTION, ID_MATERIAL, ID_STORE, DELIVER_DATE)
  VALUES (SEQ_DELIVER.NEXTVAL, 3, 4, 2, SYSDATE);
INSERT INTO T_DELIVER (ID_DELIVER, ID_SECTION, ID_MATERIAL, ID_STORE, DELIVER_DATE)
  VALUES (SEQ_DELIVER.NEXTVAL, 5, 5, 5, SYSDATE);

/* Задание 8 */
DELETE FROM T_INPRICE
  WHERE PRICE_DATE < '31.12.2000';

/* Задание 9 */
ALTER TABLE T_MATERIAL
  DROP CONSTRAINT FK_Material_Messure;
ALTER TABLE T_MATERIAL
  ADD CONSTRAINT FK_Material_Messure 
    FOREIGN KEY (ID_MESSURE) REFERENCES T_MESSURE(ID_MESSURE) ON DELETE SET NULL;
ALTER TABLE T_MATERIAL
  MODIFY (ID_MESSURE INT NULL);
DELETE FROM T_MESSURE
  WHERE NAME LIKE '_';

/* Задание 10 */
UPDATE T_SURPLUS 
 SET VOLUME = 0
   WHERE ID_STORE LIKE 1 ;

/* Задание 11 */
UPDATE T_EMPLOYER
  SET NAME = 'Жданов', SURNAME = 'Петр', FATHER_NAME = 'Александрович'
    WHERE ID_EMPLOYER LIKE 1;

/* Задание 12 */
UPDATE T_CATERER
  SET PHONE = 89002567419
    WHERE NAME LIKE 'Поставщик 3';

/* Задание 13 */
UPDATE T_INPRICE 
  SET PRICE = 0.85 * PRICE
    WHERE PRICE_DATE LIKE '%2017%'
