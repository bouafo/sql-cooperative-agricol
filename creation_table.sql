-- 1. CREATION DES TABLES


-- Table 1 : Producteurs
CREATE TABLE producteurs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    region TEXT NOT NULL,
    telephone TEXT
);

-- Table 2 : Parcelles
CREATE TABLE parcelles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    producteur_id INTEGER,
    superficie_ha REAL NOT NULL,
    localisation TEXT,
    FOREIGN KEY (producteur_id) REFERENCES producteurs(id)
);

-- Table 3 : Cultures
CREATE TABLE cultures (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_culture TEXT NOT NULL,
    prix_unitaire_kg REAL NOT NULL
);

-- Table 4 : Récoltes
CREATE TABLE recoltes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    parcelle_id INTEGER,
    culture_id INTEGER,
    quantite_kg REAL NOT NULL,
    date_recolte DATE NOT NULL,
    FOREIGN KEY (parcelle_id) REFERENCES parcelles(id),
    FOREIGN KEY (culture_id) REFERENCES cultures(id)
);

-- 2. INSERTION DES DONNEES DE TEST

-- Insertion dans producteurs
INSERT INTO producteurs (nom, prenom, region, telephone) VALUES
('Kouassi', 'Jean', 'Marahoué', '+2250701020304'),
('Koffi', 'Awa', 'Haut-Sassandra', '+2250502030405'),
('Yao', 'Brou', 'Poro', '+2250102030405'),
('Diallo', 'Mamadou', 'Indénié-Djuablin', '+2250708091011');

-- Insertion dans parcelles
INSERT INTO parcelles (producteur_id, superficie_ha, localisation) VALUES
(1, 2.5, 'Bouaflé'),
(1, 1.0, 'Bouaflé'),
(2, 4.0, 'Daloa'),
(3, 3.5, 'Korhogo'),
(4, 5.0, 'Abengourou');

-- Insertion dans cultures
INSERT INTO cultures (nom_culture, prix_unitaire_kg) VALUES
('Maïs', 250),
('Arachide', 500),
('Manioc', 150),
('Anacarde', 400);

-- Insertion dans recoltes
INSERT INTO recoltes (parcelle_id, culture_id, quantite_kg, date_recolte) VALUES
(1, 1, 1200.5, '2025-03-10'),
(2, 2, 450.0, '2025-03-15'),
(3, 3, 3000.0, '2025-03-20'),
(4, 1, 2100.0, '2025-04-05'),
(5, 4, 1800.0, '2025-04-12');
