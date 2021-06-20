#!/bin/bash

ANS=0;
O1=;
O2=;
O3=;
O4=;
O5=;
while [ $ANS -lt 7 ]; do
if [[ $ANS -lt 6 ]]; then
	echo -e "1.Nazwa pliku: $O1 \n2.Nazwa katalogu: $O2 \n3.Rozmiar wiekszy niz [MB] $O3 		\n4.Rozmiar mniejszy niz [MB] $O4 \n5.Zawartosc: $O5 \n6.Szukaj \n7.Koniec"
else
	echo "7.Koniec"
fi

	read ANS
if [[ $ANS -eq 1 ]]; then
	read O1
elif [[ $ANS -eq 2 ]]; then
	read O2
elif [[ $ANS -eq 3 ]]; then
	read O3
elif [[ $ANS -eq 4 ]]; then
	read O4
elif [[ $ANS -eq 5 ]]; then
	read O5
elif [[ $ANS -eq 6 ]]; then
	X=$(find $O2/ -type f -name "$O1" -size +"$O3"M -size -"$O4"M -exec grep $O5 {} \;)
	if [[ -n $X ]]; then
		echo "Plik istnieje"
	else echo "Plik nie istnieje"
	fi
fi
done
