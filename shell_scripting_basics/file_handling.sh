echo "This is a line" > file_handling.txt

echo "Appending this line" >> file_handling.txt

while read line; do
	echo "Line: $line"
done < file_handling.txt

