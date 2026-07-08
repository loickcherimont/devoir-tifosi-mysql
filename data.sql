-- We use IGNORE to avoid duplicated data on file execution

INSERT IGNORE INTO 
    marque (id, nom) 
VALUES
    (1, 'Coca-cola'),
    (2, 'Cristalline'),
    (3, 'Monster'),
    (4, 'Pepsico');

INSERT IGNORE INTO 
    ingredient (id, nom)
VALUES
    (1, 'Ail'),
    (2, 'Ananas'),
    (3, 'Artichaut'),
    (4, 'Bacon'),
    (5, 'Base Tomate'),
    (6, 'Base crème'),
    (7, 'Champignon'),
    (8, 'Chevre'),
    (9, 'Cresson'),
    (10, 'Emmental'),
    (11, 'Gorgonzola'),
    (12, 'Jambon cuit'),
    (13, 'Jambon fumé'),
    (14, 'Oeuf'),
    (15, 'Oignon'),
    (16, 'Olive noire'),
    (17, 'Olive verte'),
    (18, 'Parmesan'),
    (19, 'Piment'),
    (20, 'Poivre'),
    (21, 'Pomme de terre'),
    (22, 'Raclette'),
    (23, 'Salami'),
    (24, 'Tomate cerise'),
    (25, 'Mozarella');


INSERT IGNORE INTO 
    boisson (id, nom, id_marque)
VALUES
    (1, 'Coca-cola zéro', 1),
    (2, 'Coca-cola original', 1),
    (3, 'Fanta citron', 1),
    (4, 'Fanta orange', 1),
    (5, 'Capri-sun', 1),
    (6, 'Pepsi', 4),
    (7, 'Pepsi Max Zéro', 4),
    (8, 'Lipton zéro citron', 4),
    (9, 'Lipton Peach', 4),
    (10, 'Monster energy ultra gold', 3),
    (11, 'Monster energy ultra blue', 3),
    (12, 'Eau de source', 2);