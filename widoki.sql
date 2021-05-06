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
                        where k.id_rasy=r2.id_rasy
                         )
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

drop view Otwarte_pastwiska;