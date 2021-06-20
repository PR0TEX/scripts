#!/bin/bash

cat cdlinux.ftp.log | grep 'OK DOWNLOAD' | cut -d '"' -f 2,4 | sort | uniq | sed 's#.*/##' | sort | uniq -c | sort -r | grep '\.iso'

echo " "

cat cdlinux.www.log | cut -d ' ' -f 1,7,9 | grep 200 | sed 's#.*:##' | sort | uniq | grep -v '99e6' | sed 's#.*/##' | grep '\.iso' | grep -v '?' | grep -v '%' | grep 200 | cut -d ' ' -f 1 | sort | uniq -c | sort -r

echo " "

cat cdlinux.ftp.log | grep 'OK DOWNLOAD' | cut -d '"' -f 2,4 | sort | uniq | sed 's#.*/##' | grep '\.iso' >> zliczanie.txt

cat cdlinux.www.log | cut -d ' ' -f 1,7,9 | grep 200 | sed 's#.*:##' | sort | uniq | grep -v '99e6' | sed 's#.*/##' | grep '\.iso' | grep -v '?' | grep -v '%' | grep 200 | cut -d ' ' -f 1 >> zliczanie.txt

cat zliczanie.txt | sort | uniq -c | sort -r

