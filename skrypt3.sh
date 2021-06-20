#!/bin/bash


NAME=`
zenity --forms --title="Szukaj" \
--text="Uzupelnij dane" \
--separator="," \
--add-entry="Nazwa pliku" \
--add-entry="Nazwa katalogu" \
`

MIN=`zenity --scale --title "Szukaj" --text "Podaj rozmiar wiekszy niz: [MB]" --min-value=0 --max-value=100` \

MAX=`zenity --scale --title "Szukaj" --text "Podaj rozmiar mniejszy niz: [MB]" --min-value=0 --max-value=100` \
IN=`
zenity --forms --title="Szukaj" \
--add-entry="Zawartosc:" \
`
FIL="$(cut -d',' -f1 <<<$NAME)"
CAT="$(cut -d',' -f2 <<<$NAME)"

X=$(find $CAT/ -type f -name "$FIL" -size +"$MIN"M -size -"$MAX"M -exec grep $IN {} \;)
	if [[ -n $X ]]; then
		zenity --info --title "Informacja" --text "Plik istnieje"
	else zenity --info --title "Informacja" --text "Plik nie istnieje"
	fi



