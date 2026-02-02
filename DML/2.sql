with gitaristi as (
    select *
    from Muzicar m
    join Muzicar_instrument mi on mi.id_muzicar = m.id
    where mi.instrument = 'gitara'
)

select distinct g.ime, g.prezime
from Koncert_muzicar_bend kmb
join gitaristi g on g.id = kmb.id_muzicar
join Muzicar_bend mb on mb.id_muzicar = g.id
join Koncert k on k.id = kmb.id_koncert
where mb.datum_napustanje < k.datum