<?php 
    require 'connexion.php';

    $statement = $db->prepare('SELECT *FROM personnage');
    $statement->execute();
    $personnages = $statement->fetchAll();
    
    foreach($personnages as $personnage){
        echo $personnage['nom_personnage']."<br>";
    }

    //another example trying to get character name from a location and activity
    

        $query = 'SELECT nom_personnage FROM personnage 
                            WHERE id_lieu = :id_lieu AND id_specialite = :id_specialite';
        $statement = $db->prepare($query);
        $statement->execute([
            'id_lieu' => 1,
            'id_specialite' => 7,
        ]);
        $res = $statement->fetchAll();
        foreach($res as $personnage){
            echo $personnage['nom_personnage']."<br>";
        }
?>