#!/bin/bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
ps | grep TTY
ps | grep -i tty
grep -v "35.237.4.214" log.txt
grep -o "35.237.4.214" log.txt
awk '{print $1}' log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt
head log.txt
awk '{print $1,$NF}' log.txt
awk -F',' '{print $1}' example_csv.txt
awk 'NR < 10' log.txt
grep "42.236.10.117" log.txt
awk '{print $7}' log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'
sed 's/Mozilla/Godzilla/g' log.txt
grep "zilla" log.txt
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep "zilla" log.txt