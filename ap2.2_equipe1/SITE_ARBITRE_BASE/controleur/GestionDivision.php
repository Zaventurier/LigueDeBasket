<?php
include "modele/GestDivision.php";


$btn = "Initialiser";
if (isset($_POST["btn"])){
	$btn = $_POST["btn"];
}

$message = "";
$erreur = "";
$confirm ="";

switch ($btn){
	case "Initialiser" :
		$_POST["nom_division"] = "";
		break;
		
	case "Modifier" :
		if ( $_POST["nom_division"] == "" ){
			$erreur = "ERREUR : modification impossible : vous devez saisir un nom de division !";
		    break;
		}
	
	
		
		//Enregistrer le nom dans la base de données ....
		update_division( $_POST["num_division"], $_POST["nom_division"]);
		
		$message = $_POST["nom_division"]." a été modifié avec succés !";
		
		
		break;
	case "Supprimer" :
		if ( $_POST["nom_division"] == "" ){
			$erreur = "ERREUR : la suppression n'a pas pu être effectué car le champ est vide !";
			break;
		}
		$message = $_POST["nom_division"]." a été supprimé avec succés !";
		delete_division( $_POST["num_division"], $_POST["nom_division"]);
		//erreur ici
		//$_POST["nom_division"]." est sur le point d'être supprimé ! Cette action est irréversible ! Confirmez vous la supression ?";
		break;;
		
		
	case "Ajouter" :
		if ( $_POST["nom_division"] == "" ){
			$erreur = "ERREUR : vous devez saisir un nom pour votre divison !";
			break;
		}
		
	add_division($_POST["nom_division"]);
		$message = $_POST["nom_division"]." a été ajouté avec succés !";
	
}


$lignes=getDivision();
include "./vue/vueGestionDivision.php";
?>