with preporaki as(
    select k_ime_od as k_ime, naslov, count() as cnt
    from Preporaka
    group by k_ime_od, naslov
),

max_preporaki as(
    select k_ime, max(cnt) as cnt
    from preporaki
    group by k_ime
)

select p.k_ime, p.naslov, p.cnt as broj
from preporaki p
join max_preporaki mp on mp.k_ime = p.k_ime and mp.cnt = p.cnt