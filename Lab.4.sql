﻿/* Задание 48 */
CREATE VIEW V_CATERER 
  (ID_CATERER, CATERER_NAME, CONTACT_NAME, CONTACT_SURNAME)
AS
  SELECT T_CATERER.ID_CATERER, T_CATERER.NAME, T_CONTACT.NAME, T_CONTACT.SURNAME
    FROM T_CATERER JOIN T_CONTACT
    ON T_CATERER.ID_CATERER = T_CONTACT.ID_CATERER;

SELECT * FROM V_CATERER;

INSERT INTO V_CATERER 
  (ID_CATERER, CATERER_NAME, CONTACT_NAME, CONTACT_SURNAME)
  VALUES
  (4, 'Поставщик 4', 'Имя6', 'Фамилия6');

DELETE FROM V_CATERER
  WHERE ID_CATERER = 3;

UPDATE V_CATERER
  SET CONTACT_NAME = 'Pavel'
    WHERE ID_CATERER = 1;

/* Задание 49 */
CREATE OR REPLACE VIEW V_SURPLUS
  (MATERIAL, STORE, VOLUME)
AS
  SELECT T_MATERIAL.NAME, T_STORE.NAME, SUM(T_SURPLUS.VOLUME)
    FROM T_MATERIAL JOIN T_SURPLUS  
      ON T_MATERIAL.ID_MATERIAL = T_SURPLUS.ID_MATERIAL
    JOIN T_STORE 
      ON T_SURPLUS.ID_STORE = T_STORE.ID_STORE
  GROUP BY T_MATERIAL.NAME, T_STORE.NAME;

/* Задание 50 */
CREATE VIEW V_SUPPLY
  (CATERER_NAME, MATERIAL, MESSURE, SUPPLY_DATE, PRICE, VOLUME, SUMM)
AS
  SELECT T_CATERER.NAME, T_MATERIAL.NAME, T_MESSURE.NAME, 
         T_SUPPLY.SUPPLY_DATE, T_INPRICE.PRICE,
         T_SUPPLY.VOLUME, T_SUPPLY.VOLUME * T_INPRICE.PRICE
  FROM T_SUPPLY JOIN T_CATERER 
    ON T_SUPPLY.ID_CATERER = T_CATERER.ID_CATERER
  JOIN T_MATERIAL 
    ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
  JOIN T_MESSURE 
    ON T_MATERIAL.ID_MESSURE = T_MESSURE.ID_MESSURE
  JOIN T_INPRICE 
    ON T_MATERIAL.ID_MATERIAL = T_INPRICE.ID_MATERIAL;

/* Задание 51 */
/*В таблице передачи материалов в использование нет атрибута объёма.
  И при проектировании о нём ничего не было сказано.
  Но я всё же добавлю его...*/
ALTER TABLE T_DELIVER
  ADD VOLUME INT CHECK (VOLUME >= 0);
UPDATE T_DELIVER
  SET VOLUME = 10;

CREATE VIEW V_STORE
  (STORE, MATERIAL, MESSURE, SUMM)
AS
  SELECT T_STORE.NAME, T_MATERIAL.NAME, T_MESSURE.NAME,
         SUM(T_DELIVER.VOLUME)
    FROM T_DELIVER JOIN T_STORE 
      ON T_DELIVER.ID_STORE = T_STORE.ID_STORE    
    JOIN T_MATERIAL 
      ON T_DELIVER.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
    JOIN T_MESSURE 
      ON T_MATERIAL.ID_MESSURE = T_MESSURE.ID_MESSURE
    WHERE DELIVER_DATE >= '01.01.2017' AND
          DELIVER_DATE <= '31.12.2017'
  GROUP BY T_STORE.NAME, T_MATERIAL.NAME, T_MESSURE.NAME;

/* Задание 52 */
/*В таблице поставок нет цен поставок.
  И при проектировании, как обычно, об этом ни слова не было сказано.
  Повторю алгоритм добавления нового атрибута.*/
ALTER TABLE T_SUPPLY
  ADD PRICE INT CHECK (PRICE >= 0);
UPDATE T_SUPPLY
  SET PRICE = 120;

CREATE OR REPLACE VIEW V_SUPPLY_PRICE
  (ID, MATERIAL, VOLUME, STORE, PRICE, SUMM)
AS
  SELECT T_SUPPLY.ID_SUPPLY, T_MATERIAL.NAME, T_SUPPLY.VOLUME, 
         T_STORE.NAME, T_SUPPLY.PRICE, 
         T_SUPPLY.VOLUME * T_SUPPLY.PRICE
  FROM T_SUPPLY JOIN T_MATERIAL 
    ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
  JOIN T_STORE 
    ON T_SUPPLY.ID_STORE = T_STORE.ID_STORE
  ORDER BY T_SUPPLY.ID_SUPPLY;

CREATE OR REPLACE VIEW V_INPRICE
  (ID, MATERIAL, VOLUME, STORE, PRICE, SUMM)
AS
  SELECT T_SUPPLY.ID_SUPPLY, T_MATERIAL.NAME, T_SUPPLY.VOLUME, 
         T_STORE.NAME, T_INPRICE.PRICE, 
         T_SUPPLY.VOLUME * T_INPRICE.PRICE
  FROM T_SUPPLY JOIN T_MATERIAL 
    ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
  JOIN T_INPRICE 
    ON T_MATERIAL.ID_MATERIAL = T_INPRICE.ID_MATERIAL
  JOIN T_STORE 
    ON T_SUPPLY.ID_STORE = T_STORE.ID_STORE
  ORDER BY T_SUPPLY.ID_SUPPLY;

CREATE VIEW V_COMPARE
  (MATERIAL, VOLUME, STORE, SUPPLY_PRICE, INPRICE, DIFFERENCE)
AS
  SELECT T_MATERIAL.NAME, T_SUPPLY.VOLUME, T_STORE.NAME,
         V_SUPPLY_PRICE.SUMM, V_INPRICE.SUMM, 
         ABS(V_SUPPLY_PRICE.SUMM - V_INPRICE.SUMM)
  FROM T_SUPPLY JOIN T_MATERIAL 
    ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
  JOIN T_STORE 
    ON T_SUPPLY.ID_STORE = T_STORE.ID_STORE
  JOIN V_SUPPLY_PRICE 
    ON T_SUPPLY.ID_SUPPLY = V_SUPPLY_PRICE.ID
  JOIN V_INPRICE 
    ON T_SUPPLY.ID_SUPPLY = V_INPRICE.ID;
