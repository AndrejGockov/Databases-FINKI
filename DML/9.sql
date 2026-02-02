with poseti as(
    select count(p.id_mesto) as cnt, o.id_grad
    from Objekt o
    join Poseta p on o.id_mesto = o.id_mesto
    group by o.id_grad
),

max_poseti as(
    select max(cnt) as cnt
    from poseti
)

select m.ime
from poseti p
join max_poseti mp on mp.cnt = p.cnt
join Mesto m on m.id = p.id_grad
