#!/bin/bash

#Verzeichnisse definieren
klassen_verzeichnis="_schulklassen"
templates_verzeichnis="_templates"

#Durch jede Datei im Verzeichnis _schulklassen iterieren
for klassen_datei in "$klassen_verzeichnis"/*.txt; do

    #Klassenname extrahieren ohne die Dateiendung
    klassen_name="${klassen_datei%.txt}"
    #Verzeichnis für die Klasse erstellen
    mkdir -p "$klassen_name"
    
    #Jede Zeile (Schülername) aus der Datei lesen
    while IFS= read -r schueler_name; do
        #Erstelle ein Verzeichnis für jeden Schülernamen
        schueler_verzeichnis="$klassen_name/$schueler_name"
        mkdir -p "$schueler_verzeichnis"
        
        #Kopiere alle Dateien aus _templates in das Schüler-Verzeichnis
        cp "$templates_verzeichnis"/* "$schueler_verzeichnis/"
    done < "$klassen_datei"
done

echo "Wurde ausgeführt!"

