#!/bin/bash

# Check if the user provided a filename

if [ $# -ne 1 ]; then
	echo "Usage: $0 <filename>"
	exit 1
fi

