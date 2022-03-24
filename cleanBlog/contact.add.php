<?php

// var_dump($_GET);

if (!isset($_POST["name"])) {
    die("Nom obligatoire!");
}
if ($_POST["name"] == "") {
    die("Nom doit contenir une valeur!");
}
if (strlen($_POST["name"]) > 25 ) {
    die("Nom doit être inférieur à 26 caractères !");
}


try {
    //   var_dump($_POST);
    $query=
    "INSERT 
    INTO blog_contacts
    (contact_name, contact_email, contact_phone, contact_message)
    VALUES
    (" . addslashes($_POST["name"]) . ", " . $_POST["email"] . ", " . $_POST["phone"] . ", " . addslashes($_POST["message"]) .")";
    die($query);

} catch (Exception $e) {
    die('Erreur MySQL : ' . $e->getMEssage());

}