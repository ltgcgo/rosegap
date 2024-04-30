#!/bin/bash
echo "Compiling \"$1\"..."
shx goc $1 -v
printf "Running!\n\n"
"./dist/$1.out"
exit