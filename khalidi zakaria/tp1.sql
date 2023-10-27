create database estionEmploye ;
use estionEmploye;
create table Employe(
matricule int primary key,
nom varchar(25),
salaire int(10),
fonction varchar(35),
telephone varchar(15),
codedept int
);
create table Departement(
codedept int primary key ,
nomdepartement varchar(10),
capacite int );
alter table Employe add constraint foreign key Employe(codedept) references Departement(codedept);
alter table Employe add constraint check (salaire > 0);
alter table EDepartement add constraint check (capacite > 0);
alter table Employe add column adresse varchar(30);
alter table Employe add constraint check (fonction in ('commercial','agent d’accueil','agent de terrain','assistance') );
alter table Departement add constraint check (nomdepartement regexp'^d_.+_$');
alter table Employe add constraint check (telephone regexp"^0[0-9]{9}$");

INSERT INTO Departement (codedept, nomdepartement, capacite) VALUES
    (101, 'd_Ressources_Humaines', 50),
    (102, 'd_Informatique', 100),
    (103, 'd_Ventes', 30),
    (104, 'd_Comptabilité', 40);
INSERT INTO Employe (matricule, nom, salaire, fonction, telephone, codedept)
VALUES
    (1001, 'John Doe', 50000, 'commercial', '0555123456', 101, '123 Main St'),
    (1002, 'Jane Smith', 42000, 'agent d’accueil', '0555987654', 102, '456 Elm St');
ALTER TABLE Departement
ADD CONSTRAINT check_nomdepartement CHECK (nomdepartement REGEXP '^d_.+_*$');


ALTER TABLE Employe
ADD CONSTRAINT check_telephone CHECK (telephone REGEXP '^0[0-9]{9}$');

INSERT INTO Departement (codedept, nomdepartement, capacite)
VALUES
    (101, 'd_Ressources_Humaines', 50),
    (102, 'd_Informatique', 100),
    (103, 'd_Ventes', 30),
    (104, 'd_Comptabilité', 40);


INSERT INTO Employe (matricule, nom, salaire, fonction, telephone, codedept, adresse)
VALUES
    (1001, 'John Doe', 50000, 'commercial', '0555123456', 101, '123 Main St'),
    (1002, 'Jane Smith', 42000, 'agent d’accueil', '0555987654', 102,'456 Elm St')
    









