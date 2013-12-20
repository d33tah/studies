with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program wczytujacy tablice liczb calkowitych o dlugosci podanej 
--przez uzytkownika, a nastepnie, w zaleznosci od decyzji uzytkownika:
--
-- * oblicza ilosc parzystych oraz ilosc nieparzystych elementow tablicy;
-- * oblicza dlugosc najdluzszego fragmentu tablicy, w ktorym wszystkie 
--   elementy sa dodatnie;
-- * wczytuje dwie liczby calkowite L i P (liczby maja byc dodatnie i nie 
--   wieksze od dlugosci tablicy), a nastepnie odwraca kolejnosc 
--   elementow we fragmencie wyznaczonym przez wartosci tych zmiennych.
--Program powinien pozwalac na wielokrotne wybieranie czynnosci do wykonania.

procedure cw8_4 is
n: integer;
wybor: integer;
parzyste, nieparzyste, najdluzszy, l, p, tymczasowa: integer;
begin

put("Podaj dlugosc tablicy: ");
get(n);

declare
type t_t1 is array (1..n) of integer;
t1: t_t1;
begin

for i in t1'range loop
	put("Podaj liczbe numer ");
	put(i,width=>0);
	put(": ");
	get(t1(i));
end loop;

while true loop
	new_line;
	put_line("1. Policz parzyste i nieparzyste elementy");
	put_line("2. Najdluzszy dodatni fragment tablicy");
	put_line("3. Odwroc fragment tablicy");
	put_line("---");
	put_line("0. Opusc program");
	new_line;
	put("Wybierz opcje: ");
	get(wybor);

	case wybor is 
		when 0=>
			put_line("Koniec wykonywania programu.");
		exit;

		when 1=>
			parzyste:=0;
			nieparzyste:=0;
			for i in t1'range loop
				if t1(i) mod 2 = 0 then
					parzyste:=parzyste+1;
				else
					nieparzyste:=nieparzyste+1;
				end if;
			end loop;

			put("Elementow parzystych: ");
			put(parzyste,width=>0);
			put_line(".");

			put("Elementow nieparzystych: ");
			put(nieparzyste,width=>0);
			put_line(".");

		when 2=>
			tymczasowa:=0;
			najdluzszy:=0;

			for i in t1'range loop
				if t1(i)>0 then
					tymczasowa:=tymczasowa+1;
						if tymczasowa>najdluzszy then
							najdluzszy:=tymczasowa;
						end if;
				else
					tymczasowa:=0;
				end if;
			end loop;

			put("Najdluzszy dodatni podciag tablicy ma dlugosc: ");
			put(najdluzszy,width=>0);

		when 3=>
			put("Podaj L: ");
			get(l);

			put("Podaj P: ");
			get(p);


			if p>l then --upewniamy sie ze l>p
				tymczasowa:=p;
				p:=l;
				l:=tymczasowa;
			end if;

			for a in 0..l-p loop
				if p+a/=l-a and p+a>l-a then

					--put(p+a);put("=>");put(l-a);new_line;

					tymczasowa:=t1(p+a);
					t1(p+a):=t1(l-a);
					t1(l-a):=tymczasowa;
				end if;
			end loop;

			for i in t1'range loop
				put(t1(i));
				new_line;
			end loop;

		when others=>
			put("Nieprawidlowy wybor, wybierz jeszcze raz. ");

	end case;

end loop;

end;

end cw8_4;
