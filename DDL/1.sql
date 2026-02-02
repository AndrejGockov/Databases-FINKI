create table Vraboten(
ID int primary key,
ime text,
prezime text,
datum_r date,
datum_v date,
obrazovanie text, 
plata int,

check (datum_r < datum_v)
);

create table Shalterski_rabotnik(
ID int primary key,

foreign key(id) references Vraboten(ID)
on delete cascade on update cascade
);

create table Transakcija_shalter(
ID int primary key,
ID_v int,
MBR_k int,
MBR_k_s int,
broj int,
datum date,
suma int,
tip text,

foreign key(MBR_k) references Klient(MBR_k)
on delete cascade on update cascade

foreign key(MBR_k_s, broj) references Smetka(MBR_k_s, broj)
on delete cascade on update cascade

foreign key(ID_v) references Shalterski_rabotnik(ID)
on delete set null on update cascade

check(tip in("uplata", "isplata") 
and datum not between '2020-12-30' and '2021-01-14')
);