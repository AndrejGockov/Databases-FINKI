with preporaki_cnt as(
    select count(*) as cnt, k_ime_od
    from Preporaka p
    group by(k_ime_od)
),

max_preporaki_cnt as(
    select max(cnt) as max_cnt
    from preporaki_cnt
),

filtrirani_korisnici as(
    select pc.k_ime_od
    from preporaki_cnt pc
    join max_preporaki_cnt mpc on mpc.max_cnt = pc.cnt
)

select fk.k_ime_od as k_ime, count(p.k_ime_na) as dobieni_preporaki
from Preporaka p
join filtrirani_korisnici fk on fk.k_ime_od = p.k_ime_na
group by p.k_ime_na