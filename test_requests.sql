-- 1. Display list of focaccia names in ascending alphabetical order
SELECT nom 
FROM focaccia
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
SELECT COUNT(nom) 
FROM ingredient;

-- EXPECTED:
-- 25

-- ACTUAL:
-- +----------+
-- | COUNT(*) |
-- +----------+
-- |       25 |
-- +----------+


-- 3. Display mean price for focaccia
SELECT AVG(prix) 
FROM focaccia;

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
INNER JOIN marque 
ON boisson.id_marque = marque.id 
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


-- 5. Display list of ingredients for a Raclaccia (id = 3)
SELECT ingredient.nom
FROM focaccia_ingredient

INNER JOIN ingredient
ON focaccia_ingredient.id_ingredient = ingredient.id

INNER JOIN focaccia
ON focaccia_ingredient.id_focaccia = focaccia.id

WHERE focaccia.nom = 'Raclaccia';

-- EXPECTED:
-- Base tomate, raclette, cresson, ail, champignon, parmesan, poivre


-- ACTUAL:
-- +-------------+
-- | nom         |
-- +-------------+
-- | Ail         |
-- | Base Tomate |
-- | Champignon  |
-- | Cresson     |
-- | Parmesan    |
-- | Poivre      |
-- | Raclette    |
-- +-------------+
-- The list is sorted in alphabetical order


-- 6. Display name and number of ingredients for each focaccia
SELECT focaccia.nom, 
GROUP_CONCAT(
    CONCAT(ingredient.nom, '(', focaccia_ingredient.quantite, ')'
    )
)
FROM focaccia_ingredient

INNER JOIN ingredient
ON focaccia_ingredient.id_ingredient = ingredient.id

INNER JOIN focaccia
ON focaccia_ingredient.id_focaccia = focaccia.id

GROUP BY (focaccia.nom);

-- EXPECTED :
-- Mozaccia : Base Tomate(200), Mozarella(50), Cresson(20), Jambon fumé(80), Ail(2), Artichaut(20), Champignon(40), Parmesan(50), Poivre(1), Olive noire(20)
-- Gorgonzollaccia : Base Tomate(200), Gorgonzola(50), Cresson(20), Ail(2), Champignon(40), Parmesan(50), Poivre(1), Olive noire(20)
-- Raclaccia : Base Tomate(200), Raclette(50), Cresson(20), Ail(2), Champignon(40), Parmesan(50), Poivre(1)
-- Emmentalaccia : Base crème(200), Emmental(50), Cresson(20), Champignon(40), Parmesan(50), Poivre(1), Oignon(20)
-- Tradizione : Base Tomate(200), Mozarella(50), Cresson(20), Jambon cuit(80), Champignon(80), Parmesan(50), Poivre(1), Olive noire(10), Olive verte(10)
-- Hawaienne : Base Tomate(200), Mozarella(50), Cresson(20), Bacon(80), Ananas(40), Piment(2), Parmesan(50), Poivre(1), Olive noire(20)
-- Américaine : Base Tomate(200), Mozarella(50), Cresson(20), Bacon(80), Pomme de terre(40), Parmesan(50), Poivre(1), Olive noire(20)
-- Paysanne : Base crème(200), Chevre(50), Cresson(20), Pomme de terre(80), Jambon fumé(80), Ail(2), Artichaut(20), Champignon(40), Parmesan(50), Poivre(1), Olive noire(20), Oeuf(50)

-- ACTUAL :
-- +-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
-- | nom             | GROUP_CONCAT(     CONCAT(ingredient.nom, '(', focaccia_ingredient.quantite, ')'     ) )                                                                         |
-- +-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
-- | Américaine      | Bacon(80),Base Tomate(200),Cresson(20),Olive noire(20),Parmesan(50),Poivre(1),Pomme de terre(40),Mozarella(50)                                                  |
-- | Emmentalaccia   | Base crème(200),Champignon(40),Cresson(20),Emmental(50),Oignon(20),Parmesan(50),Poivre(1)                                                                       |
-- | Gorgonzollaccia | Ail(2),Base Tomate(200),Champignon(40),Cresson(20),Gorgonzola(50),Olive noire(20),Parmesan(50),Poivre(1)                                                        |
-- | Hawaienne       | Ananas(40),Bacon(80),Base Tomate(200),Cresson(20),Olive noire(20),Parmesan(50),Piment(2),Poivre(1),Mozarella(50)                                                |
-- | Mozaccia        | Ail(2),Artichaut(20),Base Tomate(200),Champignon(40),Cresson(20),Jambon fumé(80),Olive noire(20),Parmesan(50),Poivre(1),Mozarella(50)                           |
-- | Paysanne        | Ail(2),Artichaut(20),Base crème(200),Champignon(40),Chevre(50),Cresson(20),Jambon fumé(80),Oeuf(50),Olive noire(20),Parmesan(50),Poivre(1),Pomme de terre(80)   |
-- | Raclaccia       | Ail(2),Base Tomate(200),Champignon(40),Cresson(20),Parmesan(50),Poivre(1),Raclette(50)                                                                          |
-- | Tradizione      | Base Tomate(200),Champignon(80),Cresson(20),Jambon cuit(80),Olive noire(10),Olive verte(10),Parmesan(50),Poivre(1),Mozarella(50)                                |
-- +-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+

-- Ingredient are sorted using ascending order


-- 7. Display focaccia name with the most ingredients
SELECT focaccia.nom, COUNT(ingredient.nom)
FROM focaccia_ingredient

INNER JOIN ingredient
ON focaccia_ingredient.id_ingredient = ingredient.id

INNER JOIN focaccia
ON focaccia_ingredient.id_focaccia = focaccia.id

GROUP BY focaccia.nom

ORDER BY COUNT(ingredient.nom) DESC

LIMIT 1;

-- EXPECTED :
-- Paysanne : 12

-- ACTUAL : 
-- +----------+-----------------------+
-- | nom      | COUNT(ingredient.nom) |
-- +----------+-----------------------+
-- | Paysanne |                    12 |
-- +----------+-----------------------+


-- 8. Display list of focaccia containing "Ail" ingredient
SELECT focaccia.nom
FROM focaccia_ingredient

INNER JOIN ingredient
ON focaccia_ingredient.id_ingredient = ingredient.id

INNER JOIN focaccia
ON focaccia_ingredient.id_focaccia = focaccia.id

WHERE ingredient.nom = 'Ail';

-- EXPECTED :
-- Mozaccia, Gorgonzollaccia, Raclaccia, Pays


-- ACTUAL: 
-- +-----------------+
-- | nom             |
-- +-----------------+
-- | Mozaccia        |
-- | Gorgonzollaccia |
-- | Raclaccia       |
-- | Paysanne        |
-- +-----------------+


-- 9. Display list of unused ingredients
SELECT ingredient.nom, focaccia_ingredient.id_focaccia
FROM ingredient

LEFT JOIN focaccia_ingredient
ON focaccia_ingredient.id_ingredient = ingredient.id

WHERE focaccia_ingredient.id_focaccia IS NULL;

-- EXPECTED : 
-- Salami, Tomate cerise

-- ACTUAL :
-- +---------------+-------------+
-- | nom           | id_focaccia |
-- +---------------+-------------+
-- | Salami        |        NULL |
-- | Tomate cerise |        NULL |
-- +---------------+-------------+

-- In id_focaccia column, there is null for unused ingredients. 


-- 10. Display list of focaccia that don't use 'Champignon'

-- EXPECTED :
-- Hawaienne, Américaine