# Hitori mobile Game
*Made by Amandine Carlier and William Denorme*
### Rules :
Hitori is played with a grid of squares or cells, with each cell initially containing a number. The game is played by eliminating squares/numbers and this is done by blacking them out. The objective is to transform the grid to a state wherein all three following rules are true:
- no row or column can have more than one occurrence of any given number
- black cells cannot be horizontally or vertically adjacent, although they can be diagonal to one another.
- the remaining numbered cells must be all connected to each other, horizontally or vertically.

### Getting Started with the app

To run the project on your device
- Make sure your phone is plugged in onto your computer and that both Flutter and Dark sdk are on your computer
- Run `flutter devices` and make sure that the device you will use to play the app is listed
- Run `flutter run` to launch the project

Then enjoy :)

### Choix d'architecture

Afin de structurer au mieux notre application, nous avons décidé de mettre en place plusieurs packages :
- components : regroupant les modèles de notre application (avec les propriétés de chaque objet, les getters et les setters) ;
- mockedData : contient uniquement une dizaine de grilles valides (les grilles sont sélectionnées par hasard dans le fichier Game.dart) ;
- pages : l'ensemble des pages de l'application (la page Home qui correspond à la page d'accueil de notre application et la page Game qui contient toute la logique du jeu) ;
- utils : modèle utilitaire permettant de créer des paires de valeurs (ce qui est utile lors de la vérification de la grille, lorsque l'utilisateur souhaite vérifier sa saisie) ;
- widget : éléments utiles pour l'affichage de notre grille et de notre pop-up (qui indique si l'utilisateur a gagné ou non).

Ce choix d'architecture nous a permis de centraliser notre logique dans notre fichier Game.dart, le projet étant petit, tout en respectant les contraintes de chaque modèle. 
Ainsi, nous avons des caractéristiques bien précises pour les cellules, de même que pour la grille.


### Axes d'amélioration

Avec plus de temps, nous aurions aimé pouvoir générer des grilles de manière aléatoire, pour cela il aurait fallu partir d'une grille de départ (comme celle ci-dessous) et ajouter des doublons (entre 1 et 5 puisque nous avons une grille de taille 5).
Malheuseument, pour valider la faisabilité de cette grille, il aurait fallu mettre en place un "solveur" capable de résoudre cette première. 

Grille simple valide : 

1 2 3 4 5

2 3 4 5 1

3 4 5 1 2

4 5 1 2 3

5 1 2 3 4

Au départ, sans cette logique de grille d'initialisation et de doublons, nous avons essayé de mettre en place un solveur, cependant nous n'obtenions pas de résultat, le nombre de combinaisons de grille étant trop important (nous avons donc perdu beaucoup de temps sur cet aspect).

De plus, il aurait intéressant de proposer à l'utilisateur des grilles de tailles différentes (5x5, 8x8, 10x10 par exemple).

Enfin, avec plus de temps, il aurait également intéressant de mettre en place une troisième page avec un tableau des temps, puisque nous avons mis en place un timeur.


### Emplacement des sources

Les sources du projet sont disponibles : https://github.com/AvesSeven/flutterHitori