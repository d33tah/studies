with ada.text_io, ada.integer_text_io, ada.float_text_io;
use  ada.text_io, ada.integer_text_io, ada.float_text_io;

--Napisac program pobierajacy od uzytkownika dwie liczby calkowite oznaczajace
--odpowiednio dlugosc trasy w km i czas jej przebycia w minutach i zwracajacy 
--srednia predkosc na tej trasie (wyrazona w km/h)

procedure cw2_5 is
km, czas: integer;
predkosc: integer;
begin
put("Podaj dlugosc trasy (w km): ");
get(km);

put("Podaj czas przejazdu (w min.): ");
get(czas);

predkosc := 60*km / czas;
put("==>Srednia predkosc jazdy wynosila: ");
put(predkosc,width=>0);
put_line(" kilometrow na godzine.");

end;
