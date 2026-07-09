-- 1. Display list of focaccia names in ascending alphabetical order
SELECT nom FROM focaccia
ORDER BY nom;

-- EXPECTED:
-- Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione

-- ACTUAL:
-- +-----------------+
-- | nom             |
-- +-----------------+
-- | Américaine      |
-- | Emmentalaccia   |
-- | Gorgonzollaccia |
-- | Hawaienne       |
-- | Mozaccia        |
-- | Paysanne        |
-- | Raclaccia       |
-- | Tradizione      |
-- +-----------------+


-- 2. Display total number of ingredients
SELECT COUNT(nom) FROM ingredient;

-- EXPECTED:
-- 25

-- ACTUAL:
-- +----------+
-- | COUNT(*) |
-- +----------+
-- |       25 |
-- +----------+


-- 3. Display mean price for focaccia
SELECT AVG(prix) FROM focaccia;

-- EXPECTED:
-- 10,375

-- ACTUAL:
-- +-----------+
-- | AVG(prix) |
-- +-----------+
-- | 10.375000 |
-- +-----------+
-- The script returns 8 digits (more precision) instead of the 5 expected.


-- 4. Display all drinks names with brands in ascending alphabetical order 
SELECT boisson.nom, marque.nom 
FROM boisson  
INNER JOIN marque ON boisson.id_marque = marque.id 
ORDER BY boisson.nom;

-- EXPECTED:
-- Capri-sun, Coca-cola
-- Coca-cola original, Coca-cola
-- Coca-cola zéro, Coca-cola
-- Eau de source, Cristalline
-- Fanta citron, Coca-cola
-- Fanta orange, Coca-cola
-- Lipton Peach, Pepsico
-- Lipton zéro citron, Pepsico
-- Monster energy ultra blue, Monster
-- Monster energy ultra gold, Monster
-- Pepsi, Pepsico
-- Pepsi Max Zéro, Pepsico

-- ACTUAL:
-- +---------------------------+-------------+
-- | nom                       | nom         |
-- +---------------------------+-------------+
-- | Capri-sun                 | Coca-cola   |
-- | Coca-cola original        | Coca-cola   |
-- | Coca-cola zéro            | Coca-cola   |
-- | Eau de source             | Cristalline |
-- | Fanta citron              | Coca-cola   |
-- | Fanta orange              | Coca-cola   |
-- | Lipton Peach              | Pepsico     |
-- | Lipton zéro citron        | Pepsico     |
-- | Monster energy ultra blue | Monster     |
-- | Monster energy ultra gold | Monster     |
-- | Pepsi                     | Pepsico     |
-- | Pepsi Max Zéro            | Pepsico     |
-- +---------------------------+-------------+
