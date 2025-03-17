#!/bin/bash

csv_file="./arrays_table.csv"

column_0=($(cut -d "," -f 1 $csv_file))
column_1=($(cut -d "," -f 2 $csv_file))
column_2=($(cut -d "," -f 3 $csv_file))

echo "Displaying the column:"
echo "${column_0[@]}"
echo "${column_1[@]}"
echo "${column_2[@]}"


## Create a new array as the difference of column 1 and 2
# initialize array with header
column_3=("cloumn_3")

# get the number of lines in each column
nlines=$(cat $csv_file | wc -l)
echo "There are $nlines lines in the file"

# populate the array
for ((i=1; i<$nlines; i++)); do
	column_3[$i]=$((column_2[$i] - column_1[$i]))
done

echo "${column_3[@]}"

## Combine the new array with the csv file
# first write the new array to file
# initialize the file with a header

echo "${column_3[0]}" > column_3.txt
for ((i=1; i<$nlines; i++)); do
	echo "${column_3[$i]}" >> column_3.txt
done

paste -d "," $csv_file column_3.txt > report.csv


