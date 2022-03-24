<?php 
// pour relier le fichier home.modele avec celui-ci
include('model/home.model.php');
//on a récuperé la variable $header_title dans home.model
$layout_title='Titre = ' . $header_title;
//on relie avec le fichier view home
include('view/home.view.php');