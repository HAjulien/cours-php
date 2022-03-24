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

include("model/contact.add.model.php");

header("Location: index.php?notif=1");
exit;
