<?php
try {
    $db = new PDO('mysql:host=localhost;dbname=gaulois;charset=utf8', 'root', '');
    echo 'bravo';
}
catch (Exception $e) {
    echo 'error';
    die('Erreur : ' . $e->getMessage());
}
?>