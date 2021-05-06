CREATE TABLE LOKALIZACJA
(
ID_LOKALIZACJI NUMBER(9,0) PRIMARY KEY,
ULICA VARCHAR2(32) NOT NULL,
NUMER_DZIALKI NUMBER(4,0) NOT NULL,
MIEJSCOWOSC VARCHAR2(32) NOT NULL,
PANSTWO VARCHAR2(32) NOT NULL
);

CREATE TABLE PASTWISKA
(
ID_PASTWISKA NUMBER(9,0) PRIMARY KEY,
POJEMNOSC NUMBER(6,0) NOT NULL,
ID_LOKALIZACJI NUMBER(4,0) REFERENCES LOKALIZACJA(ID_LOKALIZACJI) NOT NULL
);

CREATE TABLE PRACOWNICY
(
ID_PRACOWNIKA NUMBER(9,0) PRIMARY KEY,
IMIE VARCHAR2(16) NOT NULL,
NAZWISKO VARCHAR2(32) NOT NULL,
NUMER_TEL NUMBER(13,0) CHECK(LENGTH(NUMER_TEL) >= 9) NOT NULL,
ID_KIEROWNIKA NUMBER(9,0) REFERENCES PRACOWNICY(ID_PRACOWNIKA)
);

CREATE TABLE OBORY
(
ID_OBORY NUMBER(9,0) PRIMARY KEY,
POJEMNOSC NUMBER(6,0) NOT NULL,
ID_KIEROWNIKA NUMBER(9,0) REFERENCES PRACOWNICY(ID_PRACOWNIKA) NOT NULL,
ID_PASTWISKA NUMBER(9,0) REFERENCES PASTWISKA(ID_PASTWISKA) NOT NULL,
ID_LOKALIZACJI NUMBER(9,0) REFERENCES LOKALIZACJA(ID_LOKALIZACJI) NOT NULL
);

CREATE TABLE RASY
(
ID_RASY NUMBER(9,0) PRIMARY KEY,
NAZWA VARCHAR2(32) NOT NULL,
SREDNIA_WYDAJNOSC NUMBER(5,0),
SREDNIA_WAGA NUMBER(4,0),
SREDNIA_DL_ZYCIA NUMBER(3,1)
);

CREATE TABLE KROWY
(
ID_KROWY NUMBER(9,0) PRIMARY KEY,
WYDAJNOSC_MLECZNA NUMBER(5,0) NOT NULL,
DATA_UR DATE NOT NULL,
ID_RASY NUMBER(9,0) REFERENCES RASY(ID_RASY) NOT NULL,
ID_OBORY NUMBER(9,0) REFERENCES OBORY(ID_OBORY) NOT NULL
);
-------------------------------------------------------------------------------------

INSERT ALL
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(1, 'Zachodnia', 25, 'Krolowy most', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(2, 'Wschodnia', 57, 'Krolowy most', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(3, 'Polnocna', 20, 'Krolowy most', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(4, 'Polnocna', 21, 'Krolowy most', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(5, 'Poludniowa', 18, 'Krolowy most', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(6, 'Poludniowa', 19, 'Krolowy most', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(7, 'Stodolowa', 12, 'Rogowo', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(8, 'Stodolowa', 14, 'Rogowo', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(9, 'Stodolowa', 13, 'Rogowo', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(10, 'Stodolowa', 15, 'Rogowo', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(11, 'Liliowa', 01, 'Rogowo', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(12, 'Liliowa', 05, 'Rogowo', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(13, 'Stodolowa', 17, 'Rogowo', 'Polska')
INTO LOKALIZACJA(id_lokalizacji, ulica, numer_dzialki, miejscowosc, panstwo) VALUES(14, 'Liliowa', 11, 'Rogowo', 'Polska')
SELECT * FROM dual;

INSERT ALL
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(1, 50, 3)
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(2, 100, 4)
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(3, 75, 5)
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(4, 80, 6)
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(5, 40, 11)
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(6, 60, 8)
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(7, 65, 10)
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(8, 90, 12)
INTO PASTWISKA (id_pastwiska, pojemnosc, id_lokalizacji) Values(9, 90, 14)
SELECT * FROM DUAL;

INSERT ALL 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel)values(1,'Mariusz', 'Nowak', '0048123321231')
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel)values(2,'Zenon', 'Kowalski', '0048456654564')
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel)values(3,'Cat', 'Valentine', '0048234432324')
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel)values(4,'Sam', 'Puckett', '0048345543435')
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel)values(5,'Krzysztof', 'Zdunski', '0048456654564')
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(6,'Eugeniusz', 'Velvet', '0048567765657', 1) 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(7,'Robert', 'Viqueens', '0048678876786', 1) 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(8,'Tomasz', 'Raven', '0048789987879', 2) 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(9,'Karol', 'Nevar', '0048890098980', 2) 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(10,'Oskar', 'Piechur', '0048321123213', 3) 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(11,'Kamil', 'Ekwador', '00482466424266', 3)
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(12,'Teresa', 'Mostowiak', '0048357753537', 4) 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(13,'Ross', 'Geller', '976654867', 4) 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(14,'Britney', 'Spears', '753951852', 5) 
INTO PRACOWNICY (id_pracownika, imie, nazwisko, numer_tel, id_kierownika)values(15,'Lara', 'Croft', '745896321', 5)
SELECT * FROM dual;

INSERT ALL
INTO OBORY (ID_obory, pojemnosc, Id_kierownika, Id_pastwiska, Id_lokalizacji) values(1, 50, 1, 2, 1)
INTO OBORY (ID_obory, pojemnosc, Id_kierownika, Id_pastwiska, Id_lokalizacji) values(2, 60, 2, 3, 2)
INTO OBORY (ID_obory, pojemnosc, Id_kierownika, Id_pastwiska, Id_lokalizacji) values(3, 30, 3, 6, 7)
INTO OBORY (ID_obory, pojemnosc, Id_kierownika, Id_pastwiska, Id_lokalizacji) values(4, 100, 4, 7, 9)
INTO OBORY (ID_obory, pojemnosc, Id_kierownika, Id_pastwiska, Id_lokalizacji) values(5, 75, 5, 9, 13)
SELECT * FROM dual;

INSERT ALL
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(1,'HF czarno-biala', 700, 10, 8360)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(2,'HF czerwono-biala', 700, 10, 7601)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(3,'Simental', 750, 9, 6252)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(4,'Polska czerwona', 500, 10, 3645)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(5,'Jersey', 400, 8, 6465)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(6,'Montbeliarde', 650, 8, 7758)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(7,'Bialogrzbieta', 700, 10, 4253)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(8,'Polska czerwono-biala', 650, 10, 4509)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(9,'Polska czarno-biala', 700, 10, 4668)
INTO RASY (ID_rasy, nazwa, srednia_waga, srednia_dl_zycia, srednia_wydajnosc) Values(10,'Brown swiss', 640, 10, 6720)
SELECT * FROM dual;

INSERT ALL
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(1, '22-06-11', 1, 1, 8250)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(2, '23-02-11', 1, 2, 8400)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(3, '20-07-12', 1, 1, 7900)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(4, '24-09-15', 1, 2, 7600)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(5, '25-05-11', 1, 6, 8050)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(6, '15-01-09', 1, 6, 7750)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(7, '01-12-08', 1, 10, 7035)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(8, '30-09-10', 1, 10, 7934)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(9, '29-07-12', 1, 5, 6702)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(10, '08-03-14', 1, 5, 6301)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(11, '18-04-09', 2, 3, 6303)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(12, '29-02-10', 2, 3, 6354)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(13, '11-05-12', 2, 4, 4005)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(14, '13-07-13', 2, 4, 3205)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(15, '06-11-11', 2, 7, 4307)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(16, '02-07-14', 2, 7, 4608)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(17, '05-03-13', 2, 8, 4359)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(18, '07-01-12', 2, 8, 4412)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(19, '09-07-15', 2, 8, 4711)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(20, '30-11-11', 2, 9, 4613)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(21, '01-06-11', 3, 1, 8215)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(22, '02-02-11', 3, 2, 8416)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(23, '03-07-12', 3, 1, 7917)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(24, '04-09-15', 3, 2, 7618)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(25, '05-05-11', 3, 6, 8019)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(26, '06-01-09', 3, 6, 7724)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(27, '07-12-08', 3, 10, 7026)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(28, '08-09-10', 3, 10, 7928)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(29, '09-12-12', 3, 5, 6734)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(30, '10-03-14', 3, 5, 6336)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(31, '11-04-09', 4, 3, 6369)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(32, '12-02-10', 4, 3, 6387)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(33, '13-05-12', 4, 4, 4094)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(34, '14-07-13', 4, 4, 3265)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(35, '15-11-11', 4, 7, 4336)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(36, '16-07-14', 4, 7, 4663)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(37, '17-03-13', 4, 8, 4351)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(38, '18-01-12', 4, 8, 4457)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(39, '19-07-15', 4, 8, 4758)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(40, '20-11-11', 4, 9, 4659)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(41, '21-03-14', 5, 5, 6356)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(42, '22-04-09', 5, 3, 6353)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(43, '23-02-10', 5, 3, 6325)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(44, '24-05-12', 5, 4, 4021)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(45, '25-07-13', 5, 4, 3224)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(46, '26-11-11', 5, 7, 4327)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(47, '27-07-14', 5, 7, 4628)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(48, '28-03-13', 5, 8, 4329)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(49, '29-01-12', 5, 8, 4426)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(50, '30-07-15', 5, 8, 4723)
INTO KROWY (ID_krowy, data_ur, id_obory, id_rasy, wydajnosc_mleczna)VALUES(51, '01-11-11', 5, 9, 4674)
SELECT * FROM dual;
--------------------------------------------------------------------------------------------------------

CREATE VIEW Informacje_o_kierownikach AS
SELECT  o.id_obory, p.imie, p.nazwisko, p.numer_tel
FROM obory o 
join pracownicy p
on o.id_kierownika=p.id_pracownika;

CREATE VIEW Pracownicy_obor AS
SELECT  o.id_obory, p.imie, p.nazwisko, p.numer_tel
FROM pracownicy p, obory o
WHERE p.id_kierownika = o.id_kierownika or o.id_kierownika = p.id_pracownika
order by o.id_obory ASC;

CREATE VIEW Wydajne_krowy AS
SELECT  o.id_obory, k.id_krowy, r.nazwa as "NAZWA RASY", k.wydajnosc_mleczna as wydajnosc, r.SREDNIA_WYDAJNOSC as "SREDNIA WYDAJNOSC RASY"
FROM obory o
join krowy k
on o.id_obory=k.id_obory
join rasy r
on k.id_rasy = r.Id_rasy
where k.wydajnosc_mleczna>=(select r2.Srednia_wydajnosc from rasy r2
                        where k.id_rasy=r2.id_rasy)
ORDER by r.Srednia_wydajnosc desc, r.nazwa desc, k.wydajnosc_mleczna desc;

CREATE VIEW Wypelnienie_obor AS
SELECT  o.id_obory, o.pojemnosc as dopuszczalna_pojemnosc, COUNT(k.id_krowy) as ilosc_krow
FROM obory o 
join krowy k
on o.id_obory = k.id_obory
group by o.id_obory, o.pojemnosc
order by o.id_obory;
       
CREATE VIEW Otwarte_pastwiska AS
SELECT  o.id_obory as id_obory, i.miejscowosc as "MIEJSCOWOSC OBORY", i.ulica as "ULICA OBORY", i.numer_dzialki as "NUMER DZIALKI OBORY",
        p.id_pastwiska as id_pastwiska, l.miejscowosc as "MIEJSCOWOSC PASTWISKA", l.ulica as "ULICA PASTWISKA", l.numer_dzialki as "NUMER DZIALKI PASTWISKA"
FROM obory o 
join lokalizacja i
on o.id_lokalizacji=i.id_lokalizacji
join pastwiska p
on o.id_pastwiska=p.id_pastwiska
join lokalizacja l
on p.id_lokalizacji=l.id_lokalizacji
order by o.id_obory asc;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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