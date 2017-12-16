# Introduction des mathématiques dans EAST
Projet d'introduction des mathématiques dans EAST:EAsy Slides Toolkit. Ce document représente le résumé de l'étude que nous avons mené sur deux bibliothèques d'affichage de mathématiques et de la possibilité de leur intégration dans EAST. 

## Partie 1 : Les bibliothèques Katex et MathJax
Katex et MathJax sont développées en JavaScript. Il s'agit de deux bibliothèques OpenSources disponibles sur les liens suivants : [Katex](https://github.com/Khan/KaTeX)     -       [MathJax](https://www.mathjax.org/)

### Utilisation de Katex
Pour utiliser KaTex nous avons deux possibilité :
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
Sinon il existe la possibilité de faire le render automatique, autrement dit : l'affichage des formules mathématiques sera effectué d'une manière automatique et cela en faisant l'inclusion du script de Katex autorender:
```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0-alpha2/contrib/auto-render.min.js" integrity="sha384-cXpztMJlr2xFXyDSIfRWYSMVCXZ9HeGXvzyKTYrn03rsMAlOtIQVzjty5ULbaP8L" crossorigin="anonymous"></script>
```
