with ada.text_io, ada.float_text_io;
use  ada.text_io, ada.float_text_io;

--Badania wykazaly, ze pewna ilosc slodz uzywanego w dietetycznych
--napojach gazowanych powoduje smierc myszy. Odchudzajacy sie znajomy,
--ktory bardzo lubi takie napoje, chcialby wiedziec, ile napoju moze
--wypic bez narazania sie na los myszy. Napisac program pobierajacy docelowa
--(tj. po odchudzeniu) wage znajomego i wyswietlajacy, ile litrow napoju wolno
--mu wypic. Mase myszy i mase slodz zabijajaca mysz zadeklarowac jako 
--stale; przyjac tez, ze 1 litr napoju wazy 1,2 kg i zawiera 0.01% slodz.

procedure cw2_3 is
waga_znajomego: float;

nap_na_litr_g: constant float := 1200.0;
slodz_na_litr_proc: constant float := 0.0001;
slodz_na_litr_g: float; --obliczyc w pierwszej kolejnosci!

masa_myszy_kg: constant float := 1.0;
masa_slodiku_zab_g: constant float := 1.0;

litrow_na_kg_dop: float;
begin

slodz_na_litr_g := nap_na_litr_g * slodz_na_litr_proc;
litrow_na_kg_dop := (masa_slodiku_zab_g / slodz_na_litr_g) / (masa_myszy_kg);

put_line("***<DEBUG>***");
put("nap_na_litr_g="); put(exp=>0,item=>nap_na_litr_g); new_line;
put("slodz_na_litr_proc="); put(exp=>0,item=>slodz_na_litr_proc); new_line;
put("slodz_na_litr_g="); put(exp=>0,item=>slodz_na_litr_g); new_line;
put_line("---");
put("masa_myszy_kg="); put(exp=>0,item=>masa_myszy_kg); new_line;
put("masa_slodiku_zab_g="); put(exp=>0,item=>masa_slodiku_zab_g); new_line;
put("litrow_na_kg_dop="); put(exp=>0,item=>litrow_na_kg_dop); new_line;

new_line;
put("=>Przy aktualnych danych mysz musialaby wypic ");
put(masa_myszy_kg * litrow_na_kg_dop,exp=>0);
put(" litrow.");
new_line(2);

put_line("***</DEBUG>***");


put("Podaj docelowa wage znajomego: ");
get(waga_znajomego);

put("Twoj znajomy powinien wypic mniej niz ");
put(waga_znajomego * litrow_na_kg_dop,exp=>0);
put(" litrow napoju.");



end;
