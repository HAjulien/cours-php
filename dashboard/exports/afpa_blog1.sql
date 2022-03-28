-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- HÃ´te : 127.0.0.1:3306
-- GÃ©nÃ©rÃ© le : lun. 21 mars 2022 Ã  13:05
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
-- Base de donnÃ©es : `afpa_blog1`
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
-- DÃ©chargement des donnÃ©es de la table `blog_categories`
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
  `comment_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ClÃ© primaire',
  `comment_post_ID` int(11) NOT NULL COMMENT 'ClÃ© vers le post',
  `comment_author` int(11) NOT NULL COMMENT 'ClÃ© vers l''auteur',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du commentaire',
  `comment_content` text NOT NULL COMMENT 'Texte du commentaire',
  PRIMARY KEY (`comment_ID`),
  KEY `fk_blog_comments_blog_posts1` (`comment_post_ID`),
  KEY `fk_blog_comments_blog_users1` (`comment_author`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- DÃ©chargement des donnÃ©es de la table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_date`, `comment_content`) VALUES
(1, 4, 1, '2018-10-19 08:02:54', 'Concept intÃ©ressant !'),
(2, 3, 1, '2018-10-19 08:40:18', 'Le skate c\'est chouette !'),
(5, 3, 1, '2019-01-16 08:23:51', 'Un commentaire de plus'),
(6, 1, 1, '2019-01-16 12:32:32', 'Bienvenue Ã  l\'Ã©tÃ© !'),
(22, 12, 1, '2019-02-09 15:51:49', 'TrÃ¨s bon article !!!'),
(23, 12, 1, '2019-02-28 09:23:39', 'Vive la neige !'),
(44, 7, 1, '2019-03-26 21:20:53', 'TrÃ¨s bel article !');

-- --------------------------------------------------------

--
-- Structure de la table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
CREATE TABLE IF NOT EXISTS `blog_posts` (
  `post_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ClÃ© primaire',
  `post_author` int(11) NOT NULL COMMENT 'ClÃ© vers l''auteur',
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
-- DÃ©chargement des donnÃ©es de la table `blog_posts`
--

INSERT INTO `blog_posts` (`post_ID`, `post_author`, `post_category`, `post_date`, `post_content`, `post_title`, `post_img_url`) VALUES
(1, 1, 2, '2017-11-13 15:33:09', 'Ã‡a y est lâ€™Ã©tÃ© arriveâ€¦ enfin si on ne regarde pas par la <b>fenÃªtre</b>â€¦ ! Ici, chez Allons rider on rÃªve dâ€™une journÃ©e plage avec des vagues sympas et pleins de nanas qui ont le sourire. Toi aussi ? Et bien Ã§a tombe bien parce que câ€™est justement ce qui nous attend le samedi 23 juin !', 'VIENS RIDER ENTRE NANAS ! ', 'https://i1.wp.com/www.allonsrider.fr/wp-content/uploads/2018/06/elizeu-dias-520684-unsplash.jpg?resize=759%2C500'),
(3, 1, 3, '2018-06-25 15:07:46', 'Quelques trucks qui grincent sur le coping en fer, des roulements qui nâ€™ont jamais fait autant de tours sur eux-mÃªme, une multitude de possibilitÃ©s de rider, mais aussi de sâ€™Ã©clater sur un bitume tout aussi bouillant que le public, et surtout beaucoup de style. Quand on assiste au Redbull Bowl Rippers, on sâ€™en souvient. Non seulement parce que la crÃ¨me de la crÃ¨me du skate se retrouve dans un mÃªme skatepark pendant 2 jours mais aussi parce quâ€™on ne fait pas de crÃ¨me sans casser des oeufs. Et câ€™est assez impressionnant.\r\nPar chance, Motorola nous a conviÃ© Ã  nous y rendre pour y capturer un maximum dâ€™images. Retour sur lâ€™Ã©vÃ©nement skate qui a marquÃ© nos esprits.\r\nA premiÃ¨re vue, on se croirait aux states. Le bowl a Ã©tÃ© complÃ¨tement repeint, les juges sont hissÃ©s sur leur chaises blanches, les speakers dÃ©chainÃ©s, un gros 4Ã—4 Redbull monte la garde et les spectateurs sont trÃ¨s stylisÃ©s. On ne ressent pas de pression, mais plutÃ´t beaucoup dâ€™excitation de la part des skaters qui courent partout autour du bowl en attendant leur tour. Alors que nous, en zone presse, on boit (du Redbull organic) et on sâ€™imagine, lÃ  bas, Ã  leur place lâ€™instant de quelques secondes avant que le speaker ne nous rappelle Ã  la rÃ©alitÃ©.\r\nImaginer quelques instants lâ€™adrÃ©naline quâ€™ils peuvent ressentir une fois lancÃ©s dans ces courbes, acclamÃ©s par le public Marseillais, cerveaux probablement dÃ©connectÃ©s.\r\nLe local Vincent Matheron, lui, nâ€™a pas eu de mal Ã  dÃ©connecter son cerveau en finale de la compÃ©tition pour balancer des tricks Ã  la hauteur du level de ses trois concurrents brÃ©siliens (Murilo Peres, le skater aux 9 mÃ©dailles X-Games et les tout-juste-majeur Luiz Francisco et Pedro Barros) et de deux amÃ©ricains (Chris Russell et Kevin Kowalski). Un pari perdu plus tard, il finira, avec le sourire*, sur la 5Ã¨me marche du podium devancÃ© par le gagnant Pedro Barros. *sanglant du Joker dessinÃ© sur le visage\r\n\r\nMais si Ã  Marseille on a lâ€™habitude de soutenir les skaters lors de cet event qui fÃªte sa troisiÃ¨me edition, Ã§a en est tout autre pour les skateuses.\r\nÂ« Jamais deux sans trois Â» nâ€™est pas au goÃ»t de Redbull et Ã§a ne nous Ã©tonne que trÃ¨s peu au vu de lâ€™image fun et dÃ©sinvolte de la marque qui joue bien souvent sur le terrain de lâ€™inattendu. Deux Ã©ditions sans skateuses ont suffit Ã  Redbull pour les faire intervenir lors de leur troisiÃ¨me volets. Et les filles ne sont pas lÃ  pour jouer les pompom girlsâ€¦\r\nAu programme, 12 nanas talentueuses venues sâ€™affronter les unes contre les autres mais toujours avec une certaine solidaritÃ©. Sur la rampe de lancement, pas question de passer son tour, elles y vont franco et savent exactement ce quâ€™elles font.\r\nChez les franÃ§aises on ressent une certaine pression. Probablement celle de voir dÃ©barquer 10 skateuses du monde entier venir dÃ©chirer leur home spot. Pour la locale Maya Jacquemin câ€™est Â« formateur de skater entourÃ©e de pro Â». Et pro, câ€™est le mot.\r\nParmi les skateuses, une icÃ´ne de la discipline: Lizzie Armanto. Cette skateuse originaire des Etats Unis sâ€™Ã©tait faite remarquer trois jours plus tÃ´t pour avoir Ã©tÃ© la premiÃ¨re femme Ã  skater le looping 360Â° de Tony Hawk. Rien que Ã§a.\r\nMais ce nâ€™est pas tout puisque Brighton Zeuner Ã©tait aussi de la partie. A seulement 14 ans, elle est la plus jeune mÃ©daillÃ©e de lâ€™histoire des X-Games. Nous lâ€™avons rencontrÃ©.\r\n\r\nSalut Brighton, comment tu te sens aujourdâ€™hui ?\r\n\r\nJe dois dire que je suis plutÃ´t nerveuse parce que ce nâ€™est pas une petite compÃ©tition mais je suis toujours comme Ã§a lors des contest. Jâ€™ai surtout super hÃ¢te de skater ! Et puis, jâ€™ai de la chance cette fois je ne suis pas jet lag puisque jâ€™Ã©tais en SuÃ¨de juste avant.\r\nQue fais tu pour te dÃ©tendre quand tu es nerveuse ? As tu des rituels ? \r\n\r\nEt bien quand je suis nerveuse, jâ€™essaie de penser Ã  autre chose, je ne sais pas tropâ€¦ Jâ€™essaie de me dÃ©tendre en skatant mais Ã§a craint parce quâ€™au final je suis stressÃ©e pour la competition mais il nâ€™y a quâ€™en skatant que je peux Ãªtre detendue. Alors bah jâ€™attend mon tour nerveusementâ€¦ Mais quand je suis dans le bowl Ã§a va beaucoup mieux !\r\n\r\nTu nâ€™Ã©tais jamais venue Ã  Marseille, que penses-tu du bowl ? \r\n\r\nOui câ€™est la premiÃ¨re fois que je viens ici et je trouve le bowl diffÃ©rent de ce que jâ€™ai lâ€™habitude de skater. Mais je pense que câ€™est une bonne chose ! Câ€™est important pour les skaters de pouvoir sâ€™adapter Ã  de nouveaux skateparks comme celui lÃ  et câ€™est plutÃ´t amusant de tester de nouvelles choses donc ouiâ€¦ câ€™est trÃ¨s diffÃ©rent mais câ€™est fun !\r\nPour la premiÃ¨re fois, le Redbull Bowl Rippers ouvre la compÃ©tition aux nanas. Quâ€™est ce que tu penses de Ã§a ? \r\n\r\nJe trouve Ã§a super cool quâ€™ils commencent Ã  mettre le skate fÃ©minin au mÃªme niveau que les mecs parce que les filles se donnent autant que les gars. Puis jâ€™ai beaucoup de potes skaters qui trouvent Ã§a bien, ils aiment bien quand une nana vient skater avec eux. Ã‡a apporte de la visibilitÃ© au monde du skate fÃ©minin, câ€™est gÃ©nial pour la future gÃ©nÃ©ration !\r\n\r\nCette aprÃ¨s midi câ€™est juste un entrainement pour les filles, demain seulement les choses sÃ©rieuses dÃ©marrent. Quels sont tes objectifs ? \r\n\r\nJe vais juste skater et tenter de mâ€™amuser. Je nâ€™ai pas envie de me mettre la pression sur les Ã©paules, je vais juste skater et voir ce que Ã§a donne. Et puis, la France câ€™est super beau, câ€™est cool de pouvoir skater ici et dâ€™aller Ã  la plage en suivant. Tu vois, juste du fun.\r\nFun, câ€™est le mot qui rÃ©sume plutÃ´t bien ce contest organisÃ© par Redbull. Tous les athlÃ¨tes sont Ã  fond et on ne sâ€™ennuie pas une seule seconde. On redoute mÃªme le moment oÃ¹ lâ€™envie dâ€™Ã©vacuer les litres de Redbull engorgÃ© va se faire sentir. Tout ce quâ€™on a Ã  faire est dâ€™ouvrir grand les yeux, moto g6 Ã  la main.\r\nFinalement, câ€™est la BrÃ©silienne Yndiara Asp qui prend la premiÃ¨re marche du podium chez les filles. Elle devance ainsi Brighton Zeuner et lâ€™Australienne Poppy Starr Olsen sur ce lÃ©gendaire Bowl du Prado. Tandis que les FranÃ§aises Maya Jacquemain et Alice Attali terminent respectivement cinquiÃ¨me et sixiÃ¨me. \r\nEn tout cas nous on resterait bien un jour de plus que lâ€™effervescence redescende pour pouvoir tester le bowl. A votre avis, on a rÃ©sistÃ© ?\r\n\r\nMerci Motorola pour cette super expÃ©rience. Retrouvez toutes les infos du Moto G6 par ici. \r\n\r\nPhotos: Lucas Cerri et/ou prise avec le moto G6.', 'RENCONTRE AVEC LA CRÃˆME DU SKATE FÃ‰MININ AU REDBULL BOWL RIPPERS', 'https://i1.wp.com/www.allonsrider.fr/wp-content/uploads/2018/09/322A0438.jpg?resize=759%2C500'),
(4, 1, 5, '2018-09-27 15:20:36', 'Souviens toi, il y a quelques semaines, je te parlais de ce surfshop Lastage, le plus green au monde, situÃ© Ã  Biarritz. Cette nouvelle marque franÃ§aise, qui sâ€™adresse aux 15-30 ans, propose des produits Ã©co-responsables.Cela va mÃªme plus loin puisque toute la marque a Ã©tÃ© pensÃ© autour de ces valeurs. Les shops sont faits Ã  partir dâ€™objets recyclÃ©s, 10% de remise sont offerts aux clients qui ramÃ¨nent en magasin de vieilles fringues, la production est faite en Turquie pour sa culture de coton biologique, respectant des normes internationales strictes quant aux conditions de travail et les produits sont fabriquÃ©s Ã  partir de matiÃ¨res recyclÃ©es. Pas de production franÃ§aise donc, mais des compromis qui permettent dâ€™avoir des produits Ã  la foisde haute qualitÃ©, respectueux de lâ€™environnement et Ã  des prix raisonnables.Le shop de GuidelDu coup jâ€™ai profitÃ© dâ€™un WE surf dans le Morbihan pour passer au seul shop breton de la marque, Ã  Guidel (prÃ¨s de Lorient). Tenu par Yann, baroudeur qui a passÃ© 8 mois au Maroc, ce shop sent bon le surf, le vrai. Car Yann est aussi moniteur, il gÃ¨re en parallÃ¨le lâ€™Ã©cole Yousurf. Du coup la boutique est partagÃ©e entre produits Lastage et espaces pour le matos de lâ€™Ã©cole. On est loin de certains shops de grandes marques australiennes tenus par des vendeurs qui ne sont jamais montÃ©s sur une planche de leur vie. Ici certains clients arrivent pieds nus, combi plein de sable et cheveux mouillÃ©s. Ã‡a respire lâ€™amour du surf.Le boardshort LastageLe produit phare, câ€™est le boardshort, fabriquÃ© Ã  90% de bouteilles en plastique recyclÃ©es. Jâ€™ai jetÃ© mon dÃ©volu sur le modÃ¨le Pro Duc III Pop Corn. Coupe trÃ¨s courte (17) et couleurs pastel, de jaune et de bleu, ce qui lui donne un look assez rÃ©tro, trÃ¨s 70s-80s. Et aprÃ¨s 2h de surf sur la cÃ´te sauvage de Quiberon, je dois dire que je suis plutÃ´t impressionnÃ© par le produit. Jâ€™avais peur que le short soit rigide, car fait de bouteilles en plastique recyclÃ©es. Mais en fait pas du tout, il est aussi Â« Ã©lastique Â» que mon Mirage de Rip Curl, grÃ¢ce au 10% restant, le stretch. Et câ€™est plutÃ´t cool de se dire que tu surfes avec un boardshort qui est fait Ã  partir de bouteilles que certaines personnes laissent traÃ®ner sur la plage. Câ€™est un peu une revanche de cette bouteille Vittel laissÃ©e entre deux rochers.Autre originalitÃ© du short, son systÃ¨me de serrage velcro. Unique au monde et brevetÃ© Lastage dâ€™aprÃ¨s leur site internet. Ici pas de lacets pour ensuite avoir un nÅ“ud qui pend, mais que du velcro, qui permet de lâ€™ajuster Ã  sa taille. A la fois malin et esthÃ©tique. Mais ce qui engendre pour moi le seul petit hic du produit : il nâ€™y a pas de lacets Ã  insÃ©rer dans le loop de mon top (pour Ã©viter quâ€™il remonte). Mais Ã  priori les tops de la marque Lastage ont eux un petit bouton qui sâ€™accroche aux shorts. Tout a donc Ã©tÃ© pensÃ© pour Ã  la fois le surfeur pratiquant et pour le chilleur soucieux de son look sur la plage.Niveau prix, on est dans les standards de ce que les grandes marques comme Quiksilver, Rip Curl ou Billabong pratiquent. Aux alentours de 49 â‚¬ piÃ¨ce pour lâ€™entrÃ©e de gamme et jusquâ€™Ã  75 â‚¬ pour la gamme pro model. A la diffÃ©rence que câ€™est une marque franÃ§aise, et que les matiÃ¨res utilisÃ©es viennent de plastique recyclÃ©. Ce qui nâ€™est pas nÃ©gligeable.Pour conclure je dirais que câ€™est vraiment sympa de surfer avec un produit au look vintage et trÃ¨s moderne dans son procÃ©dÃ© de fabrication Ã©co-responsable.  Si tu as la chance de surfer juste en boardshort dans une eau chaude, câ€™est parfait. Dâ€™ailleurs ce short, il serait parfait lâ€™Ã©tÃ©, en longboard, pour retrouver des sensations de glisse bien old school. Un retour aux sources.', 'Test du boardshort Lastage, fabriquÃ© avec des bouteilles recyclÃ©es', 'https://insideurosima.files.wordpress.com/2016/02/eurosima-lastage-4.jpg?w=840&h=560'),
(5, 1, 5, '2018-10-21 13:38:44', 'Historique\r\nL\'an dernier le Big Festival disparaissait aprÃ¨s 8 Ã©ditions consÃ©cutives. Au dÃ©but, câ€™est lâ€™argument technique qui avait Ã©tÃ© Ã©voquÃ© puisque le site du stade Aguilera Ã©tait en rÃ©novation. Mais câ€™est finalement le budget qui a posÃ© problÃ¨me car les organisateurs rÃ©clamaient 300.000 euros de participation Ã  la Mairie de Biarritz soit le double par rapport aux annÃ©es prÃ©cÃ©dentes pourra t-on lire dans le mediabask.\r\n\r\nRÃ©sultat, 2017 sâ€™est passÃ© au OKLM avec des rendez-vous hebdomadaires en plein air Ã  la CitÃ© de lâ€™ocÃ©an avec des artistes un peu moins connus mais pour autant tout aussi agrÃ©able. \r\n\r\nLe nouveau festival\r\n2018, câ€™est le retour dâ€™un projet ambitieux avec Â« Biarritz en Ã©tÃ© Â» qui sera donc le nouveau festival branchÃ© du coin. OrganisÃ© par la Ville de Biarritz et le Centre des Musiques Actuelles lâ€™Atabal (et non des parigos), le festival se veut Â« authentique Â» et Â« fÃ©dÃ©rateur pour notre territoire Â» dÃ©clara Sylvie Claracq prÃ©sidente de lâ€™Atabal pour mediabask.\r\n\r\nLe festival se dÃ©roulera donc dans les jardins de la CitÃ© de lâ€™ocÃ©an du 20 au 22 juillet prochain. \r\n\r\nProgramme\r\nAujourdâ€™hui voici les tÃªtes dâ€™affiches qui ont Ã©tÃ© divulguÃ©es : Phoenix, Etienne Daho, Cigarrettes After sex, Juliette Armanet, Lomepal, The Black Madonna, Lâ€™impÃ©ratrice, AngÃ¨le, Agar Agar, Caballero & JeanJass, Yellow Days, Malick Djoudi et Kepa\r\n\r\nPendant la journÃ©e, un village sera installÃ© Ã  la Milady pour cÃ©lÃ©brer la culture locale, gastronomique, surf et musicale avec la participation de collectifs musicaux gratuit. \r\n\r\nPour le reste, la billetterie est dâ€™ores et dÃ©jÃ  ouverte avec des prix variants entre 83 et 113 euros selon le moment de votre rÃ©servation (plus vous rÃ©servez tÃ´t, mieux câ€™est !\r\n\r\nUne bonne nouvelle qui nous rÃ©chauffe le coeur malgrÃ© ce temps pourriâ€¦ vivement lâ€™Ã©tÃ© ! ', 'Â« Biarritz en Ã©tÃ© Â» le nouveau festival qui remplacera le BIG le 20/22 juillet prochain', 'https://i1.wp.com/surf-me.com/wp-content/uploads/2018/02/lomepal-festival-biarritz-en-ete-2018.jpg?w=820'),
(6, 1, 2, '2018-10-21 14:16:53', 'En ce 2 janvier 2018, jour oÃ¹ les houles ne cessent de sâ€™enchainer Ã  NazarÃ© (Portugal), il est de bon ton de revenir sur lâ€™une des adeptes et surtout des pionniÃ¨res de surf de gros : la surfeuse brÃ©silienne Maya Gabeira\r\n\r\nIssue dâ€™un pÃ¨re politicien (Fernando Gabeira) fondateur du Parti vert brÃ©silien et trÃ¨s engagÃ© dans la lutte armÃ©e contre la dictature militaire Ã  la fin des annÃ©es 60 (il participera mÃªme Ã  lâ€™enlÃ¨vement de lâ€™ambassadeur amÃ©ricain au BrÃ©sil Charles Elbrick le 7 septembre 1969), câ€™est loin de la politique que la surfeuse de 30 ans va Ã©voluer mais câ€™est surement lÃ  lâ€™origine de son tempÃ©rament engagÃ©.\r\n\r\nCar son Â« combat Â» Ã  elle, câ€™est celui dâ€™affronter les vagues gÃ©antes partout dans le monde et autant vous dire quâ€™en la matiÃ¨re, elle nâ€™y va pas avec le dos de la cuillÃ¨re.\r\n\r\nA son actif : 5 Billabong XXL awards consÃ©cutifs de 2007 Ã  2012 dont la plus grosse vague jamais surfÃ©e par une femme en 2009 oÃ¹ elle signe un 14 mÃ¨tres Ã  Dungeons en Afrique du Sudâ€¦\r\n\r\nMais Maya Gabeira câ€™est aussi : un traumatisme crÃ¢nien en aout 2011 sur une session de tow-in (surf tractÃ©) sur un gros Teahupoo Ã  Tahiti oÃ¹ elle se prendra 5 vagues sur la tÃªte pour finir Ã  demi-consciente et un wipeout sur une vague XXL Ã  NazarÃ© (Portugal) en 2013 oÃ¹ elle frÃ´le la mort et sera rÃ©animÃ©e de justesse par son coÃ©quipier brÃ©silien Carlos Burleâ€¦ sâ€™en suit 2 ans de rÃ©Ã©ducation avec des opÃ©rations au dos, au nez etc..\r\n\r\nDepuis 2015, elle revient tranquillement sur les spots et se remet Ã  charger Ã  NazarÃ© et Ã  HawaÃ¯ notamment.\r\n\r\nUne athlÃ¨te au parcours exceptionnel qui nous prouve que mÃªme si le surf de gros se dÃ©mocratise cela reste un challenge dangereux oÃ¹ il est facile dâ€™y laisser la vieâ€¦\r\n\r\nEn espÃ©rant que 2018 soit une belle annÃ©e Ã  vague pour cette vÃ©tÃ©ran qui en a inspirÃ© plus dâ€™un(e)â€¦ pour lâ€™instant Ã§a Ã  lâ€™air dâ€™Ãªtre plutÃ´t bien partie !', 'Maya Gabeira portrait dâ€™une surfeuse pionniÃ¨re de retour dans les vagues XXL', 'https://i0.wp.com/surf-me.com/wp-content/uploads/2018/01/maya-gabeira.jpg?resize=960%2C550'),
(7, 1, 2, '2018-10-21 22:16:37', 'Pour la premiÃ¨re fois je laisse la parole Ã  une autre personne, Xavier, qui nous raconte son dernier surf trip en Irlande. Il saura Ã  coup sÃ»r vous donner envie de partir visiter cette belle Ã®le pour y surfer, mais pas que !\r\n\r\nRÃ©cit de mon surf trip en Irlande\r\nPendant que certains voyagent aux quatre coins du monde pour trouver les meilleurs spots de surf possibles (comme ce voyage au Chili par exemple), il suffit parfois dâ€™Ã©cumer les plages dâ€™Europe pour trouver de nombreux paradis sur terreâ€¦ Ou plutÃ´t sur mer. Ma derniÃ¨re aventure mâ€™a rÃ©cemment menÃ© en Irlande, pays connu pour ses biÃ¨res (Guinness, Kilkenny), ses Leprechauns et ses trÃ¨fles Ã  quatre feuille mais aussi pour le surf qui sâ€™impose de plus en plus comme une destination de choix pour les passionnÃ©s de rouleaux, au point dâ€™Ãªtre devenue en quelques annÃ©es seulement une destination surf majeure dans la zone Europe.\r\n\r\nBon, je vous lâ€™accorde, il sâ€™agit surtout dâ€™une destination de choix pour les surfeurs qui nâ€™ont pas peur de se frotter aux eaux froides, trÃ¨s froides. En effet, au meilleur moment de lâ€™annÃ©e, soit entre juillet et septembre, la tempÃ©rature de lâ€™eau sur lâ€™Ã®le Ã©meraude ne dÃ©passe pas les 15Â° en moyenne. Entre novembre et janvier, elle peut mÃªme tomber sous la barre des 11Â°. Autant dire que les surfeurs frileux ont tout intÃ©rÃªt Ã  sâ€™abstenir et Ã  choisir une autre destination !\r\nHeureusement, en marge de ce lÃ©ger inconvÃ©nient, les cÃ´tes irlandaises disposent aussi de nombreux atouts qui font dâ€™elles un Â« paradis froid Â», comme lâ€™avait expliquÃ© Kelly Slater aprÃ¨s avoir visitÃ© les 5 spots incontournables Ã  tester dans le pays, allant dâ€™Inchydoney, parfaitement adaptÃ© aux dÃ©butants, Ã  Easky, qui abrite la FÃ©dÃ©ration de surf irlandaise, en passant par The Peak, qui a longtemps constituÃ© une Ã©tape des Championnats EuropÃ©ens de surf et qui sâ€™impose indÃ©niablement comme Ã©tant une des vagues les plus cÃ©lÃ¨bres dâ€™Irlande. Câ€™est une certitude, si vous ne devez visiter quâ€™un spot, privilÃ©giez celui-lÃ , accessible toute lâ€™annÃ©e avec des vagues de bonne qualitÃ©.\r\n\r\n Lâ€™Irlande nâ€™est pas un trÃ¨s grand pays. Vous nâ€™avez donc aucune raison de vous limiter Ã  un seul spot ! Dâ€™ailleurs, pas trÃ¨s loin de The Peak, prÃ¨s de Bundoran, vous pourrez trouver un autre spot moins connu du grand public, baptisÃ© Rossnowlagh, mais qui abrite aussi des vagues qui peuvent Ãªtre trÃ¨s impressionnantes. Dâ€™ailleurs, chaque annÃ©e, nombreux sont les surfeurs qui viennent sâ€™y frotter puisque la ville cÃ´tiÃ¨re accueille annuellement la plus vieille compÃ©tition de surf du pays, les Irish Inter Counties Surfing Championships.\r\n\r\nSachez-le, de faÃ§on gÃ©nÃ©rale, lâ€™ensemble de la cÃ´te du Donegal figure dans les 50 meilleures destinations de surf au monde Ã©tablies par la chaÃ®ne amÃ©ricaine CNN, avec des spots qui rivalisent directement avec les spots dâ€™Hawaii ou de la Californie. Vous pouvez donc simplement vous rendre sur place et trouver la plage la plus adaptÃ©e Ã  vos envies et votre niveau.\r\n\r\nPour les plus aventuriers et qui nâ€™ont peur de rien de surfer du gros, je vous conseillerais aussi dâ€™aller faire un tour dans le comtÃ© de Sligo, Ã  Mullaghmore. La cÃ©lÃ¨bre vague que les chargeurs de la planÃ¨te viennent rÃ©guliÃ¨rement dÃ©fier en Hiver. MontÃ©e dâ€™adrÃ©naline garantie \r\nCe qui fait la force de lâ€™Irlande en matiÃ¨re de surf, câ€™est clairement son cÃ´tÃ© authentique et brut, sauvage mÃªme. Si vous avez la chance de rencontrer dâ€™autres surfeurs au cours de votre pÃ©riple sur lâ€™Ã®le verte, vous pouvez avoir lâ€™assurance que ces rencontres seront riches en tÃ©moignages forts et en valeurs partagÃ©es.\r\n\r\nEt puisque lâ€™on vous disait plus tÃ´t que lâ€™Irlande est aussi connue pour ses pubs et ses biÃ¨res, je ne saurais que vous recommander de poser votre boardbag Ã  un moment de votre sÃ©jour pour mettre le cap sur la civilisation et notamment la capitale de lâ€™Irlande, Dublin, qui regorge de tavernes incontournables. Il nâ€™y a certes pas de vagues Ã  Dublin, mais la ville est imprÃ©gnÃ©e dâ€™une atmosphÃ¨re que lâ€™on ne retrouve quâ€™en Irlande et qui fait indÃ©niablement partie intÃ©grante des raisons pour lesquelles vous devez mettre le cap sur cette belle Ã®le.', 'Surf Trip en Irlande : lâ€™Ã®le de la Guinness et des cÃ´tes sauvages', 'https://www.beachbrother.com/img/pictures/2016/20161206/thumbnail/1612069165.jpg'),
(10, 1, 1, '2018-10-27 17:31:05', 'Le Bayonnais nous dÃ©voile son amour pour la rÃ©gion en compilant plus de 10,000 clichÃ©s capturÃ©s entre mai et septembre dans un timelapse Ã  couper le souffle !\r\nÂ« Entre Pays Basque, vallÃ©e dâ€™Aspe ou encore dans la vallÃ©e de Cauterets, nous sommes gÃ¢tÃ©s par les PyrÃ©nÃ©es ! Â» pourra t-on lire en titre de sa vidÃ©o Facebook.\r\n\r\nLe photographe nâ€™en Ã©tait pas Ã  son premier coup dâ€™essai et avait dÃ©jÃ  rÃ©alisÃ© une compilation des Landes au Pays Basque lâ€™Ã©tÃ© dernier . Un nouveau projet est en cours pour cet hiver nous dit Sud Ouest en attendant rÃ©galez-vous !\r\n<a href=\"http://surf-me.com/amour-dernier-timelapse-bayonnais-xabi-barreneche/\">La vidÃ©o ici</a>\r\n\r\n', 'Â« Amour Â»: le dernier timelapse du bayonnais Xabi Barreneche', 'https://i0.wp.com/surf-me.com/wp-content/uploads/2017/10/photo-xabi-barreneche.png?w=672'),
(11, 1, 1, '2019-01-28 14:12:13', 'Qui dit nouvelle annÃ©e, dit bonnes rÃ©solutions. Le mois de janvier est la pÃ©riode idÃ©ale pour se fixer des objectifs et apporter du changement positif Ã  sa vie. Mais statistiquement parlant, la rÃ©ussite des rÃ©solutions du Nouvel An est proche de 0. Une Ã©tude de l\'universitÃ© de Scranton a dÃ©montrÃ© que 92% de ceux qui en prennent ne les tiennent pas. Oups.\r\n\r\nChez Vague et Vent, nous vous avons concoctÃ© aussi une liste non-exhaustive de bonnes rÃ©solutions, Ã  commencer par arrÃªter de faire des rÃ©solutions qu\'on ne pourrait pas tenir.\r\n\r\n \r\n\r\nSe fixer des objectifs rÃ©alisables\r\nParce que les objectifs du mois de janvier c\'est bien Â« joli joli Â», mais si on ne s\'y tient pas, Ã§a ne sert Ã  rien de les prendre. Il suffit parfois d\'Ãªtre honnÃªte avec soi-mÃªme. Non, nous ne serons pas sur le podium du World Surfing Games 2017. Toi oui ? Nous non. Le meilleur moyen de faire de vrais progrÃ¨s est de se concentrer sur des objectifs plus modÃ©rÃ©s et rÃ©alistes. Tu auras d\'autant plus de chances de t\'y tenir, et tu auras davantage confiance en ta capacitÃ© Ã  changer et progresser.\r\n\r\n \r\n\r\nArrÃªter de procrastiner\r\nNous avons toujours 1000 excuses de ne pas faire ce que nous nous sommes pourtant promis de faire. Et mÃªme ce que nous avons envie de faire. Il faut l\'avouer, nous sommes tous parfois atteint de Â« flÃ©mingite aiguÃ« Â», mÃªme quand il s\'agit de se jeter Ã  l\'eau. La procrastination est une puissante habitude dont il est difficile de se dÃ©tacher.\r\n\r\nAlors si quand tu jettes un petit coup d\'Å“il Ã  ta montre, les conditions mÃ©tÃ©orologiques sont favorables, bouge-toi ! Demain, le temps ne le sera peut-Ãªtre pas et aprÃ¨s demain encore moins. Mets ta flemme de cÃ´tÃ© et sors ton matos. Fais-le maintenant.\r\nEtre plus courageux face au froid\r\nIl faut quand mÃªme avouer qu\'en plein hiver, le froid a tendance Ã  nous dÃ©courager trÃ¨s vite. C\'est vrai, on se les caille ! Mais dans le fond, que prÃ©fÃ¨res-tu, ne pas surfer ou souffrir du froid ? Nous, le choix est vite fait ! Equipe-toi ! Investis une bonne fois pour toute dans des gants, chaussons et une cagoule.\r\n\r\nFaire une playlist\r\nQue ce soit pour aller rider, ou naviguer, nous avons tous besoin d\'un peu de musique pour nous mettre la pÃªche. On ne parle pas de la vieille playlist que tu Ã©coutes depuis l\'Ã©tÃ© dernier, voire l\'hiver dernier. Nous sommes au mois de janvier, sache qu\'il est grand temps de la changer. Enfile ton casque Skullcandy et prends le temps de faire une playlist pour te motiver lors de ta prochaine sortie.\r\nAcheter sa propre wax\r\nTu vois de quoi on parle ? Oui, cette petite chose qui ne coÃ»te pas grand-chose et qui pourtant est bien utile. C\'est dingue, que l\'on soit surfeur dÃ©butant ou expÃ©rimentÃ©, personne n\'a jamais de wax avec soi. Du coup, soit on taxe une Ã©niÃ¨me fois le mec d\'Ã  cÃ´tÃ© sur le parking, soit on glisse sur sa planche. En 2017, achÃ¨te ta propre wax et tout le monde sera content, mÃªme le mec d\'Ã  cÃ´tÃ©. Evite cependant de l\'oublier Ã  chaque fois.\r\n\r\nEssayer une cure de Surf ThÃ©rapie\r\nDe quoi s\'agit-il ? La Surf ThÃ©rapie est une thalassothÃ©rapie naturelle basÃ©e sur la pratique rÃ©guliÃ¨re du surf, la marche dans le sable et la natation en bord de mer.\r\n\r\nTu ne pratiques pas le surf ? Good news, grÃ¢ce au standup paddle, il n\'est plus indispensable d\'Ãªtre un as de la glisse pour faire du surf. Il est possible de surfer sans vagues grÃ¢ce au surf debout Ã  la rame. Tout le monde peut s\'essayer Ã  la Surf ThÃ©rapie, toi y compris.\r\n\r\nCette mÃ©thode aide Ã  rester en forme, Ã  stabiliser son poids, Ã  attÃ©nuer le stress et mÃªme Ã  booster sa libido ! Ok, il est temps pour nous aussi de nous mettre Ã  la Surf ThÃ©rapie.\r\nFaire du bien Ã  la planÃ¨te\r\nToi aussi, Ã§a t\'horripile de voir des dÃ©chets sur la plage ou sur les pistes ? Nous te proposons de lutter avec nous contre la pollution de notre environnement. Il y a des petits gestes tout bÃªtes Ã  adopter comme ramasser le sac plastique, la canette de biÃ¨re ou le mÃ©got (et pourquoi pas les trois) qui traine sur la plage et le mettre Ã  la poubelle. Un petit geste rÃ©gulier pour un bien durable Ã§a ne peut pas nous faire de mal.\r\n\r\nSi tu veux aller plus loin, tu peux aussi participer Ã  une des collectes Initiatives OcÃ©anes organisÃ©es par la Surfrider Foundation Europe.\r\n\r\nEssayer de nouvelles choses\r\nOn ne va pas se mentir, quand on est adepte Ã  un sport de glisse on est un peu rÃ©fractaire Ã  tester un autre. Mais essayer une nouvelle activitÃ© ne peut Ãªtre que bÃ©nÃ©fique. Cela  pourrait te servir Ã  rendre ton entraÃ®nement plus intÃ©ressant en cas de lassitude. Il existe tout un monde de sports de glisse, Ã©largi ton horizon !\r\nNous te souhaitons Ã  nouveau une bonne annÃ©e, beaucoup de bonheur et surtout de belles vagues ! N\'hÃ©site pas Ã  nous laisser un commentaire et nous donner tes bonnes rÃ©solutions.', 'Les bonnes rÃ©solutions de Vague et Vent', 'https://www.vagueetvent.com/blog/wp-content/uploads/2017/01/Procrastination-%C2%A9RossSokolovski.jpg'),
(12, 4, 4, '2019-02-06 08:20:09', 'Les fortes chutes de neige des derniÃ¨res semaines nous ont rapprochÃ©s de plusieurs records, surtout dans l\'Est. Attention : Vous pouvez descendre seul dans la poudreuse blanche, alors n\'oubliez pas d\'emmener le plus de copains possible sur la piste la prochaine fois que vous irez Ã  la montagne ! Ouvert sous www.snowbuddies.ch/fr/trouve-des-rides Rides pour vos entreprises et vous verrez, la communautÃ© remercie sous forme de participations des compagnons de route de bonne humeur.\r\n\r\nLe Freeride et le Touring ensemble, c\'est beaucoup de plaisir et vous pouvez profiter Ã  l\'infini l\'un de l\'autre. Sentez la vibration de la communautÃ© !', 'La saison est commencÃ©e - et nous conduisons : Ensemble', 'https://www.ecoledeski.fr/media/blog/cover/MARION14.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `blog_users`
--

DROP TABLE IF EXISTS `blog_users`;
CREATE TABLE IF NOT EXISTS `blog_users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ClÃ© primaire',
  `user_login` varchar(20) NOT NULL COMMENT 'Login',
  `user_pass` varchar(32) NOT NULL COMMENT 'Password',
  `user_email` varchar(100) NOT NULL COMMENT 'Email',
  `display_name` varchar(100) NOT NULL COMMENT 'Nom affichÃ©',
  `user_photo` varchar(45) NOT NULL DEFAULT 'user.jpg',
  `user_admin` tinyint(1) NOT NULL DEFAULT '0',
  `user_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `loginpassword` (`user_login`,`user_pass`),
  UNIQUE KEY `email` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- DÃ©chargement des donnÃ©es de la table `blog_users`
--

INSERT INTO `blog_users` (`ID`, `user_login`, `user_pass`, `user_email`, `display_name`, `user_photo`, `user_admin`, `user_token`) VALUES
(1, 'phg', '4eaa2c63e55d0a3a233d8cb6b7871cd0', 'phgiraud@cogitium.com', 'Philippe Giraud', 'user.jpg', 0, NULL),
(3, 'lambda', '4eaa2c63e55d0a3a233d8cb6b7871cd0', 'test@mail.com5', 'Lambda', 'user.jpg', 0, NULL),
(4, 'admin', '4eaa2c63e55d0a3a233d8cb6b7871cd0', 'info@cogitium.com', 'SuperAdmin', 'user2.jpg', 1, NULL),
(5, 'test2', '4eaa2c63e55d0a3a233d8cb6b7871cd0', 'test2@mail.com', 'Test Test 2', 'user.jpg', 0, NULL);

--
-- Contraintes pour les tables dÃ©chargÃ©es
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
