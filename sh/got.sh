#!/bin/bash
if [ "$1" == "" ]; then
	echo -e "\033[1;31mError\033[0m: Build target not provided. A list is available below."
	ls -1 "./go/" | while IFS= read -r folder; do
		if [ -d "./go/${folder}" ]; then
			echo "    · ${folder}"
		fi
	done
elif [ -d "./go/$1" ]; then
	echo "Compiling \"$1\"..."
	shx goc $1 -v
	printf "Running!\n\n"
	"./dist/$1.out"
else
	echo -e "\033[1;31mError\033[0m: Invalid build target \"$1\"."
fi
exit