with ada.text_io, ada.float_text_io;
use  ada.text_io, ada.float_text_io;

--Napisac program pobierajacy od uzytkownika temperature w skali Celsjusza
--i zwracajacy jej wartosc w skali Kelvina i w skali Fahrenheita.

procedure cw2_8 is
celcjusz: float;
kelvin: float;
fahrenheit: float;
begin
put("Podaj temperature w stopniach Celcjusza: "); get(celcjusz);
kelvin:=273.15+celcjusz;
fahrenheit:=32.0 + 5.0/9.0 * celcjusz;
put("Skala Kelvina: "); put(kelvin,exp=>0); new_line;
put("Skala Fahrenheit: "); put(fahrenheit,exp=>0); new_line;
end; 
