<?php

include('config/config.inc.php');

include('model/pdo.inc.php');

try{
    $query= "SELECT *
        FROM blog_contacts ";

    $req = $pdo->query($query);
    $req-> setFetchMode(PDO::FETCH_ASSOC);

    $data = $req->fetchAll();
    //var_dump($data);


}catch (Exception $e) {
    die('Erreur MySQL : ' . $e->getMEssage());

}



$bg='https://www.informatique-mania.com/wp-content/uploads/2020/12/01-40.jpg';
$header_title='Liste de contact';
$header_subtitle='Notre liste de contact';