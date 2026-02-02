create table Bend(
id int primary key,
ime text,
godina_osnovanje int,

check(godina_osnovanje >= 1970)
);

create table Bend_zanr(
id_bend int,
zanr text,

constraint pk_check primary key(id_bend, zanr),

foreign key(id_bend) references Bend(id)
on delete cascade on update cascade
);

create table Festival_bend(
id_festival int,
datum_od date,
id_bend int,

constraint pk_check primary key(id_festival, datum_od, id_bend)

foreign key(id_festival, datum_od) references Festival_odrzuvanje(id, datum_od)
on delete cascade on update cascade

foreign key(id_bend) references Bend(id)
on delete set default on update cascade

check(not (id_bend = 5 and id_festival = 2))
);