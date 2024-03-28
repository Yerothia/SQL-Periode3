START TRANSACTION;

USE `Yerothia`;

-- Voeg extra willekeurige e-mailadressen toe aan de tabel `Emails`
INSERT INTO `Emails` (`emailId`, `email`) VALUES 
(6, 'mark.thompson@example.com'),
(7, 'laura.wilson@example.com'),
(8, 'chris.white@example.com'),
(9, 'jessica.brown@example.com'),
(10, 'ryan.harris@example.com'),
(11, 'emily.clark@example.com'),
(12, 'jacob.lewis@example.com'),
(13, 'olivia.hall@example.com'),
(14, 'nathan.young@example.com');

-- Voeg extra willekeurige accountgegevens toe aan de tabel `Accounts`
INSERT INTO `Accounts` (`emailId`, `wachtwoord`, `accounttype`) VALUES 
(6, 'MThompson123', 'Klant'),
(7, 'LWilson456', 'Beheerder'),
(8, 'CWhite789', 'Klant'),
(9, 'JBrown321', 'Klant'),
(10, 'RHarris654', 'Klant'),
(11, 'EClark987', 'Klant'),
(12, 'JLewis123', 'Beheerder'),
(13, 'OHall456', 'Klant'),
(14, 'NYoung789', 'Klant');

-- Voeg extra willekeurige contactgegevens toe aan de tabel `Contacten`
INSERT INTO `Contacten` (`telefoonnummer`, `contactpersoon`) VALUES 
(741852963, 'Mark Thompson'),
(852963741, 'Laura Wilson'),
(963741852, 'Chris White'),
(741963852, 'Jessica Brown'),
(852741963, 'Ryan Harris'),
(963852741, 'Emily Clark'),
(741963852, 'Jacob Lewis'),
(852741963, 'Olivia Hall'),
(963852741, 'Nathan Young');

-- Voeg extra willekeurige klantgegevens toe aan de tabel `Klanten`
INSERT INTO `Klanten` (`klantId`, `kvkNummer`, `accountId`) VALUES 
(1, 34567891, 1),
(2, 45678912, 2),
(3, 56789123, 3),
(4, 67891234, 4),
(5, 78912345, 5),
(6, 89123456, 6),
(7, 91234567, 7),
(8, 12345678, 8),
(9, 23456789, 9);


-- Voeg extra willekeurige adresgegevens toe aan de tabel `Adressen`
INSERT INTO `Adressen` (`adresId`, `vestigingsnaam`, `postcode`, `huisnummer`, `toevoeging`, `klantId`, `contactId`, `emailId`) VALUES 
(6, 'Bedrijf Y', '1234CD', 6, 'F', 1, 1, 6),
(7, 'Kantoor Z', '5678EF', 7, 'G', 2, 2, 7),
(8, 'Hoofdkantoor X', '9012GH', 8, 'H', 3, 3, 8),
(9, 'Winkel B', '3456IJ', 9, 'I', 4, 4, 9),
(10, 'Magazijn C', '7890KL', 10, 'J', 5, 5, 10),
(11, 'Kantoor D', '1234MN', 11, 'K', 6, 6, 11),
(12, 'Winkel E', '5678OP', 12, 'L', 7, 7, 12),
(13, 'Hoofdkantoor F', '9012QR', 13, 'M', 8, 8, 13),
(14, 'Kantoor G', '3456ST', 14, 'N', 9, 9, 14);

-- Voeg extra willekeurige abonnementsgegevens toe aan de tabel `Abonnementen`
INSERT INTO `Abonnementen` (`abonnementId`, `naam`, `omschrijving`, `prijs`, `ingangsdatum`, `afsluitdatum`, `abonnementsperiode`, `capaciteit`, `adresId`) VALUES 
(3, 'Extra', 'Extra abonnement', 69.99, '2024-03-01', '2024-03-01', 'Maandelijks', 150, 6),
(4, 'Deluxe', 'Deluxe abonnement', 129.99, '2024-03-01', '2024-03-01', 'Maandelijks', 300, 7),
(5, 'Starter', 'Starter abonnement', 19.99, '2024-03-01', '2024-03-01', 'Maandelijks', 25, 8),
(6, 'Essential', 'Essential abonnement', 89.99, '2024-03-01', '2024-03-01', 'Maandelijks', 200, 9),
(7, 'Basic Plus', 'Basic Plus abonnement', 39.99, '2024-03-01', '2024-03-01', 'Maandelijks', 75, 10),
(8, 'Elite', 'Elite abonnement', 179.99, '2024-03-01', '2024-03-01', 'Maandelijks', 600, 11),
(9, 'Light', 'Light abonnement', 9.99, '2024-03-01', '2024-03-01', 'Maandelijks', 10, 12),
(10, 'Premium Plus', 'Premium Plus abonnement', 149.99, '2024-03-01', '2024-03-01', 'Maandelijks', 400, 13),
(11, 'Advanced', 'Advanced abonnement', 59.99, '2024-03-02', '2024-03-02', 'Maandelijks', 125, 14);

-- Voeg extra willekeurige productgegevens toe aan de tabel `Producten`
INSERT INTO `Producten` (`naam`, `omschrijving`, `prijs`) VALUES 
('Product F', 'Omschrijving van product F', 69.99),
('Product G', 'Omschrijving van product G', 79.99),
('Product H', 'Omschrijving van product H', 89.99),
('Product I', 'Omschrijving van product I', 99.99),
('Product J', 'Omschrijving van product J', 109.99),
('Product K', 'Omschrijving van product K', 119.99),
('Product L', 'Omschrijving van product L', 129.99),
('Product M', 'Omschrijving van product M', 139.99),
('Product N', 'Omschrijving van product N', 149.99);

-- Voeg extra willekeurige factuurgegevens toe aan de tabel `AbbonementsProducten`
INSERT INTO `AbonnementsProducten` (`productId`, `abonnementId`, `aantal`) VALUES 
(1, 3, 10),
(2, 4, 5),
(3, 5, 3),
(4, 6, 8),
(5, 7, 7),
(6, 8, 6),
(7, 9, 5),
(8, 10, 10),
(9, 11, 20);

-- Voeg extra willekeurige betaalgegevens toe aan de tabel `Betaalgegevens`
INSERT INTO `Betaalgegevens` (`betaalId`, `rekeningnummer`, `betaalmethode`, `betalingstype`, `betaaldatum`) VALUES 
(1, 147258369, 'creditcard', 'maandelijks', '2024-03-10'),
(2, 258369147, 'ideal', 'eenmalig', '2024-03-05'),
(3, 369147258, 'factuur', 'eenmalig', '2024-03-03'),
(4, 963852741, 'creditcard', 'eenmalig', '2024-03-01'),
(5, 852741963, 'incasso', 'maandelijks', '2024-03-20'),
(6, 741852963, 'creditcard', 'maandelijks', '2024-03-15'),
(7, 963741852, 'ideal', 'eenmalig', '2024-03-12'),
(8, 741963852, 'factuur', 'eenmalig', '2024-03-08'),
(9, 852963741, 'creditcard', 'eenmalig', '2024-03-06');

-- Voeg extra willekeurige automatische incassogegevens toe aan de tabel `AutomatischeIncassos`
INSERT INTO `AutomatischeIncassos` (`betaalId`, `abonnementId`, `status`, `incassobedrag`) VALUES 
(1, 3, 'Lopend', 69.99),
(2, 4, 'Betaald', 129.99),
(3, 5, 'Beëindigd', 19.99),
(4, 6, 'Mislukt', 89.99),
(5, 7, 'Geannuleerd', 39.99),
(6, 8, 'Lopend', 179.99),
(7, 9, 'Betaald', 9.99),
(8, 10, 'Beëindigd', 149.99),
(9, 11, 'Mislukt', 59.99);

-- Voeg extra willekeurige ordergegevens toe aan de tabel `Orders`
INSERT INTO `Orders` (`status`, `totaalprijs`, `orderdatum`, `adresId`) VALUES 
('Betaald', 129.99, '2024-03-20', 6),
('Betaald', 159.99, '2024-03-18', 7),
('Betaald', 59.99, '2024-03-16', 8),
('Betaald', 79.99, '2024-03-14', 9),
('Betaald', 99.99, '2024-03-12', 10),
('Betaald', 139.99, '2024-03-10', 11),
('Betaald', 19.99, '2024-03-08', 12),
('Betaald', 189.99, '2024-03-06', 13),
('Betaald', 49.99, '2024-03-04', 14);

-- Voeg extra willekeurige orderregelgegevens toe aan de tabel `Orderregels`
INSERT INTO `Orderregels` (`orderId`, `productId`, `factuurprijs`, `aantal`) VALUES 
(1, 1, 69.99, 1),
(2, 2, 79.99, 1),
(3, 3, 89.99, 1),
(4, 4, 99.99, 1),
(5, 5, 109.99, 1),
(6, 6, 119.99, 1),
(7, 7, 129.99, 1),
(8, 8, 139.99, 1),
(9, 9, 149.99, 1);

-- Voeg extra willekeurige factuurgegevens toe aan de tabel `Facturen`
INSERT INTO `Facturen` (`adresId`, `betaalId`, `orderId`, `status`, `factuurbedrag`) VALUES 
(6, 1, 1, 'Betaald', 129.99),
(7, 2, 2, 'Betaald', 159.99),
(8, 3, 3, 'Betaald', 59.99),
(9, 4, 4, 'Betaald', 79.99),
(10, 5, 5, 'Betaald', 99.99),
(11, 6, 6, 'Betaald', 139.99),
(12, 7, 7, 'Betaald', 19.99),
(13, 8, 8, 'Betaald', 189.99),
(14, 9, 9, 'Betaald', 49.99);

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
('2024-03-25 10:00:00', '2024-03-21', 'Serviceaanvraag', 6, NULL),
('2024-03-24 11:30:00', '2024-03-20', 'Chataanvraag', 7, NULL),
('2024-03-23 09:45:00', '2024-03-19', 'Retouraanvraag', 8, 1),
('2024-03-22 14:20:00', '2024-03-18', 'Serviceaanvraag', 9, NULL),
('2024-03-21 13:15:00', '2024-03-17', 'Chataanvraag', 10, NULL),
('2024-03-20 10:30:00', '2024-03-16', 'Retouraanvraag', 11, 2),
('2024-03-19 12:45:00', '2024-03-15', 'Serviceaanvraag', 12, NULL),
('2024-03-18 15:20:00', '2024-03-14', 'Chataanvraag', 13, NULL),
('2024-03-17 08:10:00', '2024-03-13', 'Retouraanvraag', 14, 3);

COMMIT;
