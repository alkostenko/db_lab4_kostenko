--function
create or replace function most_frequent_drinks() returns int as
$$
    begin
        return(select coffee_type from coffee where cups_per_day>2 group by coffee_type);
    end;
$$ language 'plpgsql';
select * from most_frequent_drinks()

--trigger
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