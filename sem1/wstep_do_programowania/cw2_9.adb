with ada.text_io, ada.integer_text_io, ada.long_integer_text_io, 
     ada.long_long_integer_text_io, ada.short_integer_text_io, 
     ada.short_short_integer_text_io, ada.float_text_io, 
     ada.short_float_text_io, ada.long_float_text_io, 
     ada.long_long_float_text_io;

use  ada.text_io, ada.integer_text_io, ada.long_integer_text_io,
     ada.long_long_integer_text_io, ada.short_integer_text_io,
     ada.short_short_integer_text_io, ada.float_text_io,
     ada.short_float_text_io, ada.long_float_text_io,
     ada.long_long_float_text_io;

--Napisac program wypisujacy zakresy:
-- * typu integer, typu long_integer, typu long_long_integer, 
--   typu short_integer, typu short_short_integer
-- * typow: float, short_float, long_float, long_long_float

procedure cw2_9 is
begin

put("Integer: "); 
put(integer'first); 
put(" - "); 
put(integer'last); 
new_line;

put("Long_integer: "); 
put(long_integer'first); 
put(" - "); 
put(long_integer'last); 
new_line;

put("Long_long_integer: "); 
put(long_long_integer'first); 
put(" - "); 
put(long_long_integer'last); 
new_line;

put("Short_integer: "); 
put(short_integer'first); 
put(" - "); 
put(short_integer'last); 
new_line;

put("Short_short_integer: "); 
put(short_short_integer'first); 
put(" - "); 
put(short_short_integer'last); 
new_line;

new_line;

put("Float: "); 
put(float'first); 
put(" - "); 
put(float'last); 
new_line;

put("Short_float: "); 
put(short_float'first); 
put(" - "); 
put(short_float'last); 
new_line;

put("Long_float: "); 
put(long_float'first); 
put(" - "); 
put(long_float'last); 
new_line;

put("Long_long_float: "); 
put(long_long_float'first); 
put(" - "); 
put(long_long_float'last); 
new_line;

end;
