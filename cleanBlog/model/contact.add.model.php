<?php

include('config/config.inc.php');
include('model/pdo.inc.php');

try {
    //   var_dump($_POST);
    // $query=
    // "INSERT 
    // INTO blog_contacts
    // (contact_name, contact_email, contact_phone, contact_message)
    // VALUES
    // ('" . addslashes($_POST["name"]) . "', '" . $_POST["email"] . "', '" . $_POST["phone"] . "', '" . addslashes($_POST["message"]) ."')";
    
    // $req = $pdo->exec($query);


    $query=
    "INSERT 
    INTO blog_contacts
    (contact_name, contact_email, contact_phone, contact_message)
    VALUES
    (:contact_name, :contact_email, :contact_phone, :contact_message)";

    // die($query)

    $curseur = $pdo->prepare($query);

    $curseur->bindValue(':contact_name', $_POST["name"], PDO::PARAM_STR);
    $curseur->bindValue(':contact_email', $_POST["email"], PDO::PARAM_STR);
    $curseur->bindValue(':contact_phone', $_POST["phone"], PDO::PARAM_STR);
    $curseur->bindValue(':contact_message', $_POST["message"], PDO::PARAM_STR);

    $curseur->execute();

} catch (Exception $e) {
    // die('Erreur MySQL : ' . $e->getMEssage());
    header("Location: index.php?erreur=1");
    exit;

}