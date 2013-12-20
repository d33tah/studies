with ada.text_io, ada.integer_text_io, ada.unchecked_deallocation;
use  ada.text_io, ada.integer_text_io;

--Napisać pakiet implementujący stos liczb całkowitych przy pomocy wskaźników, 
--udostępniający:
--
-- * typ rekordowy stos, przechowujący wskaźnik początku stosu (ograniczony 
--   typ prywatny)
-- * procedurę wypisującą stos podany jako parametr
-- * procedurę wkładając na stos podany jako parametr element podany jako 
--   parametr
-- * procedurę zdejmującą element ze stosu podanego jako parametr. Liczba 
--   zdjęta ze stosu ma zostać przekazana do programu, pamięć zajmowana przez
--   usuwany element ma zostać zwolniona. W przypadku braku elementu do 
--   zdjęcia procedura ma zgłaszać wyjątek stos_pusty
-- * funkcję zwracającą rozmiar (ilość elementów) stosu podanego jako 
--   parametr,
-- * procedurę czyszczącą stos podany jako parametr. Pamięć zajmowana przez 
--   stos ma zostać zwolniona,
-- * procedurę zwracającą kopię stosu podanego jako parametr
-- * funkcję "=" zwracającą wartość logiczną mówiącą, czy dwa stosy podane 
--   jako parametry są takie same
--
--oraz program testujący działanie tego pakietu

pragma warnings(off);

package zaj5_1_pakiet is
    type stos is private;
    type stos_ptr is access stos;

    type stos_ptr_struct is record
        ptr: stos_ptr;
    end record;

    procedure poloz(v_stos: out stos_ptr; liczba: integer);

    stos_pusty: Exception;

    procedure zdejmij(v_stos: out stos_ptr; liczba: out integer);
    procedure wypisz(v_stos: in stos_ptr);
    function rozmiar(v_stos: stos_ptr) return integer;
    procedure wyczysc(v_stos: out stos_ptr);
    function skopiuj(v_stos: stos_ptr) return stos_ptr;
    function "="(v1_stos: stos_ptr_struct; v2_stos: stos_ptr_struct) return boolean;

    private 
    
    type stos is record
        poprz: stos_ptr;
        liczba: integer;
    end record;

end;
