#!/bin/bash

#Verzeichnis _templates erstellen
mkdir -p _templates

#Erstelle mindestens 3 Dateien im Verzeichnis _templates
touch _templates/datei-1.txt
touch _templates/datei-2.pdf
touch _templates/datei-3.doc

#Erstelle das Verzeichnis _schulklassen
mkdir -p _schulklassen

#Erstelle eine Liste von neuen Schülernamen
neue_schueler=(
    "Anna"
    "Benjamin"
    "Carla"
    "Daniel"
    "Emma"
    "Felix"
    "Greta"
    "Hannes"
    "Isabella"
    "Jakob"
    "Klara"
    "Lukas"
)

#Erstelle Klassenordner und kopiere die Dateien hinein
for klasse in M123-AP23a M123-AP23b M123-AP23c; do
    for name in "${neue_schueler[@]}"; do
        echo "$name" >> "_schulklassen/$klasse.txt"
    done
done

echo "Wurde ausgeführt!"

