.echo on
.headers on
.mode column

-- Name: Samer Khamisi
-- File: lab1b.Khamisi.sql
-- Date: January 11, 2021

drop table if exists myfamily;

create table myfamily (
	id int primary key,
	name text,
	sex int,
	role text,
	weight real
);

insert into myfamily values (1,'Samer',1,'Husband',180);
insert into myfamily values (2,'Christine',0,'Wife',Null);
insert into myfamily values (3,'Allie',0,'Pet',101);
insert into myfamily values (4,'Milo',1,'Pet',14);
insert into myfamily values (5,'Terry',1,'Father-in-Law',215);
insert into myfamily values (6,'Ann',0,'Mother-in-Law',Null);


select * from myfamily;
select * from myfamily where role like 'Pet';
select * from myfamily where weight > 150;
select * from myfamily where sex = 0;