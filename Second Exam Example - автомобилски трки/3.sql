with odrzani_trki as(
    select *
    from Trka t
    join Odrzana_trka ot on ot.ime = t.ime
),

pobednici as(
    select *
    from Vozac v
    join Ucestvuva u on u.vozacki_broj = v.vozacki_broj
    where krajna_p = 1
),

pobednici_po_trki as(
    select ot.ime, p.vozacki_broj, count(p.vozacki_broj) as cnt
    from odrzani_trki ot
    join pobednici p on p.ime_trka = ot.ime and p.datum_trka = ot.datum
    group by ot.ime, p.vozacki_broj
),

max_poeni as(
    select ime, vozacki_broj, max(cnt) as max_cnt
    from pobednici_po_trki
    group by ime
)

select distinct ppt.ime as race , ppt.vozacki_broj as driver
from pobednici_po_trki ppt
join max_poeni mp on mp.max_cnt = ppt.cnt and mp.ime = ppt.ime