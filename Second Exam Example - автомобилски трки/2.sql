with odrzani as(
    select *
    from Trka t
    join Odrzana_trka ot on ot.ime = t.ime
    where t.krugovi < 70 and ot.datum like '2023%'
)

select v.vozacki_broj, v.ime, v.prezime, v.nacionalnost, v.datum_r
from Vozac v

join Ucestvuva u on u.vozacki_broj = v.vozacki_broj
join odrzani o on o.ime = u.ime_trka and o.datum = u.datum_trka

where u.poeni > 0
group by v.vozacki_broj
order by v.datum_r desc