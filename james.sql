create database gestionEmploye;
use gestionEmploye;
create table Departement(codedept int(3) primary key auto_increment,
						nomdepartement varchar(30),
                        capacite int);

create table Employe(matricule int(3) primary key auto_increment,codedept int,
					nom varchar(30),salaire float,fonction varchar(30),
                    telephone varchar(12), 
                    foreign key(codedept) references Departement(codedept)
                    );

alter table Departement
	add constraint check (capacite>0);


alter table Employe
	add column adresse varchar(30);

alter table Employe
	add check (fonction IN ('commercial', 'agent d’accueil', 'agent de terrain','assistance'));

alter table Departement
	add check (nomdepartement regexp '[^d_.+_]');

alter table Employe
	add check (telephone regexp '^0[0-9]{9}');
 
insert into Departement (nomdepartement,  capacite)
		values('d_Informatique_',300),
			('d_Finance_',200),
            		('d_Agro_',100);
            
insert into Employe (codedept, nom,salaire,fonction,telephone,adresse)
		values(1,'Oldy',1000.00,'commercial','0690224785','Iris'),
			(2,'Tyler',3101.00,'assistance','0794532725','Doha'),
                	(3,'Spaghetti Boy',4000.00,'agent de terrain','0689304357','Doha');

              
select nomdepartement, count(*) as nombre from Employe
inner join Departement on Departement.codedept=Employe.codedept
group by nomdepartement;


select sum(salaire) as somme_Salaire from Employe inner join Departement on Departement.codedept=Employe.codedept
group by nomdepartement;

select count(*) from Employe;

select nom from Employe where nom regexp '^[aeiouy]{1}.+$';

create view v1 as select nom,salaire from employe order by salaire asc;
select * from v1;

use gestionEmploye;
create view v2 as select codedept as code_Depart, nomdepartment as Nom_Depart, capacite from department;
select * from v2;
insert into v2 values(4,'d_business_',300),(5,'d_informatique_',150);

create view somme as select sum(salaire) as salaireTotale from employe;
select * from somme;

create view v4 as select * from employe group by adresse;
select * from v4;

create view nomDe as select d.nomdepartement, count(*) as nombre from employe as e 
  inner join department as d on d.codedept=e.codedept
group by nomdepartement;
select * from sommesal;

drop view sommesal;
select * v2;