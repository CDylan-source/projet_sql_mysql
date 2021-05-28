/* Création table */
CREATE TABLE table_test(
    id VARCHAR(255) NULL,
    first_name VARCHAR(255) NULL,
    last_name VARCHAR(255) NULL,
    email VARCHAR(255) NULL,
    gender VARCHAR(255) NULL,
    ip_address VARCHAR(255) NULL,
    birth_date VARCHAR(255) NULL,
    zip_code VARCHAR(255) NULL,
    avatar_url VARCHAR(255) NULL,
    state_code VARCHAR(255) NULL,
    country_code VARCHAR(255) NULL
);

/* Chargement du fichier csv dans la table*/
LOAD DATA 
LOCAL INFILE 'base.csv' 
INTO TABLE table_test 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATEDBY '\n' 
IGNORE 1 ROWS;

/* Sélection des Palmer */
SELECT *
FROM `table_test`
WHERE last_name = 'palmer';

/* Séléction des femmes */
SELECT *
FROM `table_test`
WHERE gender = 'Female';

/* Sélection des états commençant par N */
SELECT *
FROM `table_test`
WHERE state_code LIKE 'N%';

/* Sélection des mails contenant google */
SELECT *
FROM `table_test`
WHERE email LIKE '%google%';

/* Tri par état et arrangement par occurrence croissante */
SELECT state_code,
COUNT(*) 
FROM table_test
GROUP BY state_code
ORDER BY COUNT(*) ASC;

/* Création d'un 1001ème personnage */
INSERT INTO table_test 
VALUES ('1001', 'Elvis', 'Presley', 'elv.pres@gmail.com', 'Male', '192.168.1.1', '12/06/1845', '70100', 'http://blinklist.com/accumsan/odio.html', 'PA', 'US');

/* Changement de mail */
UPDATE table_test
SET email = REPLACE(email, 'elv.pres@gmail.com', 'elvis@wanadoo.fr');

/* Bye bye Elvis */
DELETE FROM `table_test`
WHERE `id` = 1001;

/* Nombre de femmes et d'hommes */
SELECT gender,
COUNT(*)
FROM table_test
GROUP BY gender;

/* Âges */
UPDATE `table_test`
SET `birth_date` = str_to_date( `birth_date`, '%d/%m/%Y' );

SELECT birth_date,
FLOOR(DATEDIFF(CURDATE(), birth_date)/365.25) as age
FROM table_test;

/* Moyenne âges */

SELECT
AVG(FLOOR(DATEDIFF(CURDATE(), birth_date)/365.25))
FROM table_test;

SELECT gender,
AVG(DATEDIFF(CURDATE(), birth_date)/365.25)
FROM table_test
GROUP BY gender;

/* Colonne avec âge */
ALTER TABLE table_test
ADD age VARCHAR(255);

UPDATE `table_test`
SET `age` = FLOOR(DATEDIFF(CURDATE(), birth_date)/365.25);

/* Éxo 9 */
CREATE TABLE ACS(
    membres VARCHAR(255) NULL
);

ALTER TABLE ACS
ADD last_name VARCHAR(255);

INSERT INTO ACS (membres, last_name)
 VALUES ('MANON', 'MILLE'), ('CLÉMENT', 'POUPENEY'), ('FABRICE', 'DHERVÉ'), ('FLORIANE', 'SIMMET'), ('RAPHAEL', 'DORCE'), ('MARGAUX', 'COPPI'), ('LAURY', 'QUARTO'), ('LOUIS', 'POCHERON'), ('MICKAEL', 'CECEN'), ('OSCAR', 'MILLOT'), ('DYLAN', 'CHAPUIS'), ('JONATHAN', 'JUILLERAT'), ('NADIL', 'TAHAR'), ('BRYAN', 'PERGAUD'), ('ÉLODIE', 'GAGE');

 INSERT INTO ACS (membres, last_name)
 VALUES ('BRYAN', 'PERGAUD'), ('ÉLODIE', 'GAGE');

 /* Table département */ /* Désapprouvée par Floriane, donc suppression de cette méthode par un DELETE FROM */
CREATE TABLE departements(
    numero VARCHAR(255) NULL,
    nom_departement VARCHAR(255) NULL
);

LOAD DATA 
LOCAL INFILE 'departements-france.csv'
INTO TABLE departements (numero, nom_departement,@dummy, @dummy)
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

ALTER TABLE ACS
ADD numero VARCHAR(255);

UPDATE `ACS`
SET `numero` = '25'
WHERE membres = 'MANON'
OR membres = 'CLÉMENT'
OR membres = 'FLORIANE'
OR membres = 'RAPHAEL'
OR membres = 'LAURY'
OR membres = 'MICKAEL'
OR membres = 'JONATHAN'
OR membres = 'BRYAN'
OR membres = 'ÉLODIE';

UPDATE `ACS`
SET `numero` = '35'
WHERE membres = 'FABRICE';

UPDATE `ACS`
SET `numero` = '06'
WHERE membres = 'MARGAUX';

UPDATE `ACS`
SET `numero` = '39'
WHERE membres = 'LOUIS';

UPDATE `ACS`
SET `numero` = '07'
WHERE membres = 'OSCAR';

UPDATE `ACS`
SET `numero` = '38'
WHERE membres = 'DYLAN';

UPDATE `ACS`
SET `numero` = '68'
WHERE membres = 'NADIL';

SELECT *
FROM ACS
NATURAL JOIN departements;

ALTER TABLE ACS
DROP numero;
/* Au revoir ancienne solution */

/* Bonjour foreign key, si je réussi à vous utiliser */