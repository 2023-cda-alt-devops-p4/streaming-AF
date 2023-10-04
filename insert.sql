INSERT INTO Role
    (Name_r)
VALUES
    ('admin'),
    ('user');

INSERT INTO Utilisateur
    (Name_u, Firstname_u, Password_u, email_u, Id_role)
VALUES
    ('Nadmin1', 'Padmin1', 'adim1pass', 'admin1@gmail.com', 1),
    ('Nuser1', 'Puser1', 'user1pass', 'user1@gmail.com', 2),
    ('Nuser2', 'Puser2', 'user2pass', 'user2@gmail.com', 2),
    ('Nuser3', 'Puser3', 'user3pass', 'user3@gmail.com', 2);

INSERT INTO Realisateur
    (Name_r, Firstname_r)
VALUES
    ('Nreal1', 'Preal1'),
    ('Nreal2', 'Preal2'),
    ('Nreal3', 'Preal3'),
    ('Nreal4', 'Preal4');

INSERT INTO Film
    (Tittle, Duration, ReleaseDate, Id_realisateur)
VALUES
    ('Film1', '01:34:25', '1988-04-13', 1),
    ('Film2', '01:22:02', '2002-11-25', 2),
    ('Film3', '02:05:46', '2011-08-04', 2),
    ('Film4', '01:54:14', '2002-07-17', 3),
    ('Film5', '02:41:23', '2021-02-02', 4),
    ('Film6', '01:37:06', '2013-05-14', 4);

INSERT INTO Acteur
    (Name_a, Firstname_a, Birthday)
VALUES
    ('Nacteur1', 'Pacteur1', '1952-06-03'),
    ('Nacteur2', 'Pacteur2', '1959-11-13'),
    ('Nacteur3', 'Pacteur3', '1981-12-11'),
    ('Nacteur4', 'Pacteur4', '1974-03-07'),
    ('Nacteur5', 'Pacteur5', '1992-01-30'),
    ('Nacteur6', 'Pacteur6', '1966-04-12'),
    ('Nacteur7', 'Pacteur7', '1968-05-02'),
    ('Nacteur8', 'Pacteur8', '1972-08-17'),
    ('Nacteur9', 'Pacteur9', '1983-06-06'),
    ('Nacteur10', 'Pacteur10', '1969-09-18');

INSERT INTO RoleFilm
    (Name_rf)
VALUES
    ('premier rôle'),
    ('rôle pricipal'),
    ('second rôle'),
    ('petit rôle');

INSERT INTO Jouer
    (Id_film, Id_acteur, Id_RoleFilm)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 2),
    (1, 4, 3),
    (2, 5, 1),
    (2, 6, 3),
    (3, 7, 3),
    (6, 8, 3),
    (6, 9, 4),
    (5, 10, 3);

INSERT INTO Favorie
    (Id_film, Id_utilisateur)
VALUES
    (1, 2),
    (5, 2),
    (1, 3),
    (4, 4),
    (2, 4),
    (3, 4),
    (4, 2),
    (2, 3),
    (5, 3),
    (3, 2);