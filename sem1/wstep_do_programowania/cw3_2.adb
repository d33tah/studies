with ada.numerics, ada.text_io, ada.integer_text_io, ada.float_text_io;
use  ada.numerics, ada.text_io, ada.integer_text_io, ada.float_text_io;

--Napisac program obliczajacy - w zaleznosci od wyboru uzytkownika - pole 
--powierzchni lub objetosc kuli o promieniu podanym przez uzytkownika. Promien
--ma byc liczba calkowita.


procedure cw3_2 is
r: integer;
wybor: integer;
begin
put("Podaj promien kuli: "); get(r);
put("Wpisz 1 dla pola powierzchni, 2 dla objetosci: "); get(wybor);

if (wybor=1) then
	put("Powierzchnia tej kuli to: ");
	put(float(4*pi*r**2),exp=>0);
	new_line;
elsif (wybor=2) then
	put("Objetoscc tej kuli to: ");
	put(float(0.75*pi*r**3),exp=>0);
else
	put("Blad.");
end if;

end;
