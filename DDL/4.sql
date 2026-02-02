create table Korisnik(
kor_ime text primary key, 
ime text,
prezime text,
pol text,
data_rag date,
data_reg date
);


create table Korisnik_email(
kor_ime text,
email text,

constraint pk_check primary key(kor_ime, email),

foreign key(kor_ime) references Korisnik(kor_ime)
on delete cascade on update cascade

check(email like '%.com' and length(email) >= 10)
);

create table Poseta(
id int primary key,
kor_ime text,
id_mesto int,
datum date,

foreign key(kor_ime) references Korisnik(kor_ime)
on delete set null on update cascade

foreign key(id_mesto) references Mesto(id)
on delete cascade on update cascade

check(datum < date())
);