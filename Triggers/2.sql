-- V1
create trigger vax_status

after insert on Vakcinacija_datum
for each row
begin
    update Lice
    set vakcinalen_status = "primena prva doza"
    where id = new.id_lice and 1 = (
        select count()
        from Vakcinacija_datum
        where new.id_lice = id_lice
    );
    
    update Lice
    set vakcinalen_status = "primeni dve dozi"
    where id = new.id_lice and 2 = (
        select count()
        from Vakcinacija_datum
        where new.id_lice = id_lice
    );
end;


-- V2
create trigger vax_status

after insert on Vakcinacija_datum
for each row
begin
    update Lice
    set vakcinalen_status = case
        when 1 = (
            select count()
            from Vakcinacija_datum
            where new.id_lice = id_lice
        ) then "primena prva doza"
        
        when 2 <= (
            select count()
            from Vakcinacija_datum
            where new.id_lice = id_lice
        ) then "primeni dve dozi"
        
        --else "nema vakcina"
    end
    where id = new.id_lice;
end;

-- V3
create trigger vax_status

after insert on Vakcinacija_datum
for each row
begin
    update Lice
    set vakcinalen_status = (
        select case 
            when count() = 1 then "primena prva doza"
            when count() = 2 then "primeni dve dozi"
            else "primeni dve dozi"
        end
        
        from Vakcinacija_datum
        where new.id_lice = id_lice
    )
    where id = new.id_lice;
end;