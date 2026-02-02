with 

VisitedObjects as (
    select *
    from objekt obj
    join grad gr on obj.id_grad=gr.id_mesto
),

VisitedCities as(
    select g.id_mesto, count(g.id_mesto) as num_visits
    from grad g
    join poseta p on g.id_mesto=p.id_mesto
    group by g.id_mesto
)

select m.ime
from VisitedObjects visobj
join VisitedCities viscit on viscit.id_mesto = visobj.id_grad
join Mesto m on m.id = visobj.id_mesto
where viscit.num_visits = (select max(num_visits) from VisitedCities )
order by m.ime desc