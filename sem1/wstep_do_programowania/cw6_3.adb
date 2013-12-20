with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Smok Podwawelski to wielki zarlok: wczoraj porwal i pozarl jedna 
--owce, a dzis powiekszyl swoje menu o jedna sztuke kradnac dwie owce.
--Smok postanowil, ze kazdego nastepnego dnia zje tyle owiec ile zjadl 
--dnia poprzedniego i dodatkowo bedzie dokladal sobie o jedna sztuke 
--wiecej, niz dolozyl w dniu poprzednim - a wiec jutro pozre cztery 
--owce, a pojutrze siedem. Napisac program, ktory wyznaczy ilosc owiec, 
--jaka zje smok w n-tym dniu oraz laczna liczbe owiec zjedzonych przez 
--smoka przez te n dni. Wejscie: liczba dni; wyjscie: liczba owiec 
--zjedzonych w n-tym dniu i calkowita liczba owiec zjedzonych przez n dni

procedure cw6_3 is
liczba_dni: integer;
razem_zjedzone: integer:=0;
dzisiaj: integer;
begin

put("Podaj liczbe dni: ");
get(liczba_dni);

for i in 1..liczba_dni loop
dzisiaj := razem_zjedzone+1;
razem_zjedzone := razem_zjedzone + dzisiaj;
--put(razem_zjedzone);
--new_line;
end loop;

put("Dzisiaj smok zje ");
put(dzisiaj,width=>0);
put(" owiec, razem zjadl juz ");
put(razem_zjedzone,width=>0);
put_line(".");

end;
