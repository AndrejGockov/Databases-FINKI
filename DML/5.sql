select distinct k.ime, k.prezime

from Korisnik k

join Premium_korisnik pk on pk.k_ime = k.k_ime
join Preporaka p on p.k_ime_od = pk.k_ime
join Video_zapis vz on vz.naslov = p.naslov

where p.ocena >= 4 and vz.vremetraenje >= 120

order by datum_reg asc