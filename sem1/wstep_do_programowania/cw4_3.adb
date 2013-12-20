with ada.text_io;
use  ada.text_io;

--Napisac program pobierajacy od uzytkownika nazwe miesiaca w jezyku polskim, 
--a nastepnie wypisujacy jej tlumaczenie na wybrany przez uzytkownika jeden 
--z dwoch dostepnych jezykow obcych.

procedure cw4_3 is
type miesiace_pl is (styczen, luty, marzec, kwiecien, maj, czerwiec, lipiec,
        sierpien, wrzesien, pazdziernik, listopad, grudzien);
type miesiace_en is (january, february, march, april, may, june, july, august,
	september, october, november, december);
type miesiace_de is (januar, februar, marz, april, mai, juni, juli, september,
	oktober, november, dezember);


package mpl_io is new ada.text_io.enumeration_io(miesiace_pl);
use mpl_io;

package men_io is new ada.text_io.enumeration_io(miesiace_en);
use men_io;

package mde_io is new ada.text_io.enumeration_io(miesiace_de);
use mde_io;

miesiac_pl : miesiace_pl;

begin

put("Podaj miesiac po polsku: ");
get(miesiac_pl);

put("Po angielsku brzmi on: ");
put(miesiace_en'val(miesiace_pl'pos(miesiac_pl)),set=>lower_case);
new_line;

put("Po niemiecku brzmi on: ");
put(miesiace_de'val(miesiace_pl'pos(miesiac_pl)),set=>lower_case);
new_line;

end;
