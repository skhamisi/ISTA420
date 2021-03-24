.echo on
.headers on
.mode column

-- Name: Samer Khamisi
-- File: SQL.EXR1.Khamisi.sql
-- Date: January 12, 2021

drop table if exists todo_list;

create table todo_list (
    Chore_id int primary key,
    task text,
    location text,
    mood text,
    minutes int,
	dueDate date,
	check (minutes>=5),
	check (length(mood) >=2)
	
);
    
insert into todo_list values (1,'Wash the dishes', 'house', 'meh', 30, 2021-01-20);
insert into todo_list values (2,'Laundry', 'house', 'okay', 120, 2021-01-25);
insert into todo_list values (3,'Mowing', 'Back Yard', 'rad', 60, 2021-02-01);
insert into todo_list values (4,'Take out trash', 'house', 'content', 10, 2021-02-10);
insert into todo_list values (5,'Meeting', 'Office','professional', 60, 2021-03-20);
insert into todo_list values (7,'software development', 'MSSA', 'exstatic', 240, 2021-04-05);
insert into todo_list values (8,'Gym', 'planet fitness', 'pumped', 60, 2021-04-15);

    
select * from todo_list;
select sum(minutes) from todo_list;

