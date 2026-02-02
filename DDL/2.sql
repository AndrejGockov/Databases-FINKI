create table Test(
id int,
shifra text,
tip text,
datum date,
rezultat text,
laboratorija text,

constraint pk_check primary key(id, shifra),

foreign key(id) references Lice(id)
on delete cascade on update cascade,

check(not (laboratorija = 'lab-abc' and tip != 'seroloshki'))
);


create table Vakcinacija(
id_lice int,
id_med_lice int,
shifra_vakcina int,

constraint pk_check primary key(id_lice, id_med_lice, shifra_vakcina),

foreign key(id_lice) references Lice(id)
on delete set default on update cascade

foreign key(id_med_lice) references Med_lice(id)
on delete set default on update cascade

foreign key(shifra_vakcina) references Vakcina(shifra)
on delete set default on update cascade


check(id_lice != id_med_lice)
);

create table Vakcinacija_datum(
id_lice int,
id_med_lice int,
shifra_vakcina int,
datum date,

constraint pk_check primary key(id_lice, id_med_lice, shifra_vakcina, datum),

foreign key(id_lice, id_med_lice, shifra_vakcina) references Vakcinacija(id_lice, id_med_lice, shifra_vakcina)
on delete set null on update cascade
);