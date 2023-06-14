<?php
try {
    $db = new PDO('mysql:host=localhost;
                    dbname=gaulois;
                    charset=utf8', 
                    'root', '',
                    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION],
                );
}
catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}
?>