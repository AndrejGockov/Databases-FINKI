create trigger imunizirani_lica

after insert on Vakcinacija_datum
for each row
begin
    update Lice
    set celosno_imuniziran = 1
    where id = new.id_lice and 2 <= (
        select count()
        from Vakcinacija_datum
        where id_lice = new.id_lice
    );
end;