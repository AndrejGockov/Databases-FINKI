with korisnici_poseti as (
    select *
    from Korisnik k
    join Poseta p on p.kor_ime = k.kor_ime
    join Objekt o on o.id_mesto = p.id_mesto
)

select distinct k.ime, k.prezime
from Korisnik k

join korisnici_poseti korpos_1 on korpos_1.kor_ime = k.kor_ime
join korisnici_poseti korpos_2 on korpos_2.kor_ime = k.kor_ime

join Sosedi sos on 
(sos.grad1 = korpos_1.id_grad and sos.grad2 = korpos_2.id_grad)
or (sos.grad2 = korpos_1.id_grad and sos.grad1 = korpos_2.id_grad)

where sos.rastojanie < 300
