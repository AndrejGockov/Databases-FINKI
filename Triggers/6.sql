create trigger update_poseti

after insert on Poseta
for each row
begin
    update Korisnik
    set broj_poseti = 
    (
        select count(distinct id_mesto)
        from Poseta 
        where kor_ime = new.kor_ime
    )
    where kor_ime = new.kor_ime;
end;