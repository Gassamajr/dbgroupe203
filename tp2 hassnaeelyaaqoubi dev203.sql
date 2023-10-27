CREATE DATABASE gestionEmploye;

USE gestionEmploye;

CREATE TABLE Departement (
    codedept INT PRIMARY KEY,
    nomdepartement VARCHAR(50),
    capacite INT  
);
CREATE TABLE Employe (
    matricule INT PRIMARY KEY,
    nom VARCHAR(50),
    salaire real,
    fonction VARCHAR(30),
    telephone VARCHAR(10),
    codedept INT,
    FOREIGN KEY (codedept) REFERENCES Departement(codedept)
);


ALTER TABLE Employe
ADD CONSTRAINT check_salaire CHECK (salaire > 0);

ALTER TABLE Departement
ADD CONSTRAINT check_capacite CHECK (capacite > 0);


ALTER TABLE Employe
ADD adresse VARCHAR(30);


ALTER TABLE Employe
ADD CONSTRAINT check_fonction CHECK (fonction IN ('commercial', 'agent d’accueil', 'agent de terrain', 'assistance'));



ALTER TABLE Departement
ADD CONSTRAINT check_nomdepartement CHECK (nomdepartement REGEXP '^d_.+_*$');


ALTER TABLE Employe
ADD CONSTRAINT check_telephone CHECK (telephone REGEXP '^0[0-9]{9}$');



INSERT INTO Employe (matricule, nom, salaire, fonction, telephone, codedept, adresse)
VALUES
    (1, 'hassnae', 50000, 'commercial', '0623456789', 1, '123 Oujda '),
    (2, 'chaymae', 60000, 'agent d’accueil', '0745678901', 2, '456 Oujda'),
    (3, 'asmae', 55000, 'agent de terrain', '0756789012', 1, '789 Oujda');


INSERT INTO Departement (codedept, nomdepartement, capacite)
VALUES
    (1, 'd_Sales_', 100),
    (2, 'd_HR_', 50),
    (3, 'Marketing_', 75);
    
    
SELECT d.nomdepartement, COUNT(e.matricule) AS nombre_employes
FROM Departement d
LEFT JOIN Employe e ON d.codedept = e.codedept
GROUP BY d.nomdepartement;


SELECT d.nomdepartement, SUM(e.salaire) AS somme_salaires
FROM Departement d
LEFT JOIN Employe e ON d.codedept = e.codedept
GROUP BY d.nomdepartement;

SELECT COUNT(*) AS nombre_employes FROM Employe;


CREATE VIEW V1 AS
SELECT nom , salaire
FROM Employe
ORDER BY salaire ASC;

select * from V1;
select nom , salaire from V1;


