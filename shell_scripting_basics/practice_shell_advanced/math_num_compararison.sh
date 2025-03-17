#!/bin/bash

echo "Enter your first number: "
read first_number

echo "Enter your second number: "
read second_number

sum=$(($first_number+$second_number))
product=$(($first_number*$second_number))

echo "Sum first number and second number is: ($first_number+$second_number)=$sum"
echo "Product first number and second number is: ($first_number*$second_number)=$product"


if [ $sum -lt $product ]
then
	echo "The sum is less than the product."
elif [[ $sum == $product ]]
then
	echo "The sum is equal to the product."
elif [[ $sum -gt $product ]]
then
	echo "The sum is greater than the product."
fi

