<?php

// var_dump($_GET);
// exit;
// echo($_GET['article']);
// echo($_GET['article']);

//ce controller doit recevoir un parametre article
if(!isset($_GET["article"])) {
    die("Manque paramètre");
};

include('model/post.model.php'); 

$layout_title='Titre = ' . $title; 

include('view/post.view.php'); 
