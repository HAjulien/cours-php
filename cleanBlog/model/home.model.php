<?php

include('config/config.inc.php');

include('model/pdo.inc.php');

try {

    $query="
    
    SELECT post_ID, cat_descr , LEFT(post_content ," . TRONCATURE . ") AS post_content ,post_title , display_name , post_date

    FROM blog_posts
    
    INNER JOIN blog_users
    ON post_author = ID

    INNER JOIN blog_categories
    ON post_category = cat_id

    ORDER BY post_date DESC
    ";

    // die ($query);

    $req = $pdo->query($query);
    // var_dump($req);

    // while ($data = $req->fetch()) {
    //      var_dump ($data);
    //      echo"<br>" . $data["post_title"] . "<br>";
    // }

    $data = $req->fetchAll();
    // var_dump($data);

} catch  (Exception $e) {
    die('Connexion impossible : ' . $e->getMEssage());
}



$bg='assets/img/home-bg.jpg';
$title='Blog de surf';
$subtitle='Le meilleur sport de glisse';

// $title_art_1='La planche de surf ';
// $subtitle_art_1='Comment bien la choisir pour progresser';
// $author_art_1='Phillipe G.';
// $date_art_1='le 17 Mars 2022';