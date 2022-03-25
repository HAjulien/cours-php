<?php


// if ( (!isset($_GET['article'])) || ($_GET['article'] == '1' ) ) {

//     $bg='assets/img/post-bg.jpg';
//     $color='red';
//     $title='Planche de surf :';
//     $subtitle='comment bien la choisir ?';
//     $content = 'Vous commencez à prendre vos premières vagues et souhaitez passer le cap dans la pratique de votre sport préféré ? Sans doute le moment est-il venu de vous offrir votre première planche de surf ! Petit bémol : il existe presqu’autant de modèle que de shapers… Aussi, choisir sa planche de surf peut s’avérer un peu plus compliqué qu’on ne le croit au premier abord.

//     Quel shape est fait pour vous ? Quel <a href="#">type</a>  de vagues voulez-vous surfer ? Comment va-t-elle se comporter à la rame ? Quid du poids et de la taille ?

//     Tous ces éléments – vous l’aurez devinez – et bien d’autres encore, vont être déterminant pour votre montée en niveau. Dans cet article, on vous livre tous les secrets pour choisir la planche de surf en adéquation avec votre niveau et vos objectifs !
//     <style>
//         .test{
//             color: ' . $color . '; 
//         }
//     </style>

//     1. Pourquoi choisir sa planche de surf ?
//     2. Quels sont les différents types de planche de surf ? 
//     3. Comment choisir sa planche de surf ?
//     4. Où acheter sa <span class="test"> planche de surf </span> ?';
// }  

// else if ( $_GET['article'] == '2' ) {

//     $bg='https://www.surfcamp.fr/wp-content/uploads/2020/08/image-2020-08-27T170705.195.jpg';
//     $title='Rendez-Nous la Mer';
//     $subtitle='la Pétition pour autoriser les Activités Nautiques';
//     $content = 'Un grand merci aux nombreux signataires et aux personnalités du monde du surf, de la mer, de la culture et de la santé qui soutiennent la pétition pour un libre accès à l’océan pendant le (re)confinement.

//     Pour ceux qui ne l’ont pas encore fait, vous pouvez signer ici :';
// }
// else if ( $_GET['article'] == '3' ) {

//     $bg='https://www.surfcamp.fr/wp-content/uploads/2020/08/image-90.jpg';
//     $title='Évasion et aventure ';
//     $subtitle='un séjour surf entre amis en Indonésie';
//     $content = 'Les vacances en Indonésie promettent aux touristes une aventure riche en émotion et de découvertes. De nombreuses activités les attendent durant leur escapade : immersion culturelle, plongée sous-marine, randonnée, surf et bien d’autres. Les adeptes de surf auront, par exemple, à leur disposition un large choix de spots pour s’adonner à leurs activités favorites.';
// }
// else {

//     $bg='https://img-0.journaldunet.com/qhevN0_qiAHAirgBuxGDCY8CYac=/1500x/smart/c64aaa86188643eba9ca6ac7e7f7c3ae/ccmcms-jdn/10984460.jpg';
//     $title='Erreur';
//     $subtitle='Page inexistante';
//     $content = ' ';
// }


include('config/config.inc.php');

include('model/pdo.inc.php');

try {

    /* $query="
    
    SELECT  cat_descr , post_content , post_title , post_img_url , display_name , post_date

    FROM blog_posts
    
    INNER JOIN blog_users
    ON post_author = ID
    
    INNER JOIN blog_categories
    ON post_category = cat_id
    
    WHERE post_ID = " . $_GET["article"]
    ;  
    
    // die ($query);
 
    $req = $pdo->query($query);
    // var_dump($req);
 
    // while ($data = $req->fetch()) {
    //      var_dump ($data);
    //      echo"<br>" . $data["post_title"] . "<br>";
    // }
 
    $data = $req->fetch();  */

    // var_dump($data);



    $query=" 
    
    SELECT  cat_descr , post_content , post_title , post_img_url , display_name , post_date

    FROM blog_posts
    
    INNER JOIN blog_users
    ON post_author = ID

    INNER JOIN blog_categories
    ON post_category = cat_id
    
    WHERE post_ID = :article";

    $curseur = $pdo->prepare($query);

    $curseur->bindValue(':article', $_GET["article"], PDO::PARAM_INT);

    $curseur->execute();

    $curseur-> setFetchMode(PDO::FETCH_ASSOC);

    $data = $curseur-> fetch();

    // var_dump($data);
    // exit();


} catch  (Exception $e) {
    die('Connexion impossible : ' . $e->getMEssage());
}