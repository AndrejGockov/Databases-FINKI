create trigger izbrisana_trka

after delete on Vozac
begin
    update Ucestvuva
    set vozacki_broj = null
    where old.vozacki_broj = vozacki_broj;
end;


create trigger brisi_timovi

after delete on Tim
begin
    delete from Ucestvuva
    where old.ime = ime_tim;
end;