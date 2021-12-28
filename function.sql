create or replace function most_frequent_drinks() returns int as
$$
    begin
        return(select coffee_type from coffee where cups_per_day>2 group by coffee_type);
    end;
$$ language 'plpgsql';