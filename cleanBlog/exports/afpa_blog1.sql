-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 21 mars 2022 à 13:05
-- Version du serveur :  5.7.19-log
-- Version de PHP : 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `afpa_blog1`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE IF NOT EXISTS `blog_categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_descr` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `blog_categories`
--

INSERT INTO `blog_categories` (`cat_id`, `cat_descr`) VALUES
(1, 'Divers'),
(2, 'Surf'),
(3, 'Skate'),
(4, 'Snowboard'),
(5, 'Style'),
(6, 'Test');

-- --------------------------------------------------------

--
-- Structure de la table `blog_comments`
--

DROP TABLE IF EXISTS `blog_comments`;
CREATE TABLE IF NOT EXISTS `blog_comments` (
  `comment_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',
  `comment_post_ID` int(11) NOT NULL COMMENT 'Clé vers le post',
  `comment_author` int(11) NOT NULL COMMENT 'Clé vers l''auteur',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du commentaire',
  `comment_content` text NOT NULL COMMENT 'Texte du commentaire',
  PRIMARY KEY (`comment_ID`),
  KEY `fk_blog_comments_blog_posts1` (`comment_post_ID`),
  KEY `fk_blog_comments_blog_users1` (`comment_author`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_date`, `comment_content`) VALUES
(1, 4, 1, '2018-10-19 08:02:54', 'Concept intéressant !'),
(2, 3, 1, '2018-10-19 08:40:18', 'Le skate c\'est chouette !'),
(5, 3, 1, '2019-01-16 08:23:51', 'Un commentaire de plus'),
(6, 1, 1, '2019-01-16 12:32:32', 'Bienvenue à l\'été !'),
(22, 12, 1, '2019-02-09 15:51:49', 'Très bon article !!!'),
(23, 12, 1, '2019-02-28 09:23:39', 'Vive la neige !'),
(44, 7, 1, '2019-03-26 21:20:53', 'Très bel article !');

-- --------------------------------------------------------

--
-- Structure de la table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
CREATE TABLE IF NOT EXISTS `blog_posts` (
  `post_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',
  `post_author` int(11) NOT NULL COMMENT 'Clé vers l''auteur',
  `post_category` int(11) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du post',
  `post_content` text NOT NULL COMMENT 'Contenu du post',
  `post_title` varchar(255) NOT NULL COMMENT 'Titre du post',
  `post_img_url` varchar(255) NOT NULL COMMENT 'Url de image du post',
  PRIMARY KEY (`post_ID`),
  KEY `fk_blog_posts_blog_users` (`post_author`),
  KEY `fk_blog_posts_blog_categories1` (`post_category`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `blog_posts`
--

INSERT INTO `blog_posts` (`post_ID`, `post_author`, `post_category`, `post_date`, `post_content`, `post_title`, `post_img_url`) VALUES
(1, 1, 2, '2017-11-13 15:33:09', 'Ça y est l’été arrive… enfin si on ne regarde pas par la <b>fenêtre</b>… ! Ici, chez Allons rider on rêve d’une journée plage avec des vagues sympas et pleins de nanas qui ont le sourire. Toi aussi ? Et bien ça tombe bien parce que c’est justement ce qui nous attend le samedi 23 juin !', 'VIENS RIDER ENTRE NANAS ! ', 'https://i1.wp.com/www.allonsrider.fr/wp-content/uploads/2018/06/elizeu-dias-520684-unsplash.jpg?resize=759%2C500'),
(3, 1, 3, '2018-06-25 15:07:46', 'Quelques trucks qui grincent sur le coping en fer, des roulements qui n’ont jamais fait autant de tours sur eux-même, une multitude de possibilités de rider, mais aussi de s’éclater sur un bitume tout aussi bouillant que le public, et surtout beaucoup de style. Quand on assiste au Redbull Bowl Rippers, on s’en souvient. Non seulement parce que la crème de la crème du skate se retrouve dans un même skatepark pendant 2 jours mais aussi parce qu’on ne fait pas de crème sans casser des oeufs. Et c’est assez impressionnant.\r\nPar chance, Motorola nous a convié à nous y rendre pour y capturer un maximum d’images. Retour sur l’événement skate qui a marqué nos esprits.\r\nA première vue, on se croirait aux states. Le bowl a été complètement repeint, les juges sont hissés sur leur chaises blanches, les speakers déchainés, un gros 4×4 Redbull monte la garde et les spectateurs sont très stylisés. On ne ressent pas de pression, mais plutôt beaucoup d’excitation de la part des skaters qui courent partout autour du bowl en attendant leur tour. Alors que nous, en zone presse, on boit (du Redbull organic) et on s’imagine, là bas, à leur place l’instant de quelques secondes avant que le speaker ne nous rappelle à la réalité.\r\nImaginer quelques instants l’adrénaline qu’ils peuvent ressentir une fois lancés dans ces courbes, acclamés par le public Marseillais, cerveaux probablement déconnectés.\r\nLe local Vincent Matheron, lui, n’a pas eu de mal à déconnecter son cerveau en finale de la compétition pour balancer des tricks à la hauteur du level de ses trois concurrents brésiliens (Murilo Peres, le skater aux 9 médailles X-Games et les tout-juste-majeur Luiz Francisco et Pedro Barros) et de deux américains (Chris Russell et Kevin Kowalski). Un pari perdu plus tard, il finira, avec le sourire*, sur la 5ème marche du podium devancé par le gagnant Pedro Barros. *sanglant du Joker dessiné sur le visage\r\n\r\nMais si à Marseille on a l’habitude de soutenir les skaters lors de cet event qui fête sa troisième edition, ça en est tout autre pour les skateuses.\r\n« Jamais deux sans trois » n’est pas au goût de Redbull et ça ne nous étonne que très peu au vu de l’image fun et désinvolte de la marque qui joue bien souvent sur le terrain de l’inattendu. Deux éditions sans skateuses ont suffit à Redbull pour les faire intervenir lors de leur troisième volets. Et les filles ne sont pas là pour jouer les pompom girls…\r\nAu programme, 12 nanas talentueuses venues s’affronter les unes contre les autres mais toujours avec une certaine solidarité. Sur la rampe de lancement, pas question de passer son tour, elles y vont franco et savent exactement ce qu’elles font.\r\nChez les françaises on ressent une certaine pression. Probablement celle de voir débarquer 10 skateuses du monde entier venir déchirer leur home spot. Pour la locale Maya Jacquemin c’est « formateur de skater entourée de pro ». Et pro, c’est le mot.\r\nParmi les skateuses, une icône de la discipline: Lizzie Armanto. Cette skateuse originaire des Etats Unis s’était faite remarquer trois jours plus tôt pour avoir été la première femme à skater le looping 360° de Tony Hawk. Rien que ça.\r\nMais ce n’est pas tout puisque Brighton Zeuner était aussi de la partie. A seulement 14 ans, elle est la plus jeune médaillée de l’histoire des X-Games. Nous l’avons rencontré.\r\n\r\nSalut Brighton, comment tu te sens aujourd’hui ?\r\n\r\nJe dois dire que je suis plutôt nerveuse parce que ce n’est pas une petite compétition mais je suis toujours comme ça lors des contest. J’ai surtout super hâte de skater ! Et puis, j’ai de la chance cette fois je ne suis pas jet lag puisque j’étais en Suède juste avant.\r\nQue fais tu pour te détendre quand tu es nerveuse ? As tu des rituels ? \r\n\r\nEt bien quand je suis nerveuse, j’essaie de penser à autre chose, je ne sais pas trop… J’essaie de me détendre en skatant mais ça craint parce qu’au final je suis stressée pour la competition mais il n’y a qu’en skatant que je peux être detendue. Alors bah j’attend mon tour nerveusement… Mais quand je suis dans le bowl ça va beaucoup mieux !\r\n\r\nTu n’étais jamais venue à Marseille, que penses-tu du bowl ? \r\n\r\nOui c’est la première fois que je viens ici et je trouve le bowl différent de ce que j’ai l’habitude de skater. Mais je pense que c’est une bonne chose ! C’est important pour les skaters de pouvoir s’adapter à de nouveaux skateparks comme celui là et c’est plutôt amusant de tester de nouvelles choses donc oui… c’est très différent mais c’est fun !\r\nPour la première fois, le Redbull Bowl Rippers ouvre la compétition aux nanas. Qu’est ce que tu penses de ça ? \r\n\r\nJe trouve ça super cool qu’ils commencent à mettre le skate féminin au même niveau que les mecs parce que les filles se donnent autant que les gars. Puis j’ai beaucoup de potes skaters qui trouvent ça bien, ils aiment bien quand une nana vient skater avec eux. Ça apporte de la visibilité au monde du skate féminin, c’est génial pour la future génération !\r\n\r\nCette après midi c’est juste un entrainement pour les filles, demain seulement les choses sérieuses démarrent. Quels sont tes objectifs ? \r\n\r\nJe vais juste skater et tenter de m’amuser. Je n’ai pas envie de me mettre la pression sur les épaules, je vais juste skater et voir ce que ça donne. Et puis, la France c’est super beau, c’est cool de pouvoir skater ici et d’aller à la plage en suivant. Tu vois, juste du fun.\r\nFun, c’est le mot qui résume plutôt bien ce contest organisé par Redbull. Tous les athlètes sont à fond et on ne s’ennuie pas une seule seconde. On redoute même le moment où l’envie d’évacuer les litres de Redbull engorgé va se faire sentir. Tout ce qu’on a à faire est d’ouvrir grand les yeux, moto g6 à la main.\r\nFinalement, c’est la Brésilienne Yndiara Asp qui prend la première marche du podium chez les filles. Elle devance ainsi Brighton Zeuner et l’Australienne Poppy Starr Olsen sur ce légendaire Bowl du Prado. Tandis que les Françaises Maya Jacquemain et Alice Attali terminent respectivement cinquième et sixième. \r\nEn tout cas nous on resterait bien un jour de plus que l’effervescence redescende pour pouvoir tester le bowl. A votre avis, on a résisté ?\r\n\r\nMerci Motorola pour cette super expérience. Retrouvez toutes les infos du Moto G6 par ici. \r\n\r\nPhotos: Lucas Cerri et/ou prise avec le moto G6.', 'RENCONTRE AVEC LA CRÈME DU SKATE FÉMININ AU REDBULL BOWL RIPPERS', 'https://i1.wp.com/www.allonsrider.fr/wp-content/uploads/2018/09/322A0438.jpg?resize=759%2C500'),
(4, 1, 5, '2018-09-27 15:20:36', 'Souviens toi, il y a quelques semaines, je te parlais de ce surfshop Lastage, le plus green au monde, situé à Biarritz. Cette nouvelle marque française, qui s’adresse aux 15-30 ans, propose des produits éco-responsables.Cela va même plus loin puisque toute la marque a été pensé autour de ces valeurs. Les shops sont faits à partir d’objets recyclés, 10% de remise sont offerts aux clients qui ramènent en magasin de vieilles fringues, la production est faite en Turquie pour sa culture de coton biologique, respectant des normes internationales strictes quant aux conditions de travail et les produits sont fabriqués à partir de matières recyclées. Pas de production française donc, mais des compromis qui permettent d’avoir des produits à la foisde haute qualité, respectueux de l’environnement et à des prix raisonnables.Le shop de GuidelDu coup j’ai profité d’un WE surf dans le Morbihan pour passer au seul shop breton de la marque, à Guidel (près de Lorient). Tenu par Yann, baroudeur qui a passé 8 mois au Maroc, ce shop sent bon le surf, le vrai. Car Yann est aussi moniteur, il gère en parallèle l’école Yousurf. Du coup la boutique est partagée entre produits Lastage et espaces pour le matos de l’école. On est loin de certains shops de grandes marques australiennes tenus par des vendeurs qui ne sont jamais montés sur une planche de leur vie. Ici certains clients arrivent pieds nus, combi plein de sable et cheveux mouillés. Ça respire l’amour du surf.Le boardshort LastageLe produit phare, c’est le boardshort, fabriqué à 90% de bouteilles en plastique recyclées. J’ai jeté mon dévolu sur le modèle Pro Duc III Pop Corn. Coupe très courte (17) et couleurs pastel, de jaune et de bleu, ce qui lui donne un look assez rétro, très 70s-80s. Et après 2h de surf sur la côte sauvage de Quiberon, je dois dire que je suis plutôt impressionné par le produit. J’avais peur que le short soit rigide, car fait de bouteilles en plastique recyclées. Mais en fait pas du tout, il est aussi « élastique » que mon Mirage de Rip Curl, grâce au 10% restant, le stretch. Et c’est plutôt cool de se dire que tu surfes avec un boardshort qui est fait à partir de bouteilles que certaines personnes laissent traîner sur la plage. C’est un peu une revanche de cette bouteille Vittel laissée entre deux rochers.Autre originalité du short, son système de serrage velcro. Unique au monde et breveté Lastage d’après leur site internet. Ici pas de lacets pour ensuite avoir un nœud qui pend, mais que du velcro, qui permet de l’ajuster à sa taille. A la fois malin et esthétique. Mais ce qui engendre pour moi le seul petit hic du produit : il n’y a pas de lacets à insérer dans le loop de mon top (pour éviter qu’il remonte). Mais à priori les tops de la marque Lastage ont eux un petit bouton qui s’accroche aux shorts. Tout a donc été pensé pour à la fois le surfeur pratiquant et pour le chilleur soucieux de son look sur la plage.Niveau prix, on est dans les standards de ce que les grandes marques comme Quiksilver, Rip Curl ou Billabong pratiquent. Aux alentours de 49 € pièce pour l’entrée de gamme et jusqu’à 75 € pour la gamme pro model. A la différence que c’est une marque française, et que les matières utilisées viennent de plastique recyclé. Ce qui n’est pas négligeable.Pour conclure je dirais que c’est vraiment sympa de surfer avec un produit au look vintage et très moderne dans son procédé de fabrication éco-responsable.  Si tu as la chance de surfer juste en boardshort dans une eau chaude, c’est parfait. D’ailleurs ce short, il serait parfait l’été, en longboard, pour retrouver des sensations de glisse bien old school. Un retour aux sources.', 'Test du boardshort Lastage, fabriqué avec des bouteilles recyclées', 'https://insideurosima.files.wordpress.com/2016/02/eurosima-lastage-4.jpg?w=840&h=560'),
(5, 1, 5, '2018-10-21 13:38:44', 'Historique\r\nL\'an dernier le Big Festival disparaissait après 8 éditions consécutives. Au début, c’est l’argument technique qui avait été évoqué puisque le site du stade Aguilera était en rénovation. Mais c’est finalement le budget qui a posé problème car les organisateurs réclamaient 300.000 euros de participation à la Mairie de Biarritz soit le double par rapport aux années précédentes pourra t-on lire dans le mediabask.\r\n\r\nRésultat, 2017 s’est passé au OKLM avec des rendez-vous hebdomadaires en plein air à la Cité de l’océan avec des artistes un peu moins connus mais pour autant tout aussi agréable. \r\n\r\nLe nouveau festival\r\n2018, c’est le retour d’un projet ambitieux avec « Biarritz en été » qui sera donc le nouveau festival branché du coin. Organisé par la Ville de Biarritz et le Centre des Musiques Actuelles l’Atabal (et non des parigos), le festival se veut « authentique » et « fédérateur pour notre territoire » déclara Sylvie Claracq présidente de l’Atabal pour mediabask.\r\n\r\nLe festival se déroulera donc dans les jardins de la Cité de l’océan du 20 au 22 juillet prochain. \r\n\r\nProgramme\r\nAujourd’hui voici les têtes d’affiches qui ont été divulguées : Phoenix, Etienne Daho, Cigarrettes After sex, Juliette Armanet, Lomepal, The Black Madonna, L’impératrice, Angèle, Agar Agar, Caballero & JeanJass, Yellow Days, Malick Djoudi et Kepa\r\n\r\nPendant la journée, un village sera installé à la Milady pour célébrer la culture locale, gastronomique, surf et musicale avec la participation de collectifs musicaux gratuit. \r\n\r\nPour le reste, la billetterie est d’ores et déjà ouverte avec des prix variants entre 83 et 113 euros selon le moment de votre réservation (plus vous réservez tôt, mieux c’est !\r\n\r\nUne bonne nouvelle qui nous réchauffe le coeur malgré ce temps pourri… vivement l’été ! ', '« Biarritz en été » le nouveau festival qui remplacera le BIG le 20/22 juillet prochain', 'https://i1.wp.com/surf-me.com/wp-content/uploads/2018/02/lomepal-festival-biarritz-en-ete-2018.jpg?w=820'),
(6, 1, 2, '2018-10-21 14:16:53', 'En ce 2 janvier 2018, jour où les houles ne cessent de s’enchainer à Nazaré (Portugal), il est de bon ton de revenir sur l’une des adeptes et surtout des pionnières de surf de gros : la surfeuse brésilienne Maya Gabeira\r\n\r\nIssue d’un père politicien (Fernando Gabeira) fondateur du Parti vert brésilien et très engagé dans la lutte armée contre la dictature militaire à la fin des années 60 (il participera même à l’enlèvement de l’ambassadeur américain au Brésil Charles Elbrick le 7 septembre 1969), c’est loin de la politique que la surfeuse de 30 ans va évoluer mais c’est surement là l’origine de son tempérament engagé.\r\n\r\nCar son « combat » à elle, c’est celui d’affronter les vagues géantes partout dans le monde et autant vous dire qu’en la matière, elle n’y va pas avec le dos de la cuillère.\r\n\r\nA son actif : 5 Billabong XXL awards consécutifs de 2007 à 2012 dont la plus grosse vague jamais surfée par une femme en 2009 où elle signe un 14 mètres à Dungeons en Afrique du Sud…\r\n\r\nMais Maya Gabeira c’est aussi : un traumatisme crânien en aout 2011 sur une session de tow-in (surf tracté) sur un gros Teahupoo à Tahiti où elle se prendra 5 vagues sur la tête pour finir à demi-consciente et un wipeout sur une vague XXL à Nazaré (Portugal) en 2013 où elle frôle la mort et sera réanimée de justesse par son coéquipier brésilien Carlos Burle… s’en suit 2 ans de rééducation avec des opérations au dos, au nez etc..\r\n\r\nDepuis 2015, elle revient tranquillement sur les spots et se remet à charger à Nazaré et à Hawaï notamment.\r\n\r\nUne athlète au parcours exceptionnel qui nous prouve que même si le surf de gros se démocratise cela reste un challenge dangereux où il est facile d’y laisser la vie…\r\n\r\nEn espérant que 2018 soit une belle année à vague pour cette vétéran qui en a inspiré plus d’un(e)… pour l’instant ça à l’air d’être plutôt bien partie !', 'Maya Gabeira portrait d’une surfeuse pionnière de retour dans les vagues XXL', 'https://i0.wp.com/surf-me.com/wp-content/uploads/2018/01/maya-gabeira.jpg?resize=960%2C550'),
(7, 1, 2, '2018-10-21 22:16:37', 'Pour la première fois je laisse la parole à une autre personne, Xavier, qui nous raconte son dernier surf trip en Irlande. Il saura à coup sûr vous donner envie de partir visiter cette belle île pour y surfer, mais pas que !\r\n\r\nRécit de mon surf trip en Irlande\r\nPendant que certains voyagent aux quatre coins du monde pour trouver les meilleurs spots de surf possibles (comme ce voyage au Chili par exemple), il suffit parfois d’écumer les plages d’Europe pour trouver de nombreux paradis sur terre… Ou plutôt sur mer. Ma dernière aventure m’a récemment mené en Irlande, pays connu pour ses bières (Guinness, Kilkenny), ses Leprechauns et ses trèfles à quatre feuille mais aussi pour le surf qui s’impose de plus en plus comme une destination de choix pour les passionnés de rouleaux, au point d’être devenue en quelques années seulement une destination surf majeure dans la zone Europe.\r\n\r\nBon, je vous l’accorde, il s’agit surtout d’une destination de choix pour les surfeurs qui n’ont pas peur de se frotter aux eaux froides, très froides. En effet, au meilleur moment de l’année, soit entre juillet et septembre, la température de l’eau sur l’île émeraude ne dépasse pas les 15° en moyenne. Entre novembre et janvier, elle peut même tomber sous la barre des 11°. Autant dire que les surfeurs frileux ont tout intérêt à s’abstenir et à choisir une autre destination !\r\nHeureusement, en marge de ce léger inconvénient, les côtes irlandaises disposent aussi de nombreux atouts qui font d’elles un « paradis froid », comme l’avait expliqué Kelly Slater après avoir visité les 5 spots incontournables à tester dans le pays, allant d’Inchydoney, parfaitement adapté aux débutants, à Easky, qui abrite la Fédération de surf irlandaise, en passant par The Peak, qui a longtemps constitué une étape des Championnats Européens de surf et qui s’impose indéniablement comme étant une des vagues les plus célèbres d’Irlande. C’est une certitude, si vous ne devez visiter qu’un spot, privilégiez celui-là, accessible toute l’année avec des vagues de bonne qualité.\r\n\r\n L’Irlande n’est pas un très grand pays. Vous n’avez donc aucune raison de vous limiter à un seul spot ! D’ailleurs, pas très loin de The Peak, près de Bundoran, vous pourrez trouver un autre spot moins connu du grand public, baptisé Rossnowlagh, mais qui abrite aussi des vagues qui peuvent être très impressionnantes. D’ailleurs, chaque année, nombreux sont les surfeurs qui viennent s’y frotter puisque la ville côtière accueille annuellement la plus vieille compétition de surf du pays, les Irish Inter Counties Surfing Championships.\r\n\r\nSachez-le, de façon générale, l’ensemble de la côte du Donegal figure dans les 50 meilleures destinations de surf au monde établies par la chaîne américaine CNN, avec des spots qui rivalisent directement avec les spots d’Hawaii ou de la Californie. Vous pouvez donc simplement vous rendre sur place et trouver la plage la plus adaptée à vos envies et votre niveau.\r\n\r\nPour les plus aventuriers et qui n’ont peur de rien de surfer du gros, je vous conseillerais aussi d’aller faire un tour dans le comté de Sligo, à Mullaghmore. La célèbre vague que les chargeurs de la planète viennent régulièrement défier en Hiver. Montée d’adrénaline garantie \r\nCe qui fait la force de l’Irlande en matière de surf, c’est clairement son côté authentique et brut, sauvage même. Si vous avez la chance de rencontrer d’autres surfeurs au cours de votre périple sur l’île verte, vous pouvez avoir l’assurance que ces rencontres seront riches en témoignages forts et en valeurs partagées.\r\n\r\nEt puisque l’on vous disait plus tôt que l’Irlande est aussi connue pour ses pubs et ses bières, je ne saurais que vous recommander de poser votre boardbag à un moment de votre séjour pour mettre le cap sur la civilisation et notamment la capitale de l’Irlande, Dublin, qui regorge de tavernes incontournables. Il n’y a certes pas de vagues à Dublin, mais la ville est imprégnée d’une atmosphère que l’on ne retrouve qu’en Irlande et qui fait indéniablement partie intégrante des raisons pour lesquelles vous devez mettre le cap sur cette belle île.', 'Surf Trip en Irlande : l’île de la Guinness et des côtes sauvages', 'https://www.beachbrother.com/img/pictures/2016/20161206/thumbnail/1612069165.jpg'),
(10, 1, 1, '2018-10-27 17:31:05', 'Le Bayonnais nous dévoile son amour pour la région en compilant plus de 10,000 clichés capturés entre mai et septembre dans un timelapse à couper le souffle !\r\n« Entre Pays Basque, vallée d’Aspe ou encore dans la vallée de Cauterets, nous sommes gâtés par les Pyrénées ! » pourra t-on lire en titre de sa vidéo Facebook.\r\n\r\nLe photographe n’en était pas à son premier coup d’essai et avait déjà réalisé une compilation des Landes au Pays Basque l’été dernier . Un nouveau projet est en cours pour cet hiver nous dit Sud Ouest en attendant régalez-vous !\r\n<a href=\"http://surf-me.com/amour-dernier-timelapse-bayonnais-xabi-barreneche/\">La vidéo ici</a>\r\n\r\n', '« Amour »: le dernier timelapse du bayonnais Xabi Barreneche', 'https://i0.wp.com/surf-me.com/wp-content/uploads/2017/10/photo-xabi-barreneche.png?w=672'),
(11, 1, 1, '2019-01-28 14:12:13', 'Qui dit nouvelle année, dit bonnes résolutions. Le mois de janvier est la période idéale pour se fixer des objectifs et apporter du changement positif à sa vie. Mais statistiquement parlant, la réussite des résolutions du Nouvel An est proche de 0. Une étude de l\'université de Scranton a démontré que 92% de ceux qui en prennent ne les tiennent pas. Oups.\r\n\r\nChez Vague et Vent, nous vous avons concocté aussi une liste non-exhaustive de bonnes résolutions, à commencer par arrêter de faire des résolutions qu\'on ne pourrait pas tenir.\r\n\r\n \r\n\r\nSe fixer des objectifs réalisables\r\nParce que les objectifs du mois de janvier c\'est bien « joli joli », mais si on ne s\'y tient pas, ça ne sert à rien de les prendre. Il suffit parfois d\'être honnête avec soi-même. Non, nous ne serons pas sur le podium du World Surfing Games 2017. Toi oui ? Nous non. Le meilleur moyen de faire de vrais progrès est de se concentrer sur des objectifs plus modérés et réalistes. Tu auras d\'autant plus de chances de t\'y tenir, et tu auras davantage confiance en ta capacité à changer et progresser.\r\n\r\n \r\n\r\nArrêter de procrastiner\r\nNous avons toujours 1000 excuses de ne pas faire ce que nous nous sommes pourtant promis de faire. Et même ce que nous avons envie de faire. Il faut l\'avouer, nous sommes tous parfois atteint de « flémingite aiguë », même quand il s\'agit de se jeter à l\'eau. La procrastination est une puissante habitude dont il est difficile de se détacher.\r\n\r\nAlors si quand tu jettes un petit coup d\'œil à ta montre, les conditions météorologiques sont favorables, bouge-toi ! Demain, le temps ne le sera peut-être pas et après demain encore moins. Mets ta flemme de côté et sors ton matos. Fais-le maintenant.\r\nEtre plus courageux face au froid\r\nIl faut quand même avouer qu\'en plein hiver, le froid a tendance à nous décourager très vite. C\'est vrai, on se les caille ! Mais dans le fond, que préfères-tu, ne pas surfer ou souffrir du froid ? Nous, le choix est vite fait ! Equipe-toi ! Investis une bonne fois pour toute dans des gants, chaussons et une cagoule.\r\n\r\nFaire une playlist\r\nQue ce soit pour aller rider, ou naviguer, nous avons tous besoin d\'un peu de musique pour nous mettre la pêche. On ne parle pas de la vieille playlist que tu écoutes depuis l\'été dernier, voire l\'hiver dernier. Nous sommes au mois de janvier, sache qu\'il est grand temps de la changer. Enfile ton casque Skullcandy et prends le temps de faire une playlist pour te motiver lors de ta prochaine sortie.\r\nAcheter sa propre wax\r\nTu vois de quoi on parle ? Oui, cette petite chose qui ne coûte pas grand-chose et qui pourtant est bien utile. C\'est dingue, que l\'on soit surfeur débutant ou expérimenté, personne n\'a jamais de wax avec soi. Du coup, soit on taxe une énième fois le mec d\'à côté sur le parking, soit on glisse sur sa planche. En 2017, achète ta propre wax et tout le monde sera content, même le mec d\'à côté. Evite cependant de l\'oublier à chaque fois.\r\n\r\nEssayer une cure de Surf Thérapie\r\nDe quoi s\'agit-il ? La Surf Thérapie est une thalassothérapie naturelle basée sur la pratique régulière du surf, la marche dans le sable et la natation en bord de mer.\r\n\r\nTu ne pratiques pas le surf ? Good news, grâce au standup paddle, il n\'est plus indispensable d\'être un as de la glisse pour faire du surf. Il est possible de surfer sans vagues grâce au surf debout à la rame. Tout le monde peut s\'essayer à la Surf Thérapie, toi y compris.\r\n\r\nCette méthode aide à rester en forme, à stabiliser son poids, à atténuer le stress et même à booster sa libido ! Ok, il est temps pour nous aussi de nous mettre à la Surf Thérapie.\r\nFaire du bien à la planète\r\nToi aussi, ça t\'horripile de voir des déchets sur la plage ou sur les pistes ? Nous te proposons de lutter avec nous contre la pollution de notre environnement. Il y a des petits gestes tout bêtes à adopter comme ramasser le sac plastique, la canette de bière ou le mégot (et pourquoi pas les trois) qui traine sur la plage et le mettre à la poubelle. Un petit geste régulier pour un bien durable ça ne peut pas nous faire de mal.\r\n\r\nSi tu veux aller plus loin, tu peux aussi participer à une des collectes Initiatives Océanes organisées par la Surfrider Foundation Europe.\r\n\r\nEssayer de nouvelles choses\r\nOn ne va pas se mentir, quand on est adepte à un sport de glisse on est un peu réfractaire à tester un autre. Mais essayer une nouvelle activité ne peut être que bénéfique. Cela  pourrait te servir à rendre ton entraînement plus intéressant en cas de lassitude. Il existe tout un monde de sports de glisse, élargi ton horizon !\r\nNous te souhaitons à nouveau une bonne année, beaucoup de bonheur et surtout de belles vagues ! N\'hésite pas à nous laisser un commentaire et nous donner tes bonnes résolutions.', 'Les bonnes résolutions de Vague et Vent', 'https://www.vagueetvent.com/blog/wp-content/uploads/2017/01/Procrastination-%C2%A9RossSokolovski.jpg'),
(12, 4, 4, '2019-02-06 08:20:09', 'Les fortes chutes de neige des dernières semaines nous ont rapprochés de plusieurs records, surtout dans l\'Est. Attention : Vous pouvez descendre seul dans la poudreuse blanche, alors n\'oubliez pas d\'emmener le plus de copains possible sur la piste la prochaine fois que vous irez à la montagne ! Ouvert sous www.snowbuddies.ch/fr/trouve-des-rides Rides pour vos entreprises et vous verrez, la communauté remercie sous forme de participations des compagnons de route de bonne humeur.\r\n\r\nLe Freeride et le Touring ensemble, c\'est beaucoup de plaisir et vous pouvez profiter à l\'infini l\'un de l\'autre. Sentez la vibration de la communauté !', 'La saison est commencée - et nous conduisons : Ensemble', 'https://www.ecoledeski.fr/media/blog/cover/MARION14.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `blog_users`
--

DROP TABLE IF EXISTS `blog_users`;
CREATE TABLE IF NOT EXISTS `blog_users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',
  `user_login` varchar(20) NOT NULL COMMENT 'Login',
  `user_pass` varchar(32) NOT NULL COMMENT 'Password',
  `user_email` varchar(100) NOT NULL COMMENT 'Email',
  `display_name` varchar(100) NOT NULL COMMENT 'Nom affiché',
  `user_photo` varchar(45) NOT NULL DEFAULT 'user.jpg',
  `user_admin` tinyint(1) NOT NULL DEFAULT '0',
  `user_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `loginpassword` (`user_login`,`user_pass`),
  UNIQUE KEY `email` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `blog_users`
--

INSERT INTO `blog_users` (`ID`, `user_login`, `user_pass`, `user_email`, `display_name`, `user_photo`, `user_admin`, `user_token`) VALUES
(1, 'phg', '4eaa2c63e55d0a3a233d8cb6b7871cd0', 'phgiraud@cogitium.com', 'Philippe Giraud', 'user.jpg', 0, NULL),
(3, 'lambda', '4eaa2c63e55d0a3a233d8cb6b7871cd0', 'test@mail.com5', 'Lambda', 'user.jpg', 0, NULL),
(4, 'admin', '4eaa2c63e55d0a3a233d8cb6b7871cd0', 'info@cogitium.com', 'SuperAdmin', 'user2.jpg', 1, NULL),
(5, 'test2', '4eaa2c63e55d0a3a233d8cb6b7871cd0', 'test2@mail.com', 'Test Test 2', 'user.jpg', 0, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `fk_blog_comments_blog_posts` FOREIGN KEY (`comment_post_ID`) REFERENCES `blog_posts` (`post_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_blog_comments_blog_users1` FOREIGN KEY (`comment_author`) REFERENCES `blog_users` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `fk_blog_posts_blog_categories1` FOREIGN KEY (`post_category`) REFERENCES `blog_categories` (`cat_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_blog_posts_blog_users1` FOREIGN KEY (`post_author`) REFERENCES `blog_users` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
