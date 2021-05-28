<?php 
/* PDO */      
$pdo = new PDO('mysql:host=localhost;dbname=jesaispas', 'Dylan', 'Neptune26.'); 
try
{
	$bdd = new PDO('mysql:host=localhost;dbname=jesaispas;charset=utf8', 'Dylan', 'Neptune26.');
}
catch (Exception $e)
{
        die('Erreur : ' . $e->getMessage());
}

/* Test */
/* $reponse = $bdd->query('SELECT * FROM `ACS`'); 
while($donnees = $reponse->fetch()){
echo $donnees['last_name']."\n";} */

$reponse = $bdd->query('SELECT *
FROM ACS
INNER JOIN departements ON 
(CASE 
WHEN last_name = "MILLE"
OR last_name = "POUPENEY"
OR last_name = "SIMMET"
OR last_name = "DORCE"
OR last_name = "QUARTO"
OR last_name = "CECEN"
OR last_name = "JUILLERAT"
OR last_name = "PERGAUD"
OR last_name = "GAGE"
THEN 25
WHEN last_name = "DHERVÉ"
THEN 35
WHEN last_name = "COPPI"
THEN 06
WHEN last_name = "POCHERON"
THEN 39
WHEN last_name = "MILLOT"
THEN 07
WHEN last_name = "CHAPUIS"
THEN 38
WHEN last_name = "TAHAR"
THEN 68
END) = numero;'); 
while($donnees = $reponse->fetch()){
echo $donnees['last_name']." est né dans le ".$donnees['numero']."\n";}
?>