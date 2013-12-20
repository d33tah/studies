with ada.text_io, ada.integer_text_io, ada.float_text_io, 
	ada.numerics.Elementary_Functions;
use  ada.text_io, ada.integer_text_io, ada.float_text_io, 
	ada.numerics.Elementary_Functions;

--Napisac program, ktory pobiera od uzytkownika trzy liczby calkowite 
--oznaczajace dlugosci odcinkow. Jesli z podanych odcinkow mozna zbudowac 
--trojkat, to program oblicza pole tego trojkata (ze wzoru Herona: pole 
--trojkata o bokach a,b,c to pierwiastek z liczby p(p-a)(p-b)(p-c), gdzie 
--p - polowa sumy bokow). W przeciwnym razie wypisuje informacje, ze podane 
--liczby nie moga byc bokami trojkata.

procedure cw3_3 is
a, b, c: integer;
p, pole: float;
begin
put("Podaj a: "); get(a);
put("Podaj b: "); get(b);
put("Podaj c: "); get(c);

if (abs(b-c)<a and a<b+c) then
begin
	p := (float(a)+float(b)+float(c))/2.0;
	pole := sqrt(p*(p-float(a))*(p-float(b))*(p-float(c)));
	put("Pole trojkata o podanych dlugosciach odcinkow to: ");
	put(pole,exp=>0);
	put_line(".");
end;
else
begin
	put("Z podanych bokow nie mozna zbudowac trojkata!");
end;
end if;

end;

