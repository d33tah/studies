--Napisać pakiet Ulamki udostępniający:                                            
-- * typ prywatny Ulamek;                                                          
-- * procedurę pobierającą ułamek będący parametrem;                               
-- * procedurę wypisującą ułamek będący parametrem;                                
-- * funkcje "<", "+" i "=" dla ułamków                                            
--                                                                                 
--oraz program testujący działanie tego pakietu.                                   

package body zaj3_1_pakiet is 
    procedure Pobierz(obj: out Ulamek) is                                              
    begin                                                                          
        put("Podaj licznik: ");                                                    
        get(obj.L);                                                                
                                                                                   
        put("Podaj mianownik: ");                                                  
        get(obj.M);                                                                
    end;

    procedure Wypisz(obj: in Ulamek) is
    begin
        put(obj.L,0);
        put("/");
        put(obj.M,0);
    end;

    function "<"(obj1: in Ulamek; obj2: in Ulamek) return boolean is
    begin
        return (float(obj1.L)/float(obj1.M))<(float(obj2.L)/float(obj2.M));
    end;

    function "="(obj1: in Ulamek; obj2: in Ulamek) return boolean is
    begin
        return (float(obj1.L)/float(obj1.M))=(float(obj2.L)/float(obj2.M));
    end;

    function nwd(a: integer; b: integer) return integer is
        t_a: integer:=a;
        t_b: integer:=b;
    begin
        while t_a/=t_b loop
            if t_a>t_b then
                t_a:=t_a-t_b;
            else
                t_b:=t_b-t_a;
            end if;
        end loop;
        return t_a;
    end;

    function "+"(obj1: in Ulamek; obj2: in Ulamek) return Ulamek is
        ret: Ulamek;
    begin
        ret.M := (obj1.M * obj2.M)/nwd(obj1.M, obj2.M); --NWW
        ret.L := (obj1.L*(ret.M/obj1.M))+(obj2.L*(ret.M/obj2.M));
        return ret;
    end;

end zaj3_1_pakiet;
