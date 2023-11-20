#!/bin/bash  

echo "voy a crear un nuevo repo:" $1 " con estrategia GitFlow"

echo "creo el directorio local: " $1
mkdir $1
cd $1
echo "me muevo al directorio " $(pwd)

echo "hago un git init"
git init
echo "genero el archivo .gitignore"
echo "*.class" > .gitignore

echo "creo el readme.md"
echo "Nuevo repositorio " $1 > readme.md

echo "agrego todos los archvivos al primer commit"
git add .gitignore
git add *

echo "hago el commit inicial en la rama main/master"
git commit -m "Commit inicial de la creación del repositorio en la rama main"
git branch -M main

echo "voy a subir al repo: https://github.com"/$2/$1".git"
git remote add origin https://github.com/$2/$1.git
git push -u origin main

echo "creo rama dev"
git checkout -b dev
git push -u origin dev

echo "creo rama test"
git checkout -b test
git push -u origin test

cd ..
rm $1 -rf
