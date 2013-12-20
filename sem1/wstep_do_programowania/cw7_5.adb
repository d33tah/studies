with ada.text_io, ada.integer_text_io, ada.float_text_io;
use  ada.text_io, ada.integer_text_io, ada.float_text_io;

--Zadeklarowac typ wyliczeniowy dni_tygodnia oraz typ tablicowy wydatki 
--indeksowany typem dni_tygodnia i przechowujacy wartosci rzeczywiste. Napisac
--program pobierajacy trzy takie tablice (a w wersji bardziej ambitnej - 
--podana przez uzytkownika liczbe tablic), obliczajacy kwote wydana w danym 
--tygodniu i znajdujacy tydzień o najwiekszych wydatkach.

procedure cw7_5 is
ilosc: integer;
type dni_tygodni is 
	(poniedzialek, wtorek, sroda, czwartek, piatek, sobota, niedziela);
package dni_io is new ada.text_io.enumeration_io(dni_tygodni);
use dni_io;

begin

put("Podaj ilosc tygodni poddawanych analizie: ");
get(ilosc);

declare
type wydatki_tyg is array(dni_tygodni'first..dni_tygodni'last) of float;
type t_wydatki is array(1..ilosc) of wydatki_tyg;
type t_sumy is array(1..ilosc) of float;
wydatki: t_wydatki;
sumy: t_sumy;
max: integer:=1;
begin

for tydzien in 1..ilosc loop
	put("=>Teraz spytam o wydatki w tygodniu ");
	put(tydzien,width=>0);
	put_line(".");

	for n in wydatki(tydzien)'range loop
		put(dni_tygodni(n),set=>lower_case);
		put(": ");
		get(wydatki(tydzien)(n));
		sumy(tydzien):=sumy(tydzien)+wydatki(tydzien)(n);
	end loop;

	new_line;
end loop;


for i in sumy'range loop

	if sumy(i)>sumy(max) then
		max:=i;
	end if;

	put("Tydzien ");
	put(i,width=>0);
	put(": ");
	put(sumy(i),exp=>0,aft=>2);
	put_line(".");
end loop;

new_line;

put("Najwieksze wydatki byly w tygodniu ");
put(max,width=>0);
put(".");
end;
end;
