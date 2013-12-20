with ada.text_io, ada.integer_text_io, ada.float_text_io;
use  ada.text_io, ada.integer_text_io, ada.float_text_io;

--Napisac program pobierajacy od uzytkownika wspolczynniki trojmianu 
--kwadratowego (liczby calkowite) oraz wartosc zmiennej (liczbe 
--rzeczywista) i wypisujacy wartosc podanego trojmianu dla tej zmiennej.

procedure cw2_6 is
a, b, c: integer;
x: float;
d: float;
begin
put("Podaj a: "); get(a);
put("Podaj b: "); get(b);
put("Podaj c: "); get(c);
put("Podaj x: "); get(x);

put("f(x)=");
put(float(a)*(x**2)+float(b)*x+float(c), exp=>0);

end;
