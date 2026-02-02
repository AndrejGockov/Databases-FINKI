create trigger update_poseti

after insert on Poseta
for each row
begin
    update Mesto
    set broj_poseti = 
    (
        select count(distinct kor_ime)
        from Poseta 
        where id_mesto = new.id_mesto
    )
    where id = new.id_mesto;
end;