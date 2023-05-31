<?php

function controleurPrincipal($action){
    $lesActions = array();
    $lesActions["defaut"] = "index.php";
    $lesActions["ajouterdivision"] = "VueAjouterDivision.php";
    $lesActions["AfficherConvoc"] = "AfficherCovoc.php";



    if (array_key_exists ($action, $lesActions)){
        return $lesActions[$action];
    }
    else{
        return $lesActions["defaut"];
    }
}