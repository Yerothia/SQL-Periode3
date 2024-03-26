CREATE DATABASE IF NOT EXISTS `Yerothia`;

USE `Yerothia`;

DROP TABLE IF EXISTS `AutomatischeIncassos`;
DROP TABLE IF EXISTS `AbonnementsProducten`;
DROP TABLE IF EXISTS `Abonnementen`;
DROP TABLE IF EXISTS `Facturen`;
DROP TABLE IF EXISTS `Services`;
DROP TABLE IF EXISTS `Retouren`;
DROP TABLE IF EXISTS `Orderregels`;
DROP TABLE IF EXISTS `Orders`;
DROP TABLE IF EXISTS `Adressen`;
DROP TABLE IF EXISTS `Klanten`;
DROP TABLE IF EXISTS `Accounts`;
DROP TABLE IF EXISTS `Emails`;
DROP TABLE IF EXISTS `Contacten`;
DROP TABLE IF EXISTS `Betaalgegevens`;
DROP TABLE IF EXISTS `Producten`;

CREATE TABLE IF NOT EXISTS `Emails` (
  `emailId` INT AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(255) UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Accounts` (
  `accountId` INT AUTO_INCREMENT PRIMARY KEY,
  `emailId` INT,
  `wachtwoord` VARCHAR(255),
  `accounttype` ENUM('Beheerder', 'Klant', 'Medewerker'),
  FOREIGN KEY (`emailId`) REFERENCES `Emails`(`emailId`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Contacten` (
  `contactId` INT AUTO_INCREMENT PRIMARY KEY,
  `telefoonnummer` INT,
  `contactpersoon` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Klanten` (
  `klantId` INT AUTO_INCREMENT PRIMARY KEY,
  `kvkNummer` INT(8) UNSIGNED,
  `accountId` INT,
  `contactId` INT,
  `emailId` INT,
  FOREIGN KEY (`accountId`) REFERENCES `Accounts`(`accountId`),
  FOREIGN KEY (`contactId`) REFERENCES `Contacten`(`contactId`),
  FOREIGN KEY (`emailId`) REFERENCES `Emails`(`emailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Adressen` (
  `adresId` INT AUTO_INCREMENT PRIMARY KEY,
  `vestigingsnaam` VARCHAR(255),
  `postcode` VARCHAR(10),
  `huisnummer` INT,
  `toevoeging` VARCHAR(10),
  `klantId` INT,
  `contactId` INT,
  `emailId` INT,
  FOREIGN KEY (`klantId`) REFERENCES `Klanten`(`klantId`),
  FOREIGN KEY (`contactId`) REFERENCES `Contacten`(`contactId`),
  FOREIGN KEY (`emailId`) REFERENCES `Emails`(`emailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Abonnementen` (
  `abonnementId` INT AUTO_INCREMENT PRIMARY KEY,
  `naam` VARCHAR(255),
  `omschrijving` TEXT,
  `prijs` DECIMAL(10, 2),
  `abonnementsperiode` ENUM('Maandelijks', 'Jaarlijks'),
  `capaciteit` INT,
  `adresId` INT,
  FOREIGN KEY (`adresId`) REFERENCES `Adressen`(`adresId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Producten` (
  `productId` INT PRIMARY KEY AUTO_INCREMENT,
  `naam` VARCHAR(255),
  `omschrijving` TEXT,
  `prijs` DECIMAL(10, 2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `AbonnementsProducten` (
  `productId` INT,
  `abonnementId` INT,
  `afsluitdatum` DATE,
  `ingangsdatum` DATE,
  `einddatum` DATE,
  `factuurprijs` DECIMAL(10, 2),
  PRIMARY KEY (`productId`, `abonnementId`),
  FOREIGN KEY (`productId`) REFERENCES `Producten`(`productID`),
  FOREIGN KEY (`abonnementId`) REFERENCES `Abonnementen`(`abonnementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Betaalgegevens` (
  `betaalId` INT PRIMARY KEY AUTO_INCREMENT,
  `rekeningnummer` INT,
  `betaalmethode` ENUM('Creditcard', 'iDEAL', 'Factuur', 'Incasso', 'OpRekening'),
  `betalingstype` ENUM('Eenmalig', 'Maandelijks', 'Jaarlijks'),
  `betaaldatum` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `AutomatischeIncassos` (
  `abonnementId` INT,
  `betaalId` INT,
  `status` ENUM('Lopend', 'Betaald', 'Beëindigd', 'Mislukt', 'Geannuleerd'),
  `incassobedrag` DECIMAL(10, 2),
  PRIMARY KEY (`abonnementId`, `betaalId`),
  FOREIGN KEY (`abonnementId`) REFERENCES `Abonnementen`(`abonnementId`),
  FOREIGN KEY (`betaalId`) REFERENCES `Betaalgegevens`(`betaalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Orders` (
  `orderId` INT AUTO_INCREMENT PRIMARY KEY,
  `status` ENUM('Winkelmand', 'Betaald', 'Geleverd', 'Geannuleerd'),
  `totaalprijs` DECIMAL(10, 2),
  `orderdatum` DATE,
  `adresId` INT,
  FOREIGN KEY (`adresId`) REFERENCES `Adressen`(`adresId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Orderregels` (
  `orderregelId` INT AUTO_INCREMENT PRIMARY KEY,
  `orderId` INT,
  `productId` INT,
  `factuurprijs` DECIMAL(10, 2),
  `aantal` INT,
  FOREIGN KEY (`orderId`) REFERENCES `Orders`(`orderId`),
  FOREIGN KEY (`productId`) REFERENCES `Producten`(`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `Facturen` (
  `adresId` INT,
  `betaalId` INT,
  `orderId` INT,
  `status` ENUM('Open', 'Betaald', 'Vervallen', 'Mislukt', 'Geannuleerd'),
  `factuurbedrag` DECIMAL(10,2),
  PRIMARY KEY (`adresId`, `betaalId`, `orderId`),
  FOREIGN KEY (`adresId`) REFERENCES `Adressen`(`adresId`),
  FOREIGN KEY (`betaalId`) REFERENCES `Betaalgegevens`(`betaalId`),
  FOREIGN KEY (`orderId`) REFERENCES `Orders`(`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Retouren` (
  `retourId` INT AUTO_INCREMENT PRIMARY KEY,
  `reden` TEXT,
  `aanvraagdatum` DATE,
  `retourdatum` DATE,
  `orderregelId` INT,
  FOREIGN KEY (`orderregelId`) REFERENCES `Orderregels`(`orderregelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Services` (
  `serviceId` INT AUTO_INCREMENT PRIMARY KEY,
  `servicetijdstip` DATETIME,
  `aanvraagdatum` DATE,
  `servicetype` ENUM('Serviceaanvraag', 'Chataanvraag', 'Retouraanvraag'), 
  `adresId` INT,
  `retourId` INT DEFAULT NULL,
  FOREIGN KEY (`adresId`) REFERENCES `Adressen`(`adresId`),
  FOREIGN KEY (`retourId`) REFERENCES `Retouren`(`retourId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

