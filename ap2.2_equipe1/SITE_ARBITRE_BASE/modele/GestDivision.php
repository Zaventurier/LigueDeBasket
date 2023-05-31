<?php

function connexionPDO() {
    $login = "root";
    $mdp = "root";
    $bd = "liguebasket";
    $serveur = "localhost";

    try {
        $conn = new PDO("mysql:host=$serveur;dbname=$bd", $login, $mdp, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\'')); 
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $e) {
        print "Erreur de connexion PDO ";
        die();
    }
}

function getDivision() {
    $resultat = array();

    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select * from division");
        

        $req->execute();

        $ligne = $req->fetchAll(PDO::FETCH_ASSOC);
        return $ligne;
        
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
	
    
}

function update_division( $num_division,$nom_division){
	 try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("UPDATE division SET nom_division = (?) WHERE num_division=(?)");
		$req->bindValue(1, $_POST['nom_division']);
		$req->bindValue(2, $_POST['num_division']);
        

        $req->execute();

        #$ligne = $req->fetchAll(PDO::FETCH_ASSOC);
        #return $ligne;
        
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
}
function delete_division ($num_division,$nom_division) {
	try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("DELETE FROM division WHERE num_division=(?)");
		#$req->bindValue(1, $_POST['nom_division']);
		$req->bindValue(1, $_POST['num_division']);
        

        $req->execute();

        #$ligne = $req->fetchAll(PDO::FETCH_ASSOC);
        #return $ligne;
        
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
}
function add_division () {
	try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("INSERT INTO division VALUES (NULL,?)");
		$req->bindValue(1, $_POST['nom_division']);
		//$req->bindValue(2, $_POST['num_division']);
        

        $req->execute();

        #$ligne = $req->fetchAll(PDO::FETCH_ASSOC);
        #return $ligne;
        
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
}
function verifDivision(){
    for ($i = 0; $i < count(getDivision()) ; ++$i){
        if($nom_division == $ligne){
            print("Erreur : l'enregistrement est déjà inscrit dans la base de données !");
        }
    }
    

}
//Fonction pour afficher les convocations
/*function convocation (){
    $connex = connexionPDO();
    $requete = $connex->prepare("");

}*/
?>