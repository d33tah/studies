with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisac program wczytujacy z klawiatury dwie daty (zapisane za pomoca trzech
--liczb calkowitych, oznaczajacych dzień, miesiac i rok) i sprawdzajacy, czy 
--te daty sa prawidlowe (uzwgledniajac przy tym przestepnosc lat) oraz 
--czy pierwsza data jest wczesniejsza od drugiej.

procedure cw3_6 is

function sprawdz (d, m, r: integer) return boolean is
max_dzien: integer;
begin
if not ( m in 1..12) then
begin
	return false;
end;
else
begin
	if (m=2) then
	begin
		if (r rem 4 =0 and ( not (r rem 100=0) or (r rem 400 = 0) ) ) then
		begin
			max_dzien:=29;
		end;
		else
		begin
			max_dzien:=28;
		end;
		end if;
	end;
	else
	begin
		if (m rem 2 = 0) then
		begin
			max_dzien:=30;			
		end;
		else
		begin
			max_dzien:=31;
		end;
		end if;
	end;
	end if;
end;
end if;
return (d > 0 and not (d > max_dzien) );
end;


d1, m1, r1, d2, m2, r2: integer;
begin
put_line("---PIERWSZA DATA---");
put("Rok: "); get(r1);
put("Miesiac: "); get(m1);
put("Dzien: "); get(d1);

new_line;

put_line("---DRUGA DATA---");
put("Rok: "); get(r2);
put("Miesiac: "); get(m2);
put("Dzien: "); get(d2);

if (not sprawdz(d1,m1,r1) and not sprawdz(d2,m2,r2)) then
begin
put_line("Ktoras z podanych dat jest nieprawidlowa");
end;
else
begin
	if (r1>r2 or (r1=r2 and m1>m2) or (r1=r2 and m1=m2 and d1>d2)) then
	begin
		put("Pierwsza data jest pozniejsza.");
	end;
	else
	begin
		put("Druga data jest pozniejsza.");
	end;
	end if;
end;
end if;


end;
