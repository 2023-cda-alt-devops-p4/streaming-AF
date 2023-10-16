
CREATE TABLE Acteur(
   Id_acteur INT AUTO_INCREMENT,
   Name_a VARCHAR(50) NOT NULL,
   Firstname_a VARCHAR(50) NOT NULL,
   Birthday DATE,
   Create_time_a DATETIME DEFAULT CURRENT_TIMESTAMP,
   Update_time_a DATETIME ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(Id_acteur),
   UNIQUE(Name_a),
   UNIQUE(Firstname_a)
);

CREATE TABLE Realisateur(
   Id_realisateur INT AUTO_INCREMENT,
   Name_r VARCHAR(50) NOT NULL,
   Firstname_r VARCHAR(50) NOT NULL,
   Create_time_r DATETIME DEFAULT CURRENT_TIMESTAMP,
   Update_time_r DATETIME ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(Id_realisateur),
   UNIQUE(Name_r),
   UNIQUE(Firstname_r)
);

CREATE TABLE Role(
   Id_role INT AUTO_INCREMENT ,
   Name_r VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_role),
   UNIQUE(Name_r)
);

CREATE TABLE RoleFilm(
   Id_RoleFilm INT AUTO_INCREMENT,
   Name_rf VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_RoleFilm),
   UNIQUE(Name_rf)
);

CREATE TABLE Film(
   Id_film INT AUTO_INCREMENT,
   Tittle VARCHAR(50) NOT NULL,
   Duration TIME,
   ReleaseDate DATE,
   Create_time_f DATETIME DEFAULT CURRENT_TIMESTAMP,
   Update_time_f DATETIME ON UPDATE CURRENT_TIMESTAMP,
   Id_realisateur INT NOT NULL,
   PRIMARY KEY(Id_film),
   UNIQUE(Tittle),
   FOREIGN KEY(Id_realisateur) REFERENCES Realisateur(Id_realisateur)
);

CREATE TABLE Utilisateur(
   Id_utilisateur INT AUTO_INCREMENT,
   Name_u VARCHAR(50) NOT NULL,
   Firstname_u VARCHAR(50) NOT NULL,
   Email_u VARCHAR(60) NOT NULL,
   Password_u VARCHAR(50) NOT NULL,
   Create_time_u DATETIME DEFAULT CURRENT_TIMESTAMP,
   Id_role INT NOT NULL,
   PRIMARY KEY(Id_utilisateur),
   UNIQUE(Name_u),
   UNIQUE(Firstname_u),
   UNIQUE(Email_u),
   UNIQUE(Password_u),
   FOREIGN KEY(Id_role) REFERENCES Role(Id_role)
);

CREATE TABLE Archive(
   Id_archive INT AUTO_INCREMENT,
   Name_ar VARCHAR(50) NOT NULL,
   Firstname_ar VARCHAR(50) NOT NULL,
   Email_ar VARCHAR(60) NOT NULL,
   Password_ar VARCHAR(50) NOT NULL,
   Update_time_ar DATETIME ON UPDATE CURRENT_TIMESTAMP,
   Id_utilisateur INT NOT NULL,
   PRIMARY KEY(Id_archive),
   UNIQUE(Name_ar),
   UNIQUE(Firstname_ar),
   UNIQUE(Email_ar),
   UNIQUE(Password_ar),
   FOREIGN KEY(Id_utilisateur) REFERENCES Utilisateur(Id_utilisateur)
);

CREATE TABLE Jouer(
   Id_film INT,
   Id_acteur INT,
   Id_RoleFilm INT,
   PRIMARY KEY(Id_film, Id_acteur, Id_RoleFilm),
   FOREIGN KEY(Id_film) REFERENCES Film(Id_film),
   FOREIGN KEY(Id_acteur) REFERENCES Acteur(Id_acteur),
   FOREIGN KEY(Id_RoleFilm) REFERENCES RoleFilm(Id_RoleFilm)
);

CREATE TABLE Favorie(
   Id_film INT,
   Id_utilisateur INT,
   PRIMARY KEY(Id_film, Id_utilisateur),
   FOREIGN KEY(Id_film) REFERENCES Film(Id_film),
   FOREIGN KEY(Id_utilisateur) REFERENCES Utilisateur(Id_utilisateur)
);

DELIMITER $$

CREATE TRIGGER after_user_update
AFTER UPDATE
ON Utilisateur FOR EACH ROW
BEGIN
   set @name = old.Name_u;
   set @firstname = old.Firstname_u;
   set @email = old.email_u;
   set @password = old.Password_u;

   IF old.Name_u <> new.Name_u THEN
      set @name = new.Name_u;
   END IF;

   IF old.Firstname_u <> new.Firstname_u THEN
      set @firstname = new.Firstname_u;
   END IF;

   IF old.Email_u <> new.Email_u THEN
      set @email = new.email_u;
   END IF;

   IF old.Password_u <> new.Password_u THEN
      set @password = new.Password_u;
   END IF;

   INSERT INTO Archive(Name_ar, Firstname_ar, Email_ar, Password_ar, Id_utilisateur)
   VALUES(@name, @firstname, @email, @password, old.Id_utilisateur);
END$$

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ListeFilmsReal(IN real_id INT)
BEGIN
    SELECT Tittle
    FROM Film
    INNER JOIN Realisateur ON Film.Id_realisateur = Realisateur.Id_realisateur
    WHERE Realisateur.Id_realisateur = real_id;
END//

DELIMITER ;

