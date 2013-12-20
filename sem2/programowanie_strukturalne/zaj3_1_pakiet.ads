with ada.text_io, ada.integer_text_io;
use  ada.text_io, ada.integer_text_io;

--Napisać pakiet Ulamki udostępniający:
-- * typ prywatny Ulamek;
-- * procedurę pobierającą ułamek będący parametrem;
-- * procedurę wypisującą ułamek będący parametrem;
-- * funkcje "<", "+" i "=" dla ułamków
--
--oraz program testujący działanie tego pakietu.
--
package zaj3_1_pakiet is
    type Ulamek is private;

    procedure Pobierz(obj: out Ulamek);
    procedure Wypisz(obj: in Ulamek);
    function "<"(obj1: in Ulamek; obj2: in Ulamek) return boolean;
    function "="(obj1: in Ulamek; obj2: in Ulamek) return boolean;
    function "+"(obj1: in Ulamek; obj2: in Ulamek) return Ulamek;

    private type Ulamek is record
        L: Integer;
        M: Integer;
    end record;
end zaj3_1_pakiet;
