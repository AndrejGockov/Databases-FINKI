create trigger otvorene_izlozbi

after insert on Izlozeni
for each row
begin
    update Umetnicko_delo
    set br_izlozbi_otvoreno = br_izlozbi_otvoreno + 1
    where new.shifra_d = shifra and new.ime_i in (
        select ime_i
        from Izlozba i
        join Muzej m on m.shifra = i.shifra_muzej
        where tip = 'otvoreno'
    );
end;

create trigger zatvarane_izlozbi

after insert on Izlozeni
for each row
begin
    update Umetnicko_delo
    set br_izlozbi_zatvoreno = br_izlozbi_zatvoreno + 1
    where new.shifra_d = shifra and new.ime_i in (
        select ime_i
        from Izlozba i
        join Muzej m on m.shifra = i.shifra_muzej
        where tip = 'zatvoreno'
    );
end;