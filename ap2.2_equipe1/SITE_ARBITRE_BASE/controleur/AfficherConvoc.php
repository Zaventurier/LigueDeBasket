<?php
include "./modele/AfficherConvocation.php";

$btn = "Initialiser";
if (isset($_POST["btn"])){
	$btn = $_POST["btn"];
}

$message = "";
$erreur = "";
$confirm ="";

switch ($btn){
	case "Initialiser" :
		$_POST["num_match"] = "";
		break;
		
	case "Saisir" :
		if ( $_POST["num_match"] == "" ){
			$erreur = "ERREUR : la saisit est impossible : un numéro de match est obligatoire !";
		    break;
		}
}








$equipes = getEquipe();
$arbitres = getArbitre();
$matchs = getMatch($_POST["num_match"]);
include "./vue/vueAfficherConvocation.php";
?>

