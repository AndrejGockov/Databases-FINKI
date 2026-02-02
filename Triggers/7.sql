create trigger update_avg_ocena

after insert on Preporaka
begin
    update Video_zapis
    set prosechna_ocena = (
        select avg(ocena)
        from Preporaka
        where naslov = new.naslov
    )
    where naslov = new.naslov;
end;