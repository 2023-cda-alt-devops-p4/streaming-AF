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
