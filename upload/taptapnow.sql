-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  jeu. 12 mars 2020 à 23:22
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP :  7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `taptapnow`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin_payment`
--

CREATE Database taptapnow;
use taptapnow;

CREATE TABLE `admin_payment` (
  `id_admin_payment` int(11) NOT NULL,
  `date_admin_payment` datetime NOT NULL DEFAULT current_timestamp(),
  `restaurant_fk` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL,
  `amount` double(12,2) NOT NULL,
  `create_by_admin_fk` int(11) NOT NULL,
  `status_admin_payment` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `date_of_last_order_restaurant` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin_payment`
--

INSERT INTO `admin_payment` (`id_admin_payment`, `date_admin_payment`, `restaurant_fk`, `user_fk`, `amount`, `create_by_admin_fk`, `status_admin_payment`, `notes`, `date_of_last_order_restaurant`) VALUES
(3, '2020-03-03 14:04:16', 352, 116, 17.60, 3, 1, 'Hi , i already made the check , everything looks good', '2020-03-05 19:54:08'),
(4, '2020-03-03 14:45:08', 352, 116, 24.20, 3, 1, 'i paid', '2020-03-05 19:54:08'),
(7, '2020-03-06 20:31:05', 332, 116, 120.01, 3, 1, 'ok', '2020-03-08 00:25:38');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `admin_payment_restaurant_view`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `admin_payment_restaurant_view` (
`id_restaurant` int(11)
,`name_restaurant` varchar(255)
,`logo_restaurant` varchar(255)
,`tel_restaurant` varchar(255)
,`adresse_restaurant` varchar(255)
,`total_paye` double(19,2)
,`last_date_payment` datetime
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `all_restaurant_to_pay_view`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `all_restaurant_to_pay_view` (
`id_restaurant` int(11)
,`name_restaurant` varchar(255)
,`logo_restaurant` varchar(255)
,`adresse_restaurant` varchar(255)
,`tel_restaurant` varchar(255)
,`adminRestID` int(11)
,`diference` double(19,2)
,`last_date_payment` datetime
);

-- --------------------------------------------------------

--
-- Structure de la table `bank_info`
--

CREATE TABLE `bank_info` (
  `id_bank_info` int(10) UNSIGNED NOT NULL,
  `user_id_fk` int(11) NOT NULL,
  `restaurant_legal_name` varchar(255) DEFAULT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `bank_routing` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `phone_line` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `county_tax_rate` varchar(255) DEFAULT NULL,
  `date` date DEFAULT current_timestamp(),
  `isAcceptContract` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bank_info`
--

INSERT INTO `bank_info` (`id_bank_info`, `user_id_fk`, `restaurant_legal_name`, `tax_number`, `bank_routing`, `account_number`, `mailing_address`, `phone_line`, `state`, `county_tax_rate`, `date`, `isAcceptContract`) VALUES
(1, 116, 'Julio Delices restaurant ', '1223445', '85829398392', '1234-53545-5355-5535', '8600 NW 30TH TER', '+1 (434) 343-4434', 'FL', 'United States', '2020-03-09', '1');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `value_category` varchar(100) NOT NULL,
  `desc_category` varchar(500) DEFAULT NULL,
  `img_category` varchar(500) DEFAULT 'defaultcat.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `value_category`, `desc_category`, `img_category`) VALUES
(12, 'dessert', 'dessert', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0Y9VVtLuIaGKdWL5Z1ecExebm4HhsxZb9nz-ZQyDwkTTzhg49eg&s'),
(13, 'dinner', 'dinner', 'https://cdn.iconscout.com/icon/premium/png-256-thumb/dinner-85-540711.png'),
(14, 'Juices', 'Juices', 'https://image.flaticon.com/icons/png/512/167/167247.png'),
(15, 'Fast food', 'Fast food', 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png');

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

CREATE TABLE `country` (
  `id_country` int(11) NOT NULL,
  `shortname_country` varchar(255) NOT NULL,
  `globalname_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `country`
--

INSERT INTO `country` (`id_country`, `shortname_country`, `globalname_country`) VALUES
(1, 'CAN', 'Canada'),
(2, 'USA', 'États-Unis'),
(3, 'HT', 'HAITI');

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `id_favoris` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL,
  `restaurant_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`id_favoris`, `user_fk`, `restaurant_fk`) VALUES
(35, 33, 97),
(41, 33, 2),
(42, 33, 1),
(43, 55, 1),
(44, 33, 318),
(45, 33, 39),
(47, 4, 39),
(48, 5, 104),
(49, 7, 134),
(50, 5, 39),
(51, 5, 331),
(67, 3, 318),
(68, 5, 318),
(70, 3, 1),
(86, 1, 1),
(87, 1, 318),
(88, 27, 322),
(89, 36, 169),
(90, 41, 1),
(91, 42, 318),
(92, 44, 45),
(93, 44, 19),
(94, 44, 3),
(95, 66, 286),
(96, 51, 145),
(97, 54, 69),
(98, 91, 150),
(99, 91, 146),
(100, 91, 144),
(101, 98, 330),
(103, 102, 65),
(104, 1, 21),
(105, 103, 235),
(106, 103, 217),
(107, 103, 199),
(108, 103, 241);

-- --------------------------------------------------------

--
-- Structure de la table `fiche_order`
--

CREATE TABLE `fiche_order` (
  `id_fiche` int(11) NOT NULL,
  `userFicheID` int(11) NOT NULL,
  `restaurant_fk` int(11) NOT NULL,
  `pickup_fiche` datetime NOT NULL DEFAULT current_timestamp(),
  `status_fiche` int(11) NOT NULL,
  `created_fiche` datetime NOT NULL DEFAULT current_timestamp(),
  `qty_total` int(11) DEFAULT 0,
  `montant_total` double(12,2) DEFAULT 0.00,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fiche_order`
--

INSERT INTO `fiche_order` (`id_fiche`, `userFicheID`, `restaurant_fk`, `pickup_fiche`, `status_fiche`, `created_fiche`, `qty_total`, `montant_total`, `comment`) VALUES
(3, 125, 352, '2020-03-03 13:51:42', 4, '2020-03-03 13:51:42', 0, 17.60, 'Thank you very much'),
(4, 125, 352, '2020-03-03 14:32:39', 4, '2020-03-03 14:32:39', 0, 24.20, 'mesi'),
(5, 125, 352, '2020-03-06 12:46:43', 4, '2020-03-06 12:46:43', 0, 19.80, 'Thank you'),
(6, 125, 332, '2020-03-06 19:08:19', 4, '2020-03-06 19:08:19', 0, 33.44, 'Thank you very much , '),
(7, 125, 332, '2020-03-06 19:25:38', 4, '2020-03-06 19:25:38', 0, 86.57, 'Thank you'),
(8, 125, 353, '2020-03-07 15:18:26', 4, '2020-03-07 15:18:26', 0, 39.60, 'Ok thank to Andy');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `fiche_order_restaurant_no_payment`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `fiche_order_restaurant_no_payment` (
`id_restaurant` int(11)
,`name_restaurant` varchar(255)
,`montant_total` double(19,2)
,`logo_restaurant` varchar(255)
,`adresse_restaurant` varchar(255)
,`tel_restaurant` varchar(255)
,`adminRestID` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `fiche_order_restaurant_view`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `fiche_order_restaurant_view` (
`id_restaurant` int(11)
,`name_restaurant` varchar(255)
,`montant_total` double(19,2)
,`logo_restaurant` varchar(255)
,`tel_restaurant` varchar(255)
,`adresse_restaurant` varchar(255)
,`adminRestID` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la table `interest`
--

CREATE TABLE `interest` (
  `id_interest` int(11) NOT NULL,
  `name_owner` varchar(255) NOT NULL,
  `adress_restaurant` text NOT NULL,
  `name_restaurant` varchar(255) NOT NULL,
  `telephone` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `email_owner` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `interest`
--

INSERT INTO `interest` (`id_interest`, `name_owner`, `adress_restaurant`, `name_restaurant`, `telephone`, `date`, `email_owner`) VALUES
(22, 'Randoll Revers', 'Lilburn, GA', 'Lakay Restaurant', '4049696768', '2019-12-31 06:26:35', 'randollr@ornu.com'),
(24, 'Gessica Rene', '39 Liberty Street', 'Gessica Rene', '(862) 704-5238', '2020-01-01 03:43:12', 'gessicarene8@gmail.com'),
(25, 'julio jean fils', 'Delmas 103', 'Mail back restuarant', '48188107', '2020-01-01 22:39:55', 'julio.fils1@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `name_menu` varchar(100) NOT NULL,
  `description_menu` varchar(500) DEFAULT NULL,
  `prix_menu` varchar(500) DEFAULT NULL,
  `categoryMenuID` int(11) NOT NULL DEFAULT 14,
  `restaurantMenuID` int(11) NOT NULL,
  `img_menu` varchar(250) NOT NULL,
  `actif_menu` tinyint(1) NOT NULL DEFAULT 0,
  `amount_serve` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id_menu`, `name_menu`, `description_menu`, `prix_menu`, `categoryMenuID`, `restaurantMenuID`, `img_menu`, `actif_menu`, `amount_serve`) VALUES
(20, 'Soupe Joumon', 'Soupe Joumon Haitian ', '7', 13, 333, 'uploads/profil/2019-12-27T19:22:20.187Zmenu.jpg', 1, 100),
(24, 'Griyo a bannan ', 'Griyo kochon , bannan , ', '6', 13, 333, 'uploads/profil/2019-12-27T19:27:33.741Zmenu.jpg', 1, 100),
(25, 'Lalo', 'Duri a lalo, Haitian food ', '4', 13, 333, 'uploads/profil/2019-12-27T19:31:25.222Zmenu.jpg', 1, 100),
(28, 'Belle plat with clear menu', 'amount not', '11.5', 12, 332, '1581994580005Screen Shot 2020-02-13 at 4.55.45 PM.png', 1, 300),
(32, 'Bannan a griyo ', 'Bannan peyi , cochon peyi', '10.90', 12, 332, '1581994567466Screen Shot 2020-02-05 at 11.31.55 AM.png', 1, 1200),
(36, 'Duri a lalo', 'Duri blan , lalo , legume', '8', 12, 332, '1581992380264Screen Shot 2020-02-05 at 11.53.12 AM.png', 1, 200),
(37, 'One dish for ', 'One dish for  test', '12', 14, 325, '1582759294060Screen Shot 2020-02-15 at 6.57.11 PM.png', 1, 5),
(38, 'Tchaka', 'Tchaka Haiti ', '7', 14, 352, '1583254578934tchaka.jpeg', 1, 100),
(39, 'Bouyon tet kabrit', 'Bouyon tet kabrit ak tonbe kabrit', '9', 14, 352, '1583254392363bouyon-viv-ak-pye-poul-60-1469289670.jpg', 1, 100),
(40, 'Griyo', 'Bannan n a vyan', '13', 14, 352, '158326323903278669773_2426458747481683_7577787899014283264_n.jpg', 1, 200),
(42, 'Andy pate ', 'Vant andy pa plen', '12', 14, 353, '', 1, 100);

-- --------------------------------------------------------

--
-- Structure de la table `offer`
--

CREATE TABLE `offer` (
  `id_offer` int(11) NOT NULL,
  `date_start_offer` datetime NOT NULL,
  `date_end_offer` datetime NOT NULL,
  `price_offer` float NOT NULL,
  `name_offer` varchar(100) NOT NULL,
  `menuOfferID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `opening_times`
--

CREATE TABLE `opening_times` (
  `id_opening_time` int(10) UNSIGNED NOT NULL,
  `weekday` varchar(255) NOT NULL,
  `restaurant_fk` int(11) NOT NULL,
  `start_hour` varchar(55) NOT NULL,
  `end_hour` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `opening_times`
--

INSERT INTO `opening_times` (`id_opening_time`, `weekday`, `restaurant_fk`, `start_hour`, `end_hour`) VALUES
(12, '1', 20, '09:10', '21:00'),
(13, '2', 20, '09:10', '21:00'),
(14, '3', 20, '09:10', '21:00'),
(15, '4', 20, '09:10', '21:00'),
(16, '1', 332, '09:00', '23:00'),
(17, '2', 332, '09:00', '23:00'),
(18, '0', 352, '11:00', '23:00'),
(19, '1', 352, '09:00', '23:00'),
(20, '2', 352, '09:00', '21:00'),
(11, '0', 353, '12:00', '02:00'),
(2, '1', 353, '08:00', '23:00'),
(4, '3', 353, '08:00', '23:00'),
(6, '4', 353, '08:00', '23:00'),
(10, '5', 353, '14:22', '01:00');

-- --------------------------------------------------------

--
-- Structure de la table `order_menu`
--

CREATE TABLE `order_menu` (
  `id_order` int(11) NOT NULL,
  `qty_order` int(11) NOT NULL,
  `menuOrderID` int(11) NOT NULL,
  `id_restaurant_fk` int(11) NOT NULL,
  `specification_order` text CHARACTER SET armscii8 DEFAULT NULL,
  `price_order` double NOT NULL,
  `ficheOrderID` int(11) NOT NULL,
  `created_order` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_menu`
--

INSERT INTO `order_menu` (`id_order`, `qty_order`, `menuOrderID`, `id_restaurant_fk`, `specification_order`, `price_order`, `ficheOrderID`, `created_order`) VALUES
(5, 1, 38, 352, '', 7, 3, '2020-03-03 13:51:42'),
(7, 1, 40, 352, '', 13, 4, '2020-03-03 14:32:39'),
(8, 1, 39, 352, '', 9, 4, '2020-03-03 14:32:44'),
(9, 2, 39, 352, '', 9, 5, '2020-03-06 12:46:43'),
(10, 1, 28, 332, '', 11.5, 6, '2020-03-06 19:08:19'),
(11, 1, 32, 332, '', 10.9, 6, '2020-03-06 19:08:23'),
(12, 1, 36, 332, '', 8, 6, '2020-03-06 19:10:26'),
(13, 4, 28, 332, '', 11.5, 7, '2020-03-06 19:25:38'),
(14, 3, 32, 332, '', 10.9, 7, '2020-03-06 19:25:45'),
(15, 3, 42, 353, '', 12, 8, '2020-03-07 15:18:26');

-- --------------------------------------------------------

--
-- Structure de la table `pass_temp`
--

CREATE TABLE `pass_temp` (
  `id_pass` int(11) NOT NULL,
  `value_temp` varchar(200) NOT NULL,
  `user_passID` int(11) NOT NULL,
  `created_pass` datetime NOT NULL,
  `not_use` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `photos_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_menu` text NOT NULL,
  `label` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `photos`
--

INSERT INTO `photos` (`photos_id`, `date`, `img_menu`, `label`) VALUES
(2, '2020-02-28 18:44:24', '15811161459771.png', 'kgiingnig.png'),
(8, '2020-02-29 15:06:11', '1583006771623Screen Shot 2019-11-22 at 5.08.52 PM.png', 'phtoo '),
(10, '2020-02-29 15:13:36', '1583007216769buripoulet.jpeg', 'olol'),
(11, '2020-03-03 15:02:04', '158326572414579706583_2426459174148307_7065538917830754304_n.jpg', 'pate');

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

CREATE TABLE `rating` (
  `id_rating` int(11) NOT NULL,
  `comm_rating` varchar(255) DEFAULT NULL,
  `value_rating` float NOT NULL,
  `userRatID` int(11) NOT NULL,
  `restRatID` int(11) NOT NULL,
  `date_rating` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `id_restaurant` int(11) NOT NULL,
  `name_restaurant` varchar(255) NOT NULL,
  `email_restaurant` varchar(255) NOT NULL,
  `tel_restaurant` varchar(255) NOT NULL,
  `website_restaurant` varchar(255) NOT NULL,
  `adresse_restaurant` varchar(255) NOT NULL,
  `img_restaurant` varchar(255) NOT NULL,
  `logo_restaurant` varchar(255) NOT NULL,
  `create_restaurant` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_restaurant` datetime DEFAULT current_timestamp(),
  `countryRestID` int(11) NOT NULL,
  `adminRestID` int(11) NOT NULL,
  `lat_restaurant` varchar(255) DEFAULT NULL,
  `long_restaurant` varchar(255) DEFAULT NULL,
  `open_restaurant` tinyint(1) NOT NULL DEFAULT 1,
  `rate` float NOT NULL DEFAULT 4,
  `tax` float NOT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `restaurant`
--

INSERT INTO `restaurant` (`id_restaurant`, `name_restaurant`, `email_restaurant`, `tel_restaurant`, `website_restaurant`, `adresse_restaurant`, `img_restaurant`, `logo_restaurant`, `create_restaurant`, `updated_restaurant`, `countryRestID`, `adminRestID`, `lat_restaurant`, `long_restaurant`, `open_restaurant`, `rate`, `tax`, `zipcode`, `city`, `state`, `isActive`) VALUES
(1, 'Piman Bouk Haitian Restaurant', 'Julio@gmail.com', '(305) 759-6805', 'Not required', '5921 NE 2nd Ave Miami FL 33137', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 1, '18.54509700', '-72.23787100', 1, 4.5, 10, NULL, '', '', 1),
(2, 'Naomi\'s Garden Restaurant & Lounge', 'services@taptapnow.com', '(305) 456-4715', '', '650 NW 71st St Miami FL 33150', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.83957580', '-80.20792510', 1, 5.5, 10, NULL, '', '', 0),
(3, 'Chef Creole Seasoned Restaurant', 'julio@quiver.com', '(305) 754-2223', 'Not required', '200 NW 54th St Miami FL 33127', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.824871', '-80.200255', 1, 3.5, 10, NULL, '', '', 0),
(4, 'Manger Creole', 'services@taptapnow.com', '(305) 324-1615', '', '1051 NW 14th St Miami FL 33136', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '34.01200304', '-99.99999999', 1, 4.5, 10, NULL, '', '', 0),
(5, 'Chez Le Bebe', 'services@taptapnow.com', '(305) 751-7639', '', '114 NE 54th St Miami FL 33137', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.82515250', '-80.19346640', 1, 3.5, 10, NULL, '', '', 0),
(6, 'Le Jardin Haitian Restaurant', 'services@taptapnow.com', '(305) 244-7566', '', '195 NE 78th St Miami FL 33138', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.85615600', '-96.03579900', 1, 4.5, 10, NULL, '', '', 0),
(7, 'La Fourchette Restaurant', 'services@taptapnow.com', '(305) 456-7024', '', '8267 N Miami Ave Miami FL 33127', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.85093390', '-80.19677673', 1, 3.5, 10, NULL, '', '', 0),
(8, 'Au Bon Gout Restaurant', 'services@taptapnow.com', '(305) 899-0507', '', '12051 W Dixie Hwy North Miami FL 33161', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.88928200', '-80.18831300', 1, 3.5, 10, NULL, '', '', 0),
(9, 'L\'auberge Restaurant', 'services@taptapnow.com', '(305) 891-0077', '', '13315 W Dixie Hwy North Miami FL 33161', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.88928200', '-80.18831300', 1, 3.5, 10, NULL, '', '', 0),
(10, 'Blessing Restaurant', 'services@taptapnow.com', '(305) 244-8833', '', '8427 NE 2nd Ave Miami FL 33138', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.81078470', '-80.19121860', 1, 5.5, 10, NULL, '', '', 0),
(11, 'Simon Lumiere Restaurant Take Out & Delivery', 'services@taptapnow.com', '(786) 534-9139', '', '12750 W Dixie Hwy North Miami FL 33161', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.89257350', '-80.18500490', 1, 3.5, 10, NULL, '', '', 0),
(12, 'Chez Madame Johns Restaurant', 'services@taptapnow.com', 'None', '', '975 NE 125th St North Miami FL 33161', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.89089365', '-80.17890754', 1, 5.5, 10, NULL, '', '', 0),
(13, 'Randy\'s Restaurant & Lounge', 'services@taptapnow.com', '(305) 687-9630', '', '13420 NW 7th Ave Miami FL 33168', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.45876350', '-99.99999999', 1, 3.5, 10, NULL, '', '', 0),
(14, 'Lecap Restaurant', 'services@taptapnow.com', '(305) 687-5004', '', '13639 NW 7th Ave North Miami FL 33168', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.45876350', '-99.99999999', 1, 3.5, 10, NULL, '', '', 0),
(15, 'Fritay', 'services@taptapnow.com', '(786) 991-6229', '', '12143 NW 7th Ave North Miami FL 33168', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.45876350', '-99.99999999', 1, 4.5, 10, NULL, '', '', 0),
(16, '3 Queens Restaurant', 'services@taptapnow.com', '(305) 392-0731', '', '7625 NE 2nd Ave Miami FL 33138', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.81078470', '-80.19121860', 1, 5.5, 10, NULL, '', '', 0),
(17, 'Macillon Grio Fish & Chicken', 'services@taptapnow.com', '(786) 320-6093', '', '1026 N Miami Beach Blvd North Miami Beach FL 33162', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.92692685', '-80.17980587', 1, 4.5, 10, NULL, '', '', 0),
(18, 'Onyx Restaurant', 'services@taptapnow.com', '(786) 657-3028', '', '486 NE 167th St Miami FL 33162', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '47.75048759', '-99.99999999', 1, 5.5, 10, NULL, '', '', 0),
(19, 'Ivan\'s Cookhouse', 'services@taptapnow.com', '(305) 944-4826', '', '14815 Biscayne Blvd North Miami FL 33181', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.91264350', '-80.15584170', 1, 4.5, 10, NULL, '', '', 0),
(20, 'Chef Creole Seasoned Restaurant', 'service@taptapnow.com', '(305) 769-9440', 'not defined', '1392 NW 119th St Miami FL 33167', 'not defined', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '35.59114980', '-97.71759390', 1, 3.5, 8, '33167', '', 'Fl', 0),
(21, 'Family Cuisine Haitian Restaurant', 'services@taptapnow.com', '(305) 354-2151', '', '1572 NE 165th St North Miami Beach FL 33162', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '47.74853759', '-99.99999999', 1, 5.5, 10, NULL, '', '', 0),
(22, 'Cuisine Creole', 'services@taptapnow.com', '(305) 949-2316', '', '15034 NE 6th Ave Miami FL 33161', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '32.80915360', '-98.10759360', 1, 3.5, 10, NULL, '', '', 0),
(23, 'Sabal Palm Cafeteria', 'services@taptapnow.com', '(786) 953-4698', '', '5299 NE 2nd Ave Miami FL 33137', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.81078470', '-80.19121860', 1, 5.5, 10, NULL, '', '', 0),
(24, 'Le Lambi Miami', 'services@taptapnow.com', '(305) 383-0442', '', '13720 SW 88th St Miami FL 33186', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.68773140', '-80.34047640', 1, 5.5, 10, NULL, '', '', 0),
(25, 'Venus Restaurant', 'services@taptapnow.com', '(305) 681-2111', '', '13785 NW 7th Ave Miami FL 33168', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '-25.63110420', '27.27685210', 1, 5.5, 10, NULL, '', '', 0),
(26, 'Horace Bakery & Restaurant', 'services@taptapnow.com', '(305) 627-3850', '', '16732 NE 6th Ave North Miami Beach FL 33162', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '32.80915360', '-98.10759360', 1, 3.5, 10, NULL, '', '', 0),
(27, 'Pack Super Market', 'services@taptapnow.com', '(305) 757-4777', '', '8235 NE 2nd Ave Miami FL 33138', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.81078470', '-80.19121860', 1, 5.5, 10, NULL, '', '', 0),
(28, 'Nathalie Kitchen', 'services@taptapnow.com', '(786) 803-8774', '', '12989 W Dixie Hwy Miami FL 33161', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.88928200', '-80.18831300', 1, 5.5, 10, NULL, '', '', 0),
(29, 'Pierre\'s Restaurant', 'services@taptapnow.com', '(305) 418-0982', '', '11105 NW 7th Ave Miami FL 33168', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.45876350', '-99.99999999', 1, 5.5, 10, NULL, '', '', 0),
(30, 'Cuisine Creole', 'services@taptapnow.com', '(305) 454-9715', '', '20725 NW 2nd Ave Miami Gardens FL 33169', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.83246500', '-80.20032980', 1, 3.5, 10, NULL, '', '', 0),
(31, 'Nana\'s SapiBon Creole Bakery & Restaurant', 'services@taptapnow.com', '(954) 374-8029', '', '2471 Pembroke Rd Hollywood FL 33020', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '-29.80354520', '31.03701010', 1, 3.5, 10, NULL, '', '', 0),
(32, 'Nani\'s Haitian Cuisine', 'Julio@gmail.com', '(914) 573-6960', 'Not required', '1940 N 30th Rd #241 Hollywood FL 33021', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.028277', '-80.168861', 1, 5.5, 10, NULL, '', '', 0),
(33, 'Chez Guyto Take Out Restaurant', 'services@taptapnow.com', '(954) 963-6139', '', '6520 Pembroke Rd Miramar FL 33023', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '-29.80354520', '31.03701010', 1, 3.5, 10, NULL, '', '', 0),
(34, 'Tastee Cre\'Haitian', 'Julio@gmail.com', '(305) 795-0900', 'Not required', '1940 N 30th Rd #267 Hollywood FL 33021', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, ' 26.028277', '-80.168861', 1, 3.5, 10, NULL, '', '', 0),
(35, 'Taty Griot Express Restaurant', 'services@taptapnow.com', '(954) 793-1309', '', '7108 Pembroke Rd Miramar FL 33023', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '-29.80354520', '31.03701010', 1, 5.5, 10, NULL, '', '', 0),
(36, 'Le Cordon Bleu', 'services@taptapnow.com', '(786) 237-9967', '', '4521 W Hallandale Beach Blvd Hollywood FL 33023', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.98449402', '-80.18832062', 1, 4.5, 10, NULL, '', '', 0),
(37, 'Chez Nous American Haitian', 'julio@quiver.com', '(954) 989-0675', 'Not required', '3056 S. State road 7 . Bay 38 repercussions Miramar FL 33023', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.972758', '-80.205967', 1, 3.5, 10, NULL, '', '', 0),
(38, 'Bargain Family Restaurant', 'services@taptapnow.com', '(954) 921-0880', '', '728 S Dixie Hwy Hollywood FL 33020', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.00565360', '-80.14919943', 1, 5.5, 10, NULL, '', '', 0),
(39, 'Kasa Champet', 'services@taptapnow.com', '(954) 983-5046', '', '7920 Pines Blvd Pembroke Pines FL 33024', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.00762150', '-80.40901900', 1, 3.5, 10, NULL, '', '', 0),
(40, 'La Belle Jacmelienne Cafe', 'services@taptapnow.com', '(954) 381-3886', '', '3328 S University Dr Miramar FL 33025', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.97904282', '-80.24708971', 1, 4.5, 10, NULL, '', '', 0),
(41, 'Le Bifteck Restaurant', 'services@taptapnow.com', '(954) 613-7501', '', '6252 Pembroke Rd Miramar FL 33023', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.99534290', '-80.21216153', 1, 5.5, 10, NULL, '', '', 0),
(42, 'Lubin\'s Classic Bakery', 'services@taptapnow.com', '(954) 367-7522', '', '1466 W Dixie Hwy Dania Beach FL 33004', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.03497233', '-80.15016441', 1, 3.5, 10, NULL, '', '', 0),
(43, 'La Belle Monique', 'julio@quiver.com', '(954) 587-0304', 'Not required', '937 S State Rd 7 Plantation FL 33317', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.109374', '-80.20195', 1, 4.5, 10, NULL, '', '', 0),
(45, 'Piman Cafe Restaurant', 'services@taptapnow.com', '(954) 356-7995', '', '1560 NE 4th Ave Fort Lauderdale FL 33304', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 1, '26.14684002', '-80.14065319', 1, 4.5, 10, NULL, '', '', 1),
(46, 'Alberte\'s Restaurant', 'services@taptapnow.com', '(954) 990-4360', '', '1201 NE 38th St Oakland Park FL 33334', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.17417107', '-80.13144566', 1, 5.5, 10, NULL, '', '', 0),
(47, 'Reflexion Restaurant', 'services@taptapnow.com', '(954) 767-0383', '', '300 W Sunrise Blvd Fort Lauderdale FL 33311', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.13721630', '-80.12771050', 1, 3.5, 10, NULL, '', '', 0),
(48, 'Randy\'s Restaurant & Lounge', 'services@taptapnow.com', '(305) 687-9630', '', '13420 NW 7th Ave Miami FL 33168', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.89759485', '-80.21157025', 1, 4.5, 10, NULL, '', '', 0),
(49, 'Yo\'s Restaurant & Bakery', 'services@taptapnow.com', '(954) 404-9129', '', '8874 Miramar Pkwy Miramar FL 33025', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.98018890', '-80.26226120', 1, 3.5, 10, NULL, '', '', 0),
(50, 'Island Palace Restaurant', 'julio@quiver.com', '(954) 735-2233', 'Not required', '4170 FL-7 Lauderdale Lakes FL 33319', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.178054', '-80.203225', 1, 5.5, 10, NULL, '', '', 0),
(51, 'H & R Grill', 'services@taptapnow.com', '(954) 368-3495', '', '3535 NW 88th Ave Sunrise FL 33351', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.15485680', '-80.26781840', 1, 5.5, 10, NULL, '', '', 0),
(52, 'Coco\'s Kitchen', 'julio@quiver.com', '(954) 909-5163', 'Not required', '1267 NW 31st Ave Fort Lauderdale', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.142463', '-80.186955', 1, 3.5, 10, NULL, '', '', 0),
(53, 'M&S Best Tropical Restaurant', 'services@taptapnow.com', '(954) 565-0001', '', '3754 N Andrews Ave Oakland Park FL 33309', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.17354786', '-80.14656587', 1, 4.5, 10, NULL, '', '', 0),
(54, 'China Hut Haitian Restaurant', 'services@taptapnow.com', '(954) 714-6868', '', '2998 NW 55th Ave Lauderhill FL 33313', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.16354447', '-80.22367748', 1, 5.5, 10, NULL, '', '', 0),
(55, 'Le Jardin Caribbean Cafe', 'julio@quiver.com', '(954) 584-1900', 'Not required', '1460 FL-7 Lauderhill FL 33313', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.144038', '-80.202444', 1, 3.5, 10, NULL, '', '', 0),
(56, 'Lakes Ballroom and Restaurant', 'julio@quiver.com', 'None', 'Not required', '4322 FL-7 Lauderdale Lakes FL 33319', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.178970', '-80.203244', 1, 5.5, 10, NULL, '', '', 0),
(57, 'Venise Caribbean Cuisine', 'services@taptapnow.com', '(954) 462-7967', '', '1519 NE 4th Ave Fort Lauderdale FL 33304', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.14617815', '-80.14081736', 1, 5.5, 10, NULL, '', '', 0),
(58, 'Cafe Creole', 'julio@quiver.com', '(954) 990-4589', 'Not required', '5460 FL-7 Fort Lauderdale FL 33319', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.194178', '-80.202797', 1, 5.5, 10, NULL, '', '', 0),
(59, 'Haitian Alpha Takeout Restaurant', 'services@taptapnow.com', '(954) 347-9304', '', '592 SW 27th Ave Fort Lauderdale FL 33312', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.11401971', '-80.17783002', 1, 3.5, 10, NULL, '', '', 0),
(60, 'Caribbean delight catering restaurant', 'services@taptapnow.com', '(954) 731-1880', '', '3134 W Commercial Blvd Tamarac FL 33309', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.19194990', '-80.21119990', 1, 3.5, 10, NULL, '', '', 0),
(61, 'Koupé Dwét', 'julio@quiver.com', '(754) 666-4978', 'Not required', '6025 Kimberly Blvd Pompano Beach Kimberly Blvd', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.215924', '-80.205212', 1, 4.5, 10, NULL, '', '', 0),
(62, 'Artibonite Caribbean Restaurant', 'services@taptapnow.com', '(954) 255-7738', '', '7824 W Sample Rd Pompano Beach FL 33065', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.27483950', '-80.13289050', 1, 5.5, 10, NULL, '', '', 0),
(63, 'Bistro Creole', 'services@taptapnow.com', '(954) 578-5700', '', '6130 W Oakland Park Blvd Sunrise FL 33313', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.16803420', '-80.31270390', 1, 5.5, 10, NULL, '', '', 0),
(64, 'J J Gourmet', 'services@taptapnow.com', '(954) 741-6686', '', '6937 Sunset Strip Sunrise FL 33313', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.15484492', '-80.24064654', 1, 5.5, 10, NULL, '', '', 0),
(65, 'La Belle Moe Restaurant', 'services@taptapnow.com', '(954) 990-6910', '', '4711 NW 14th St Lauderhill FL 33313', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.14313631', '-80.21261763', 1, 3.5, 10, NULL, '', '', 0),
(66, 'Unique Park', 'julio@quiver.com', '(954) 781-6970', 'Not required', 'Northwest 10th Street 3521 NW 8th Ave Pompano Beach', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.273979', '-80.133972', 1, 4.5, 10, NULL, '', '', 0),
(67, 'Au-Bon-Gout Restaurant', 'services@taptapnow.com', '(954) 570-9192', '', '5273 N Dixie Hwy Pompano Beach FL 33064', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.24093950', '-80.12347250', 1, 4.5, 10, NULL, '', '', 0),
(68, 'Excel Restaurant', 'services@taptapnow.com', '(954) 783-2211', '', '2001 N Dixie Hwy Pompano Beach FL 33060', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.25540100', '-80.11950200', 1, 3.5, 10, NULL, '', '', 0),
(69, 'Notre Dame Restaurant', 'services@taptapnow.com', '(954) 421-4777', '', '4859 N Dixie Hwy Pompano Beach FL 33064', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.24093950', '-80.12347250', 1, 4.5, 10, NULL, '', '', 0),
(70, 'LD Island Cuisine', 'julio@quiver.com', '(754) 205-2637', 'Not required', '360 South State Road 7 Margate FL 33068', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.226354', '-80.204237', 1, 3.5, 10, NULL, '', '', 0),
(71, 'Delish Caribbean Restaurant', 'services@taptapnow.com', '(954) 933-3052', '', '171 South State Road 7 Margate FL 33068', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.22884272', '-80.20477370', 1, 4.5, 10, NULL, '', '', 0),
(72, 'Deluxe 2 Restaurant and Grill', 'services@taptapnow.com', '(954) 720-2865', '', '996-998 SW 81st Ave North Lauderdale FL 33068', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.21631802', '-80.23655758', 1, 4.5, 10, NULL, '', '', 0),
(73, 'Saveur Tropical Restaurant', 'services@taptapnow.com', '(954) 840-6535', '', '515 NE 24th St Pompano Beach FL 33064', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.26092757', '-80.11537256', 1, 5.5, 10, NULL, '', '', 0),
(74, 'Le Bistro 2.0', 'julio@quiver.com', '(561) 465-5767', 'Not required', '9846 Sandalfoot Blvd Boca Raton FL 33428', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.335607', '-80.200345', 1, 5.5, 10, NULL, '', '', 0),
(75, 'Giveness Caribbean', 'services@taptapnow.com', '(561) 274-1255', '', '1533 S Congress Ave Delray Beach FL 33445', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.44337177', '-80.09246964', 1, 5.5, 10, NULL, '', '', 0),
(76, 'RC Caribbean Restaurant', 'julio@quiver.com', '(561) 562-8520', 'Not required', '1100 Linton Blvd Suite 3 Delray Beach FL 33444', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.437649', '-80.08433', 1, 3.5, 10, NULL, '', '', 0),
(77, 'Excell Restaurant', 'services@taptapnow.com', '(561) 330-0463', '', '1041 S Congress Ave Delray Beach FL 33445', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.44610524', '-80.09234211', 1, 3.5, 10, NULL, '', '', 0),
(78, 'A&E Caribbean Cafe', 'services@taptapnow.com', '(561) 330-4140', '', '2200 Lake Ida Rd Delray Beach FL 33445', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.47304700', '-80.09809100', 1, 3.5, 10, NULL, '', '', 0),
(79, 'Sabine Restaurant', 'services@taptapnow.com', '(561) 501-4277', '', '201 SE 2nd Ave Delray Beach FL 33483', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.45786600', '-80.07058900', 1, 4.5, 10, NULL, '', '', 0),
(80, 'Dutshy\'s Caribbean Restaurant', 'julio@quiver.com', '(561) 332-0427', 'Not required', '801 Congress Ave #677 Boynton Beach FL 33426', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.534216', '-80.095523', 1, 4.5, 10, NULL, '', '', 0),
(81, 'Chez Elda Takeout Restaurant', 'services@taptapnow.com', '(561) 216-3532', '', '544 E Gateway Blvd #4 Boynton Beach FL 33435', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.54904019', '-80.05781891', 1, 4.5, 10, NULL, '', '', 0),
(82, 'Ney Caribbean Restaurant', 'julio@quiver.com', '(561) 509-7157', 'Not required', '10114 S Military Trail suite #102 Boynton Beach FL 33436', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.526929', '-80.095523', 1, 3.5, 10, NULL, '', '', 0),
(83, 'Tropical Island Restaurant', 'services@taptapnow.com', '(561) 369-4205', '', '400 E Boynton Beach Blvd Boynton Beach FL 33435', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.52882100', '-80.06057900', 1, 3.5, 10, NULL, '', '', 0),
(84, 'Chez TiDoc Restaurant', 'services@taptapnow.com', '(561) 330-7437', '', '229 SE 2nd Ave # 1 Delray Beach FL 33483', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.45741543', '-80.07066157', 1, 5.5, 10, NULL, '', '', 0),
(85, 'Le Basilic Restaurant and Bakery', 'julio@quiver.com', '(561) 629-7191', 'Not required', '6480 Lake Worth Rd Lake Worth FL 33463', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.61597', '-80.145079', 1, 5.5, 10, NULL, '', '', 0),
(86, 'Caribbean Craft Restaurant', 'julio@quiver.com', '(561) 586-5580', 'Not required', '1600 S Dixie Hwy Lake Worth FL 33460', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.59653', '-80.054305', 1, 3.5, 10, NULL, '', '', 0),
(87, 'Prosperity Island Restaurant', 'services@taptapnow.com', '(561) 721-2710', '', '5784 Okeechobee Blvd West Palm Beach FL 33417', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.70589230', '-80.07370670', 1, 4.5, 10, NULL, '', '', 0),
(88, 'Alberte Restaurant', 'julio@quiver.com', '(561) 649-6766', 'Not required', '4595 Hypoluxo Rd #7 Lake Worth FL 33463', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.59653', '-80.054305', 1, 3.5, 10, NULL, '', '', 0),
(89, 'Lakay Restaurant', 'services@taptapnow.com', '(561) 615-7088', '', '2695 N Military Trl #25 West Palm Beach FL 33409', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.71725450', '-80.11062650', 1, 4.5, 10, NULL, '', '', 0),
(90, 'Beauvais Caribbean Restaurant', 'julio@quiver.com', '(561) 642-5334', 'Not required', '6150 S Congress Ave Lantana FL 33462', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.586619', '-80.091931', 1, 5.5, 10, NULL, '', '', 0),
(91, 'Savour Of Caribbean Restaurant', 'services@taptapnow.com', '(561) 530-3731', '', '2677 Forest Hill Blvd #111 West Palm Beach FL 33406', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.65550480', '-80.06894200', 1, 5.5, 10, NULL, '', '', 0),
(92, 'Griot Caribbean Take Out', 'julio@quiver.com', '(561) 847-4963', 'Not required', '2337 1558 Palm Beach Lakes Blvd #5 West Palm', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.723804', '-80.080174', 1, 3.5, 10, NULL, '', '', 0),
(93, 'Pam Pi Bon Haitian Restaurant', 'services@taptapnow.com', '(561) 704-1165', '', '818 N Federal Hwy Boynton Beach FL 33435', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.53362714', '-80.05810047', 1, 3.5, 10, NULL, '', '', 0),
(94, 'Ti Manmi’s Kitchen', 'services@taptapnow.com', '(561) 810-8335', '', '306 E Boynton Beach Blvd Boynton Beach FL 33435', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.52882308', '-80.06119602', 1, 3.5, 10, NULL, '', '', 0),
(95, 'Maddy\'s Cuisine', 'services@taptapnow.com', '(772) 249-5744', '', '1002 SE Port St Lucie Blvd Port St. Lucie FL 34952', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.27177492', '-80.32160093', 1, 5.5, 10, NULL, '', '', 0),
(96, 'Island Twist Take Out Restaurant', 'services@taptapnow.com', '(772) 905-8856', '', '1366 SW Bayshore Blvd Port St. Lucie FL 34983', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.29921086', '-80.36826596', 1, 3.5, 10, NULL, '', '', 0),
(97, 'Malaika Caribbean Cuisine and Bakery', 'services@taptapnow.com', '(772) 807-1296', '', '658 SW Port St Lucie Blvd Port St. Lucie FL 34953', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.27038869', '-80.36420865', 1, 3.5, 10, NULL, '', '', 0),
(98, 'Alabon Bakery', 'services@taptapnow.com', '(772) 882-4983', '', '1409 Delaware Ave Fort Pierce FL 34950', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.44343200', '-80.33832200', 1, 5.5, 10, NULL, '', '', 0),
(99, 'Caribbean Flavors Restaurant', 'services@taptapnow.com', '(772) 336-5255', '', '690 SW Bayshore Blvd Port St. Lucie FL 34983', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.31265692', '-80.37163921', 1, 4.5, 10, NULL, '', '', 0),
(100, 'Peacock Arts Café', 'services@taptapnow.com', '(772) 448-4571', '', '609 Orange Ave Fort Pierce FL 34950', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.44688795', '-80.32820378', 1, 5.5, 10, NULL, '', '', 0),
(101, 'Pearl of the Island Caribbean Cuisine', 'julio@quiver.com', '(754) 205-4839', 'Not required', '1490 FL-7 Bay A Margate FL 33063', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.24811', '-80.200951', 1, 5.5, 10, NULL, '', '', 0),
(102, 'Friendly & Amigo Restaurant', 'services@taptapnow.com', '(239) 231-4349', '', '12275 Collier Blvd Naples FL 34116', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.11118880', '-81.68723510', 1, 4.5, 10, NULL, '', '', 0),
(103, 'Hi Lands Restaurant', 'services@taptapnow.com', '(239) 352-9771', '', '4963 Golden Gate Pkwy Naples FL 34116', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.17417450', '-81.76698560', 1, 3.5, 10, NULL, '', '', 0),
(104, 'Ti-Kreyol Restaurant- Food Truck', 'services@taptapnow.com', '(239) 333-9118', '', '11500 Tamiami Trail E Naples FL 34113', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.10786400', '-81.74844010', 1, 5.5, 10, NULL, '', '', 0),
(105, 'Tropical Creole Restaurant', 'services@taptapnow.com', '(239) 313-7379', '', '3440 Fowler St Fort Myers FL 33901', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.61475340', '-81.86201290', 1, 5.5, 10, NULL, '', '', 0),
(106, 'Labadie Bar Restaurant and Bakery', 'services@taptapnow.com', '(239) 204-9927', '', '3580 Evans Ave Fort Myers FL 33901', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.61202435', '-81.85998710', 1, 5.5, 10, NULL, '', '', 0),
(107, 'Cafe Creole Caribbean Cuisine', 'services@taptapnow.com', '(941) 391-6606', '', '2320 Tamiami Trail Port Charlotte FL 33952', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.99516499', '-82.11726677', 1, 4.5, 10, NULL, '', '', 0),
(108, 'Le Lambi Restaurant', 'services@taptapnow.com', '(941) 875-9838', '', '2395 Tamiami Trail Port Charlotte FL 33952', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.99658982', '-82.11911320', 1, 3.5, 10, NULL, '', '', 0),
(109, 'Lakay Restaurant', 'julio@quiver.com', '(941) 896-3966', 'Not required', '6320 15th St E Sarasota FL 34243', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.42853', '-82.547325', 1, 5.5, 10, NULL, '', '', 0),
(110, 'Bon Appetit', 'julio@quiver.com', '(941) 251-9776', 'Not required', '3300 1st St Bradenton FL 34208', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.470717', '-82.563491', 1, 4.5, 10, NULL, '', '', 0),
(111, 'Bon Zanmi Haitian Cuisine', 'services@taptapnow.com', '(813) 284-7943', '', '14601 N Nebraska Ave Tampa FL 33613', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '27.95207920', '-82.45128060', 1, 3.5, 10, NULL, '', '', 0),
(112, 'Kreyol Delight', 'services@taptapnow.com', '(813) 443-5099', '', '4818 E Busch Blvd Tampa FL 33617', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.03271007', '-82.40674060', 1, 5.5, 10, NULL, '', '', 0),
(113, 'Alez', 'julio@quiver.com', '(813) 971-5902', 'Not required', '1428 E Fletcher Ave Tampa FL 33612', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.069645', '-82.443757', 1, 5.5, 10, NULL, '', '', 0),
(115, 'Mom\'s Restaurant Haitian Cuisine and Bakery', 'julio@quiver.com', '(813) 631-0900', 'Not required', '11900 N Nebraska Ave Suite #1 Tampa FL 33612', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.056466', '-82.451625', 1, 5.5, 10, NULL, '', '', 0),
(116, 'Yeshua Bistro', 'julio@quiver.com', '(813) 533-6165', 'Not required', '10910 N 30th St Suite 105 Tampa FL 33612', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.047509', '-82.426583', 1, 4.5, 10, NULL, '', '', 0),
(117, 'Bon Appetit Grill', 'julio@quiver.com', '(407) 857-2434', 'Not required', '4534 S Orange Blossom Trail Orlando FL 32839', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.49742', '-81.398865', 1, 3.5, 10, NULL, '', '', 0),
(119, 'Cafe Kreol', 'julio@quiver.com', '(407) 852-9723', 'Not required', '7256 W Colonial Dr Orlando FL 32818', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.550864', '-81.480773', 1, 3.5, 10, NULL, '', '', 0),
(120, 'Caribbean Cuisine', 'services@taptapnow.com', '(407) 298-0088', '', '5812 Old Winter Garden Rd Orlando FL 32835', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.54587110', '-81.43867230', 1, 4.5, 10, NULL, '', '', 0),
(121, 'Lilly\'s Creole Restaurant', 'julio@quiver.com', '(407) 506-7477', 'Not required', '607 N Pine Hills Rd Orlando FL 32808', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.549188', '-81.447237', 1, 5.5, 10, NULL, '', '', 0),
(122, 'Saudie\'s Restaurant', 'services@taptapnow.com', '(407) 299-3544', '', '6249 Old Winter Garden Rd Orlando FL 32835', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.54587110', '-81.43867230', 1, 5.5, 10, NULL, '', '', 0),
(123, 'Tama\'s Restaurant & Bakery', 'services@taptapnow.com', '(407) 574-2002', '', '6319 Silver Star Rd Orlando FL 32818', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.57784808', '-81.46831844', 1, 3.5, 10, NULL, '', '', 0),
(125, 'Mimi\'s Restaurant', 'services@taptapnow.com', '(407) 601-7983', '', '2161 Americana Blvd Orlando FL 32839', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.48682005', '-81.40750345', 1, 5.5, 10, NULL, '', '', 0),
(126, 'Bon Appetit Grill', 'julio@quiver.com', '(407) 271-8833', 'Not required', '485 S Kirkman Rd Orlando FL 32811', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.535445', '-81.457496', 1, 3.5, 10, NULL, '', '', 0),
(127, 'Adventel Restaurant And Bakery', 'julio@quiver.com', '(407) 751-2343', 'Not required', '4563 S Orange Blossom Trail Suite 1 Orlando FL 32839', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.498427', '-81.395566', 1, 5.5, 10, NULL, '', '', 0),
(128, 'Blessing D Kreyol Food', 'julio@quiver.com', '(352) 321-5228', 'Not required', 'Wednesday None None None', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.496917', '-81.401538', 1, 4.5, 10, NULL, '', '', 0),
(129, 'Bistro Paradise Restaurant & Bar', 'services@taptapnow.com', '(407) 757-0959', '', '2869 Wilshire Dr Orlando FL 32835', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.51176929', '-81.46325846', 1, 5.5, 10, NULL, '', '', 0),
(130, 'Kreyol Kafe & Bakery', 'julio@quiver.com', '(407) 930-6731', 'Not required', '12014 E Colonial Dr #120 Orlando FL 32826', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.565853', '-81.203993', 1, 5.5, 10, NULL, '', '', 0),
(131, 'Chez Telfort Restaurant', 'julio@quiver.com', '(407) 857-8222', 'Not required', '2215 W Oak Ridge Rd Orlando FL 32809', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.472911', '-81.408517', 1, 5.5, 10, NULL, '', '', 0),
(132, 'Belinda Take Out', 'julio@quiver.com', '(407) 253-7223', 'Not required', '6900 Silver Star Rd #106 Orlando FL 32818', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.577142', '-81.474474', 1, 3.5, 10, NULL, '', '', 0),
(133, 'Chez Rosie', 'services@taptapnow.com', '(407) 749-0959', '', '704 N Main St Kissimmee FL 34744', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.29801512', '-81.40382900', 1, 4.5, 10, NULL, '', '', 0),
(134, 'Kalalou Caribbean Bar & Grill', 'julio@quiver.com', '(407) 286-5539', 'Not required', '5160 S John Young Pkwy Orlando FL 32839', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.488532', '-81.418034', 1, 4.5, 10, NULL, '', '', 0),
(135, '340 Caribbean Restaurant', 'julio@quiver.com', 'None', 'Not required', '4529 N Pine Hills Rd Orlando FL 32808', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.59759', '-81.450614', 1, 3.5, 10, NULL, '', '', 0),
(136, 'Le Bon Gout Caribbean Restaurant LLC', 'services@taptapnow.com', '(407) 757-2222', '', '2048 Americana Blvd Orlando FL 32839', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '28.48586599', '-81.40660423', 1, 3.5, 10, NULL, '', '', 0),
(137, '509 Caribbean Cuisine', 'services@taptapnow.com', '(850) 765-1440', '', '2450 Springhill Rd Tallahassee FL 32305', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '30.41684262', '-84.30238563', 1, 4.5, 10, NULL, '', '', 0),
(138, 'Caribbean Crossroads- Food Truck', 'Julio@gmail.com', '850-345-5744', 'Not required', '3708 Carrington Pl, Tallahassee, FL 32303', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '30.499288 ', '-84.341797', 1, 4.5, 10, NULL, '', '', 0),
(139, 'Fify\'s', 'services@taptapnow.com', '(239) 657-3439', '', '320 Alachua St Immokalee FL 34142', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.42249210', '-81.41642340', 1, 3.5, 10, NULL, '', '', 0),
(140, 'Ce Bien Haitian Bakery', 'julio@quiver.com', '(239) 628-9679', 'Not required', 'South 316 S 1st St Immokalee FL 34142', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.413918', '-81.417025', 1, 4.5, 10, NULL, '', '', 0),
(141, 'Caribbean Union Restaurant & Bakery', 'julio@quiver.com', '(239) 674-7154', 'Not required', '2814 Lee Blvd Suite 7 Lehigh Acres FL 33971', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.617784', '-81.672138', 1, 4.5, 10, NULL, '', '', 0),
(142, 'Sak Pase Restaurant', 'julio@quiver.com', '(305) 245-2864', 'Not required', '27156 S Dixie Hwy Naranja FL 33032', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '25.514691', '-80.431804', 1, 3.5, 10, NULL, '', '', 0),
(143, 'Palms Paradise Restaurant', 'services@taptapnow.com', '(239) 895-6844', '', '3226 Fowler St Fort Myers FL 33901', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '26.61841929', '-81.86208084', 1, 3.5, 10, NULL, '', '', 0),
(144, 'Ole Restaurant & Lounge', 'services@taptapnow.com', '(404) 294-5600', '', '5481 Memorial Dr Stone Mountain GA 30083', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.81034480', '-84.18223800', 1, 5.5, 10, NULL, '', '', 0),
(145, 'La Difference Bakery & Cafe', 'services@taptapnow.com', '(678) 373-3262', '', '540 Northdale Rd C Lawrenceville GA 30046', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.96945483', '-83.99179579', 1, 5.5, 10, NULL, '', '', 0),
(146, 'JoJo Fritay', 'julio@quiver.com', '(678) 540-2341', 'Not required', '1200 Ernest W Barrett Pkwy NW suite 140 Kennesaw GA 30144', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.961218', '-83.973033', 1, 5.5, 10, NULL, '', '', 0),
(147, 'C\'est Si Bon Pastry & Restaurant', 'services@taptapnow.com', '(770) 319-8875', '', '560 Windy Hill Rd SE Smyrna GA 30080', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.89440086', '-84.53621769', 1, 5.5, 10, NULL, '', '', 0),
(148, 'Marie\'s Caribbean Kitchen', 'services@taptapnow.com', '(770) 509-0066', '', '1458 Roswell Rd Marietta GA 30062', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.96379370', '-84.49326540', 1, 3.5, 10, NULL, '', '', 0),
(149, 'The Spice House', 'services@taptapnow.com', '(678) 974-7231', '', '2247 Cascade Rd SW Atlanta GA 30311', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.72263496', '-84.46229930', 1, 3.5, 10, NULL, '', '', 0),
(150, 'La Citadelle Bakery', 'julio@quiver.com', '(678) 330-1073', 'Not required', '248 E Crogan St #1 Lawrenceville GA 30046', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.961218', '-83.973033', 1, 5.5, 10, NULL, '', '', 0),
(151, 'Haitian food store & Cuisine', 'services@taptapnow.com', '(404) 880-2364', '', '5046 Austell Rd Austell GA 30106', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '33.83264412', '-84.61188484', 1, 5.5, 10, NULL, '', '', 0),
(152, 'Caribbean Desire- Food Truck', 'Julio@gmail.com', '615-307-1264', 'Not required', 'Call for location, Nashville, TN 37222', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '36.078543', '-86.725229 ', 1, 3.5, 10, NULL, '', '', 0),
(153, 'Chez Lama Haitian Cuisine', 'services@taptapnow.com', '(615) 477-5502', '', '1333 Nicole Ln La Vergne TN 37086', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '36.04077335', '-86.55766479', 1, 5.5, 10, NULL, '', '', 0),
(154, 'Belle Fouchette', 'julio@quiver.com', '(504) 331-2683', 'Not required', '435 Wall Blvd Gretna LA 70056', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '29.878440', '-90.030320 ', 1, 4.5, 10, NULL, '', '', 0),
(155, 'Fritai Haitian Street Food', 'services@taptapnow.com', '(504) 500-0987', '', '2381 St Claude Ave New Orleans LA 70117', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '29.96952750', '-90.05221220', 1, 4.5, 10, NULL, '', '', 0),
(156, 'Kizin Creole Restaurant', 'services@taptapnow.com', '(773) 961-7275', '', '2311 Howard St Chicago IL 60645', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.56127240', '-87.26286930', 1, 4.5, 10, NULL, '', '', 0),
(157, 'Port-au-Prince Haitian Cuisine', 'services@taptapnow.com', '(301) 565-2006', '', '7912 Georgia Ave Silver Spring MD 20910', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '39.01252950', '-77.04162640', 1, 3.5, 10, NULL, '', '', 0),
(158, 'Caribbean Creole Cafe', 'services@taptapnow.com', '(443) 978-7981', '', '705 W Isabella St Salisbury MD 21801', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '38.37141016', '-75.60776735', 1, 5.5, 10, NULL, '', '', 0),
(159, 'Gisele\'s Creole Cuisine', 'Julio@gmail.com', '(301) 933-1340', 'Not required', '2407 Price Ave, Silver Spring, MD 20902', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '39.040370', '-77.050743', 1, 3.5, 10, NULL, '', '', 0),
(160, 'Kreyol Korner- Food Truck', 'Julio@gmail.com', '512-596-0094', 'Not required', '805 Stark St, Austin, TX 78756 ', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '30.325518 ', '-97.727193', 1, 5.5, 10, NULL, '', '', 0),
(162, 'Gou Lakay', 'julio@quiver.com', '(254) 307-7771', 'Not required', '810 N W S Young Dr Suite 102 Killeen TX 76543', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '31.120130', '-97.709313', 1, 4.5, 10, NULL, '', '', 0),
(163, 'Taste Of Miami Restaurant & Catering', 'julio@quiver.com', '(817) 439-7744', 'Not required', '205 S Main St #19-05 Red Oak TX 75154', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '32.510157', '-96.805769', 1, 5.5, 10, NULL, '', '', 0),
(164, 'Chez Rosaire Haitian & West Indian Food', 'services@taptapnow.com', '(215) 324-6328', '', '121 W Tabor Rd Philadelphia PA 19120', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.03227800', '-75.12318200', 1, 5.5, 10, NULL, '', '', 0),
(165, 'Haitian Sensation Coffee Shop', 'services@taptapnow.com', '(724) 983-5318', '', '869 E State St Sharon PA 16146', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.23311408', '-80.49290483', 1, 4.5, 10, NULL, '', '', 0),
(166, 'Saveur Creole', 'services@taptapnow.com', '(973) 744-3506', '', '131 Grove St Montclair NJ 7042', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.81607089', '-74.20687756', 1, 5.5, 10, NULL, '', '', 0),
(167, 'Jacob\'s Restaurant', 'services@taptapnow.com', '(973) 373-2939', '', '80 Mt Vernon Pl Newark NJ 7106', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.73655000', '-74.24145800', 1, 3.5, 10, NULL, '', '', 0),
(168, 'Haitian Caribbean Cuisine', 'services@taptapnow.com', '(973) 675-6555', '', '167 Dodd St East Orange NJ 7017', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.78180270', '-74.21007440', 1, 5.5, 10, NULL, '', '', 0),
(169, 'First Republic Lounge & Restaurant', 'services@taptapnow.com', '(908) 355-3940', '', '1204 E Grand St Elizabeth NJ 7201', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.66653300', '-74.21424710', 1, 3.5, 10, NULL, '', '', 0),
(170, 'Woulibam Restaurant - Fine Haitian & Caribbean Cuisine', 'services@taptapnow.com', '(973) 762-1568', '', '1878 Springfield Ave Maplewood NJ 7040', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.72074550', '-74.26993225', 1, 3.5, 10, NULL, '', '', 0),
(171, 'Good Shepherd Haitian Restaurant', 'services@taptapnow.com', '(908) 525-3599', '', '1314 E St Georges Ave Linden NJ 7036', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64787371', '-74.24683343', 1, 5.5, 10, NULL, '', '', 0),
(172, 'Marcky\'s Restaurant', 'services@taptapnow.com', '(862) 772-3837', '', '527 Stuyvesant Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.72884700', '-74.23620900', 1, 4.5, 10, NULL, '', '', 0),
(173, 'Elza\'s Restaurant Café & Grill', 'services@taptapnow.com', '(973) 673-3592', '', '158 Sanford St East Orange NJ 7018', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.75628691', '-74.22751582', 1, 5.5, 10, NULL, '', '', 0),
(174, 'La Bonté Restaurant', 'services@taptapnow.com', '(973) 375-2550', '', '1266 Springfield Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.72468000', '-74.24153400', 1, 5.5, 10, NULL, '', '', 0),
(175, 'Fritaille', 'services@taptapnow.com', '(973) 399-1106', '', '643 Stuyvesant Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.72515560', '-74.23697900', 1, 5.5, 10, NULL, '', '', 0),
(176, 'Amely Restaurant', 'services@taptapnow.com', '(973) 373-1130', '', '821 Sanford Ave Newark NJ 7106', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.73510641', '-74.23717423', 1, 5.5, 10, NULL, '', '', 0),
(177, 'Denise\'s Place', 'services@taptapnow.com', '(973) 374-5124', '', '1295 Springfield Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.72437600', '-74.24266900', 1, 5.5, 10, NULL, '', '', 0),
(178, 'L\'Ambiance Restaurant', 'services@taptapnow.com', '(973) 371-3004', '', '977 S Orange Ave East Orange NJ 7018', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.74641430', '-74.22799610', 1, 4.5, 10, NULL, '', '', 0),
(179, 'Le Soleil Restaurant & Bakery', 'julio@quiver.com', '(609) 587-3811', 'Not required', '175-199 Sculptors Way Hamilton Township NJ 8609', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.238979', '-74.722308', 1, 4.5, 10, NULL, '', '', 0),
(180, 'Intimate', 'services@taptapnow.com', '(973) 849-6147', '', '730 Chancellor Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.71603600', '-74.23832750', 1, 4.5, 10, NULL, '', '', 0),
(181, 'Mommie Joe\'s', 'services@taptapnow.com', '(609) 695-6561', '', '1036 S Broad St # A Trenton NJ 8611', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.20505800', '-74.74514217', 1, 3.5, 10, NULL, '', '', 0),
(182, 'Prestige Restaurant', 'services@taptapnow.com', '(609) 407-1766', '', '4 Pleasant Ave Pleasantville NJ 8232', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '39.39384322', '-74.52093844', 1, 4.5, 10, NULL, '', '', 0),
(183, 'JP\'s Home Cooked Meals', 'services@taptapnow.com', '(973) 634-8137', '', '1043 Stuyvesant Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.71482972', '-74.25001677', 1, 4.5, 10, NULL, '', '', 0),
(184, 'Jules Restaurant', 'julio@quiver.com', '(908) 576-7096', 'Not required', '2418 150 Jefferson Ave Elizabeth None', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.666496', '-74-212059', 1, 3.5, 10, NULL, '', '', 0),
(185, 'David\'s Five Star Restaurant', 'services@taptapnow.com', '(973) 395-2630', '', '372 Dr Martin Luther King Jr Blvd East Orange NJ 7018', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.76437900', '-74.21510900', 1, 4.5, 10, NULL, '', '', 0),
(186, 'L\'assiette Restaurant', 'services@taptapnow.com', '(973) 351-5107', '', '855 18th Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.73753286', '-74.22243714', 1, 3.5, 10, NULL, '', '', 0),
(187, 'Flavor Of Choice', 'services@taptapnow.com', '(973) 757-2853', '', '1179 Stuyvesant Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.71469064', '-74.25197596', 1, 3.5, 10, NULL, '', '', 0);
INSERT INTO `restaurant` (`id_restaurant`, `name_restaurant`, `email_restaurant`, `tel_restaurant`, `website_restaurant`, `adresse_restaurant`, `img_restaurant`, `logo_restaurant`, `create_restaurant`, `updated_restaurant`, `countryRestID`, `adminRestID`, `lat_restaurant`, `long_restaurant`, `open_restaurant`, `rate`, `tax`, `zipcode`, `city`, `state`, `isActive`) VALUES
(188, 'Juliana\'s Place', 'services@taptapnow.com', '(973) 634-8137', '', '1043 Stuyvesant Ave Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.71482972', '-74.25001677', 1, 5.5, 10, NULL, '', '', 0),
(189, 'Tijo\'s Kreyol Kitchen', 'services@taptapnow.com', '(732) 774-2200', '', '1400 Asbury Ave Asbury Park NJ 7712', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.22252000', '-74.02239200', 1, 3.5, 10, NULL, '', '', 0),
(190, 'Young Delise\'s Caribbean Restaurant', 'services@taptapnow.com', '(973) 373-0037', '', '12 Becker Terrace Irvington NJ 7111', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.72389000', '-74.24882110', 1, 5.5, 10, NULL, '', '', 0),
(191, 'Family Manor Restaurant', 'services@taptapnow.com', '(973) 371-2179', '', '795 Sanford Ave Newark NJ 7106', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.73811800', '-74.23568700', 1, 4.5, 10, NULL, '', '', 0),
(192, 'Two Brothers Restaurant', 'services@taptapnow.com', '(908) 353-5359', '', '255 N Broad St Elizabeth NJ 7201', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.66735408', '-74.21516867', 1, 5.5, 10, NULL, '', '', 0),
(193, 'i Kreole Cuisine', 'services@taptapnow.com', '(973) 374-8311', '', '1084 S Orange Ave Newark NJ 7106', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.74615812', '-74.23152660', 1, 4.5, 10, NULL, '', '', 0),
(194, 'King and Queen Haitian Restaurant- Food Truck', 'Julio@gmail.com', '336-588-9868', 'Not required', '211 W Gate City Blvd Greensboro, North Carolina 27406 ', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '36.064610', '-79.792860', 1, 4.5, 10, NULL, '', '', 0),
(195, 'Island Flavors Caribbean Cuisine- Food Truck', 'Julio@gmail.com', '818-477-8076', 'Not required', 'Call for location,Los Angeles, CA 91401', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '34.179397', '-118.432342', 1, 4.5, 10, NULL, '', '', 0),
(196, 'Dhat Island Caribbean Creole', 'julio@quiver.com', '(909) 798-6060', 'Not required', '308 W State St Redlands CA 92373', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '34.056748', '-117.185984', 1, 4.5, 10, NULL, '', '', 0),
(197, 'Le Soleil', 'services@taptapnow.com', '(212) 581-6059', '', '858 10th Ave New York NY 10019', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.76858255', '-73.98862140', 1, 4.5, 10, NULL, '', '', 0),
(198, 'La Caye', 'services@taptapnow.com', '(718) 858-4160', '', '35 Lafayette Ave Brooklyn NY 11217', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.68703560', '-73.97760090', 1, 3.5, 10, NULL, '', '', 0),
(199, 'Chloe\'s', 'services@taptapnow.com', '(347) 770-9051', '', '9413 Avenue L Brooklyn NY 11236', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.63753740', '-73.89730370', 1, 4.5, 10, NULL, '', '', 0),
(200, 'Grandchamps', 'services@taptapnow.com', '(718) 484-4880', '', '197 Patchen Ave Brooklyn NY 11233', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.68471100', '-73.92627780', 1, 3.5, 10, NULL, '', '', 0),
(201, 'Kombit', 'services@taptapnow.com', '(718) 399-2000', '', '279 Flatbush Ave Brooklyn NY 11217', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.67936550', '-73.97381550', 1, 4.5, 10, NULL, '', '', 0),
(202, 'Creole Fusion Haitian American Cuisine', 'services@taptapnow.com', '(718) 464-2900', '', '111-44 Springfield Blvd Queens Village NY 11429', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.71676890', '-73.73545220', 1, 3.5, 10, NULL, '', '', 0),
(203, 'Kreyol Flavor', 'services@taptapnow.com', '(718) 856-2100', '', '2816 Church Ave Brooklyn NY 11226', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.65047320', '-73.95080382', 1, 5.5, 10, NULL, '', '', 0),
(204, 'Bebe Fritay', 'services@taptapnow.com', '(718) 484-0242', '', '82b E 18th St Brooklyn NY 11226', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64893235', '-73.96308700', 1, 4.5, 10, NULL, '', '', 0),
(205, 'Taste Of The City Fresh Grill', 'services@taptapnow.com', '(718) 484-1776', '', '1368 Flatbush Ave Brooklyn NY 11210', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.63684740', '-73.95228095', 1, 5.5, 10, NULL, '', '', 0),
(206, 'Yolie\'s Resaturant & Bar', 'services@taptapnow.com', '(347) 529-2510', '', '5722 Clarendon Rd Brooklyn NY 11203', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64478908', '-73.92254206', 1, 4.5, 10, NULL, '', '', 0),
(207, 'Katou', 'services@taptapnow.com', '(718) 618-0920', '', '5012 Avenue M Brooklyn NY 11234', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.62116135', '-73.92661075', 1, 4.5, 10, NULL, '', '', 0),
(208, 'Lantillaise Caterers and Restaurant', 'services@taptapnow.com', '(516) 216-5444', '', '20 New Hyde Park Rd Franklin Square NY 11010', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.70802700', '-73.67557400', 1, 3.5, 10, NULL, '', '', 0),
(209, 'Brasserie Creole', 'services@taptapnow.com', '(718) 341-1376', '', '22702 Linden Blvd Jamaica NY 11411', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.68280620', '-73.80620400', 1, 3.5, 10, NULL, '', '', 0),
(210, 'Creole Plate', 'julio@quiver.com', '(718) 341-8566', 'Not required', '23306 Merrick Blvd Rosedale NY 11422', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.674643', '-73.736642', 1, 4.5, 10, NULL, '', '', 0),
(211, 'Le Spot', 'services@taptapnow.com', '(516) 233-1003', '', '476 Hempstead Turnpike Elmont NY 11003', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.70704940', '-73.69684650', 1, 4.5, 10, NULL, '', '', 0),
(212, 'Belvedere Restaurant', 'services@taptapnow.com', '(718) 464-9795', '', '21854 Hempstead Ave Queens Village NY 11429', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.71254900', '-73.73294000', 1, 5.5, 10, NULL, '', '', 0),
(213, 'Mixed Notes Cafe', 'services@taptapnow.com', '(516) 328-2233', '', '333 Elmont Rd Elmont NY 11003', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.70113601', '-73.71286162', 1, 5.5, 10, NULL, '', '', 0),
(214, 'Flanm Cuisine & Catering', 'services@taptapnow.com', '(718) 740-2500', '', '215-07 Jamaica Ave Queens Village NY 11428', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.71741045', '-73.74057334', 1, 4.5, 10, NULL, '', '', 0),
(215, 'Immaculee', 'services@taptapnow.com', '(718) 778-7188', '', '1227 Nostrand Ave Brooklyn NY 11225', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.65728355', '-73.95000861', 1, 3.5, 10, NULL, '', '', 0),
(216, 'Labadi Restaurant & Lounge', 'services@taptapnow.com', '(718) 464-4400', '', '207-13 Jamaica Ave Queens Village NY 11428', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.72286070', '-73.72901540', 1, 4.5, 10, NULL, '', '', 0),
(217, 'Bebe Fritay', 'services@taptapnow.com', '(718) 513-3655', '', '1464 Rockaway Pkwy Brooklyn NY 11236', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64439420', '-73.90177257', 1, 3.5, 10, NULL, '', '', 0),
(218, 'Lakay Venus', 'services@taptapnow.com', '(718) 287-4949', '', '637 Rogers Ave Brooklyn NY 11226', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.65593310', '-73.95277295', 1, 5.5, 10, NULL, '', '', 0),
(219, 'Nous Les Amis', 'services@taptapnow.com', '(347) 627-9425', '', '2187 Clarendon Rd Brooklyn NY 11226', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64295095', '-73.95673845', 1, 4.5, 10, NULL, '', '', 0),
(221, 'La Tranquilité L\'Impressioniste', 'services@taptapnow.com', '(718) 531-8767', '', '9128 Avenue L Brooklyn NY 11236', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.63606660', '-73.89888957', 1, 5.5, 10, NULL, '', '', 0),
(222, 'Fritaille 5 Star', 'services@taptapnow.com', '(718) 975-0916', '', '1347 Flatbush Ave Brooklyn NY 11210', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.63816735', '-73.95303620', 1, 4.5, 10, NULL, '', '', 0),
(223, 'Tonel', 'services@taptapnow.com', '(646) 548-1203', '', '1236 Rogers Ave Brooklyn NY 11226', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.63966550', '-73.95144620', 1, 4.5, 10, NULL, '', '', 0),
(224, 'Combite Creole', 'services@taptapnow.com', '(347) 350-5547', '', '1728 Nostrand Ave Brooklyn NY 11226', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64385070', '-73.94898620', 1, 3.5, 10, NULL, '', '', 0),
(225, 'Bebe Fritay', 'julio@quiver.com', '(718) 489-4111', 'Not required', '112-26 Francis Lewis Blvd Queens Village NY 11429', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.703463', '-73.749769', 1, 3.5, 10, NULL, '', '', 0),
(226, 'Oohlala Restaurant & Bakery', 'services@taptapnow.com', '(718) 484-8811', '', '363 Utica Ave Brooklyn NY 11213', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.66567150', '-73.93113425', 1, 5.5, 10, NULL, '', '', 0),
(227, 'JJ\'s Fritaille', 'services@taptapnow.com', '(347) 636-2850', '', '4021 Glenwood Rd Brooklyn NY 11210', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.63477040', '-73.93754540', 1, 3.5, 10, NULL, '', '', 0),
(228, 'Friends Paradise Restaurant', 'services@taptapnow.com', '(929) 405-0064', '', '21147 Jamaica Ave Queens Village NY 11428', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.72286070', '-73.72901540', 1, 5.5, 10, NULL, '', '', 0),
(229, 'BG Café Creole', 'services@taptapnow.com', '(718) 434-1366', '', '1366 Flatbush Ave Brooklyn NY 11210', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.63689035', '-73.95232665', 1, 5.5, 10, NULL, '', '', 0),
(230, 'Nanas Bistro and Catering', 'services@taptapnow.com', '(718) 749-5382', '', '205-20 Jamaica Ave Hollis NY 11423', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.71330430', '-73.76654450', 1, 3.5, 10, NULL, '', '', 0),
(231, 'Pikliz Cafe and Lounge', 'services@taptapnow.com', '(347) 627-2191', '', '903 Franklin Ave Brooklyn NY 11225', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.66776500', '-73.95886510', 1, 4.5, 10, NULL, '', '', 0),
(232, 'Ky’s TakeOut Haitian Restaurant', 'julio@quiver.com', '(347) 334-4101', 'Not required', '89-02 165th St Jamaica NY 11432', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.707163', '-73.796458', 1, 5.5, 10, NULL, '', '', 0),
(233, 'Family Altagracia', 'services@taptapnow.com', '(718) 484-4820', '', '5601 Clarendon Rd Brooklyn NY 11203', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64496980', '-73.92358900', 1, 3.5, 10, NULL, '', '', 0),
(234, 'Taste the Island Bakery', 'julio@quiver.com', '(516) 489-5925', 'Not required', '460 S Peninsula Blvd Hempstead NY 11550', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.701314', '-73.627559', 1, 3.5, 10, NULL, '', '', 0),
(235, 'La P\'tite Baguette Shop', 'services@taptapnow.com', '(718) 977-1169', '', '229-24 Linden Blvd Cambria Heights NY 11411', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.69237360', '-73.73173270', 1, 5.5, 10, NULL, '', '', 0),
(236, 'Meli Melo', 'services@taptapnow.com', '(516) 405-0158', '', '153 Dubois Ave Valley Stream NY 11581', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64918800', '-73.70473700', 1, 4.5, 10, NULL, '', '', 0),
(237, 'Mirelle\'s Restaurant', 'services@taptapnow.com', '(516) 338-4933', '', '170 Post Ave Westbury NY 11590', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.75510676', '-73.58774182', 1, 3.5, 10, NULL, '', '', 0),
(238, 'Sak-Pasé Restaurant', 'services@taptapnow.com', '(516) 544-4033', '', '1929 Grand Ave Baldwin NY 11510', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.66328500', '-73.60757071', 1, 5.5, 10, NULL, '', '', 0),
(239, 'Kreyol Taste Restaurant', 'services@taptapnow.com', '(516) 489-3542', '', '498 Uniondale Ave Uniondale NY 11553', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.70316300', '-73.59297400', 1, 3.5, 10, NULL, '', '', 0),
(240, 'Bassin Bleu', 'julio@quiver.com', '(516) 493-9332', 'Not required', '6439 310 Jerusalem Ave Hempstead None', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.702131', '-73.606316', 1, 5.5, 10, NULL, '', '', 0),
(241, 'THE LOFT BKNY', 'services@taptapnow.com', '(347) 350-7027', '', '1712 Nostrand Ave Brooklyn NY 11226', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '40.64418855', '-73.94911945', 1, 3.5, 10, NULL, '', '', 0),
(242, 'Ronald\'s Haitian Cuisine', 'julio@quiver.com', '(203) 873-0400', 'Not required', '1147 Madison Ave A Bridgeport CT 6606', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.196354', '-73.207645', 1, 3.5, 10, NULL, '', '', 0),
(243, 'Chez Coby', 'services@taptapnow.com', '(203) 956-5625', '', '111 CT-123 Norwalk CT 6851', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.12232171', '-73.41512290', 1, 4.5, 10, NULL, '', '', 0),
(244, 'Milah\'s Cuisine', 'services@taptapnow.com', '(203) 572-0880', '', '252 Lindley St Bridgeport CT 6606', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.19604000', '-73.19189300', 1, 4.5, 10, NULL, '', '', 0),
(245, 'Creole Fusion Cuisine LLC', 'services@taptapnow.com', '(203) 506-3966', '', '1985 Main St Bridgeport CT 6604', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.19044040', '-73.19637570', 1, 3.5, 10, NULL, '', '', 0),
(246, 'Jean\'s Cuisine', 'services@taptapnow.com', '(203) 290-5022', '', '1063 Howard Ave Bridgeport CT 6605', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.16427940', '-73.20783890', 1, 5.5, 10, NULL, '', '', 0),
(247, 'Petit Bakery/ Restaurant', 'services@taptapnow.com', '(401) 721-9897', '', '234 East Ave Pawtucket RI 2860', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.87208961', '-71.38663981', 1, 5.5, 10, NULL, '', '', 0),
(248, 'Garden Of Eve Caribbean Cuisine', 'julio@quiver.com', '(401) 688-5166', 'Not required', '405 Harris Ave Providence RI 2909', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '41.825079', '-71.433846', 1, 3.5, 10, NULL, '', '', 0),
(249, 'Farah\'s Cafe Restaurant', 'services@taptapnow.com', '(617) 910-3203', '', '1158 River St Hyde Park MA 2136', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.25652809', '-71.12034161', 1, 3.5, 10, NULL, '', '', 0),
(250, 'Natifnatal', 'services@taptapnow.com', '(617) 326-6929', '', '830 Blue Hill Avenue Dorchester MA 2124', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.27484400', '-71.09345100', 1, 5.5, 10, NULL, '', '', 0),
(251, 'Highland Creole Cuisine', 'services@taptapnow.com', '(617) 625-8333', '', '2 Highland Ave Somerville MA 2143', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.38438260', '-71.09263800', 1, 3.5, 10, NULL, '', '', 0),
(252, 'Nu Flav Restaurant', 'services@taptapnow.com', '(617) 506-7092', '', '1100 Blue Hill Avenue Boston MA 2124', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.28165100', '-71.09220400', 1, 4.5, 10, NULL, '', '', 0),
(253, 'Las Vegas Express Restaurant', 'services@taptapnow.com', '(617) 322-3133', '', '1592 Blue Hill Avenue Mattapan MA 2126', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.26969618', '-71.09390713', 1, 4.5, 10, NULL, '', '', 0),
(254, 'Lala Caribbean restaurant', 'services@taptapnow.com', '(617) 265-8171', '', '792 Washington St Dorchester Center MA 2124', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.28416954', '-71.07145789', 1, 5.5, 10, NULL, '', '', 0),
(255, 'Pikliz International Kitchen', 'services@taptapnow.com', '(617) 625-6255', '', '288 Broadway Somerville MA 2145', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.39168280', '-71.09225049', 1, 3.5, 10, NULL, '', '', 0),
(256, 'Le Foyer Bakery', 'services@taptapnow.com', '(617) 298-0535', '', '132 Babson St Mattapan MA 2126', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.27018530', '-71.09264014', 1, 4.5, 10, NULL, '', '', 0),
(257, 'Jeano\'s Restaurant', 'services@taptapnow.com', '(508) 559-2610', '', '769 Main St Brockton MA 2301', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.07010455', '-71.01802978', 1, 5.5, 10, NULL, '', '', 0),
(258, 'Toutwèl Restaurant', 'services@taptapnow.com', '(617) 698-8800', '', '643 River St Mattapan MA 2126', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.26741430', '-71.09437080', 1, 4.5, 10, NULL, '', '', 0),
(259, 'La Belle Creole', 'services@taptapnow.com', '(617) 696-0129', '', '473 River St Mattapan MA 2126', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.26899513', '-71.09196927', 1, 5.5, 10, NULL, '', '', 0),
(260, 'Divine Merci Restaurant', 'services@taptapnow.com', '(617) 296-1300', '', '1296 Blue Hill Avenue Mattapan MA 2126', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.28276091', '-71.09217017', 1, 3.5, 10, NULL, '', '', 0),
(261, 'J&R Restaurant and Baker', 'services@taptapnow.com', '(781) 397-7557', '', '188 Salem St Malden MA 2148', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.42957354', '-71.06111325', 1, 4.5, 10, NULL, '', '', 0),
(262, 'Bon Appetit Restaurant', 'services@taptapnow.com', '(617) 825-5544', '', '1138 Blue Hill Avenue Dorchester Center MA 2124', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.28641698', '-71.09093197', 1, 5.5, 10, NULL, '', '', 0),
(263, 'Infused Kreyol Restaurant', 'services@taptapnow.com', '(781) 388-0938', '', '423 Main St Malden MA 2148', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.42663510', '-71.06690390', 1, 5.5, 10, NULL, '', '', 0),
(264, 'Sunrise Cuisine', 'services@taptapnow.com', '(617) 623-2992', '', '76 Middlesex Ave Somerville MA 2145', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.39332418', '-71.08335518', 1, 5.5, 10, NULL, '', '', 0),
(265, 'The Island Caribbean Cuisine and Drinks', 'services@taptapnow.com', '(781) 605-2212', '', '118 Ferry St Malden MA 2148', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.42480360', '-71.06471340', 1, 4.5, 10, NULL, '', '', 0),
(266, 'Audy\'s Cuisine', 'services@taptapnow.com', '(781) 596-0200', '', '468 Chestnut St Lynn MA 1902', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.47590365', '-70.94723633', 1, 5.5, 10, NULL, '', '', 0),
(267, 'Brothers Kafe Kreyol', 'services@taptapnow.com', '(617) 294-1425', '', '299 Main St Everett MA 2149', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.41098210', '-71.06249485', 1, 3.5, 10, NULL, '', '', 0),
(268, 'Signature Kitchen', 'services@taptapnow.com', '(508) 232-3298', '', '1289 Main St Brockton MA 2301', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.05968620', '-71.01466823', 1, 4.5, 10, NULL, '', '', 0),
(269, 'P & C Market & Caribbean Cuisine', 'services@taptapnow.com', '(781) 480-4398', '', '35 Lebanon St Malden MA 2148', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.43428725', '-71.04560985', 1, 4.5, 10, NULL, '', '', 0),
(270, 'Sunset Caribbean Hatian Restaurants', 'services@taptapnow.com', '(857) 241-7848', '', '49 Union St Lynn MA 1902', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.46832715', '-70.93879977', 1, 4.5, 10, NULL, '', '', 0),
(271, 'Delicious Restaurant', 'services@taptapnow.com', '(508) 857-1687', '', '1753 Main St Brockton MA 2301', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.05081335', '-71.01176969', 1, 5.5, 10, NULL, '', '', 0),
(272, 'Top Griyo Restaurant', 'services@taptapnow.com', '(617) 822-6985', '', '994 Blue Hill Avenue Dorchester Center MA 2124', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.29100975', '-71.08940986', 1, 3.5, 10, NULL, '', '', 0),
(273, 'Sony\'s Cafe', 'services@taptapnow.com', '(508) 588-5714', '', '6 Hovendon Ave Brockton MA 2302', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.11024780', '-71.01904560', 1, 4.5, 10, NULL, '', '', 0),
(274, 'Las Vegas Seafood Restaurant', 'services@taptapnow.com', '(617) 361-1888', '', '6 Maple St Hyde Park MA 2136', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.25496096', '-71.12233528', 1, 4.5, 10, NULL, '', '', 0),
(275, 'Saveur et Couleur Catering', 'julio@quiver.com', '(857) 249-0196', 'Not required', '580 S Main St Randolph MA 2368', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.142999', '-71.04049', 1, 3.5, 10, NULL, '', '', 0),
(276, 'Little Haiti International Cuisine', 'services@taptapnow.com', '(617) 364-1313', '', '1184 Hyde Park Ave Hyde Park MA 2136', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.25827970', '-71.12332120', 1, 4.5, 10, NULL, '', '', 0),
(277, 'Tamboo Bistro', 'services@taptapnow.com', '(508) 584-8585', '', '252 Main St Brockton MA 2301', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.08033710', '-71.01997072', 1, 4.5, 10, NULL, '', '', 0),
(278, 'Fan Fan Bakery', 'services@taptapnow.com', '(617) 361-1903', '', '15 Harvard Ave Hyde Park MA 2136', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '42.25696286', '-71.12247096', 1, 3.5, 10, NULL, '', '', 0),
(279, 'Agrikol', 'services@taptapnow.com', '+1 514-903-6707', '', '1844 Rue Amherst Montréal QC H2L', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.51969120', '-73.56219900', 1, 3.5, 10, NULL, '', '', 0),
(280, 'Kwizinn Resto Bar Créole', 'Julio@gmail.com', '+1 514-379-6670', 'Not required', '6670 St Hubert St, Montreal, QC H2S 2M3, Canada	', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.537360 ', '-73.606186 ', 1, 4.5, 10, NULL, '', '', 0),
(281, 'La Bonne Bouffe Creole', 'Julio@gmail.com', '+1 514-656-7347', 'Not required', '3715 St Catherine St E, Montreal, QC H1W 2E5, Canada	', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.544525', '-73.538165 ', 1, 4.5, 10, NULL, '', '', 0),
(282, 'Margo Caribbean & Canadian', 'Julio@gmail.com', '+1 613-241-1400', 'Not required', '606 Rideau St, Ottawa, ON K1N 6A2, Canada	', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.432875 ', '-75.675115 ', 1, 5.5, 10, NULL, '', '', 0),
(283, 'Caribbean\'s Finest', 'Julio@gmail.com', '+1 780-628-5888', 'Not required', '8815 118 Ave NW, Edmonton, AB T5B 0T3, Canada	', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '53.570281', '-113.477388	', 1, 3.5, 10, NULL, '', '', 0),
(284, 'Restaurant Steve Anna', 'Julio@gmail.com', '+1 514-725-3776', 'Not required', ' 3302 Rue Bélanger, Montréal, QC H1X 1A1, Canada', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.557883', '-73.593159 ', 1, 5.5, 10, NULL, '', '', 0),
(285, 'Chez Milie Casse-Croûte', 'Julio@gmail.com', '+1 514-593-9617', 'Not required', 'Address: 3183 Rue Jarry E, Montréal, QC H1Z 2E1, Canada								 ', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.563105 ', '-73.610448', 1, 4.5, 10, NULL, '', '', 0),
(286, 'Soleil des Iles', 'Julio@gmail.com', '+1 613-744-4439', 'Not required', '287 Queen Mary St, Ottawa, ON K1K 1X1, Canada', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.425315 ', '-75.652562 ', 1, 5.5, 10, NULL, '', '', 0),
(287, 'Alabon Libon Caribbean Cuisine', 'Julio@gmail.com', '+1 416-253-0998', 'Not required', '1837 Lawrence Ave E, Scarborough, ON M1R 2Y3, Canada', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '43.743126 ', '-79.303045', 1, 3.5, 10, NULL, '', '', 0),
(288, 'Casse-croûte Sissi Et Paul', 'Julio@gmail.com', '+1 514-903-2517', 'Not required', '2517 Jean Talon St E, Montreal, QC H2A 1T6, Canada', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.553933 ', '-73.602052', 1, 3.5, 10, NULL, '', '', 0),
(289, 'Assiette Creole - Haitian Antillaise Carribbean Resto -', 'Julio@gmail.com', '+1 514-607-3039', 'Not required', '1486 De l\'Église St, Saint-Laurent, QC H4L 2H6, Canada', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.511630 ', '-73.677940', 1, 3.5, 10, NULL, '', '', 0),
(290, 'Maranatha Caribbean Restaurant', 'Julio@gmail.com', '+1 647-660-5530', 'Not required', ' 4-4379 Kingston Rd, Scarborough, ON M1E 1Z9, Canada	', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '43.721280', '-79.237040', 1, 5.5, 10, NULL, '', '', 0),
(291, 'Tassot Creole (Greenfield Park)', 'Julio@gmail.com', '+1 450-466-1100', 'Not required', '3918B Taschereau Blvd, Greenfield Park, QC J4V 2H9, Canada		', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.495242', '-73.482472', 1, 5.5, 10, NULL, '', '', 0),
(292, 'Meli-Melo Market', 'Julio@gmail.com', '+1 514-277-6409', 'Not required', '640 Rue Jarry E, Montréal, QC H2P 1V7, Canada', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.544682', '-73.627458 ', 1, 5.5, 10, NULL, '', '', 0),
(294, 'Orhema Resto-Lounge', 'Julio@gmail.com', '+1 450-973-8490', 'Not required', '3481 Boulevard Cartier O, Laval, QC H7V 3T4, Canada	', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.539189', '-73.735911 ', 1, 3.5, 10, NULL, '', '', 0),
(295, 'Fourchette Antillaise', 'Julio@gmail.com', '+1 514-337-9393', 'Not required', ' 5968 Rue de Salaberry, Montréal, QC H4J 1J8, Canada	', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.526923 ', '-73.713038', 1, 3.5, 10, NULL, '', '', 0),
(296, 'Le Fils à Maman Laval', 'Julio@gmail.com', '+1 450-238-6262', 'Not required', '70 Boulevard de la Concorde E, Laval, QC H7G 2B7, Canada', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '45.571994 ', '-73.689915 ', 1, 3.5, 10, NULL, '', '', 0),
(297, 'Cocinería PyC Comida Haitiano Chilena', 'services@taptapnow.com', '+56 9 8947 8351', '', 'Santo Domingo 1298 Santiago Región Metropolitana', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '-33.43673706', '-70.65548236', 1, 4.5, 10, NULL, '', '', 0),
(298, 'Comida Haitiana San Bernardo', 'services@taptapnow.com', '+56 9 7473 8379', '', 'Balmaceda 1271 San Bernardo Región Metropolitana', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '-33.58579160', '-70.70012140', 1, 3.5, 10, NULL, '', '', 0),
(299, 'Maison Kreyol', 'services@taptapnow.com', '+1 809-221-0459', '', 'Calle Mercedes 255 Santo Domingo Dominican Republic', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '18.53885250', '-69.83167890', 1, 5.5, 10, NULL, '', '', 0),
(300, 'Manje Ayisyen', 'services@taptapnow.com', '+1 829-701-8679', '', 'Gregorio Martin Sosúa 57000 Dominican Republic', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '19.76920580', '-70.51104770', 1, 4.5, 10, NULL, '', '', 0),
(301, 'Au Paradis Tropical', 'services@taptapnow.com', '+33 1 42 57 87 24', '', '6 Rue Custine Paris France 75018', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.88781960', '2.34892300', 1, 3.5, 10, NULL, '', '', 0),
(302, 'Le Petit Prince', 'services@taptapnow.com', '+33 1 48 37 85 92', '', '55 Avenue Jean Mermoz La France 93120', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.93270270', '2.41145640', 1, 5.5, 10, NULL, '', '', 0),
(303, 'Casa Natachou', 'services@taptapnow.com', '+33 5 62 88 04 26', '', '32 Rue des Polinaires Toulouse France 31000', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '43.59788100', '1.44373100', 1, 4.5, 10, NULL, '', '', 0),
(304, 'Planète Afrika Haïti ', 'julio@quiver.com', '+33 1 75 34 75 67', 'Not required', '4 bis Chemin de Saint-Léger Stains France 93240', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.944865', '2.376853', 1, 5.5, 10, NULL, '', '', 0),
(305, 'Le 1804', 'services@taptapnow.com', '+33 1 72 51 03 40', '', '66 Avenue Jean Jacques Rousseau Livry-Gargan France 93190', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.92635640', '2.54510290', 1, 3.5, 10, NULL, '', '', 0),
(306, 'Gout Tropical', 'services@taptapnow.com', '+33 6 95 88 91 28', '', '3 Rue du 4 Septembre Saint-Denis France 93200', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.93093070', '2.35418080', 1, 4.5, 10, NULL, '', '', 0),
(307, 'Le Port au Prince', 'services@taptapnow.com', '+33 9 50 71 73 02', '', '21 Boulevard de la République Noisy-le-Sec France 93130', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.89513740', '2.46252520', 1, 4.5, 10, NULL, '', '', 0),
(308, 'Restaurant Vin Wè', 'services@taptapnow.com', '+33 6 12 62 38 38', '', '63 Rue Saint-Sernin Bordeaux France 33000', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '44.84118910', '-0.58261680', 1, 4.5, 10, NULL, '', '', 0),
(309, 'Tropik Foods', 'services@taptapnow.com', '+33 1 84 21 06 20', '', '14 Boulevard Jules Guesde Saint-Denis France 93200', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.93461460', '2.35032160', 1, 4.5, 10, NULL, '', '', 0),
(310, 'Au Bon Goût Chez Tit Sœur', 'services@taptapnow.com', '+33 6 19 03 01 67', '', '3 Avenue Fauveau Épinay-sur-Seine France 93800', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.95111830', '2.33060470', 1, 3.5, 10, NULL, '', '', 0),
(311, 'Paradis des Antilles', 'services@taptapnow.com', '+33 1 48 20 39 00', '', '62 Rue Gabriel Péri Saint-Denis France 93200', '', '1580761226938icon_white_180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, '48.93482360', '2.35598190', 1, 4.5, 10, NULL, '', '', 0),
(313, 'Mama Carmen', 'Julio@gmail.com', ' 323-572-8583', 'Not required', '6500 South Western Ave Los Angeles CA 90047', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-11 15:52:00', '0000-00-00 00:00:00', 2, 3, '33.98042000', '-118.308630', 1, 4, 10, NULL, '', '', 0),
(314, 'Tasty Kreyol', 'Julio@gmail.com', '808-784-1691', 'Not required', 'Kapolei Parkway, Ewa Beach, HI 96706', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 07:17:14', '0000-00-00 00:00:00', 2, 3, '21.3331661', '-158.061374', 1, 4, 0, NULL, '', '', 0),
(315, 'Rendez Vous Creole', 'Julio@gmail.com', '504-281-4831', 'Not required', '3042 Gen Collins Ave  New Orleans, LA 70114', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 07:38:13', '0000-00-00 00:00:00', 2, 3, '29.923939', '-90.015123', 1, 4, 0, NULL, '', '', 0),
(316, 'Sobeachy Haitian Cuisine ', 'Julio@gmail.com', '443-648-6848', 'Not required', '1065 S Charles St Baltimore, MD 21230', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 07:46:45', '0000-00-00 00:00:00', 2, 3, '39.27642', '-76.614035', 1, 4, 0, NULL, '', '', 0),
(317, 'Taste My Kitchen', 'Julio@gmail.com', '770-676-9149', 'Not required', '3400 Centerville Hwy. Snellville, GA 30039', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 07:50:01', '0000-00-00 00:00:00', 2, 3, '33.807525', '-84.042929', 1, 4, 0, NULL, '', '', 0),
(318, 'Caribbean Spices', 'julio@quiver.com', '628-253-5385', 'Not required', '819 4th Street. San Rafael, CA 94901', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 07:52:26', '0000-00-00 00:00:00', 2, 3, '37.972517', '-122.524404', 1, 4, 10, NULL, '', '', 0),
(319, 'La Cayenne Take Out', 'Julio@gmail.com', '267-240-7246', 'Not required', '5835 Rising Sun Ave Philadelphia, PA 19120', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 07:55:41', '0000-00-00 00:00:00', 2, 3, '40.043374', '-75.103207', 1, 4, 0, NULL, '', '', 0),
(320, '1804 Caribbean Cuisine ', 'Julio@gmail.com', '678-691-9071', 'Not required', '3435 Medlock Bridge Rd #204, Peachtree Corners, GA 30092', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 07:58:50', '0000-00-00 00:00:00', 2, 3, '33.969029', '-84.208783', 1, 4, 0, NULL, '', '', 0),
(321, 'Chez Olga', 'Julio@gmail.com', '616-233-4141', 'Not required', '1441 Wealthy St SE, Grand Rapids, MI 49506', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 08:01:14', '0000-00-00 00:00:00', 2, 3, '42.955676', '-85.633392', 1, 4, 0, NULL, '', '', 0),
(322, 'Chez Marjo', 'Julio@gmail.com', '33623540099', 'Not required', '1 Place de la Gare, Roissy-en-Brie, France 77680', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-20 14:46:42', '0000-00-00 00:00:00', 2, 3, '48.795160', '2.650483', 1, 4, 0, NULL, '', '', 0),
(323, 'A Taste of Haiti- Food Truck', 'Julio@gmail.com', '614-962-0450', 'Not required', '4381 Waldorf St Columbus OH 43224', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-21 02:14:09', '0000-00-00 00:00:00', 2, 3, '40.057580', '-82.962681', 1, 4, 0, NULL, '', '', 0),
(324, 'Mathilde’s Kitchen', 'Julio@gmail.com', '340-244-4802', 'Not required', '7238 SE Foster Rd Portland OR 97206', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-21 02:23:17', '0000-00-00 00:00:00', 2, 3, '45.485931', '-122.588220', 1, 4, 0, NULL, '', '', 0),
(325, 'Restaurant Adonai', 'Julio@gmail.com', '514-326-8880', 'Not required', '4797 Boul Henri-Bourassa E, Montreal-Nord QC H1H 1M4', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-21 23:57:15', '0000-00-00 00:00:00', 1, 1, '45.601390', '-73.636321', 1, 4, 0, NULL, '', '', 0),
(326, 'Sous Le Palmier', 'Julio@gmail.com', '514-595-3444', 'Not required', '2038 Rue Lapierre, LaSalle, QC H8N 2S2, Canada', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-22 04:18:09', '0000-00-00 00:00:00', 1, 3, '45.436614', '-76.615211', 1, 4, 0, NULL, '', '', 0),
(327, 'Haitian Caribbean Restaurant ', 'Julio@gmail.com', '2817419782', 'Not required', '12600 Bissonnet St #C4, Houston, TX 77099', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-22 15:40:47', '0000-00-00 00:00:00', 2, 3, '29.678387', '-95.600528', 1, 4, 0, NULL, '', '', 0),
(328, 'Akra Haitian Deli', 'julio@quiver.com', '631 639-9247', 'Not required', '137 Broadway, Huntington Station, NY 11746', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-24 18:41:48', '0000-00-00 00:00:00', 2, 3, ' 40.854630', '-73.407372', 1, 4, 10, NULL, '', '', 0),
(329, 'Rhum Corner', 'julio@quiver.com', '647-346-9356', 'Not required', '926 Dundas St W, Toronto, ON M6J 1W3, Canada ', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-24 18:42:51', '0000-00-00 00:00:00', 2, 3, '43.651007', '-79.413201', 1, 4, 10, NULL, '', '', 0),
(330, 'Beyond Me Haitian Cuisine', 'julio@quiver.com', '(765) 716-9822', 'Not required', '4225 Lafayette Rd, Indianapolis, IN 46254', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-24 18:44:34', '0000-00-00 00:00:00', 2, 3, '39.831770', '-86.241070', 1, 4, 10, NULL, '', '', 0),
(331, 'Mesob Haitian and Ethiopian Restaurant', 'julio@quiver.com', '(816) 442-7311', 'Not required', '3601 Broadway blvd, Kansas City, MO 64111', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-24 18:45:25', '0000-00-00 00:00:00', 2, 3, '39.057242', '-94.594079', 1, 4, 10, NULL, '', '', 0),
(332, 'Brie Catering- Caterer', 'service@taptapnow.com', '301-956-8715', 'not defined', 'Silver Spring, MD 20910', 'not defined', '1580761226938icon_white_180.png', '2019-12-24 18:46:19', '0000-00-00 00:00:00', 2, 116, '39.002589', '-77.036279', 1, 4, 10, '20910', '', 'MD', 1),
(333, 'Ms Didi’s Kitchen- Food Truck', 'julio@quiver.com', ' (704) 369-1172 ', 'Not required', 'Call for location-Charlotte, NC 2820', 'default_banner.png', '1580761226938icon_white_180.png', '2019-12-24 18:47:11', '0000-00-00 00:00:00', 2, 3, '35.220179', '-80.783475', 1, 4, 0, NULL, '', '', 0),
(334, 'Rock Steady', 'julio@quiver.com', ' 470-788.8120 ', 'Not required', '907 Marietta St NW Atlanta, GA 30318', 'default_banner.png', '1580761226938icon_white_180.png', '2020-01-03 21:02:56', '0000-00-00 00:00:00', 2, 3, '33.7771088', '-84.4073937 ', 1, 4, 10, NULL, '', '', 0),
(335, 'R&M Market & Soul Food', 'julio@quiver.com', '215-871-7771 ', 'Not required', '7544 Haverford Ave, Philadephia, PA 19151', 'default_banner.png', '1580761226938icon_white_180.png', '2020-01-03 21:09:59', '0000-00-00 00:00:00', 2, 3, '39.978044 ', '-75.267165', 1, 4, 10, NULL, '', '', 0),
(336, 'Bon Fritay- Food Truck', 'julio@quiver.com', '919-443-513 ', 'Not required', 'Call for Location- Raleigh- Durham, NC', 'default_banner.png', '1580761226938icon_white_180.png', '2020-01-03 21:10:58', '0000-00-00 00:00:00', 2, 3, '35.978318', '-78.543553 ', 1, 4, 10, NULL, '', '', 0),
(337, 'Bayshore Haitian Restaurant', 'julio@quiver.com', '239-228-5267', 'Not required', '4000 Bayshore Dr Unit A Naples, Fl 34112', 'default_banner.png', '1580761226938icon_white_180.png', '2020-01-03 23:04:07', '0000-00-00 00:00:00', 2, 16, '26.116222', '-81.770867', 1, 4, 0, NULL, '', '', 1),
(338, 'The Spice House-2', 'julio@quiver.com', '770-310-0816', 'Not required', '2617 Panola Rd Lithonia, GA 30058', 'default_banner.png', '1580761226938icon_white_180.png', '2020-01-08 19:08:55', '0000-00-00 00:00:00', 2, 3, '33.713054', '-84.167164', 1, 4, 0, NULL, '', '', 0),
(339, 'MMoo', 'service@taptapnow.com', '+509 4818-8121', 'not defined', '8600 Northwest 30th Terrace, Doral, Floride, États-Unis', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 14:02:43', '2020-02-03 14:02:43', 3, 3, '25.8014847', '-80.3353234', 0, 0, 10, '123', NULL, 'Nord', 0),
(340, 'Web  restaurant', 'service@taptapnow.com', '+509 4581-8881', 'not defined', '103 R50, Modder East Orchards, Delmas, Afrique du Sud', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 15:20:26', '2020-02-03 15:20:26', 3, 3, '-26.1052057', '28.6196755', 0, 0, 10, '12345', NULL, 'Nord', 0),
(341, 'Add restaurant works', 'service@taptapnow.com', '+509 4581-8881', 'not defined', '33 Rue Jacques 1er, Delmas, Port-au-Prince, Haïti', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 15:36:27', '2020-02-03 15:36:27', 3, 3, '18.5608942', '-72.29296699999999', 0, 0, 10, '23456', NULL, 'Nord', 0),
(342, 'Add restaurant works', 'service@taptapnow.com', '+509 4581-8881', 'not defined', '33 Rue Jacques 1er, Delmas, Port-au-Prince, Haïti', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 15:37:00', '2020-02-03 15:37:00', 3, 3, '18.5608942', '-72.29296699999999', 0, 0, 10, '23456', NULL, 'Nord', 0),
(343, 'Add restaurant works', 'service@taptapnow.com', '+509 4581-8881', 'not defined', '33 Rue Jacques 1er, Delmas, Port-au-Prince, Haïti', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 15:37:08', '2020-02-03 15:37:08', 3, 3, '18.5608942', '-72.29296699999999', 0, 0, 10, '23456', NULL, 'Nord', 0),
(344, 'Jean Marc Excellent / Amitie Ashley J', 'service@taptapnow.com', '+3 (055) 938-446', 'not defined', '8600 Northwest 30th Terrace, Lauderdale Lakes, Floride, États-Unis', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 15:47:23', '2020-02-03 15:47:23', 2, 3, '26.1767008', '-80.186587', 0, 0, 10, '33122-1909', NULL, 'FL', 0),
(345, 'Gonna text clear ', 'service@taptapnow.com', '+509 4818-8888', 'not defined', '460 Northeast 191st Street, Miami, FL 33179, États-Unis', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 15:57:30', '2020-02-03 15:57:30', 3, 3, '25.9500934', '-80.19180130000001', 0, 0, 10, '12345', NULL, 'Nord', 0),
(346, 'Heloo', 'service@taptapnow.com', '+9 (782) 309-643', 'not defined', '22 Beacom Boulevard, Miami, Floride, États-Unis', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 16:01:39', '2020-02-03 16:01:39', 2, 3, '25.772331', '-80.23126510000002', 0, 0, 10, '01510', NULL, 'MA', 0),
(347, 'Helollekne that \'s me ', 'service@taptapnow.com', '+1 (481) 899-9944', 'not defined', '460 Northeast 191st Street, Miami, FL 33179, États-Unis', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 16:06:08', '2020-02-03 16:06:08', 2, 3, '25.9500934', '-80.19180130000001', 0, 0, 10, '33179', NULL, 'FL', 0),
(348, 'Jean Marc Excellent / Amitie Ashley J', 'service@taptapnow.com', '+3 (055) 938-446', 'not defined', '8600 Northwest 30th Terrace, Lauderdale Lakes, Floride, États-Unis', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 16:08:11', '2020-02-03 16:08:11', 1, 3, '26.1767008', '-80.186587', 0, 0, 10, '33122-1909', NULL, 'FL', 0),
(349, 'Lole Restaurant', 'service@taptapnow.com', '+509 2445-5552', 'not defined', 'Delmas 33, Sunshine Inn, Rue Charbonnière, Port-au-Prince, Haïti', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 16:38:26', '2020-02-03 16:38:26', 3, 3, '18.5553395', '-72.2922059', 0, 0, 10, '33179', NULL, 'Nord', 0),
(350, 'Paradise restaurant', 'service@taptapnow.com', '+1 (433) 343-4444', 'not defined', '460 Northeast 191st Street, Miami, FL 33179, États-Unis', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 16:40:30', '2020-02-03 16:40:30', 2, 3, '25.9500934', '-80.19180130000001', 0, 0, 10, '33179', NULL, 'FL', 0),
(351, 'Tabarre 25 Restaurant', 'service@taptapnow.com', '+509 4988-9999', 'not defined', 'Tabarre 25 Dos Banque BNC Queen Tchele Luxe Boutique, Rue Rochdale, Port-au-Prince, Haïti', 'not defined', '1580761226938icon_white_180.png', '2020-02-03 21:35:30', '2020-02-03 21:35:30', 3, 3, '18.5563585', '-72.25996719999999', 0, 0, 10, 'ht2232', NULL, 'Ouest', 0),
(352, 'Julio Delices restaurant', 'service@taptapnow.com', '+509 4818-8133', 'not defined', '4963 Golden Gate Parkway, Naples, Floride, États-Unis', 'not defined', '1583263165219tchaka.jpeg', '2020-02-11 18:48:57', '2020-02-11 18:48:57', 2, 116, '26.181226', '-81.7101489', 1, 0, 10, '34116', NULL, 'FL', 1),
(353, 'Julio Restaurant  All Test', 'service@taptapnow.com', '+1 (994) 949-9499', 'not defined', '460 Northeast 191st Street, Miami, FL 33179, États-Unis', 'not defined', '1580761226938icon_white_180.png', '2020-02-19 11:04:16', '2020-02-19 11:04:16', 3, 3, '25.9500934', '-80.19180130000001', 1, 0, 10, '33179', NULL, 'FL', 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `restaurant_to_pay_view`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `restaurant_to_pay_view` (
`id_restaurant` int(11)
,`name_restaurant` varchar(255)
,`logo_restaurant` varchar(255)
,`adresse_restaurant` varchar(255)
,`tel_restaurant` varchar(255)
,`diference` double(19,2)
,`last_date_payment` datetime
);

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` int(11) NOT NULL,
  `montant_transaction` float NOT NULL,
  `date_transaction` datetime NOT NULL,
  `id_commande_fk` int(11) DEFAULT NULL,
  `id_user_fk` int(11) NOT NULL,
  `restaurant_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id_transaction`, `montant_transaction`, `date_transaction`, `id_commande_fk`, `id_user_fk`, `restaurant_fk`) VALUES
(4, 17.6, '2020-03-03 13:55:01', 3, 125, 352),
(5, 24.2, '2020-03-03 14:33:21', 4, 125, 352),
(6, 19.8, '2020-03-06 12:56:49', 5, 125, 352),
(7, 33.44, '2020-03-06 19:11:00', 6, 125, 332),
(8, 86.57, '2020-03-06 19:26:08', 7, 125, 332),
(9, 39.6, '2020-03-07 15:19:43', 8, 125, 353);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `value_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id_type`, `value_type`) VALUES
(1, 'ADMINISTRATOR'),
(2, 'CLIENT');

-- --------------------------------------------------------

--
-- Structure de la table `type_paiement`
--

CREATE TABLE `type_paiement` (
  `id_type_pay` int(11) NOT NULL,
  `name_type_pay` varchar(100) NOT NULL,
  `img_type_pay` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_paiement`
--

INSERT INTO `type_paiement` (`id_type_pay`, `name_type_pay`, `img_type_pay`) VALUES
(1, 'MASTERCARD', 'banner_mastercard.png'),
(4, 'VISA', 'banner_visa.png');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(255) DEFAULT NULL,
  `email_user` varchar(255) NOT NULL,
  `tel_user` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `created_user` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_user` datetime DEFAULT NULL,
  `countryIDUser` int(11) DEFAULT NULL,
  `photo_user` varchar(500) DEFAULT 'default.jpg',
  `actif_user` tinyint(1) NOT NULL DEFAULT 1,
  `userTypeID` int(11) NOT NULL,
  `createByAdmin` int(11) NOT NULL DEFAULT 0,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `restaurant_owner` int(1) DEFAULT 0,
  `is_first_time_login` int(11) DEFAULT 0,
  `user_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `email_user`, `tel_user`, `password_user`, `created_user`, `updated_user`, `countryIDUser`, `photo_user`, `actif_user`, `userTypeID`, `createByAdmin`, `first_name`, `last_name`, `restaurant_owner`, `is_first_time_login`, `user_address`) VALUES
(1, 'Julio test', 'Julio@gmail.com', '+50948188107', 'manmie', '2019-12-23 00:56:34', '2019-12-23 00:56:34', 1, '1582920857596Screen Shot 2019-10-15 at 5.37.49 PM.png', 1, 2, 0, '', '', 1, 1, 'delmas 75 Route de Delmas, Port-au-Prince, Haïti'),
(3, 'Julio quiver', 'julio@quiver.com', '+50948188109', 'manmie', '2019-12-23 00:58:37', '2019-12-23 00:58:37', 1, 'default_profil.png', 1, 1, 0, '', '', 1, 1, NULL),
(4, 'Nathalie', 'Nnozile@icloud.com', '+19548309261', 'nannie20', '2019-12-23 01:34:49', '2019-12-23 01:34:49', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(5, 'Jean l', 'Tgh@ghum.com', '+17865241526', 'likemenow', '2019-12-23 03:16:33', '2019-12-23 03:16:33', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(6, 'Tico Armand', 'inan378@gmail.com', '+13059674023', 'martin3812', '2019-12-23 22:27:34', '2019-12-23 22:27:34', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(7, 'Tan', 'Aet1022@gmail.com', '+13019639817', 'su33er99', '2019-12-24 20:47:04', '2019-12-24 20:47:04', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(8, 'Salshaw', 'Salshaw76@icloud.com', '+114084766514', 'Apple123', '2019-12-26 16:27:31', '2019-12-26 16:27:31', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(9, 'IpadTest', 'Ipadtest@gmail.com', '+50948188199', 'manmie', '2019-12-26 18:20:43', '2019-12-26 18:20:43', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(10, 'Aaa', 'Aaa@gmail.com', '+14084766514', 'apprle123', '2019-12-27 18:34:33', '2019-12-27 18:34:33', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(11, 'Chris Laguerre', 'Lcris509@gmail.com', '+50937022084', 'taptaptest', '2019-12-29 13:18:22', '2019-12-29 13:18:22', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(12, 'Claudette David', 'Claudettepdavid@gmail.com', '+12024455282', 'Trumpno16!', '2019-12-31 20:41:40', '2019-12-31 20:41:40', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(13, 'Brian', 'Briandavid400@gmail.com', '+13013431730', 'Bd111111', '2019-12-31 21:13:53', '2019-12-31 21:13:53', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(14, 'Martine Succes', 'Martinedelince2005@yahoo.com', '+14075723943', 'didiere1002', '2019-12-31 21:16:28', '2019-12-31 21:16:28', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(15, 'Missy Laurent', 'Missalainelaurent@gmail.com', '+17863407990', 'M1$$y123', '2019-12-31 21:20:10', '2019-12-31 21:20:10', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(16, 'Macena Jennie ', 'macenajennie8@gmail.com', '+18135269120', 'jenniequeen', '2019-12-31 21:29:48', '2019-12-31 21:29:48', 1, 'default_profil.png', 1, 2, 0, '', '', 1, 0, NULL),
(17, 'Stephanie Jean PIERRE', 'Stephaniejeanpiere2@gmail.com', '+13016656568', 'washington40', '2019-12-31 21:41:45', '2019-12-31 21:41:45', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(18, 'Rony Jazon', 'jasonrony@gmail.com', '+18099040304', 'taptaprony2020GOOD', '2019-12-31 21:44:16', '2019-12-31 21:44:16', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(19, 'Micheline Maceus ', 'Michie706@yahoo.com', '+19548253178', 'Tyjai0106', '2019-12-31 22:08:42', '2019-12-31 22:08:42', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(20, 'Way', 'garconthezan@yahoo.com', '+17862553212', 'MrHead100%', '2019-12-31 22:28:53', '2019-12-31 22:28:53', 1, 'default_profil.png', 1, 2, 0, '', '', 1, 0, NULL),
(21, 'Djerry Augustin ', 'augustinjerry48@yahoo.com', '+15612011825', 'Jessica9728', '2019-12-31 22:31:41', '2019-12-31 22:31:41', 1, 'default_profil.png', 1, 2, 0, '', '', 1, 0, NULL),
(22, 'Wedson Lespinasse ', 'Wedsonlespinasse@gmaim.com', '+17722066356', '0308wedson', '2019-12-31 22:33:20', '2019-12-31 22:33:20', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(23, 'Cadet Rood', 'Roodycadet034@gmail.com', '+13054143418', 'Moise1959@', '2019-12-31 22:36:01', '2019-12-31 22:36:01', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(24, 'Dave', 'Mjdave7@gmail.com', '+15615094111', 'Rose1996@', '2019-12-31 22:50:19', '2019-12-31 22:50:19', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(25, 'Farah milfort', 'Faraheustache720@gmail.com', '+12393984284', 'Marleyla3', '2019-12-31 23:12:10', '2019-12-31 23:12:10', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(26, 'Pierre ', 'pcheelton@gmail.com', '+16787793116', 'Alice@91!', '2019-12-31 23:31:46', '2019-12-31 23:31:46', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(27, 'Phefnire paillard ', 'Phefnirejeudy@gmail.com', '+330778691339', 'anneleissa1990', '2020-01-01 00:16:24', '2020-01-01 00:16:24', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(28, 'Jessica Gabrius ', 'Jessicagabrius@gmail.com', '+19176984936', 'minouche63', '2020-01-01 00:24:06', '2020-01-01 00:24:06', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(29, 'Chercher', 'Tooturntsasha@gmail.com', '+14016498637', 'Chercher21', '2020-01-01 00:28:12', '2020-01-01 00:28:12', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(30, 'AJ', 'Ajoseph495@gmail.com', '+17189136138', 'Ashjay123!', '2020-01-01 00:35:44', '2020-01-01 00:35:44', 1, '1583252412757Screen Shot 2019-11-14 at 10.03.16 PM.png', 1, 2, 0, '', '', 0, 1, 'Miami Gardens, Floride, États-Unis'),
(31, 'King dezod valentin509', 'Pvalentin979@gmail.com', '+590690984903', 'valentin509', '2020-01-01 00:53:52', '2020-01-01 00:53:52', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(32, 'Samantha ', 'Samiegilbert.97@gmail.com', '+16148041404', 'Samie317120', '2020-01-01 00:55:24', '2020-01-01 00:55:24', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(33, 'Stephania ', 'Stephaniamilord@gmail.com', '+13479447119', 'Carmelite09', '2020-01-01 00:57:25', '2020-01-01 00:57:25', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(34, 'Sylvanise', 'Sanise01@yahoo.ca', '+15143783563', '1Lovem1m1', '2020-01-01 01:37:29', '2020-01-01 01:37:29', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(35, 'John Luther Tonton', 'tontonjohn23@gmail.com', '+50937801747', 'lafleurscherly', '2020-01-01 01:42:41', '2020-01-01 01:42:41', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(36, 'Jean cadet', 'Cadetjeangabriel1738@gmail.com', '+12019046699', 'haiti509', '2020-01-01 02:34:48', '2020-01-01 02:34:48', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(37, 'Myriam', 'medge12@hotmail.com', '+15162561807', 'mimimomo9', '2020-01-01 02:51:12', '2020-01-01 02:51:12', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(38, 'Veronica innocent', 'Innocentveronica14@gmail.com', '+18452482471', 'ma25katou25', '2020-01-01 03:50:06', '2020-01-01 03:50:06', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(39, 'Gessica Rene', 'gessicarene8@gmail.com', '+18627045238', 'Jeanmary1960$', '2020-01-01 04:08:43', '2020-01-01 04:08:43', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(40, 'James Augustin', 'Jamesaugustin1985@gmail.com', '+15614608788', 'Fuckyou09', '2020-01-01 04:19:58', '2020-01-01 04:19:58', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(41, 'Sagina Marc', 'madanmarc44@gmail.com', '+50948023554', 'Exaltin', '2020-01-01 04:33:32', '2020-01-01 04:33:32', 1, 'default_profil.png', 1, 2, 0, '', '', 1, 0, NULL),
(42, 'Cazi BejBl Roodiany', 'Cazibejbl96@gmail.com', '+17074163686', 'cazi1996', '2020-01-01 10:24:55', '2020-01-01 10:24:55', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(43, 'Standley baptiste ', 'Jbs5444@aol.com', '+13475583656', 'Immacula22', '2020-01-01 11:00:12', '2020-01-01 11:00:12', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(44, 'Renata', 'ccrowns37@gmail.com', '+19543008926', 'renatacraan43', '2020-01-01 12:27:02', '2020-01-01 12:27:02', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(45, 'Melissa Jean Baptiste', 'mj805892@gmail.com', '+19548597027', 'mimi12980', '2020-01-01 14:10:38', '2020-01-01 14:10:38', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(46, 'Diana', 'Dee_ann35@hotmail.com', '+19545888104', 'Bonbagay1', '2020-01-01 14:33:40', '2020-01-01 14:33:40', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(47, 'Jennifer Cabrea', 'Cabijes03@gmail.com', '+18492012391', 'Aloulou0422', '2020-01-01 15:16:48', '2020-01-01 15:16:48', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(48, 'Sasha revolus ', 'Iamsashar@gmail.com', '+19546820294', '954954', '2020-01-01 15:44:17', '2020-01-01 15:44:17', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(49, 'Saradjina jeanbptiste', 'Sherlandajeanbaptiste@ymail.com', '+50935347368', 'Holanda', '2020-01-01 15:49:51', '2020-01-01 15:49:51', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(50, 'Jean Gilles Staël ', 'staeljeangilles2004@gmail.com', '+50937906536', 'staeljeangilles', '2020-01-01 15:52:22', '2020-01-01 15:52:22', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(51, 'Flore SF', 'Floremarie77@gmail.com', '+14847989584', 'ebens1947', '2020-01-01 15:53:14', '2020-01-01 15:53:14', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(52, 'Lynn guilloteau ', 'Lynnguilloteau@icloud.com', '+18622247871', '1Glpahyra', '2020-01-01 16:07:17', '2020-01-01 16:07:17', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(53, 'A SF', 'asaintfleur@yahoo.com', '+16466216312', 'spade1982', '2020-01-01 16:23:36', '2020-01-01 16:23:36', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(54, 'Rose Deliska ', 'deliskarose2@gmail.com', '+15618098689', 'Deliskarose7?', '2020-01-01 16:50:50', '2020-01-01 16:50:50', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(55, 'Marthline Jean ', 'Marthlinejean83@gmail.com', '+13056845562', 'Niyella2@', '2020-01-01 17:29:28', '2020-01-01 17:29:28', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(56, 'Derisier Sartre', 'dersar18@gmail.com', '+50942536874', 'bigboss18', '2020-01-01 17:36:29', '2020-01-01 17:36:29', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(57, 'Vanessa Alexis', 'Sane_asylum@msn.com', '+13473426211', 'Dangerous1', '2020-01-01 17:47:48', '2020-01-01 17:47:48', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(58, 'Ronald ', 'Ron75nd@gmail.com', '+16788172217', 'Threestar1$', '2020-01-01 18:03:07', '2020-01-01 18:03:07', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(59, 'Wilner Maurice', 'mauricewilner@gmail.com', '+50943484499', 'jrolpipo88', '2020-01-01 20:03:08', '2020-01-01 20:03:08', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(60, 'Anniafly ', 'Blanchardannia@yahoo.com', '+330609414689', 'babygirl', '2020-01-01 20:06:34', '2020-01-01 20:06:34', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(61, 'Stephanie ', 'Stephaniecelestin35@gmail.com', '+17744174742', 'stephanie1995$', '2020-01-01 20:16:31', '2020-01-01 20:16:31', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(62, 'Phillipe Nelson ', 'Phillipe.Nelson@gmail.com', '+14048251594', 'Mytappa65', '2020-01-01 21:02:14', '2020-01-01 21:02:14', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(63, 'Liza Barthelemy ', 'Lizabarthelemy.lb@gmail.com', '+16132526654', 'food2020', '2020-01-01 21:29:28', '2020-01-01 21:29:28', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(64, 'Sabrina Marcelin ', 'Srmarcelin@yahoo.com', '+17707891950', 'roberte09!!', '2020-01-01 23:06:01', '2020-01-01 23:06:01', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(65, 'Polycard phedora', 'Phedorapolycard@gmail.com', '+50948433332', 'francket', '2020-01-01 23:55:31', '2020-01-01 23:55:31', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(66, 'Ted ', 'Eushenither94@gmail.com', '+13439996301', 'Holy1994', '2020-01-02 00:36:00', '2020-01-02 00:36:00', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(67, 'Cynthia ', 'darlaevenshy019@gmail.com', '+18193290453', 'Samuelevensy06', '2020-01-02 02:17:48', '2020-01-02 02:17:48', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(68, 'Walter F Blain', 'walterblain@hotmail.com', '+15146999705', 'Miam1958', '2020-01-02 02:47:57', '2020-01-02 02:47:57', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(69, 'Frantz ', 'fadjocyf@gmail.com', '+13025388282', 'adjocy12', '2020-01-02 03:45:24', '2020-01-02 03:45:24', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(70, 'Conciamene ', 'Conciamenelouis@icloud.com', '+14048409190', 'C1012m20', '2020-01-02 05:03:36', '2020-01-02 05:03:36', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(75, 'Christella ', 'Christellajean38@gmail.com', '+17869722392', 'Christella2001', '2020-01-02 11:04:27', '2020-01-02 11:04:27', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(76, 'Merh Bois', 'Merh@mgvisionhaiti.com', '+50937079374', 'celica05', '2020-01-02 11:33:39', '2020-01-02 11:33:39', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(77, 'Popotte wilda ', 'Wildapopotte@gmail.com', '+330603120647', '171286wildaP.az ', '2020-01-02 11:57:50', '2020-01-02 11:57:50', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(78, 'Marthe M Saint Juste', 'roseandgi@gmail.com', '+18479037805', 'Manjo@3011', '2020-01-02 12:59:52', '2020-01-02 12:59:52', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(79, 'Paul Ely Christopher ', 'paulely8123@yahoo.com', '+12393841217', 'polomix8123', '2020-01-02 13:54:17', '2020-01-02 13:54:17', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(80, 'Joseph Herold', 'JHerold352@gmail.com', '+15162715056', 'Jonathan0219', '2020-01-02 15:17:40', '2020-01-02 15:17:40', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(81, 'Lurock Rosalva ', 'Lurockrr@yahoo.com', '+18622761852', 'Jasondeen4425$', '2020-01-02 16:10:48', '2020-01-02 16:10:48', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(82, 'Juste Kesly', 'justekesly11@email.com', '+50935389416', 'jwoo12345678', '2020-01-02 16:17:31', '2020-01-02 16:17:31', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(83, 'Jhon Christian', 'christianjhinn@gmail.com', '+50946870469', 'klasiko12', '2020-01-02 19:04:24', '2020-01-02 19:04:24', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(84, 'Briana Beaubrun ', 'brianabeaubrun0@gmail.com', '+14382295240', 'Briana0000', '2020-01-02 20:13:41', '2020-01-02 20:13:41', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(85, 'Woody Martin', 'Woodyfmartin@gmail.com', '+13059048616', 'Wm3286350$', '2020-01-02 21:09:09', '2020-01-02 21:09:09', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(86, 'Sarah Lyse Leconte ', 'Sarahlysw@gmail.com', '+18572478550', 'Sarahlove13', '2020-01-02 21:19:30', '2020-01-02 21:19:30', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(87, 'Lau', 'Llaroche342@gmail.com', '+15149846078', 'pizzabacon78', '2020-01-02 22:56:39', '2020-01-02 22:56:39', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(88, 'Dianne Mardi', 'diannemardi01@gmail.com', '+13023593888', 'Dianne01', '2020-01-03 02:51:43', '2020-01-03 02:51:43', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(89, 'Shelby Marcellus ', 'Shelbymarcellus276@gmail.com', '+17542309920', 'Fedeli12', '2020-01-03 03:12:33', '2020-01-03 03:12:33', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(90, 'Kimberly', 'Mirand.kimberly@gmail.com', '+14385014342', 'Falina4962', '2020-01-03 10:22:10', '2020-01-03 10:22:10', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(91, 'Guerla ', 'Guerla19@gmail.com', '+16785249785', 'Peaches1976', '2020-01-03 12:36:36', '2020-01-03 12:36:36', 1, 'uploads/profil/2020-01-03T12:42:20.595Znew.jpg', 1, 2, 0, '', '', 0, 0, NULL),
(92, 'Mathieu ', 'mathieuvoltaire124@gmail.com', '+50947101530', 'Matt06628', '2020-01-03 12:53:26', '2020-01-03 12:53:26', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(93, 'Ricardo Joseph ', 'Josephricardo90@gmail.com', '+16312974082', 'Babycross2', '2020-01-03 18:41:24', '2020-01-03 18:41:24', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(94, 'Gigi Milfort', 'gigimilfort@yahoo.com', '+14049141811', 'Lovely77', '2020-01-03 20:03:04', '2020-01-03 20:03:04', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(95, 'Milfort Exodinho ', 'mmensley@yahoo.com', '+16175059450', 'mensley20', '2020-01-03 20:56:38', '2020-01-03 20:56:38', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(96, 'Jkol', 'mctchak50@yahoo.fr', '+50943671518', 'pozela50', '2020-01-04 00:13:18', '2020-01-04 00:13:18', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(97, 'Joel maignan', 'Joelmaignan73@yahoo.com', '+16092332835', '1310', '2020-01-04 03:02:53', '2020-01-04 03:02:53', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(98, 'Lovemiafadael ', 'fadaelm04@gmail.com', '+13176038490', 'lovemia8', '2020-01-04 03:58:44', '2020-01-04 03:58:44', 1, 'uploads/profil/2020-01-04T04:00:00.213Znew.jpg', 1, 2, 0, '', '', 0, 0, NULL),
(99, 'Maxime Louis ', 'Mlouis1304@yahoo.com', '+18196784433', 'Maxgroszozo2213', '2020-01-04 12:54:46', '2020-01-04 12:54:46', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(100, 'Steeve Adler Knivez', 'Knivezb92@gmail.com', '+50941860236', 'tropicmite9', '2020-01-04 15:12:17', '2020-01-04 15:12:17', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(101, 'Marc andre sainthelot', 'Sainthelotm@gmail.com', '+56935297049', 'chile2019', '2020-01-04 16:08:48', '2020-01-04 16:08:48', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(102, 'Joseph patrick', 'davejose200@gmail.com', '+17548012534', 'joseph97', '2020-01-04 18:45:22', '2020-01-04 18:45:22', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(103, 'Donley', 'Donleyjf@gmail.com', '+13472647659', 'Mckenson24', '2020-01-05 03:00:38', '2020-01-05 03:00:38', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(104, 'Loudenie Aristor ', 'loudeniearistor@gmail.com', '+17865785375', '040303la', '2020-01-05 16:36:16', '2020-01-05 16:36:16', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(105, 'Roubens Juin', 'Juinroubend6@gmail.com', '+17863622782', '055748312', '2020-01-05 16:52:59', '2020-01-05 16:52:59', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(106, 'Shamma', 'shammapetithomme29@gmail.com', '+50937329058', 'Melindagordon07+', '2020-01-05 17:58:02', '2020-01-05 17:58:02', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(107, 'Arlette Telfort', 'telfort_944@hotmail.com', '+17865463989', 'telfort@1974', '2020-01-06 00:01:00', '2020-01-06 00:01:00', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(108, 'Beck G', 'rebbecca.g@gmail.com', '+16108189723', 'Jayden&29', '2020-01-06 20:55:47', '2020-01-06 20:55:47', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(109, 'Farbie ', 'nfarbie1998@gmail.com', '+14433661465', 'Fafa1998', '2020-01-07 03:05:53', '2020-01-07 03:05:53', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(110, 'Samuel laguerre ', 'Samulaguerre25@gmail.com', '+15142391800', 'samuel1234', '2020-01-07 03:21:15', '2020-01-07 03:21:15', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(111, 'Garry Antenord ', 'antenordgarry@yahoo.com', '+17865565867', '2Bonel09', '2020-01-07 11:17:31', '2020-01-07 11:17:31', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(112, 'Erwann Francois', 'erwannfrancois1999@outlook.com', '+15147548487', 'Orielson21999', '2020-01-07 12:35:27', '2020-01-07 12:35:27', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(113, 'Rose ', 'romerla@hotmail.com', '+15147176353', 'akiko007', '2020-01-07 18:26:52', '2020-01-07 18:26:52', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(116, 'Julio Jean Fils', 'julio.fils1@gmail.com', '+509 4818-6611', 'manmie01', '2020-01-07 19:59:36', '2020-01-07 19:59:36', 1, '1582919141905buripoulet.jpeg', 1, 2, 0, 'Change every 3', 'thing fix first time', 1, 1, 'Demas & Divas - Rua das Rosas - Vila Valqueire, Rio de Janeiro - État de Rio de Janeiro, Brésil'),
(117, 'Samantha m', 'Aam58aol.com', '+14387994355', 'Piinky219', '2020-01-08 00:00:24', '2020-01-08 00:00:24', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(118, 'Paul P', 'Info@taptapnow.com', '+12293526978', 'Su33er99', '2020-01-08 01:16:18', '2020-01-08 01:16:18', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(119, 'Feslio Francois', 'Daddypimp29@gmail.com', '+17869737574', 'Daddhpimp#89', '2020-01-08 19:59:21', '2020-01-08 19:59:21', 1, 'default_profil.png', 1, 2, 0, '', '', 0, 0, NULL),
(122, 'Mack JJ', 'jjredic@gmail.com', '+1 (332) 323-3333', 'manmie', '2020-02-04 18:39:51', NULL, NULL, 'not define', 1, 2, 1, 'Mack JJ', 'Bousiko', 0, 0, NULL),
(123, 'Lebron ', 'lebron@gmail.com', '+1 (443) 434-4444', 'manmie', '2020-02-04 18:41:30', NULL, NULL, 'not define', 1, 2, 1, 'Lebron ', 'James', 0, 0, NULL),
(124, 'Andy', 'andy@gmail.com', '+1 (455) 555-5544', 'manmie', '2020-02-04 18:48:31', NULL, NULL, 'not define', 1, 2, 1, 'Andy', 'Pierre', 0, 0, NULL),
(125, 'Julio Fihdel del', 'juliojeanfilsfihdeldev@gmail.com', '+50948132344', 'manmie', '2020-03-03 13:33:33', '2020-03-03 13:33:33', 1, 'default_profil.png', 1, 1, 0, NULL, NULL, 0, 0, NULL),
(126, 'Me ', 'me@gmail.com', '+509 4818-6622', 'taptapnow01@', '2020-03-03 18:11:10', NULL, NULL, 'not define', 1, 2, 1, 'Me ', 'em', 0, 0, NULL),
(127, 'me', 'me00@gmail.com', '+1 (305) 769-9440', 'taptapnow01@', '2020-03-03 18:20:14', NULL, NULL, 'not define', 1, 2, 1, 'me', 'em', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la vue `admin_payment_restaurant_view`
--
DROP TABLE IF EXISTS `admin_payment_restaurant_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `admin_payment_restaurant_view`  AS  select `restaurant`.`id_restaurant` AS `id_restaurant`,`restaurant`.`name_restaurant` AS `name_restaurant`,`restaurant`.`logo_restaurant` AS `logo_restaurant`,`restaurant`.`tel_restaurant` AS `tel_restaurant`,`restaurant`.`adresse_restaurant` AS `adresse_restaurant`,sum(`admin_payment`.`amount`) AS `total_paye`,(select max(`admin_payment`.`date_admin_payment`) from `admin_payment` where `admin_payment`.`restaurant_fk` = `restaurant`.`id_restaurant`) AS `last_date_payment` from (`restaurant` join `admin_payment` on(`admin_payment`.`restaurant_fk` = `restaurant`.`id_restaurant`)) group by `admin_payment`.`restaurant_fk` ;

-- --------------------------------------------------------

--
-- Structure de la vue `all_restaurant_to_pay_view`
--
DROP TABLE IF EXISTS `all_restaurant_to_pay_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_restaurant_to_pay_view`  AS  select `fiche_order_restaurant_view`.`id_restaurant` AS `id_restaurant`,`fiche_order_restaurant_view`.`name_restaurant` AS `name_restaurant`,`fiche_order_restaurant_view`.`logo_restaurant` AS `logo_restaurant`,`fiche_order_restaurant_view`.`adresse_restaurant` AS `adresse_restaurant`,`fiche_order_restaurant_view`.`tel_restaurant` AS `tel_restaurant`,`fiche_order_restaurant_view`.`adminRestID` AS `adminRestID`,case when `fiche_order_restaurant_view`.`id_restaurant` in (select `admin_payment_restaurant_view`.`id_restaurant` from `admin_payment_restaurant_view`) then abs(`admin_payment_restaurant_view`.`total_paye` - `fiche_order_restaurant_view`.`montant_total`) else abs(`fiche_order_restaurant_view`.`montant_total`) end AS `diference`,`admin_payment_restaurant_view`.`last_date_payment` AS `last_date_payment` from (`fiche_order_restaurant_view` left join `admin_payment_restaurant_view` on(`admin_payment_restaurant_view`.`id_restaurant` = `fiche_order_restaurant_view`.`id_restaurant`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `fiche_order_restaurant_no_payment`
--
DROP TABLE IF EXISTS `fiche_order_restaurant_no_payment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fiche_order_restaurant_no_payment`  AS  select `restaurant`.`id_restaurant` AS `id_restaurant`,`restaurant`.`name_restaurant` AS `name_restaurant`,sum(`fiche_order`.`montant_total`) AS `montant_total`,`restaurant`.`logo_restaurant` AS `logo_restaurant`,`restaurant`.`adresse_restaurant` AS `adresse_restaurant`,`restaurant`.`tel_restaurant` AS `tel_restaurant`,`restaurant`.`adminRestID` AS `adminRestID` from (`fiche_order` join `restaurant` on(`fiche_order`.`restaurant_fk` = `restaurant`.`id_restaurant`)) where `fiche_order`.`status_fiche` = 4 and !(`restaurant`.`id_restaurant` in (select `admin_payment`.`restaurant_fk` from `admin_payment`)) group by `restaurant`.`id_restaurant` ;

-- --------------------------------------------------------

--
-- Structure de la vue `fiche_order_restaurant_view`
--
DROP TABLE IF EXISTS `fiche_order_restaurant_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fiche_order_restaurant_view`  AS  select `restaurant`.`id_restaurant` AS `id_restaurant`,`restaurant`.`name_restaurant` AS `name_restaurant`,sum(`fiche_order`.`montant_total`) AS `montant_total`,`restaurant`.`logo_restaurant` AS `logo_restaurant`,`restaurant`.`tel_restaurant` AS `tel_restaurant`,`restaurant`.`adresse_restaurant` AS `adresse_restaurant`,`restaurant`.`adminRestID` AS `adminRestID` from (`fiche_order` join `restaurant` on(`fiche_order`.`restaurant_fk` = `restaurant`.`id_restaurant`)) where `fiche_order`.`status_fiche` = 4 group by `fiche_order`.`restaurant_fk` ;

-- --------------------------------------------------------

--
-- Structure de la vue `restaurant_to_pay_view`
--
DROP TABLE IF EXISTS `restaurant_to_pay_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `restaurant_to_pay_view`  AS  select `admin_payment_restaurant_view`.`id_restaurant` AS `id_restaurant`,`admin_payment_restaurant_view`.`name_restaurant` AS `name_restaurant`,`admin_payment_restaurant_view`.`logo_restaurant` AS `logo_restaurant`,`admin_payment_restaurant_view`.`adresse_restaurant` AS `adresse_restaurant`,`admin_payment_restaurant_view`.`tel_restaurant` AS `tel_restaurant`,abs(`admin_payment_restaurant_view`.`total_paye` - `fiche_order_restaurant_view`.`montant_total`) AS `diference`,`admin_payment_restaurant_view`.`last_date_payment` AS `last_date_payment` from (`fiche_order_restaurant_view` join `admin_payment_restaurant_view` on(`admin_payment_restaurant_view`.`id_restaurant` = `fiche_order_restaurant_view`.`id_restaurant`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin_payment`
--
ALTER TABLE `admin_payment`
  ADD PRIMARY KEY (`id_admin_payment`);

--
-- Index pour la table `bank_info`
--
ALTER TABLE `bank_info`
  ADD PRIMARY KEY (`id_bank_info`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `value_category` (`value_category`),
  ADD KEY `id_category` (`id_category`);

--
-- Index pour la table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id_country`),
  ADD UNIQUE KEY `shortname_country` (`shortname_country`),
  ADD UNIQUE KEY `globalname_country` (`globalname_country`);

--
-- Index pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`id_favoris`);

--
-- Index pour la table `fiche_order`
--
ALTER TABLE `fiche_order`
  ADD PRIMARY KEY (`id_fiche`);

--
-- Index pour la table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`id_interest`),
  ADD UNIQUE KEY `name_restaurant` (`name_restaurant`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `menu_fk0` (`categoryMenuID`),
  ADD KEY `menu_fk1` (`restaurantMenuID`);

--
-- Index pour la table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id_offer`),
  ADD KEY `offer_fk0` (`menuOfferID`);

--
-- Index pour la table `opening_times`
--
ALTER TABLE `opening_times`
  ADD PRIMARY KEY (`restaurant_fk`,`weekday`),
  ADD KEY `id_opening_time` (`id_opening_time`);

--
-- Index pour la table `order_menu`
--
ALTER TABLE `order_menu`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `ficheOrderID` (`ficheOrderID`),
  ADD KEY `menuOrderID` (`menuOrderID`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`photos_id`);

--
-- Index pour la table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `rating_fk0` (`userRatID`),
  ADD KEY `rating_fk1` (`restRatID`);

--
-- Index pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- Index pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`),
  ADD UNIQUE KEY `value_type` (`value_type`);

--
-- Index pour la table `type_paiement`
--
ALTER TABLE `type_paiement`
  ADD PRIMARY KEY (`id_type_pay`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email_user` (`email_user`),
  ADD UNIQUE KEY `tel_user` (`tel_user`),
  ADD KEY `user_fk0` (`countryIDUser`),
  ADD KEY `userTypeID` (`userTypeID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin_payment`
--
ALTER TABLE `admin_payment`
  MODIFY `id_admin_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `bank_info`
--
ALTER TABLE `bank_info`
  MODIFY `id_bank_info` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `country`
--
ALTER TABLE `country`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `favoris`
--
ALTER TABLE `favoris`
  MODIFY `id_favoris` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `fiche_order`
--
ALTER TABLE `fiche_order`
  MODIFY `id_fiche` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `interest`
--
ALTER TABLE `interest`
  MODIFY `id_interest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `offer`
--
ALTER TABLE `offer`
  MODIFY `id_offer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `opening_times`
--
ALTER TABLE `opening_times`
  MODIFY `id_opening_time` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `order_menu`
--
ALTER TABLE `order_menu`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `photos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `rating`
--
ALTER TABLE `rating`
  MODIFY `id_rating` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;

--
-- AUTO_INCREMENT pour la table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
