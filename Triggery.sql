CREATE TABLE KROWY_UPDT_LOG
(
DATA_LOG DATE,
AKCJA VARCHAR2(50),
ID_KROWY NUMBER(9,0) 
);

CREATE TABLE PRACOWNICY_UPDT_LOG
(
DATA_LOG DATE,
AKCJA VARCHAR2(50),
ID_PRACOWNIKA NUMBER(9,0)
);

CREATE OR REPLACE TRIGGER log_krowy_updt1 AFTER UPDATE OR INSERT OR DELETE ON KROWY FOR EACH ROW
DECLARE
  akcja VARCHAR2(50); 
BEGIN	
  IF UPDATING THEN 
    akcja:='Zaktualizowano dane krowy'; 
    INSERT INTO krowy_updt_log VALUES(SYSDATE, akcja, :NEW.ID_KROWY);
  END IF;
  IF INSERTING THEN
    akcja:='Dodano nowa krowe';
    INSERT INTO krowy_updt_log VALUES(SYSDATE, akcja, :NEW.ID_KROWY);
  END IF;
  IF DELETING THEN
    akcja:='Usunieto krowe'; 
     INSERT INTO krowy_updt_log VALUES(SYSDATE, akcja, :OLD.ID_KROWY);
END IF;  
END;

DROP TRIGGER log_krowy_updt1;

--SPRAWDZANIE POPRAWNOSCI TRIGERA
INSERT INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(54, '22-06-11', 1, 1, 8250);
----
UPDATE krowy
SET wydajnosc_mleczna=9000
WHERE id_krowy=54;
----
DELETE FROM krowy
WHERE id_krowy=54;
--
DELETE FROM krowy_updt_log 
where id_krowy = 54;
----------------------------

CREATE OR REPLACE TRIGGER log_pracownicy_updt1 AFTER UPDATE OR INSERT OR DELETE ON PRACOWNICY FOR EACH ROW
DECLARE
  akcja VARCHAR2(50); 
BEGIN	
  IF UPDATING THEN 
    akcja:='Zaktualizowano dane pracownika'; 
    INSERT INTO pracownicy_updt_log VALUES(SYSDATE, akcja, :NEW.ID_PRACOWNIKA);
  END IF;
  IF INSERTING THEN
    akcja:='Dodano nowego pracownika';
    INSERT INTO pracownicy_updt_log VALUES(SYSDATE, akcja, :NEW.ID_PRACOWNIKA);
  END IF;
  IF DELETING THEN
    akcja:='Usunieto pracownika'; 
     INSERT INTO pracownicy_updt_log VALUES(SYSDATE, akcja, :OLD.ID_PRACOWNIKA);
END IF;  
END;

--SPRAWDZANIE POPRAWNOSCI TRIGERA
INSERT INTO PRACOWNICY (ID_PRACOWNIKA, imie, nazwisko, numer_tel, id_kierownika)VALUES(54, 'Test', 'Testownik', '555666777', 2);
----
UPDATE PRACOWNICY
SET id_kierownika = 3
WHERE id_pracownika = 54;
----
DELETE FROM PRACOWNICY
WHERE id_pracownika = 54;
--
DELETE FROM pracownicy_updt_log 
where id_pracownika = 54;
----------------------------
