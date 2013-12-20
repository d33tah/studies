with ada.text_io;
use  ada.text_io;

--Napisac program, ktory wypisuje "tabelke logiczna" dla formuly 
--(p i q) => ~ p, ladnie ja przy tym formatujac (wykorzystac typ logiczny 
--i petle).

procedure cw5_3 is
package boolio is new ada.text_io.enumeration_io(boolean);
use boolio;
begin

--mam nadzieje, ze o cos takiego chodzilo... nie wiedzialem co z ta implikacja

put_line("+-------+-------+-------+-------+");
put_line("|   p   |   q   |  p&q  |  ~p   |");
put_line("+-------+-------+-------+-------+");

for p in false..true loop
	for q in false..true loop
		put("| "); 
		put(p,width=>5); 
		put(" | "); 
		put(q,width=>5); 
		put(" | "); 
		put(p and q,width=>5); 
		put(" | "); 
		put(not p,width=>5); 
		put(" | ");
		new_line;
	end loop;
end loop;

put_line("+-------+-------+-------+-------+");

end;
