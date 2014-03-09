BDUniv
======
Projet effectué à l'INSA de Rouen, en 1ère année de cycle ingénieur.

L'objectif est de créer un programme écrit en C qui peut effectuer des requêtes sur une base de données PostgreSQL.

Dépendances
----------
- ECPG
- PostgreSQL
- gcc

Création de la base de données
----------
La base utilisée dans ce programme, l'utilisateur associé et le mot de passe sont tous `grtt6`. **Cette base et cet utilisateur ne sont pas créés par le script de création.** Par ailleurs, des droits sont donnés à des utilisateurs `grtt42` et `grtt11`, **qui ne sont pas non plus créés**.  Le fichier de création de la base de données se trouve dans `src/SQL/creation.sql`.

Pour se connecter à la base de données à l'INSA de Rouen, sur la base `grtt6` avec l'utilisateur `grtt6` :

	psql -h asi-pg.insa-rouen.fr -U grtt6 grtt6

Pour se connecter à la base de données en local, sur la base `grtt6` avec l'utilisateur `grtt6` :

	psql -h localhost -U grtt6 grtt6

Si vous vous trouvez dans le dossier `src/SQL/`. Pour créer les tables, les fonctions, les index, les vues :

	\i creation.sql

Et logiquement, pour supprimer le tout :

	\i suppression.sql


Compilation de l'application en C
----------
Il faut se trouver dans le dossier `src/C/` puis taper la commande :

	make

Si le fichier `compile` n'est pas un exécutable :

	chmod +x compile

L'exécutable généré est `appliUniv` que l'on lance avec la commande :

	./appliUniv