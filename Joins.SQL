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