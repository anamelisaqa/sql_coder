use gamers;

create table friends (
friend_id int not null auto_increment primary key,
first_name varchar(30),
second_name varchar(30),
troop_id int );


create table troops (
troop_id int not null auto_increment primary key,
descripcion varchar(45));

create table champions ( 
id_partida int not null auto_increment primary key,
troop_id int,
friend_id int,
foreign key (troop_id) references troops(troop_id) ,
foreign key (friend_id) references friends(friend_id));

insert into friends (first_name,second_name,troop_id) values
('sebastian','ulloa',1),
('flavia','horvat',1),
('Leonel','Lo presti',2),
('Anabella','Morales',2),
('Javier','careno',3),
('Julian','Rodriguez',3);

insert into troops(descripcion)values
('los mas mejores'),
('ganadores de la copa'),
('pumas del sur'); 


select * from friends;
select * from troops;

insert into champions (troop_id,friend_id)
values
(1,8);

create view VW_friends as 
select * from friends ;


select * from VW_friends;


create view VW_friends_count as 
select count(*) from friends ;
									  
create view VW_friends_restr as 
select substring(first_name,1,3),troop_id from friends ;


/*FUNCIONES*/

DELIMITER //
create function multiplicarx2 (a int ) 
returns int
deterministic
begin
declare b int;
set b=2*a;
return b;
end 
//


select T1.*,multiplicarx2(troop_id) por2 from friends T1



DELIMITER //
create function multiplicar (a int,b int) 
returns int
deterministic
begin
declare c int;
set c=a*b;
return c;
end 
//

select T1.*,multiplicar(friend_id,troop_id) por2 from friends T1


DELIMITER //
create trigger check_value
before insert
on troops for each row 
begin
  if new.descripcion is null then 
     set new.descripcion='TEAM DEFAULT';
  end if ;
end 
//

select * from troops;

insert into troops(descripcion)values
(NULL);


/* procedure*/

DELIMITER //
create procedure contar_amigos()
begin 
select count(*) from friends;
end 
//

call contar_amigos()


