#!/bin/bash
apps=()
for arg in "$@"
do
	input="./apps/$arg"
	while IFS= read -r line
	do
	  echo "$line"
	  apps+=" $line "
	done < "$input"
done

exec ./installer.sh "${apps[@]}"