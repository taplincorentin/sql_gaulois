--exo1--
    SELECT *
    FROM lieu
    WHERE nom_lieu
    LIKE '%um';


--exo2--
    SELECT COUNT(id_personnage), id_lieu
    FROM personnage
    GROUP BY id_lieu
    ORDER BY COUNT(id_personnage) DESC;


--exo3--
    SELECT personnage.nom_personnage, personnage.adresse_personnage, lieu.nom_lieu, specialite.nom_specialite
    FROM personnage
    INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu
    INNER JOIN specialite ON personnage.id_specialite = specialite.id_specialite;


--exo4--
    SELECT specialite.nom_specialite, COUNT(personnage.id_personnage) AS nombre_de_personnes
    FROM personnage
    INNER JOIN specialite ON personnage.id_specialite = specialite.id_specialite
    GROUP BY nom_specialite
    ORDER BY COUNT(personnage.id_personnage) DESC


--exo5--
    SELECT nom_bataille, DATE_FORMAT(date_bataille, "%d/%m/%Y") AS date_dmY, lieu.nom_lieu
    FROM bataille
    INNER JOIN lieu ON bataille.id_lieu = lieu.id_lieu
    ORDER BY date_bataille DESC;


--exo6--
    SELECT nom_potion, composer.qte*ingredient.cout_ingredient AS prix_total
    