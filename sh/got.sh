#!/bin/bash
printf "Compiling \"$1\"... "
shx goc $1 && echo "done."
printf "Running!\n\n"
"./dist/$1.out"
exit