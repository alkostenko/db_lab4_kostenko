create or replace function add_coffee() returns trigger as
$$
    begin 
        update coffee
        set coffee_type="coffee "|| coffee_type where coffee.coffee_type=new.coffee_type;
        return null;
    end;
$$ language "plpgsql";


create trigger on_coffee_insert 
after insert on coffee
for each row execute function add_coffee();