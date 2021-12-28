create table coder
(
	id serial,
	coding_hours int not null,
	coffee_id int not null,
	bugs_id int not null
	primary key (id),
	constraint fk_coffee foreign key(coffee_id) references coffee(id) on delete cascade,
	constraint fk_bugs foreign key(bugs_id) references bugs(id) on delete cascade
);

create table coffee
(
	id serial,
	cups_per_day int not null,
	coffee_type varchar(50)not null
	primary key(id)
);

create table bugs
(
	id serial,
	solve_bugs varchar(50)not null
	primary key (id)
);

