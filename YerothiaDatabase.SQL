CREATE DATABASE IF NOT EXCISTS `Yerothia`;

USE `Yerothia`;

CREATE TABLE IF NOT EXISTS Klanten (
  `klantId` INT AUTO_INCREMENT PRIMARY KEY,
  `bedrijfsnaam` VARCHAR(255),
  `postcode` VARCHAR(10),
  `huisnr` INT,
  `toevoeging` VARCHAR(10),
  `contactpersoon` VARCHAR(255),
  `telefoonnummer` VARCHAR(20),
  `accountId` INT,
  FOREIGN KEY (`accountId`) REFERENCES Accounts(`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Bezorggegevens` (
  `bezorgId` INT AUTO_INCREMENT PRIMARY KEY,
  `bezorgnaam` VARCHAR(255),
  `bezorgpostcode` VARCHAR(10),
  `bezorghuisnr` INT,
  `bezorgtoevoeging` VARCHAR(10),
  `bezorgtelefoonnummer` VARCHAR(20),
  `klantId` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Abonnementen` (
  `abonnementId` INT AUTO_INCREMENT PRIMARY KEY,
  `naam` VARCHAR(255),
  `omschrijving` TEXT,
  `prijs` DECIMAL(10, 2),
  `abonnementsperiode` VARCHAR(50),
  `capaciteit` INT,
  `bezorgId` INT,
  FOREIGN KEY (`bezorgId`) REFERENCES `Bezorggegevens`(`bezorgId`)
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

CREATE TABLE IF NOT EXISTS `Orders` (
  `orderId` INT AUTO_INCREMENT PRIMARY KEY,
  `status` ENUM('winkelmand', 'betaald', 'geleverd', 'geannuleerd'),
  `totaalprijs` DECIMAL(10, 2),
  `bezorgadres` VARCHAR(255),
  `orderdatum` DATE,
  `bezorgId` INT,
  FOREIGN KEY (`bezorgId`) REFERENCES `Bezorggegevens`(`bezorgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Services` (
  `serviceId` INT AUTO_INCREMENT PRIMARY KEY,
  `servicetijdstip` DATETIME,
  `aanvraagdatum` DATE,
  `servicetype` ENUM('serviceaanvraag', 'chataanvraag', 'retouraanvraag'), 
  `bezorgId` INT,
  `retourId` INT DEFAULT NULL,
  FOREIGN KEY (`bezorgId`) REFERENCES `Bezorggegevens`(`bezorgId`)
  FOREIGN KEY (`retourId`) REFERENCES `Retouren`(`retourId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Automatische incasso's` (
  `abonnementId` INT,
  `betaalId` INT,
  `status` INT,
  `incassobedrag` DECIMAL(10, 2),
  `bezorgadres` VARCHAR(255),
  PRIMARY KEY (`abonnementId`, `betaalId`),
  FOREIGN KEY (`abonnementId`) REFERENCES `Abonnementen`(`abonnementId`),
  FOREIGN KEY (`betaalId`) REFERENCES `Betalingen`(`betaalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Facturen` (
  `factuurId` INT AUTO_INCREMENT PRIMARY KEY,
  `status` INT,
  `factuurbedrag` DECIMAL(10, 2),
  `factuurpostcode` VARCHAR(10),
  `factuurhuisnr` INT,
  `factuurtoevoeging` VARCHAR(10),
  `betaalId` INT,
  FOREIGN KEY (`betaalId`) REFERENCES `Betalingen`(`betaalId`)
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

CREATE TABLE IF NOT EXISTS `Orderregels` (
  `orderId` INT,
  `productId` INT,
  `factuurprijs` DECIMAL(10, 2),
  `aantal` INT,
  PRIMARY KEY (`orderId`, `productId`),
  FOREIGN KEY (`orderId`) REFERENCES `Orders`(`orderId`),
  FOREIGN KEY (`productId`) REFERENCES `Producten`(`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
