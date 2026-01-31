create table Muzej(
shifra text primary key,
ime_muzej text,
opis text,
grad text,
tip text,
rabotno_vreme text,

check(tip = 'otvoreno' or tip = 'zatvoreno')
check(tip = 'zatvoreno' or shifra like '%o')
-- check(tip in ('otvoreno', 'zatvoreno') and (tip != 'otvoreno' or shifra like 'o%'))
);

create table Umetnicko_delo(
shifra text primary key,
ime text,
godina int,
umetnik text
);

create table Izlozeni(
shifra_d text,
ime_i text,
datum_pocetok text, 
datum_kraj text,

constraint pk_check primary key(shifra_d, ime_i)

foreign key(shifra_d) references Umetnicko_delo(shifra)
on delete cascade on update cascade

foreign key(ime_i) references Izlozba_UD(ime_i) 
on delete cascade on update cascade
);