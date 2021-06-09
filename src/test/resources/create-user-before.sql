delete from user_role;
delete from usr;

insert into usr(id, active, password, username) values
(1, true, '$2a$08$lxWQuetaOHNAxqhOvu/1zOpdpceL.0/kRqhFuDU/vVpV7QheZp4ui', 'dan'),
(2,true,'$2a$08$lxWQuetaOHNAxqhOvu/1zOpdpceL.0/kRqhFuDU/vVpV7QheZp4ui','adm');

insert into user_role(user_id, roles) values
(1,'USER'), (1, 'ADMIN'),
(2,'USER');