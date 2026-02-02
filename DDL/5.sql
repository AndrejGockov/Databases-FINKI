create table Video_zapis(
naslov text primary key,
jazik text,
vremetraenje float,
datum_d date,
datum_p date
);

create table Video_zapis_zanr(
naslov text,
zanr text,

constraint pk_check primary key(naslov, zanr)

foreign key(naslov) references Video_zapis(naslov)
on delete cascade on update cascade
);

create table Preporaka(
ID int primary key,
k_ime_od text,
k_ime_na text, 
naslov text,
datum date, 
komentar text,
ocena int,

foreign key(k_ime_od) references Korisnik(k_ime)
on delete set null on update cascade

foreign key(k_ime_na) references Korisnik(k_ime)
on delete cascade on update cascade

foreign key(naslov) references Video_zapis(naslov)
on delete cascade on update cascade

check(k_ime_od != k_ime_na and not (datum > date()))
);