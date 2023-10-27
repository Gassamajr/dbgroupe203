create database gestionEmploye ;
use gestionEmploye ;
create table  Employe 
	(matricule int primary key,
    nom varchar(255),
    salaire decimal(10, 2),
    fonction varchar(255),
    telephone varchar(10),
    codedept int  ,
    adresse varchar(30)
    );
    desc Employe;
create table departement 
	(
    codedept int primary key ,
    nomdepartement varchar(255),
    capacite int check (capacite >0)
    
    );
    
alter table Employe add constraint foreign key (codedept) references departement (codedept);
alter table Employe add constraint check (salaire >0);
alter table departement add constraint check (capacite >0);
alter table Employe add  adresse varchar(30);
alter table departement add constraint check_nomdepartement CHECK (nomdepartement regexp'^d_.+_*$');
alter table Employe add constraint check_function check (fonction in ( 'commercial','agent d’accueil', 'agent de terrain',
'assistance'
));
alter table Employe add constraint  check_phone check (telephone regexp '^0[0-9]{9}$');

-- insertion de données dans la table "Departement"
INSERT INTO Departement (codedept, nomdepartement, capacite) VALUES
(1, 'd_finance_', 50),
(2, 'd_paiement_', 100),
(3, 'd_scolarité_', 75);

-- Exemple d'insertion de données dans la table "Employe"
INSERT INTO Employe (matricule, nom, salaire, fonction, telephone, codedept) VALUES
(101, 'John Doe', 45000, 'commercial', '0123456789', 1),
(102, 'Jane Smith', 35000, 'commercial', '0787654321', 2),
(103, 'Alice Johnson', 55000, 'commercial', '0112345678', 2),
(104, 'Bob Brown', 32000, 'commercial', '0789456123', 3),
(105, 'Eva Wilson', 42000, 'commercial', '0756781234', 3);



SELECT d.nomdepartement, COUNT(e.matricule) AS nombre_employes
FROM Departement d
LEFT JOIN Employe e ON d.codedept = e.codedept
GROUP BY d.nomdepartement;


SELECT d.nomdepartement, SUM(e.salaire) AS somme_salaires
FROM Departement d
LEFT JOIN Employe e ON d.codedept = e.codedept
GROUP BY d.nomdepartement;


SELECT COUNT(*) AS nombre_employes
FROM Employe;

SELECT *
FROM Employe
WHERE LOWER(SUBSTRING(nom, 1, 1)) IN ('a', 'e', 'i', 'o', 'u');


CREATE VIEW EmployeView AS
SELECT nom, salaire
FROM Employe
ORDER BY salaire ASC;

































