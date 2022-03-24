<?php
// pour aller chercher les informations pour se connecter à la base de donnée mdp user...
include('config/config.inc.php');
// pour se connecter à la base de données
include('model/pdo.inc.php');
//pour aller chercher les info qui nous interesse dans la base de donnée , on fait une condition try catch
try {
//on recupere avec SELECT dans les categorie que l'on veux pour lire.on met dans la variable $query
// TRONCATURE constante definie dans config.php puis on doit lui redonné un nom pour requete sql left pour prendre a partir gauche chaine 
//INNER JOIN pour relie base donnée entre elle on peut savoit a quelle id auteur correspond nom auteur...
//order pour afficher post par date decroissant
    $query="
    
    SELECT post_ID, cat_descr , LEFT(post_content ," . TRONCATURE . ") AS post_content ,post_title , post_img_url, display_name , post_date

    FROM blog_posts
    
    INNER JOIN blog_users
    ON post_author = ID

    INNER JOIN blog_categories
    ON post_category = cat_id

    ORDER BY post_date DESC
    ";

    // die ($query);
    //on initialise $query avec ->query grâce $pdo qui à les info pour se connecter (dans model.pdo )
    $req = $pdo->query($query);
    // var_dump($req);

    // while ($data = $req->fetch()) {
    //      var_dump ($data);
    //      echo"<br>" . $data["post_title"] . "<br>";
    // }
//$data recupere dans un tableau  les valeur grâce fetchAll qui boucle pour chaque tupes
    $data = $req->fetchAll();
    // var_dump($data);
//si on arrive pas a se connecter a la base de donné on capture erreur dans $e grace catch Exception
} catch  (Exception $e) {
    die('Connexion impossible : ' . $e->getMEssage());
// on affiche l erreur a ecran pour pouvoir le corriger die pour stoper 
}


//variable ecrit en dur pour le titre index
$bg='assets/img/home-bg.jpg';
$header_title='Blog de surf';
$header_subtitle='Le meilleur sport de glisse';

// $title_art_1='La planche de surf ';
// $subtitle_art_1='Comment bien la choisir pour progresser';
// $author_art_1='Phillipe G.';
// $date_art_1='le 17 Mars 2022';