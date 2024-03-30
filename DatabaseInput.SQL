START TRANSACTION;

USE `Yerothia`;

-- Voeg extra willekeurige e-mailadressen toe aan de tabel `Emails`
INSERT INTO `Emails` (`emailId`, `email`) VALUES
(1, 'ronald@yerothia.nl'),
(2, 'yetkin@yerothia.nl'),
(3, 'thijs@yerothia.nl'),
(4, 'iain@yerothia.nl'),
(5, 'piet@yerothia.nl'),
(6, 'henk@yerothia.nl'),
(7, 'mark.thompson@degroenevinger.nl'),
(8, 'laura.wilson@slimmesolutions.nl'),
(9, 'chris.white@ambachtelijkeambiance.nl'),
(10, 'jessica.brown@innovatiehuisnederland.nl'),
(11, 'ryan.harris@dekoopmanskamer.nl'),
(12, 'emily.clark@energiekecosysteem.nl'),
(13, 'jacob.lewis@hetcreatiefcollectief.nl'),
(14, 'olivia.hall@praktischpartnerschap.nl'),
(15, 'nathan.young@deambachtelijkeaanpakkers.nl'),
(16, 'femke.de.vries@degroenevinger.nl'),
(17, 'lars.jansen@degroenevinger.nl'),
(18, 'anna.van.dijk@degroenevinger.nl');


-- Voeg extra willekeurige accountgegevens toe aan de tabel `Accounts`
INSERT INTO `Accounts` (`emailId`, `wachtwoord`, `accounttype`) VALUES 
(1, 'wachtwoord', 'Beheerder'),
(2, 'wachtwoord', 'Beheerder'),
(3, 'wachtwoord', 'Beheerder'),
(4, 'wachtwoord', 'Beheerder'),
(5, 'wachtwoord', 'Medewerker'),
(6, 'wachtwoord', 'Medewerker'),
(7, 'MThompson123', 'Klant'),
(8, 'LWilson456', 'Klant'),
(9, 'CWhite789', 'Klant'),
(10, 'JBrown321', 'Klant'),
(11, 'RHarris654', 'Klant'),
(12, 'EClark987', 'Klant'),
(13, 'JLewis123', 'Klant'),
(14, 'OHall456', 'Klant'),
(15, 'NYoung789', 'Klant');


-- Voeg extra willekeurige contactgegevens toe aan de tabel `Contacten`
INSERT INTO `Contacten` (`telefoonnummer`, `contactpersoon`) VALUES 
(0641852963, 'Mark Thompson'),
(0852963741, 'Laura Wilson'),
(0663741852, 'Chris White'),
(0762196842, 'Jessica Brown'),
(0202741963, 'Ryan Harris'),
(0103852741, 'Emily Clark'),
(0401963852, 'Jacob Lewis'),
(0782741963, 'Olivia Hall'),
(0613852741, 'Nathan Young'),
(0638415848, 'Femke de Vries'),
(0699499787, 'Lars Jansen'),
(0649523897, 'Anna van Dijk');

-- Voeg extra willekeurige klantgegevens toe aan de tabel `Klanten`
INSERT INTO `Klanten` (`klantId`, `kvkNummer`, `accountId`) VALUES 
(40001, 34567891, 1),
(40002, 45678912, 2),
(40003, 56789123, 3),
(40004, 67891234, 4),
(40005, 78912345, 5),
(40006, 89123456, 6),
(40007, 91234567, 7),
(40008, 12345678, 8),
(40009, 23456789, 9);


-- Voeg extra willekeurige adresgegevens toe aan de tabel `Adressen`
INSERT INTO `Adressen` (`adresId`, `vestigingsnaam`, `postcode`, `huisnummer`, `toevoeging`, `klantId`, `contactId`, `emailId`) VALUES 
(1, 'De Groene Vinger B.V.', '1234CD', 6, 'F', 40001, 1, 7),
(2, 'Slimme Solutions NL B.V.', '5678EF', 7, NULL, 40002, 2, 8),
(3, 'Ambachtelijke Ambiance B.V.', '9012GH', 8, NULL, 40003, 3, 9),
(4, 'Innovatiehuis Nederland B.V.', '3456IJ', 9, 'A', 40004, 4, 10),
(5, 'De Koopmans Kamer B.V.', '7890KL', 10, 'C', 40005, 5, 11),
(6, 'Energiek Ecosysteem B.V.', '1234MN', 11, NULL, 40006, 6, 12),
(7, 'Het Creatief Collectief B.V.', '5678OP', 12, NULL, 40007, 7, 13),
(8, 'Praktisch Partnerschap B.V.', '9012QR', 13, NULL, 40008, 8, 14),
(9, 'De Ambachtelijke Aanpakkers B.V.', '3456ST', 14, NULL, 40009, 9, 15),
(10, 'De Groene Vinger Breda', '4811AB', 22, NULL, 40001, 10, 16),
(11, 'De Groene Vinger Dordrecht', '3311CC', 11, NULL, 40001, 11, 17),
(12, 'De Groene Vinger Eindhoven', '5611DE', 35, NULL, 40001, 12, 18);


-- Voeg extra willekeurige abonnementsgegevens toe aan de tabel `Abonnementen`
INSERT INTO `Abonnementen` (`abonnementId`, `naam`, `omschrijving`, `prijs`, `ingangsdatum`, `afsluitdatum`, `abonnementsperiode`, `capaciteit`, `adresId`) VALUES 
(1, 'Essentials', 'Essentials abonnement', 300.00, '2024-03-01', '2024-03-01', 'Maandelijks', 50, 1),
(2, 'Essentials', 'Essentials abonnement', 3000.00, '2024-03-01', '2024-03-01', 'Jaarlijks', 50, 2),
(3, 'Essentials', 'Essentials abonnement', 3000.00, '2024-03-01', '2024-03-01', 'Jaarlijks', 50, 3),
(4, 'Prestige', 'Prestige abonnement', 13000.00, '2024-03-01', '2024-03-01', 'Jaarlijks', 250, 4),
(5, 'Prestige', 'Prestige abonnement', 1250.00, '2024-03-01', '2024-03-01', 'Maandelijks', 250, 5),
(6, 'Prestige', 'Prestige abonnement', 1250.00, '2024-03-01', '2024-03-01', 'Maandelijks', 250, 6),
(7, 'Signature', 'Signature abonnement', 50000.00, '2024-03-01', '2024-03-01', 'Jaarlijks', 1000, 7),
(8, 'Signature', 'Signature abonnement', 50000.00, '2024-03-01', '2024-03-01', 'Jaarlijks', 1000, 8),
(9, 'Signature', 'Signature abonnement', 50000.00, '2024-03-02', '2024-03-02', 'Jaarlijks', 1000, 9);

-- Voeg extra willekeurige productgegevens toe aan de tabel `Producten`
INSERT INTO `Producten` (`naam`, `omschrijving`, `prijs`) VALUES 
('AromaBliss', 'Omschrijving van AromaBliss', 795.00),
('FlavorFusion', 'Omschrijving van FlavorFusion', 1150.00),
('BaristaTouch', 'Omschrijving van BaristaTouch', 1475.00),
('Yerothia Black', 'Omschrijving van Yerothia Black', 10.99),
('Yerothia White', 'Omschrijving van Yerothia White', 12.99),
('Yerothia Gold', 'Omschrijving van Yerothia Gold', 19.99),
('Koffiemelk', 'Omschrijving van Koffiemelk', 1.99),
('Suiker', 'Omschrijving van Suiker', 3.99),
('Custom Koffiemokken', 'Omschrijving van Custom Koffiemokken', 8.99);

-- Voeg extra willekeurige factuurgegevens toe aan de tabel `AbbonementsProducten`
INSERT INTO `AbonnementsProducten` (`productId`, `abonnementId`, `aantal`) VALUES 
(1, 1, 10),
(2, 2, 5),
(3, 3, 3),
(4, 4, 8),
(5, 5, 7),
(6, 6, 6),
(7, 7, 5),
(8, 8, 10),
(9, 9, 20);

-- Voeg extra willekeurige betaalgegevens toe aan de tabel `Betaalgegevens`
INSERT INTO `Betaalgegevens` (`betaalId`, `rekeningnummer`, `betaalmethode`, `betalingstype`, `betaaldatum`) VALUES 
(1, 'NL57ABNA0987654321', 'Creditcard', 'Maandelijks', '2024-03-10'),
(2, 'NL88RABO3456789012', 'iDEAL', 'Eenmalig', '2024-03-05'),
(3, 'NL19INGB6543210987', 'Factuur', 'Eenmalig', '2024-03-03'),
(4, 'NL66SNSB8901234567', 'Creditcard', 'Eenmalig', '2024-03-01'),
(5, 'NL25TRIO5432109876', 'Incasso', 'Maandelijks', '2024-03-20'),
(6, 'NL36ABNA9876543210', 'OpRekening', 'Maandelijks', '2024-03-15'),
(7, 'NL49RABO2109876543', 'iDEAL', 'Eenmalig', '2024-03-12'),
(8, 'NL73INGB7890123456', 'Factuur', 'Eenmalig', '2024-03-08'),
(9, 'NL84SNSB0123456789', 'Incasso', 'Jaarlijks', '2024-03-06');

-- Voeg extra willekeurige automatische incassogegevens toe aan de tabel `AutomatischeIncassos`
INSERT INTO `AutomatischeIncassos` (`betaalId`, `abonnementId`, `status`, `incassobedrag`) VALUES 
(1, 1, 'Lopend', 69.99),
(2, 2, 'Betaald', 129.99),
(3, 3, 'Beëindigd', 19.99),
(4, 4, 'Mislukt', 89.99),
(5, 5, 'Geannuleerd', 39.99),
(6, 6, 'Lopend', 179.99),
(7, 7, 'Betaald', 9.99),
(8, 8, 'Beëindigd', 149.99),
(9, 9, 'Mislukt', 59.99);

-- Voeg extra willekeurige ordergegevens toe aan de tabel `Orders`
INSERT INTO `Orders` (`orderId`, `status`, `orderdatum`, `adresId`) VALUES 
(1, 'Geleverd',  '2024-03-20', 1),
(2, 'Betaald','2024-03-18', 2),
(3, 'Winkelmand', '2024-03-16', 3),
(4, 'Betaald', '2024-03-14', 4),
(5, 'Geleverd', '2024-03-12', 5),
(6, 'Winkelmand', '2024-03-10', 6),
(7, 'Winkelmand', '2024-03-08', 7),
(8, 'Winkelmand', '2024-03-06', 8),
(9, 'Geannuleerd', '2024-03-04', 9),
(10, 'Geleverd', '2024-03-20', 10),
(11, 'Geleverd', '2024-03-20', 11),
(12, 'Geleverd', '2024-03-20', 12);

-- Voeg extra willekeurige orderregelgegevens toe aan de tabel `Orderregels`
INSERT INTO `Orderregels` (`orderId`, `productId`, `aantal`) VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 5),
(4, 4, 1),
(5, 5, 1),
(6, 6, 3),
(7, 7, 1),
(8, 8, 10),
(9, 9, 50),
(10, 1, 3),
(11, 1, 3),
(12, 1, 5);


-- Voeg extra willekeurige factuurgegevens toe aan de tabel `Facturen`
INSERT INTO `Facturen` (`adresId`, `betaalId`, `orderId`, `status`, `factuurbedrag`) VALUES 
(1, 1, 1, 'Betaald', 129.99),
(2, 2, 2, 'Betaald', 159.99),
(3, 3, 3, 'Mislukt', 59.99),
(4, 4, 4, 'Betaald', 79.99),
(5, 5, 5, 'Betaald', 99.99),
(6, 6, 6, 'Open', 139.99),
(7, 7, 7, 'Vervallen', 19.99),
(8, 8, 8, 'Open', 189.99),
(9, 9, 9, 'Geannuleerd', 49.99),
(1, 1, 10, 'Betaald', 129.99),
(1, 1, 11, 'Betaald', 129.99),
(1, 1, 12, 'Betaald', 129.99);

-- Voeg extra willekeurige factuurgegevens toe aan de tabel `Retouren`
INSERT INTO `Retouren` (`reden`, `aanvraagdatum`, `retourdatum`, `orderregelId`) VALUES 
('Beschadigd product ontvangen', '2024-03-21', '2024-03-25', 1),
('Verkeerd product ontvangen', '2024-03-20', '2024-03-24', 2),
('Niet zoals verwacht', '2024-03-19', '2024-03-23', 3),
('Te klein', '2024-03-18', '2024-03-22', 4),
('Te groot', '2024-03-17', '2024-03-21', 5),
('Defect bij aankomst', '2024-03-16', '2024-03-20', 6),
('Onjuiste kleur', '2024-03-15', '2024-03-19', 7),
('Niet meer nodig', '2024-03-14', '2024-03-18', 8),
('Dubbele bestelling', '2024-03-13', '2024-03-17', 9);

-- Voeg extra willekeurige servicegegevens toe aan de tabel `Services`
INSERT INTO `Services` (`servicetijdstip`, `aanvraagdatum`, `servicetype`, `adresId`, `retourId`) VALUES 
('2024-03-25 10:00:00', '2024-03-21', 'Serviceaanvraag', 1, NULL),
('2024-03-24 11:30:00', '2024-03-20', 'Chataanvraag', 2, NULL),
('2024-03-23 09:45:00', '2024-03-19', 'Retouraanvraag', 3, 1),
('2024-03-22 14:20:00', '2024-03-18', 'Serviceaanvraag', 4, NULL),
('2024-03-21 13:15:00', '2024-03-17', 'Chataanvraag', 5, NULL),
('2024-03-20 10:30:00', '2024-03-16', 'Retouraanvraag', 6, 2),
('2024-03-19 12:45:00', '2024-03-15', 'Serviceaanvraag', 7, NULL),
('2024-03-18 15:20:00', '2024-03-14', 'Chataanvraag', 8, NULL),
('2024-03-17 08:10:00', '2024-03-13', 'Retouraanvraag', 9, 3);

COMMIT;
