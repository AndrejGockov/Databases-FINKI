create table Korisnik(
k_ime text primary key,
ime text,
prezime text,
tip text,
pretplata text,
datum_reg date,
tel_broj text,
email text,

check(not (datum_reg < '2015-01-01' and pretplata = 'pretplata 3'))
);

create table Premium_korisnik(
k_ime text primary key, 
datum date,
procent_popust int default 10,

foreign key(k_ime) references Korisnik(k_ime)
on delete cascade on update cascade
);


create table Lista_zelbi(
ID int primary key,
naslov text,
k_ime text,
ime text,

foreign key(naslov) references Video_zapis(naslov)
on delete set null on update cascade

foreign key(k_ime, ime) references Profil(k_ime, ime)
on delete cascade on update cascade
);