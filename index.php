<?php 
    require 'connexion.php';

    $statement = $db->prepare('SELECT *FROM personnage');
    $statement->execute();
    $personnages = $statement->fetchAll();
    
    foreach($personnages as $personnage){
        echo $personnage['nom_personnage']."<br>";
    }

    //another example: show address from name
    

        $query = 'SELECT adresse_personnage FROM personnage WHERE nom_personnage = :personnage';
        $statement = $db->prepare($query);
        $statement->execute([
            'personnage'=> 'Bonemine',
        ]);
        $res = $statement->fetchAll();
        var_dump($res);

 


?>