#!/bin/bash
if [ "$1" == "" ]; then
	echo -e "\033[1;31mError\033[0m: Build target not provided. A list is available below."
	ls -1 "./go/" | while IFS= read -r folder; do
		if [ -d "./go/${folder}" ]; then
			echo "    · ${folder}"
		fi
	done
elif [ -d "./go/$1" ]; then
	mkdir -p ./dist/
	#printf "Removing old build result... "
	rm ./dist/$1.out 2>/dev/null
	CGO_ENABLED=0 go build -o "dist/$1.out" -trimpath $2 "./go/$1/"
else
	echo -e "\033[1;31mError\033[0m: Invalid build target \"$1\"."
fi
exit