#!/bin/bash

FRUITS=("APPLE" "KIWI" "ORANGE")

echo "first fruit is: ${FRUITS[0]}"
echo "Second fruit is: ${FRUITS[1]}"
echo "Third fruit is: ${FRUITS[2]}"
echo "All fruit is: ${FRUITS[@]}"

#When you execute like--> sh 06-array.sh--> it will execute it.

#When execute like this--> ./06-array.sh    --> file needs execute permission required.