# Introduction des mathématiques dans EAST
Projet d'introduction des mathématiques dans EAST:EAsy Slides Toolkit. Ce document représente le résumé de l'étude que nous avons mené sur deux bibliothèques d'affichage de mathématiques et de la possibilité de leur intégration dans EAST. 
Pour voir une démonstration faite par EAST : [Cliquer ici](https://amofen.github.io/EAST-Maths/Demo/DemoEASTMathJax.html)
## Partie 1 : Les bibliothèques Katex et MathJax
Katex et MathJax sont développées en JavaScript. Il s'agit de deux bibliothèques OpenSources disponibles sur les liens suivants : [Katex](https://github.com/Khan/KaTeX)     -       [MathJax](https://www.mathjax.org/)

### Utilisation de Katex
Pour utiliser KaTex nous avons deux possibilités :
1. Télécharger la bibliothèque et la déployer sur un serveur Node.js.
2. Utiliser la version disponible à travers les serveurs CDN :
```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0-alpha2/katex.min.css" integrity="sha384-exe4Ak6B0EoJI0ogGxjJ8rn+RN3ftPnEQrGwX59KTCl5ybGzvHGKjhPKk/KC3abb" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0-alpha2/katex.min.js" integrity="sha384-OMvkZ24ANLwviZR2lVq8ujbE/bUO8IR1FdBrKLQBI14Gq5Xp/lksIccGkmKL8m+h" crossorigin="anonymous"></script>
```
Ensuite pour utiliser KaTex il suffit d'appeler katex.render avec la formule mathématique en paramètre  : 
```js
katex.render("c = \\pm\\sqrt{a^2 + b^2}", element);
```
Sinon il existe la possibilité de faire le rendu automatique, autrement dit : l'affichage des formules mathématiques sera effectué d'une manière automatique et cela en faisant l'inclusion du script de Katex autorender:
```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0-alpha2/contrib/auto-render.min.js" integrity="sha384-cXpztMJlr2xFXyDSIfRWYSMVCXZ9HeGXvzyKTYrn03rsMAlOtIQVzjty5ULbaP8L" crossorigin="anonymous"></script>
```

### Utilisation de MathJax
Deux possibilités se présentent pour utiliser Mathjax:
1. Télécharger la bibliothèque et l'utiliser en local (pas besoin d'un serveur node.js).
2. Utiliser la version disponible à travers les serveurs CDN (Contrairement à KaTex, nous avons un seul mode de fontionnement qui est auto-render:
```html
<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML'></script>
```

### Taille de KaTex
La taille de la bibliothèque KaTex seule est `~3mo` mais si on prend en compte la taille des fichiers du serveur node.js `~57mo` donc le tout donnera une taille totale de : `~60mo`.

### Taille de MathJax 
La taille  de MathJax est évaluée à `~177mo`. Cette taille pourra être réduite (voir: Réduction MathJax).

### Les Entrées/Sorties de KaTex et de MathJax
Les entrées qui peuvent être utilisées, ainsi que les sorties possibles sont illustrées dans la figure suivante:
![alt text](doc-images/ES.png "Entrées et sorties de Katex et MathJax")

## Partie 2 : Intégration d'une bibliothèque dans EAST
Dans cette partie nous parlerons des différents choix que nous avons fait pour intégrer les mathématiques dans EAST.
### Choix de la bibliohtèqe
Nous avons décidé d'utiliser la bibliothèque MathJax pour les raisons suivantes:  
1. La bibliothèque peut être utilisée directement sans avoir besoin de l'héberger sur un serveur. Ce qui la rend le meilleure candidat pour être intégré directement aux fichiers de configuration de EAST.   
2. MathJax offre plus de flexibilité en terme de fonctinnalités, entrées et sorties comparant à KaTex. On les résume:
    - MathJax offre plus d'entrées et de sorties que KaTex. 
    - MathJax offre un menu spécial qui s'affiche en cliquant sur une équation, et permet de modifier la sortie, d'effectuer des zooms sur les équations aisni que d'autres choix supplémentaires: afficher l'aide, changer la langue du menu ... etc. 
    ![alt text](doc-images/MENU-MATHJAX.jpg "Changer la sortie en utilisant le menu MathJax")  
    - MathJax peut être réduite en terme de taille : On peut supprimer certains composants que nous jugerons non nécessaires au besoin. On peut aller plus loin en limitant les options d'affichage et les alternatives. Cet aspect est abordé en détails dans la partie suivate.  
## Réduction de la bibliothèque MathJax  
Nous avons essayé de réduire la taille de MathJax afin d'obtenir une taille minimale qui s'adapte au besoin. Dans cette partie nous allons illustrer les différents possibilités qui se présentent afin de choisir la meilleure. 
### Phase 1: Elimination de tous ce qui est non nécessaire
On a commencé par éliminer tous ce qui est non nécessaire pour le fonctionnement de la biliothèque. Autrement dit cela n'affectera en aucun cas le fonctionnement ordinaire de MathJax.  
Taille initiale de MathJax:
```diff
177 mo
``` 
Eléments supprimés:
```diff
-MathJax/docs/*
-MathJax/tes/*
-MathJax/unpacked/*
-MathJax/.gitignore
-MathJax/.npmignore
-MathJax/.travis.yml
-MathJax/bower.json
-MathJax/composer.json
-MathJax/package.json
```
La taille des éléments éliminés est :
```diff
- 22 mo
```
Donc la taille après la première phase est :
```diff
+ 155 mo
```
### Phase 2 : Elimination des éléments qui fournissent des options supplémentaires 
MathJax offre plusieurs fichiers de configuration qui permettent de réduire le temps de chargement en combinanat plusieurs composants MathJax en un seul fichier dans le répertoire```MathJax/config```. Pour notre cas nous allons laisser un seul fichier de configuration qui nous permet d'utiliser toute les entrées/sorties que nous jugerons utile de les garder par la suite. Pour le moment nous nous contentons de garder le fichier qui permet d'utiliser toute les entrées et sorties de MathJax et nous supprimons le reste.
```diff
+MathJax/config/local/*
+MathJax/config/Accessible.js
+MathJax/config/Accessible-full.js
+MathJax/config/default.js
+MathJax/config/Safe.js
+MathJax/config/TeX-MML-AM_CHTML-full.js
+MathJax/config/TeX-MML-AM_HTMLorMML-full.js
+MathJax/config/TeX-MML-AM_SVG.js
+MathJax/config/TeX-MML-AM_SVG-full.js
```
La taille des éléments éliminés est :
```diff
- 5 mo
```
Donc la taille après la deuxième phase est :
```diff
+ 150 mo
```
 On peut aller plus loin dans cette phase pour éliminer ```~1mo``` supplémentaire après avoir choisi les entrées et sorties à garder.
 ### Phase 3 : Elimination des fonts
 La majorité des navigateur web récents supportent le format :  Web Open Fonts Format (.WOFF), ce qui fait que nous pouvons se contenter de ce format pour l'ensemble des fonts disponibles dans MathJax. De ce fait nous allons garder le répertoir ```woff``` uniquement dans les dossiers des différents fonts et supprimer tous les autres répertoires.
 ```diff
 +MathJax/fonts/HTML-CSS/Asana-Math/woff/*
 +MathJax/fonts/HTML-CSS/Gyre-Pagella/woff/*
 +MathJax/fonts/HTML-CSS/Gyre-Termes/woff/*
 +MathJax/fonts/HTML-CSS/Latin-Modern/woff/*
 +MathJax/fonts/HTML-CSS/Neo-Euler/woff/*
 +MathJax/fonts/HTML-CSS/STIX-Web/woff/*
 +MathJax/fonts/HTML-CSS/TeX/woff/*
 ```
 La taille des éléments éliminés est :
```diff
- 126 mo
```
Donc la taille après la 3ème phase est :
```diff
+ 24 mo
```

On peut également aller plus loin dans cette phase. Vue qu'un seul font sera utilisé à la fin on peut supprimer les différents fonts et ne laisser qu'un seul. Pour notre cas nous avons apprécié le Font ```Asana-Math``` donc nous allons supprimer les différents répertoires(fonts)  et ne laisser que les répertoires ```Asana-Math```(font choisi) et ```Tex```(nécessaire au fonctionnement de MathJax ) à partir des chemins suivant:
```diff
MathJax/fonts/HTML-CSS
MathJax/jax/output/HTML-CSS/fonts
MathJax/jax/output/SVG/fonts
```
 La taille des éléments éliminés est :
```diff
- 14 mo
```
Donc la taille finale de la bibliothèque est :
```diff
+ 10 mo
```
### Phase 4 : Limiter les choix 
On peut aller plus loin dans le processus de réduction pour obtenir des tailles plus réduites en limitant aux utilisateurs la possiblité de choisir plusieurs entrées/sorties. Dans le tableau qui suit, nous présentons les différents combinaisons d'entrées/sorties ainsi que la taille de la bibliothèque obtenu (nous avons gardé que les combinaisons qui permettent une réduction de taille considérable ):  

Entrées | Sorties | Taille obtenue 
:--------------------------: | :--------------------------: | ------------------------: 
MML;ASCII-MATH;Tex | HTML/CSS | 7 mo 
MML;ASCII-MATH;Tex | SVG | 8 mo 
ASCII-MATH | HTML/CSS | 6 mo 
ASCII-MATH | SVG | 7 mo 
### Automatisation du processus de réduction: 
Pour pouvoir réduire les prochaines versions de la bibliohtèque MathJax, il est possible d'utiliser le script batch "clean.bat". Son utilisation est très simple il suffit de le mêttre au niveau du répertoire principale de la bibliothèque MathJax et de l'executer.
### Conclure l'étape de réduction
D'après ce que nous avons vu dans la partie précédente, nous avons décidé de ne pas pénaliser l'utilisateur en le privant d'utiliser plusieurs entrées et sortie pour gagner ```~3mo``` . Pour cela nous avons gardé la bibliothèque avec toute les entrées et les sorties avec une taille de ```10mo```. De plus, vue que EAST sera par la suite comprésé, la taille de la bibliothèque après compression est ```4mo```.  

## Modifications effectuées sur les fichiers de EAST
### Déclaration d'un nouveau élément xml "MATH"  dans EAST.xsd
La déclaration du nouveau élément dans le fichier EAST.xsd est comme suite :
```xml
<xs:element name="MATH">
 <xs:complexType>
    <xs:simpleContent>
      <xs:restriction base="xs:string">
			<xs:attribute name="entree" type="MathJaxEntree" default="ASM" use="required"/>
      </xs:restriction>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>
```
L'élément MATH est aussi référencé dans le bloc "xs:choice" dans le même fichier :
```xml
<xs:choice>
    ...
	<xs:element ref="MATH"/>
    ...
</xs:choice>
```
Ce nouveau élément a comme seul attribut "entree" qui représente le type de l'entrée mathématiques qui sera introduite dans la balise MATH : Ascii-Math MathMl ou TeX. Cette entrée est déclarée dans le fichier "EAST.xsd" comme suite:
```xml
<xs:simpleType name="MathJaxEntree">
	<xs:restriction base="xs:string">
		<xs:enumeration value="ASM"/>
		<xs:enumeration value="MML"/>
		<xs:enumeration value="TEX"/>
	</xs:restriction>
</xs:simpleType>
```
## Ajout des transformations dans EAST.xsl
L'importation de la bibliothèque MathJax avec les balises "Script" comme suite : 
```xml
<xsl:template match="EAST">
    <html>
	    <head>
            ...
            <xsl:choose>
                <xsl:when test=".//MATH">
                    <script src='config_EAST/mathjax/MathJax.js?config=TeX-MML-AM_CHTML-full'><xsl:text> </xsl:text></script>
                </xsl:when>
            </xsl:choose>
            ...
        </head>
        ...
    </html>
</xsl:template>
    
```
Ajout des transformations selon la nature de l'entrée mathématique :
```xml
	<xsl:template match="MATH[@entree='ASM']">
        <span>`<xsl:apply-templates/>`</span>
    </xsl:template>
	<xsl:template match="MATH[@entree='MML']/text()">
		<span>
			<xsl:value-of select="." disable-output-escaping="yes"/>
		</span>
	</xsl:template>
	<xsl:template match="MATH[@entree='TEX']">
        <span>$$<xsl:apply-templates/>$$</span>
    </xsl:template>
```



