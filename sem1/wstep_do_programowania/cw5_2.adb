with ada.text_io;
use  ada.text_io;

--Napisac program wypisujacy nazwy wszystkich miesiecy "parzystych" 
--(wykorzystac typ wyliczeniowy i petle).

procedure cw5_2 is

type miesiace is (styczen, luty, marzec, kwiecien, maj, czerwiec, lipiec,
  		  sierpien, wrzesien, pazdziernik, listopad, grudzien);

package mies_io is new ada.text_io.enumeration_io(miesiace);
use mies_io;

begin
for i in miesiace'first..miesiace'last loop
	if (miesiace'pos(i)+1) mod 2 = 0 then
		put (i,set=>lower_case);
		new_line;
	end if;

end loop;
end;
