select ud.ime, ud.umetnik
from Umetnicko_delo ud

join Izlozeni i on i.shifra_d = ud.shifra
join Izlozba iz on iz.ime_i = i.ime_i 
and iz.datum_od >= i.datum_pocetok and iz.datum_do <= i.datum_kraj

order by ud.ime asc