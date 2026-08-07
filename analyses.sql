- afficher tous les producteurs
SELECT *
FROM producteurs

-afficher uniquement les producteur de bouaké
SELECT *
FROM producteurs
Where region = 'Bouaké'

- trier les producteurs par nom
SELECT *
FROM producteurs
ORDER BY nom ASC

- Afficher les trois premières récoltes
SELECT *
FROM recoltes
ORDER BY date_recolte DESC
LIMIT 3

- Afficher les cultures dont le prix est supérieur à 700 FCFA/kg
SELECT *
FROM cultures
WHERE prix_kg > 700

- Combien y a-t-il de producteurs
SELECT COUNT(*) AS total_producteure
FROM producteurs

_ Quelle est la quantité totale récoltée
SELECT SUM(quantite_kg) AS quantité_total
FROM recoltes

- Quelle est la plus grande récolte
SELECT MAX(quantite_kg) AS recolte_maximal
FROM recoltes

- Quelle est la plus petite superficie de parcelle
SELECT MIN(superficie) AS superficie_minimal
FROM parcelles

- Quelle est la quantité moyenne récoltée
SELECT AVG(quantite_kg) AS quantite_moyenne
FROM recoltes

- Quel producteur possède la plus grande parcelle
SELECT producteurs.*, parcelles.superficie
FROM parcelles
JOIN producteurs ON parcelles.id_producteur = producteurs.id_producteur
ORDER BY superficie DESC
LIMIT 1


Quelle région produit le plus de maïs
SELECT producteurs.region, SUM(recoltes.quantite_kg) AS quantite_total
FROM recoltes
JOIN cultures ON recoltes.id_culture = cultures.id_culture
JOIN parcelles ON recoltes.id_parcelle = parcelles.id_parcelle
JOIN producteurs ON parcelles.id_producteur = producteurs.id_producteur
WHERE nom_culture = 'Maïs'
GROUP BY producteurs.region
ORDER BY quantite_total DESC
LIMIT 1

Quel est le chiffre d_affaires potentiel par culture
SELECT cultures.nom_culture, SUM(cultures.prix_kg * recoltes.quantite_kg) AS chiffre_affaire
FROM recoltes
JOIN cultures ON recoltes.id_culture = cultures.id_culture
GROUP BY cultures.nom_culture

Quelle culture est la plus rentable
SELECT cultures.nom_culture, SUM(cultures.prix_kg * recoltes.quantite_kg) AS chiffre_affaire
FROM recoltes
JOIN cultures ON recoltes.id_culture = cultures.id_culture
GROUP BY cultures.nom_culture
ORDER BY chiffre_affaire DESC
LIMIT 1

Quels producteurs cultivent arachide
SELECT producteurs.nom, producteurs.prenom, cultures.nom_culture
FROM recoltes
JOIN cultures ON recoltes.id_culture = cultures.id_culture
JOIN parcelles ON recoltes.id_parcelle = parcelles.id_parcelle
JOIN producteurs ON parcelles.id_producteur = producteurs.id_producteur
WHERE nom_culture = 'Arachide'
ORDER BY nom ASC

Quelle est la superficie totale exploitée par chaque Producteurs
SELECT producteurs.nom, producteurs.prenom, SUM(parcelles.superficie) AS superficie_total
FROM parcelles
JOIN producteurs ON parcelles.id_producteur = producteurs.id_producteur
GROUP BY producteurs.nom

Quelles récoltes ont été réalisées en mars 2025
SELECT recoltes.date_recolte, recoltes.quantite_kg, cultures.nom_culture
FROM recoltes
JOIN cultures ON recoltes.id_culture = cultures.id_culture
WHERE strftime ('%Y-%m', date_recolte) = '2025-03'

quelle producteur a enregistrer le plus de kilogramme
SELECT producteurs.nom, producteurs.prenom, SUM(recoltes.quantite_kg) AS quantite_totale
FROM recoltes
JOIN parcelles ON recoltes.id_parcelle = parcelles.id_parcelle
JOIN producteurs ON parcelles.id_producteur = producteurs.id_producteur
GROUP BY producteurs.nom
ORDER BY quantite_totale DESC
LIMIT 1
