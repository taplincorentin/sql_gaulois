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
    SELECT potion.nom_potion, SUM(composer.qte*ingredient.cout_ingredient)
    FROM composer
    INNER JOIN potion ON composer.id_potion = potion.id_potion
    INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
    GROUP BY potion.nom_potion;


--exo7--
    SELECT ingredient.nom_ingredient, ingredient.cout_ingredient, composer.qte
    FROM composer
    INNER JOIN potion ON composer.id_potion = potion.id_potion
    INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
    WHERE nom_potion='Santé';

--exo8--
    SELECT personnage.nom_personnage, SUM(prendre_casque.qte) AS somme_casque
    FROM prendre_casque
    INNER JOIN personnage ON prendre_casque.id_personnage = personnage.id_personnage
    INNER JOIN bataille ON prendre_casque.id_bataille = bataille.id_bataille
    WHERE bataille.nom_bataille = 'Bataille du village gaulois'
    GROUP BY personnage.nom_personnage
    ORDER BY somme_casque DESC
    LIMIT 1;
                    --code ci-dessus ne fonctionne pas en cas d'égalité--




    SELECT p.nom_personnage, SUM(pc.qte) AS nb_casques
    FROM personnage p, bataille b, prendre_casque pc
    WHERE p.id_personnage = pc.id_personnage
    AND pc.id_bataille = b.id_bataille
    AND b.nom_bataille = 'Bataille du village gaulois'
    GROUP BY p.id_personnage
    HAVING nb_casques >= ALL(
        SELECT SUM(pc.qte)
        FROM prendre_casque pc, bataille b
        WHERE b.id_bataille = pc.id_bataille
        AND b.nom_bataille = 'Bataille du village gaulois'
        GROUP BY pc.id_personnage
        );


--exo9--
    SELECT p.nom_personnage, SUM(b.dose_boire) AS somme_doses_bues
    FROM personnage p, boire b
    WHERE p.id_personnage = b.id_personnage
    GROUP BY nom_personnage
    ORDER BY somme_doses_bues DESC


--exo10--
    SELECT b.nom_bataille, SUM(pc.qte) AS nb_casques
    FROM bataille b, prendre_casque pc
    WHERE b.id_bataille = pc.id_bataille
    GROUP BY b.id_bataille
    HAVING nb_casques >= ALL(
        SELECT SUM(pc.qte)
        FROM bataille b, prendre_casque pc
        WHERE b.id_bataille = pc.id_bataille
        GROUP BY b.id_bataille
    )


--exo11--
    SELECT tc.nom_type_casque, COUNT(c.id_casque) AS nb_casques, SUM(c.cout_casque) AS cout_total
    FROM type_casque tc, casque c 
    WHERE tc.id_type_casque = c.id_type_casque
    GROUP BY tc.nom_type_casque