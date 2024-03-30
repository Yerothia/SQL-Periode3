--  Hier komen procedures, functions, triggers, calls etc

-- Trigger --
-- Als status van factuur, bijvoorbeeld een "Open" factuur, wordt gewijzigd naar "Betaald" dan wordt deze in het Orders-tabel ook omgezet naar "Betaald". --
-- Trigger is terug te vinden onder de Triggers van het Facturen-tabel --
DROP TRIGGER IF EXISTS `update_order_status`;

DELIMITER //

CREATE TRIGGER `update_order_status` AFTER UPDATE ON `Facturen`
FOR EACH ROW

BEGIN
    IF OLD.status <> 'Betaald' AND NEW.status = 'Betaald' THEN
        UPDATE `Orders`
        SET status = 'Betaald'
        WHERE orderId = NEW.orderId;
    END IF;
END;
//

DELIMITER ;

-- Stored procedure --
-- Hiermee kan je de prijs updaten op het moment dat je de productId en de nieuwe prijs doorgeeft wanneer je de procedure uitvoert --
-- Terug te vinden onder het Yerothia datbase en dan Routines --

DROP PROCEDURE IF EXISTS `update_prijs`

DELIMITER //

CREATE PROCEDURE `update_prijs`(
    IN update_productId INT,
    IN update_prijs DECIMAL(10, 2)
)
BEGIN
    -- Update de prijs van het product met de opgegeven productId
    UPDATE Producten SET prijs = update_prijs WHERE productId = update_productId;
    
    -- Geef een melding terug over het bijwerken van de prijs
    SELECT CONCAT('Prijs van product met ID ', update_productId, ' is bijgewerkt naar ', update_prijs) AS Message;
END //

DELIMITER ;

CALL update_prijs(p_productId, p_newPrice);

DROP FUNCTION IF EXISTS `get_most_orders_in_month`;

DELIMITER //

CREATE FUNCTION `get_most_orders_in_month`()
RETURNS INT
BEGIN
    DECLARE month_number INT;
    SELECT MONTH(`orderdatum`) INTO month_number
    FROM `Orders`
    GROUP BY MONTH(`orderdatum`)
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    RETURN month_number;
END //

DELIMITER ;

CALL get_most_orders_in_month;


-- INNER JOIN --
-- Toont emails langs het KvK-nummer --
SELECT klanten.kvkNummer, emails.email
FROM klanten
INNER JOIN accounts ON klanten.accountId = accounts.accountId
INNER JOIN emails ON accounts.emailId = emails.emailId;


-- INNER JOIN --
-- Toont bezorgadres en contactpersoon per order --
SELECT contacten.*, orders.orderId, facturen.orderId, adressen.*
FROM orders
INNER JOIN facturen ON facturen.orderId = orders.orderId
INNER JOIN adressen ON orders.adresId = adressen.adresId
INNER JOIN contacten ON contacten.contactId = adressen.contactId;

-- INNER JOIN --
-- Toont factuuradres en contactpersoon per factuur --
SELECT contacten.*, orders.orderId, facturen.orderId, adressen.*
FROM orders
INNER JOIN facturen ON facturen.orderId = orders.orderId
INNER JOIN adressen ON facturen.adresId = adressen.adresId
INNER JOIN contacten ON contacten.contactId = adressen.contactId;

