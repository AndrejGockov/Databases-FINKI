create trigger maintain_neighboors

after delete on Grad
begin
    update Sosedi
    set grad1 = null
    where old.id_mesto = grad1;
    
    update Sosedi
    set grad2 = null
    where old.id_mesto = grad2;
end;

create trigger delete_visits

after delete on Korisnik
begin
    delete from Poseta
    where old.kor_ime = kor_ime;
end;