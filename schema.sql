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

CREATE TABLE IF NOT EXISTS marque (
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS boisson (
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    id_marque INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_marque
    FOREIGN KEY (id_marque) REFERENCES marque (id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS client (
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT UNSIGNED NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS menu (
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5, 2) NOT NULL,
    id_focaccia INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_focaccia_m
    FOREIGN KEY (id_focaccia) REFERENCES focaccia (id)
    ON DELETE CASCADE
);

-- Relationship table
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

CREATE TABLE IF NOT EXISTS menu_boisson (
    id_menu INT UNSIGNED,
    id_boisson INT UNSIGNED,
    PRIMARY KEY (id_menu, id_boisson),
        CONSTRAINT fk_menu
        FOREIGN KEY (id_menu) REFERENCES menu (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_boisson
        FOREIGN KEY (id_boisson) REFERENCES boisson (id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS client_menu (
    id_client INT UNSIGNED,
    id_menu INT UNSIGNED,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, date_achat),
        CONSTRAINT fk_client
        FOREIGN KEY (id_client) REFERENCES client (id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_menu_c
        FOREIGN KEY (id_menu) REFERENCES menu (id)
        ON DELETE CASCADE
);