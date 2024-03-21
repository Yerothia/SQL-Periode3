CREATE DATABASE IF NOT EXISTS `Yerothia`;


USE `Yerothia`;


CREATE TABLE IF NOT EXISTS `Accounts` (
  `accountId` INT AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(255),
  `wachtwoord` VARCHAR(255),
  `accounttype` ENUM('Beheerder', 'Klant')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Klanten` (
  `klantId` INT AUTO_INCREMENT PRIMARY KEY,
  `kvkNummer` INT,
  `contactpersoon` VARCHAR(255),
  `accountId` INT,
  FOREIGN KEY (`accountId`) REFERENCES `Accounts`(`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Adressen` (
  `adresId` INT AUTO_INCREMENT PRIMARY KEY,
  `vestigingsnaam` VARCHAR(255),
  `postcode` VARCHAR(6),
  `huisnummer` INT,
  `toevoeging` VARCHAR(10),
  `telefoonnummer` VARCHAR(20),
  `klantId` INT,
  FOREIGN KEY (`klantId`) REFERENCES `Klanten`(`klantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Abonnementen` (
  `abonnementId` INT AUTO_INCREMENT PRIMARY KEY,
  `naam` VARCHAR(255),
  `omschrijving` TEXT,
  `prijs` DECIMAL(10, 2),
  `abonnementsperiode` VARCHAR(50),
  `capaciteit` INT,
  `adresId` INT,
  FOREIGN KEY (`adresId`) REFERENCES `Adressen`(`adresId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Abonnementsorderregels` (
  `productId` INT,
  `abonnementId` INT,
  `ingangsdatum` DATE,
  `datum` DATE,
  `einddatum` DATE,
  `factuurprijs` DECIMAL(10, 2),
  PRIMARY KEY (`productId`, `abonnementId`),
  FOREIGN KEY (`productId`) REFERENCES `Producten`(`productID`),
  FOREIGN KEY (`abonnementId`) REFERENCES `Abonnementen`(`abonnementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Automatische incasso's` (
  `abonnementId` INT,
  `betaalId` INT,
  `status` INT,
  `incassobedrag` DECIMAL(10, 2),
  PRIMARY KEY (`abonnementId`, `betaalId`),
  FOREIGN KEY (`abonnementId`) REFERENCES `Abonnementen`(`abonnementId`),
  FOREIGN KEY (`betaalId`) REFERENCES `Betalingen`(`betaalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Orders` (
  `orderId` INT AUTO_INCREMENT PRIMARY KEY,
  `status` ENUM('winkelmand', 'betaald', 'geleverd', 'geannuleerd'),
  `totaalprijs` DECIMAL(10, 2),
  `orderdatum` DATE,
  `adresId` INT,
  FOREIGN KEY (`adresId`) REFERENCES `Adressen`(`adresId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Orderregels` (
  `orderId` INT,
  `productId` INT,
  `factuurprijs` DECIMAL(10, 2),
  `aantal` INT,
  PRIMARY KEY (`orderId`, `productId`),
  FOREIGN KEY (`orderId`) REFERENCES `Orders`(`orderId`),
  FOREIGN KEY (`productId`) REFERENCES `Producten`(`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `Facturen` (
  `adresId` INT,
  `betaalId` INT,
  `orderId` INT,
  `status` INT,
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
  `servicetype` ENUM('serviceaanvraag', 'chataanvraag', 'retouraanvraag'), 
  `adresId` INT,
  `retourId` INT DEFAULT NULL,
  FOREIGN KEY (`adresId`) REFERENCES `Adressen`(`adresId`),
  FOREIGN KEY (`retourId`) REFERENCES `Retouren`(`retourId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Betaalgegevens` (
  `betaalId` INT PRIMARY KEY AUTO_INCREMENT,
  `rekeningnummer` INT,
  `betaalmethode` ENUM('creditcard', 'ideal', 'factuur', 'incasso'),
  `betalingstype` ENUM('eenmalig', 'maandelijks', 'jaarlijks'),
  `betaaldatum` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Producten` (
  `productId` INT PRIMARY KEY AUTO_INCREMENT,
  `naam` VARCHAR(255),
  `omschrijving` TEXT,
  `prijs` DECIMAL(10, 2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

