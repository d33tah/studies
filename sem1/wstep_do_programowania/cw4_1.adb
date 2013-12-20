with ada.text_io;
use  ada.text_io;

--Napisac program pobierajacy nazwe dnia tygodnia, a nastepnie wypisujacy: 
--(a) czy jest to dzien roboczy czy wolny, (b) za ile dni bedzie weekend,
--(c) jakimi dniami tygodnia sa jutro, pojutrze, wczoraj i przedwczoraj

procedure cw4_1 is
type dni is (poniedzialek, wtorek, sroda, 
	czwartek, piatek, sobota, niedziela);
dzien: dni;
package dni_io is new ada.text_io.enumeration_io(dni);
use dni_io;

--mialem problemy z napisaniem funkcji bioracych jako parametr typ 'dni'.

function nastepny(val: integer) return integer is
begin
	case val is
	when 0..5 => return val+1;
	when 6 => return 0;
	when others => return 0;
	end case;
end;

function poprzedni(val: integer) return integer is
begin
        case val is
        when 1..6 => return val-1;
        when 0 => return 6;
        when others => return 0;
        end case;
end;

begin
put("Podaj dzien: ");
get(dzien);

if (dzien in sobota..niedziela) then
begin
	put_line("Jest to dzien wolny.");
end;
else
begin
	put_line("Jest to dzien roboczy.");
	put("Dni do weekendu: ");
	put_line(integer'image(5-dni'pos(dzien)));
	new_line;
end;
end if;

put("Jutro bedzie: ");
put(dni'val(nastepny(dni'pos(dzien))),set=>lower_case);
new_line;

put("Pojutrze bedzie: ");
put(dni'val(nastepny(nastepny(dni'pos(dzien)))),set=>lower_case);
new_line(2);

put("Wczoraj byl: ");
put(dni'val(poprzedni(dni'pos(dzien))),set=>lower_case);
new_line;

put("Przedwczoraj byl: ");
put(dni'val(poprzedni(poprzedni(dni'pos(dzien)))),set=>lower_case);
new_line;

end cw4_1;
