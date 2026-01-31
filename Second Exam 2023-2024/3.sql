select distinct ud.umetnik
from Umetnicko_delo ud
where ud.umetnik not in (
    select u.umetnik
    from Umetnicko_delo u
    
    join Izlozeni iz on iz.shifra_d = u.shifra
    join Izlozba i on i.ime_i = iz.ime_i
    join Muzej m on m.shifra = i.shifra_muzej

    where m.tip = 'zatvoreno'
)
order by ud.umetnik asc