#!/bin/bash
apps=()

echo $1


case $1 in

  show)
    printf "Lista de paquetes disponibles para instalación: \n"
	ls ./apps/
	printf "Lista de paquetes disponibles para configuración: \n"
	ls ./scripts_config/
    ;;

  install)
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
    ;;

  config)
    echo -n "Italian"
    ;;

  *)
    echo -n "help"
    ;;
esac