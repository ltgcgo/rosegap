#!/bin/bash
mkdir -p ./dist/
#printf "Removing old build result... "
rm ./dist/$1.out 2>/dev/null
CGO_ENABLED=0 go build -o "dist/$1.out" -trimpath "./go/$1/"
exit