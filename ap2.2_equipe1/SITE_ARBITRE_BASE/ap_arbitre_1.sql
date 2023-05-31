-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 05 mai 2022 à 07:35
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ap_arbitre`
--

-- --------------------------------------------------------

--
-- Structure de la table `arbitre`
--

DROP TABLE IF EXISTS `arbitre`;
CREATE TABLE IF NOT EXISTS `arbitre` (
  `num_arbitre` int(11) NOT NULL AUTO_INCREMENT,
  `nom_arbitre` varchar(50) NOT NULL,
  `prenom_arbitre` varchar(50) NOT NULL,
  `adresse_abitre` varchar(100) NOT NULL,
  `cp_arbitre` varchar(50) NOT NULL,
  `ville_arbitre` varchar(50) NOT NULL,
  `date_naiss_arbitre` date NOT NULL,
  `tel_fixe_arbitre` varchar(10) NOT NULL,
  `tel_port_arbitre` varchar(10) NOT NULL,
  `mail_arbitre` text NOT NULL,
  `num_club` int(11) NOT NULL,
  `num_equipe` int(11) NOT NULL,
  PRIMARY KEY (`num_arbitre`),
  KEY `fkA_numClub` (`num_club`),
  KEY `fkA_numEquipe` (`num_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `num_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) NOT NULL,
  `montant_indemnite` decimal(2,0) NOT NULL,
  PRIMARY KEY (`num_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`num_categorie`, `nom_categorie`, `montant_indemnite`) VALUES
(1, 'Poussins', '10'),
(2, 'Benjamins', '45');

-- --------------------------------------------------------

--
-- Structure de la table `championnat`
--

DROP TABLE IF EXISTS `championnat`;
CREATE TABLE IF NOT EXISTS `championnat` (
  `num_championnat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_championnat` varchar(50) NOT NULL,
  `num_categorie` int(11) NOT NULL,
  `num_division` int(11) NOT NULL,
  `num_type_championnat` int(11) NOT NULL,
  PRIMARY KEY (`num_championnat`),
  KEY `fk_numCategorie` (`num_categorie`),
  KEY `fk_numDivision` (`num_division`),
  KEY `fk_numTypeChampionnat` (`num_type_championnat`)
) ENGINE=InnoDB AUTO_INCREMENT=739 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `championnat`
--

INSERT INTO `championnat` (`num_championnat`, `nom_championnat`, `num_categorie`, `num_division`, `num_type_championnat`) VALUES
(736, 'lkjhgyut', 1, 1, 3),
(737, 'dfy', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `num_club` int(11) NOT NULL AUTO_INCREMENT,
  `nom_club` varchar(50) NOT NULL,
  PRIMARY KEY (`num_club`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `club`
--

INSERT INTO `club` (`num_club`, `nom_club`) VALUES
(1, 'kjgf'),
(2, 'uggf');

-- --------------------------------------------------------

--
-- Structure de la table `deplacement`
--

DROP TABLE IF EXISTS `deplacement`;
CREATE TABLE IF NOT EXISTS `deplacement` (
  `num_arbitre` int(11) NOT NULL,
  `num_salle` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  KEY `fkD_numArbitre` (`num_arbitre`),
  KEY `fkD_numSalle` (`num_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `num_division` int(11) NOT NULL AUTO_INCREMENT,
  `nom_division` varchar(50) NOT NULL,
  PRIMARY KEY (`num_division`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `division`
--

INSERT INTO `division` (`num_division`, `nom_division`) VALUES
(1, 'Homme'),
(2, 'Femme');

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `num_equipe` int(11) NOT NULL AUTO_INCREMENT,
  `num_club` int(11) NOT NULL,
  `nom_equipe` varchar(50) NOT NULL,
  `num_championnat` int(11) NOT NULL,
  PRIMARY KEY (`num_equipe`),
  KEY `fk_numClub` (`num_club`),
  KEY `fk_numChampionnat` (`num_championnat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`num_equipe`, `num_club`, `nom_equipe`, `num_championnat`) VALUES
(1, 1, 'jhyfd', 736),
(2, 2, 'hgfd', 737);

-- --------------------------------------------------------

--
-- Structure de la table `indisponibilite`
--

DROP TABLE IF EXISTS `indisponibilite`;
CREATE TABLE IF NOT EXISTS `indisponibilite` (
  `num_arbitre` int(11) NOT NULL,
  `date_jour` date NOT NULL,
  `Code_demi_journée` varchar(15) NOT NULL,
  KEY `fk_numArbitre` (`num_arbitre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `matchb`
--

DROP TABLE IF EXISTS `matchb`;
CREATE TABLE IF NOT EXISTS `matchb` (
  `num_match` int(11) NOT NULL AUTO_INCREMENT,
  `num_salle` int(11) NOT NULL,
  `date_match` date NOT NULL,
  `heure_match` time NOT NULL,
  `num_equipe_1` int(11) NOT NULL,
  `num_equipe_2` int(11) NOT NULL,
  `num_equipe_p` int(11) NOT NULL,
  `num_equipe_s` int(11) NOT NULL,
  `montant_deplt_p` int(11) NOT NULL,
  `montant_deplt_s` int(11) NOT NULL,
  PRIMARY KEY (`num_match`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

DROP TABLE IF EXISTS `parametre`;
CREATE TABLE IF NOT EXISTS `parametre` (
  `numero_param` int(11) NOT NULL AUTO_INCREMENT,
  `montant_km` decimal(2,0) NOT NULL,
  `mail_responsable` varchar(50) NOT NULL,
  PRIMARY KEY (`numero_param`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `num_salle` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_salle` varchar(50) NOT NULL,
  PRIMARY KEY (`num_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_championnat`
--

DROP TABLE IF EXISTS `type_championnat`;
CREATE TABLE IF NOT EXISTS `type_championnat` (
  `num_type_championnat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type_championnat` varchar(50) NOT NULL,
  PRIMARY KEY (`num_type_championnat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_championnat`
--

INSERT INTO `type_championnat` (`num_type_championnat`, `nom_type_championnat`) VALUES
(1, 'Mort subite'),
(2, 'NBA'),
(3, 'test');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `arbitre`
--
ALTER TABLE `arbitre`
  ADD CONSTRAINT `fkA_numClub` FOREIGN KEY (`num_club`) REFERENCES `club` (`num_club`),
  ADD CONSTRAINT `fkA_numEquipe` FOREIGN KEY (`num_equipe`) REFERENCES `equipe` (`num_equipe`);

--
-- Contraintes pour la table `championnat`
--
ALTER TABLE `championnat`
  ADD CONSTRAINT `fk_numCategorie` FOREIGN KEY (`num_categorie`) REFERENCES `categorie` (`num_categorie`),
  ADD CONSTRAINT `fk_numDivision` FOREIGN KEY (`num_division`) REFERENCES `division` (`num_division`),
  ADD CONSTRAINT `fk_numTypeChampionnat` FOREIGN KEY (`num_type_championnat`) REFERENCES `type_championnat` (`num_type_championnat`);

--
-- Contraintes pour la table `deplacement`
--
ALTER TABLE `deplacement`
  ADD CONSTRAINT `fkD_numArbitre` FOREIGN KEY (`num_arbitre`) REFERENCES `arbitre` (`num_arbitre`),
  ADD CONSTRAINT `fkD_numSalle` FOREIGN KEY (`num_salle`) REFERENCES `salle` (`num_salle`);

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `fk_numChampionnat` FOREIGN KEY (`num_championnat`) REFERENCES `championnat` (`num_championnat`),
  ADD CONSTRAINT `fk_numClub` FOREIGN KEY (`num_club`) REFERENCES `club` (`num_club`);

--
-- Contraintes pour la table `indisponibilite`
--
ALTER TABLE `indisponibilite`
  ADD CONSTRAINT `fk_numArbitre` FOREIGN KEY (`num_arbitre`) REFERENCES `arbitre` (`num_arbitre`);

--
-- Contraintes pour la table `matchb`
--
ALTER TABLE `matchb`
  ADD CONSTRAINT `fk_numSalle` FOREIGN KEY (`num_match`) REFERENCES `salle` (`num_salle`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
