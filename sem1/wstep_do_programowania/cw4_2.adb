with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program pobierajacy od uzytkownika nazwe miesiaca i rok, a 
--nastepnie wypisujacy ile dni ma podany miesiac (uwzgledniajac lata 
--przestepne).

procedure cw4_2 is
type miesiace is (styczen, luty, marzec, kwiecien, maj, czerwiec, lipiec,
	sierpien, wrzesien, pazdziernik, listopad, grudzien);
package m_io is new ada.text_io.enumeration_io(miesiace);
use m_io;
miesiac: miesiace;
rok: integer;
ilosc_dni:integer;
begin
put("Podaj rok: "); get(rok);
put("Podaj miesiac: "); get(miesiac);

if (miesiac=luty) then
begin
        if (rok rem 4 =0 and ( not (rok rem 100=0) or (rok rem 400 = 0) ) ) then
        begin
                ilosc_dni:=29;
        end;
        else
        begin
                ilosc_dni:=28;
        end;
        end if;
end;
else
begin
        if ( miesiace'pos(miesiac)+1 rem 2 = 0) then
        begin
                ilosc_dni:=30;
        end;
        else
        begin
                ilosc_dni:=31;
        end;
        end if;
end;
end if;

put("Ten miesiac ma ");
put(ilosc_dni, width=>0);
put_line(" dni.");

end;
