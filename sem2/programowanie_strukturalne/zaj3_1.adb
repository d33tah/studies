with ada.text_io, ada.integer_text_io, zaj3_1_pakiet;
use  ada.text_io, ada.integer_text_io, zaj3_1_pakiet;

--Napisać pakiet Ulamki udostępniający:
-- * typ prywatny Ulamek;
-- * procedurę pobierającą ułamek będący parametrem;
-- * procedurę wypisującą ułamek będący parametrem;
-- * funkcje "<", "+" i "=" dla ułamków
--
--oraz program testujący działanie tego pakietu.

procedure zaj3_1 is
    X, Y: Ulamek;
begin
    put_line("Najpierw pobiore pierwszy ulamek.");
    pobierz(X);
    new_line;

    put_line("Teraz pobiore drugi ulamek.");
    pobierz(Y);

    put("Ulamek pierwszy=[");
    wypisz(X);
    put("], ulamek drugi=[");
    wypisz(Y);
    put_line("]");

    if X<Y then
        put_line("X jest mniejsze od Y.");
    else
        if X=Y then
            put_line("X i Y sa rowne.");
        else
            put_line("X jest wieksze od Y.");
        end if;
    end if;

    put("Suma tych ulamkow wynosi: ");
    wypisz(X+Y);
    put_line(".");
end;
