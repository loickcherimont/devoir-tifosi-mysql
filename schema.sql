-- Schemas
CREATE TABLE IF NOT EXISTS ingredient (
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS focaccia (
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS ingredient_focaccia (
    id_ingredient INT UNSIGNED,
    id_focaccia INT UNSIGNED,
    quantite INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_ingredient, id_focaccia),
        CONSTRAINT fk_ingredient
        FOREIGN KEY (id_ingredient) REFERENCES ingredient (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_focaccia
        FOREIGN KEY (id_focaccia) REFERENCES focaccia (id)
        ON DELETE CASCADE
);