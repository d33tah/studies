with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;

--Zdefiniować typ rekordowy Student zawierający dane studenta (imię, nazwisko,
--nr indeksu, rok studiów). Napisać program umożliwiający:
-- * dopisanie wprowadzonego studenta na końcu pliku tekstowego o nazwie 
--   podanej przez użytkownika
-- * wypisanie z pliku o nazwie podanej przez użytkownika wszystkich studentów
--   z roku podanego przez użytkownika.
--
--Powyższe czynności mają być realizowane przez odpowiednie procedury lub 
--funkcje (uwaga!!! procedura / funkcja nie powinna pobierać żadnych danych - 
--powinny być one przekazane przez parametry !!)

procedure zaj13_1 is

    subtype t_nr_indeksu is integer range 100000..999999;
    type student is record
        imie: string(1..30):=(others=> character'val(0));
        nazwisko: string(1..30):=(others=>character'val(0));
        nr_indeksu: t_nr_indeksu;
        rok_studiow: positive;
    end record;

    type tab_studentow is array(positive range <>) of student;

    type fifo_record;
    type fifo_record_ptr is access fifo_record;

    type fifo_record is record
        el: student;
        nast: fifo_record_ptr;
    end record;

    type fifo is record
        pocz: fifo_record_ptr;
    end record;

    plik: file_type;
    nowy: student;
    tmp_i: integer;
begin
    begin
        open(plik,append_file,"zaj13_1.txt");
    exception
        when name_error=>create(plik,append_file,"zaj13_1.txt");
    end;
    put("Podaj imie nowego studenta: ");
    get_line(nowy.imie,tmp_i);
    put("Podaj nazwisko nowego studenta: ");
    get_line(nowy.nazwisko,tmp_i);
    put("Podaj nr indeksu nowego studenta: ");
    get(nowy.nr_indeksu);
    put("Podaj rok studiow nowego studenta: ");
    get(nowy.rok_studiow);


    put_line(plik,nowy.imie);
    put_line(plik,nowy.nazwisko);
    put(plik,nowy.nr_indeksu,0);
    new_line(plik);
    put(plik,nowy.rok_studiow,0);
    new_line(plik);

    close(plik);
end;
