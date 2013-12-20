with ada.text_io, ada.integer_text_io, ada.float_text_io, ada.numerics.elementary_functions;
use  ada.text_io, ada.integer_text_io, ada.float_text_io, ada.numerics.elementary_functions;

--Napisac program pobierajacy od uzytkownika liczby calkowite az do podania 
--liczby 0 kończacej pobieranie. Program sprawdza, czy kazda trojka kolejno 
--podanych liczb moze stanowic dlugosci bokow trojkata, i jesli tak - wypisuje
--jego pole i obwod. Końcowe zero nie jest brane pod uwage. Jesli podano mniej
--niz trzy liczby, program wypisuje odpowiedni komunikat. 
--
--Program nalezy zrealizowac za pomoca funkcji:
-- * funkcji Czy_Trojkat, zwracajacej wartosc mowiaca, czy liczby calkowite 
--   podane jako parametry moga byc dlugosciami bokow trojkata
-- * funkcji zwracajacej obwod trojkata o bokach podanych jako parametry,
-- * funkcji zwracajacej pole trojkata o bokach podanych jako parametry.

procedure cw10_1 is
a,b,c: float;
iteracja:integer:=0;

function moze(a,b,c: float) return boolean is
begin
return abs(b-c)<a and a<b+c;
end;

function obwod(a,b,c: float) return float is
begin
return a+b+c;
end;

function pole(a,b,c: float) return float is
p: float;
begin
        p := obwod(a,b,c)/2.0;
        return sqrt(p*(p-float(a))*(p-float(b))*(p-float(c)));
end;

begin

loop
put("Podaj a: ");
get(a);
exit when a=0.0;

put("Podaj b: ");
get(b);
exit when b=0.0;

put("Podaj c: ");
get(c);
exit when c=0.0;

if not moze(a,b,c) then
put_line("Z tych odcinkow nie mozna zbudowac trojkata.");
else
put_line("Z tych odcinkow mozna zbudowac trojkat.");
put("Jego obwod to: "); put(obwod(a,b,c),exp=>0,aft=>2); put_line(".");
put("Jego pole to: "); put(pole(a,b,c),exp=>0,aft=>2); put_line(".");
end if;

iteracja:=iteracja+1;

end loop;

if iteracja<1 then
put("Program nie zostal wykonany ani raz.");
end if;

end;
