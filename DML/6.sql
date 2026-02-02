with premium_profili as(
    select pk.k_ime, p.ime
    from Korisnik k
    join Premium_korisnik pk on pk.k_ime = k.k_ime
    join Profil p on p.k_ime = pk.k_ime
)

select pp.k_ime, lz.naslov
from premium_profili pp

join Lista_zelbi lz on lz.k_ime = pp.k_ime
join Preporaka p on p.k_ime_na = pp.k_ime

where p.ocena >= 3 and p.datum like '2021%' and lz.naslov = p.naslov
order by pp.k_ime asc