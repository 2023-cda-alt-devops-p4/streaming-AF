# streaming-AF

lancement docker :
docker-compose up -d

Ajout des tables et insertion des données par defaut dans la DataTable streaming_db
- docker cp create.sql CONTAINER_ID:/create.sql
- docker cp insert.sql CONTAINER_ID:/insert.sql
- docker exec -it CONTAINER_ID /bin/bash
- mysql -u root -p
- use streaming_db
- source create.sql
- source insert.sql

Creation d'un utilisateur avec des permisions limité : 
- docker exec -it CONTAINER_ID /bin/bash
- mysql -u root -p
- use streaming_db
- CREATE USER 'default_user'@'localhost' IDENTIFIED BY 'defaultpass'
- GRANT SELECT ON *.* TO 'default_user'@'localhost' WITH GRANT OPTION
- FLUSH PRIVILEGES

Requêttes SQL:

- les titres et dates de sortie des films du plus récent au plus ancien :
SELECT Tittle, ReleaseDate FROM Film ORDER BY ReleaseDate DESC

- les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique
SELECT Name_a, Firstname_a, (YEAR(CURDATE())-YEAR(Birthday)) FROM Acteur Where YEAR(Birthday) < YEAR(CURDATE())-30 ORDER BY Name_a

- la liste des acteurs/actrices principaux pour un film donné
SELECT Name_a, Firstname_a FROM Acteur INNER JOIN Jouer ON Acteur.Id_acteur = Jouer.Id_acteur INNER JOIN Film ON Jouer.Id_film = Film.Id_film WHERE Film.Tittle ="Film1"

- la liste des films pour un acteur/actrice donné
SELECT Tittle FROM Film INNER JOIN Jouer ON Film.Id_film = Jouer.Id_film INNER JOIN Acteur ON Jouer.Id_acteur = Acteur.Id_acteur Where Acteur.Name_a = "" AND Acteur.Firstanme_a = ""

- ajouter un film
INSERT INTO Film
    (Tittle, Duration, ReleaseDate, Id_realisateur)
VALUES
    ('Film7', '01:14:29', '1973-07-24', 3),

- ajouter un acteur/actrice
INSERT INTO Acteur
    (Name_a, Firstname_a, Birthday)
VALUES
    ('Nacteur11', 'Pacteur11', '1954-01-19');

- modifier un film
UPDATE Film
SET Tittle = 'Film2 (2002)'
WHERE condition id = 2

- supprimer un acteur/actrice
DELETE FROM Film
WHERE id = 2

- afficher les 3 derniers acteurs/actrices ajouté(e)s
SELECT Name_a, Firstname_a FROM Acteur ORDER BY Id_acteur DESC LIMIT 3 #ou par date d'ajour si j'avais crée le champs



# Critères d'évaluation

- [✔️] OK
- [:x:] NOT OK

*replace check markdown after evaluation*



## Livrables

Un dépôt GitHub contenant :
- [ ] L'environnement docker
- [ ] Le dictionnaire de données
- [ ] MCD
- [ ] MPD
- [ ] MLD
- [ ] Un fichier permettant de générer la bdd (incluant quelques données)
- [ ] Le jeu de requêtes dans le *README.md*

## Critères de performance

- [ ] Récupération facile de votre environnement
- [ ] Exactitude des relations entre les tables
- [ ] Trigger* mis en place
- [ ] Bonne présentation des requêtes sur le *README.md*
- [ ] Exécution des requêtes sans erreur

### Les requêtes

- [ ] Les titres et dates de sortie des films du plus récent au plus ancien
- [ ] Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique
- [ ] La liste des acteurs/actrices principaux pour un film donné
- [ ] La liste des films pour un acteur/actrice donné
- [ ] Ajouter un film
- [ ] Ajouter un acteur/actrice
- [ ] Modifier un film
- [ ] Supprimer un acteur/actrice
- [ ] Afficher les 3 derniers acteurs/actrices ajouté(e)s

### Procédures

- [ ] Lister grâce à une procédure stockée les films d'un réalisateur donné en paramètre

### Triggers

- [ ] Garder grâce à un trigger une trace de toutes les modifications apportées à la table des utilisateurs. Ainsi, une table d'archive conservera la date de la mise à jour, l'identifiant de l'utilisateur concerné, l'ancienne valeur ainsi que la nouvelle.
- [ ] Pour chaque entrée dans la base de données, il y aura la date de création et de modification.
