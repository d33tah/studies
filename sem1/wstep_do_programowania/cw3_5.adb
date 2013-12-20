with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program sprawdzajacy, czy podany przez uzytkownika rok jest rokiem 
--przestepnym (rok przestepny [liczbowo] spelnia nastepujace warunki: jest 
--podzielny przez 4, ale nie jest podzielny przez 100, chyba ze jest podzielny przez 400).

procedure cw3_5 is
rok: integer;
begin
put("Podaj rok: "); get(rok);
if (rok rem 4 =0 and ( not (rok rem 100=0) or (rok rem 400 = 0) ) ) then
begin
put_line("Jest przestepny.");
end;
end if;
end;
