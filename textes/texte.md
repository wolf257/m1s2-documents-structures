# Le projet

Bienvenue. Ceci est un site créé dans le cadre du cours de projet encadré du second semestre de M1 Traitement Automatique du Langage.

Nous avions déjà réalisé un projet au premier semestre (voir /lien-site/, /lien-blog) sur la perception du viol sur le web. Au niveau technique, il s'agissait d'utiliser les languages bash et python pour aspirer des pages en plusieurs langues, traiter les problèmes d'encodage, puis extraire et analysé des motifs. 

Dans celui-ci, il s'agira, comme mentionné dans la page du cours, de :

`Mise en oeuvre d'une chaîne de traitement textuel semi-automatique, de la récupération des données à leur présentation.
Ce cours posera d'abord la question des objectifs linguistiques à atteindre (lexicologie, recherche d'information, traduction...) et fera appel aux méthodes et outils informatiques nécessaires à leur réalisation (récupération de corpus, normalisation des textes, segmentation, étiquetage, extraction, structuration et présentation des résultats...).
Ce cours sera aussi l'occasion d'une évaluation critique des résultats obtenus, d'un point de vue quantitatif et qualitatif.`

# Les données

Nos données consisteront en fils RSS issus du journal Le Monde. Les fils ont été récupérés par les soins du Pr Fleury en grande partie, grâce à un script bash et perl, activé par cron (/lien/) chaque jour de l'année 2018, à 19h. Ainsi, il a mis à notre disposition un dossier contenant pour chaque jour de l'année les 17 fils d'actualité du journal (/img/).

Un dossier contenant les fils d'une année constitue une arborescence organisée de la façon suivante :

(/img/)

Nous avons décidé, en tant que groupe de nous concentrer sur trois fils :
- Technologie : 0,2-651865,1-0,0
- Livre : 0,2-3260,1-0,0
- Entreprises : 0,2-3234,1-0,0

Pour atteindre notre objectif, nous allons utilisé différentes BAO.


# Quelques définitions

- Bao : Boite à outils

Chaque boîte à outils représente une étape de notre chaîne de traitement. Elles seront présentées en détails dans leur partie respective.

- Fil RSS :

Fichier XML généré automatiquement qui rend compte des mises à jour d'un site web. Sa structure respecte une convention, ce qui lui permet d'être diffusé et lu par le plus grand nombre. Il permet aux utilisateurs qui s'y abonnent d'être facilement tenu au courant des nouveautés sur un site, en recevant un mail par exemple.

- Patron :

Motif morpho-syntaxique donné par l'utilisateur en entrée de la BaO3. Ex : "NC ADJ" (Un nom commun suivi d'un adjectif)

# Plan de travail

## BaO 1 : script perl (sans module / avec XML:RSS)

Syntaxe :

perl BaO1.pl <lien-vers-repertoire>

Output : <a-REMPLIR??>

Après avoir reçu en argument le nom d'un dossier, et demandé à l'utilisateur la rubrique à traiter parmi les 17 possible, le script va procéder comme suit :
- Parcours de l'arborescence du dossier entré en argument à la recherche de fichiers xml contenant l'indice fourni par la rubrique choisie.
- Pour chaque fichier, en extraire les items (qui correspondent aux articles).
- Pour chaque item :
    * nettoyer le titre et la description, 
    * vérifier qu'on ne l'a pas déjà noté. Si oui, passer. 
    * Si non:
         - enrichir les informations (index, date...).
         - l'écrire dans nos fichiers (txt et xml).

À la fin, nous aurons donc un fichier txt contenant les titres et descriptions, et un fichier XML avec ces articles, mais aussi légérement enrichi.

NB : Les fichiers finaux seront écrits dans le même dossier que celui où se trouve le script bao1.pl.


## BaO 2 : étiquettage (treetagger et talismane)

Syntaxe :

perl BaO1.pl <lien-vers-repertoire>

Output : <a-REMPLIR??>

La BaO2 va fonctionner un peu comme la première, mais en ajoutant un élément supplémentaire : l'étiquettage.

Pour cela, il faut :
- Tokeniser nos fichiers (XML ou txt?), ce que l'on fera grâce au script tokenise-utf8 (fourni par Mr Fleury, modifié par nous). 
- Étiquetter parallélement par Treetagger et Talismane, cela nous permettra de comparer les deux approches.
- Dans le cas de treetager, utiliser le script treetagger2xml-utf8 pour récupérer l'étiquettage et l'écrire en xml.

À la fin, nous aurons un fichier XML entièrement étiqueté.


### tokenise-utf8

Syntaxe tokenise-utf8 : 
    perl <lien-tokenise-utf8> -f <lien-input-txt> 
        > <lien-output.txt>

On peut enchainer les commandes :

perl <lien-tokenise-utf8.pl> -f <lien-input-txt> 
    | tree-tagger <lien-fichier-par> -token -lemma -no-unknown 
    > <lien-output-txt>

Output : <a-REMPLIR??>

On aura un fichier txt, dans le dossier d'où on appelle le script.
Ce fichier contiendra sur chaque ligne TOKEN - POS - LEMME.
C'est ce fichier que devra utiliser treetagger2xml-utf8.

### treetagger2xml-utf8

Syntaxe :

perl <lien-treetagger2xml-utf8> <lien-input-txt> <encodage (utf8 ici)> 

Output : <a-REMPLIR??>

    
On aura un fichier xml, dans le dossier d'où on appelle le script.
Il aura exactement le même nom, avec .xml rajouter en fin.

    

## BaO 3 : Extraction de patrons

Syntaxe :

perl bao3.pl <sortie-talismane.txt> <fichier-patrons.txt> 

Output : <a-REMPLIR??>

La BaO3 va se fonder sur les résultats de la BaO2.
Elle permet l'extraction dans les fichiers Talismane générés par BaO 2 de patrons morpho-syntaxiques qui se trouvent en ligne dans le fichier patrons.txt . Le résultat de l'extraction est écrit dans un fichier txt, dans lequel se trouve également le nombre total de matchs.
Pour chaque patron, la liste des correspondances est triée par ordre décroissant de fréquence.

## BaO 4 : Visualisation

Syntaxe :

./patron2graphe.exe "encodage" <extraction_results.txt> [motif.txt]

Output : <a-REMPLIR??>

A partir des résultats de l'extraction de patrons morpho-syntaxiques, l'exécutable patron2graphe va, comme son nom l'indique, générer un graphe, c'est-à-dire une représentation graphique de la liste des extractions. Il est possible de filtrer ce graphe en ajoutant en argument un fichier txt contenant un motif sous forme d'expression régulière.