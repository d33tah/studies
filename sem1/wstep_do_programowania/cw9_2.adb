with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program pobierajacy od uzytkownika dwie macierze kwadratowe o 
--podanym przez uzytkownika rozmiarze i tworzacy macierz bedaca ich suma oraz 
--macierz bedaca ich iloczynem.

procedure cw9_2 is
n: integer;
begin
put("Podaj wielkosc macierzy kwadratowej: ");
get(n);

declare
type t is array(1..n,1..n) of integer;
t1,t2: t;
begin

put_line("Najpierw pobiore pierwsza macierz.");
for i1 in t'range(1) loop
	for i2 in t'range(2) loop
		put("Podaj element na pozycji (");
		put(i1,width=>0);
		put(";");
		put(i2,width=>0);
		put(") => ");
		get(t1(i1,i2));
	end loop;
end loop;

put_line("Teraz pobiore druga macierz.");
for i1 in t'range(1) loop
        for i2 in t'range(2) loop
                put("Podaj element na pozycji (");
                put(i1,width=>0);
                put(";");
                put(i2,width=>0);
                put(") => ");
                get(t2(i1,i2));
        end loop;
end loop;

new_line;
put_line("Oto ich suma: ");
for i1 in t'range(1) loop
        for i2 in t'range(2) loop
                put(t1(i1,i2)+t2(i1,i2),width=>3);
        end loop;
	new_line;
end loop;

new_line;
put_line("A oto iloczyn:");
for i1 in t'range(1) loop
        for i2 in t'range(2) loop
                put(t1(i1,i2)*t2(i1,i2),width=>3);
        end loop;
	new_line;
end loop;

end;

end cw9_2;
