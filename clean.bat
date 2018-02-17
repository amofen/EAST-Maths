@echo off 
rem CE SCRIPT EST UTILISER POUR REDUIRE LA BIBLIOHTEQUE MATHJAX POUR POUVOIR L'INTEGRER AVEC EAST
echo DEBUT DE LA REDUCTION DE MATHJAX
::Phase1:Elimination de tous ce qui est non nécessaire
rmdir /s /Q "docs"
rmdir /s /Q "test"
rmdir /s /Q "unpacked"
del /s /Q ".gitignore"
del /s /Q ".npmignore"
del /s /Q ".travis.yml"
del /s /Q "bower.json"
del /s /Q "composer.json"
del /s /Q "package.json"

::Phase2:Elimination des éléments qui fournissent des options supplémentaire
cd "config"
ren "Accessible.js" "Accessible.js.lock"
ren "Accessible-full.js" "Accessible-full.js.lock"
ren "default.js" "default.js.lock"
ren "Safe.js" "Safe.js.lock"
ren "TeX-MML-AM_CHTML-full.js" "TeX-MML-AM_CHTML-full.js.lock"

del  /Q "*.js"

ren "Accessible.js.lock" "Accessible.js"
ren "Accessible-full.js.lock" "Accessible-full.js" 
ren "default.js.lock" "default.js" 
ren "Safe.js.lock" "Safe.js" 
ren "TeX-MML-AM_CHTML-full.js.lock" "TeX-MML-AM_CHTML-full.js"

cd "..""

::Phase3:Elimination des fonts
cd "fonts\HTML-CSS"
rmdir /s /Q "Gyre-Pagella"
rmdir /s /Q "Gyre-Termes"
rmdir /s /Q "Latin-Modern"
rmdir /s /Q "Neo-Euler"
rmdir /s /Q "STIX-Web"
cd "Asana-Math"
del  /Q "*.*"
rmdir /s /Q "eot"
rmdir /s /Q "otf" 

cd "../TeX"
del  /Q "*.*"
rmdir /s /Q "eot"
rmdir /s /Q "otf" 
rmdir /s /Q "svg"
rmdir /s /Q "png" 
cd "..\..\.." 

cd "jax\output\SVG\fonts"
rmdir /s /Q "Gyre-Pagella"
rmdir /s /Q "Gyre-Termes"
rmdir /s /Q "Latin-Modern"
rmdir /s /Q "Neo-Euler"
rmdir /s /Q "STIX-Web"
cd "..\..\HTML-CSS/fonts"
rmdir /s /Q "Gyre-Pagella"
rmdir /s /Q "Gyre-Termes"
rmdir /s /Q "Latin-Modern"
rmdir /s /Q "Neo-Euler"
rmdir /s /Q "STIX"
rmdir /s /Q "STIX-Web"
cd "..\..\..\.."
echo FELICITATION REDUCTION TERMINEE ! 
pause 
