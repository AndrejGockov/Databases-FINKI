with zelbi as(
    select p.ime, avg(pr.ocena) as prosek
    from Profil p
    
    join Lista_zelbi lz on lz.k_ime = p.k_ime and p.ime = lz.ime
    join Preporaka pr on pr.naslov = lz.naslov
    
    group by p.ime, lz.naslov
)

select ime, avg(prosek) as po_profil
from zelbi
group by ime