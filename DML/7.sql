with pozitivni_avgust as(
    select *
    from Test
    where rezultat = 'pozitiven' and datum like '2021-08%'
),

nevakcinirani as(
    select *
    from Lice l
    where 2 > (
        select count()
        from Vakcinacija_datum v
        where v.id_lice = l.id
    )
),

avgust_nevakcinirani as(
    select *
    from pozitivni_avgust pa
    join nevakcinirani nv on nv.id = pa.id
)

select 100.0 * count(distinct an.id) / count(distinct pa.id) as procent
from pozitivni_avgust pa, avgust_nevakcinirani an
