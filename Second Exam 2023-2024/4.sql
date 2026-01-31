with muzej_cnt as(
    select m.ime_muzej, count(distinct i.shifra_d) as cnt
    from Umetnicko_delo u

    join Izlozeni i on i.shifra_d = u.shifra
    join Izlozba iz on iz.ime_i = i.ime_i
    join Muzej m on m.shifra = iz.shifra_muzej

    where datum_pocetok >= '2023-01-01'
    group by m.ime_muzej
)

select mc.ime_muzej
from muzej_cnt mc
where mc.cnt = (
    select max(cnt)
    from muzej_cnt
)