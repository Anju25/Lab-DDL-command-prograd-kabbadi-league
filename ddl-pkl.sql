-- PROGRESSION - 1


-- 1. **Create table city**
create table city
(
id number(11) primary key,
name varchar(50) not null
);

-- 2. **Create table referee**
create table referee
(
id number(11) primary key,
name varchar(50) not null
);

-- 3. **Create table innings**
create table innings
(
id number(11) primary key,
innings_number number(11) not null
);

-- 4. **Create table extra_type**
create table extra_type
(
id number(11) primary key,
name varchar(50) not null
);
-- 5. **Create table skill**
create table skill
(
id number(11) primary key,
name varchar(50) not null
);

-- 6. **Create table team**
create table team
(
id number(11) primary key,
name varchar(50) not null,
coach varchar(50) not null,
home_city number(11),
captain number(11) not null,
foreign key(home_city) references city(id)
);
-- 7. **Create table player**
create table player
(
id number(11) primary key,
name varchar(50) not null,
country varchar(50) not null,
skill_id number(11),
team_id number(11),
foreign key(team_id) references team(id),
foreign key(skill_id) references skill(id)
);
-- 8. **Create table venue**
create table venue
(
id number(11) primary key,
stadium_name varchar(50) not null,
city_id number(11),
foreign key(city_id) references city(id)
);

-- 9. **Create table event**
create table event
(
id number(11) primary key,
innings_id number(11) not null,
event_no number(11) not null,
raider_id number(11) not null,
raid_points number(11) not null,
defending_points number(11) not null,
clock_in_seconds number(11) not null,
team_one_score number(11) not null,
team_two_score number(11) not null,
foreign key(innings_id) references innings(id),
foreign key(raider_id) references player(id)
);



-- 10. **Create table extra_event**
create table extra_event
(
id number(11) primary key,
event_id number(11) not null,
extra_type_id number(11) not null,
points number(11) not null,
scoring_team_id number(11) not null,
foreign key(event_id) references event(id),
foreign key(extra_type_id)references extra_type(id),
foreign key(scoring_team_id) references team(id)
);
-- 11. **Create table outcome**
create table outcome
(
id number(11) primary key,
status varchar(100) not null,
winner_team_id number(11),
score number(11) not null,
player_of_match number(11),
foreign key(winner_team_id) references team(id),
foreign key(player_of_match) references player(id)
);
-- 12. **Create table game**
create table game
(
id number(11) primary key,
game_date DATE not null,
team_id_1 number(11) not null,
team_id_2 number(11) not null,
venue_id number(11) not null,
outcome_id number(11) not null,
referee_id_1 number(11) not null,
referee_id_2 number(11) not null,
first_innings_id number(11) not null,
second_innings_id number(11) not null,
foreign key(team_id_1) references team(id),
foreign key(team_id_2) references team(id),
foreign key(venue_id) references venue(id),
foreign key(outcome_id)references outcome(id),
foreign key(referee_id_1) references referee(id),
foreign key(referee_id_2) references referee(id),
foreign key(first_innings_id) references innings(id),
foreign key(second_innings_id) references innings(id)
);
-- 13. **Drop table city**
drop table game;

drop table extra_event;

drop table outcome;

drop table event;

drop table player;

drop table team;

drop table venue;

drop table city;

-- 14. **Drop table innings**

drop table innings;

-- 15. **Drop table skill**

drop table skill;

-- 16. **Drop table extra_type**
drop table extra_type;

