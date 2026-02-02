with broj_odrzuvana as (
    select f.id, f.ime, count() as broj_odrzuvanja
    from Festival f
    join Festival_odrzuvanje fo on fo.id = f.id
    group by f.id
),

broj_bendovi as(
    select fo.id, count(distinct fb.id_bend) as broj_bendovi
    from Festival_odrzuvanje fo
    join Festival_bend fb on fb.id_festival = fo.id and fb.datum_od = fo.datum_od
    group by fo.id
)

select bo.ime, n.cena, n.kapacitet, bo.broj_odrzuvanja, bb.broj_bendovi
from broj_odrzuvana bo

join Nastan n on n.id = bo.id
join broj_bendovi bb on bb.id = bo.id

group by bo.ime
order by n.kapacitet desc