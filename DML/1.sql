with pozitivni as (
    select * 
    from test
    where rezultat = 'pozitiven'
)


select vk.id_lice as id
from Vakcinacija_datum vk
join pozitivni p on p.id = vk.id_lice
where p.datum < vk.datum
group by vk.id_lice
order by vk.id_lice asc