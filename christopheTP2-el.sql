create database gestionEmploye;
use gestionEmploye;
create table departement(
codedept int primary key auto_increment,
nomdepartement varchar(20),
capacite int(20)
);
create table employe(
matricule int primary key auto_increment,
nom varchar(20),
salaire float(20),
fonction varchar(20),
telephone varchar(12),
codedept int,
foreign key(codedept) references departement(codedept)
);
alter table employe add check (salaire>0);
alter table departement add check (capacite>0);
alter table employe add adress varchar(30);
alter table employe add check (fonction in('commercial','agent d’accueil','agent de terrain','assistance'));
alter table departement add check (nomdepartement regexp '^d_.+_$');
alter table employe add check (telephone regexp '^0[0-9]{9}');
insert into departement(nomdepartement,capacite)  values('d_chimie_',3000),('d_mathématique_',5000),('d_physique_',4000);
insert into employe(nom,salaire,fonction,telephone,codedept,adress)
values('benjamin Kpogomou',40000,'agent de terrain','06688966120',1,'petit simbaya'),
('Oumar Barry',50000,'commercial','06788966120',2,'petit simbaya'),
('Tafsir Yatara',60000,'agent d’accueil','06888966120',3,'Sonfonia');
select count(matricule) from employe left join departement on employe.codedept=departement.codedept group by departement.nomdepartement;
select sum(salaire) from employe left join departement using (codedept) group by nomdepartement;
select count(*)from employe;
select*from employe where (nom regexp "^('i','u','o','a','e','y')%");
create view v1 as select nom,salaire from employe order by salaire asc;