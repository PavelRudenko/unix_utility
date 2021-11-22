#!/bin/bash

## Picture that looking good =)
printf '\e[1;34m%-6s\e[m\n' "########################################################################"
printf '\e[1;34m%-6s\e[m\n' "#                                                                      #"
printf '\e[1;34m%-6s\e[m\n' "#$(printf '\e[1;31m%-6s\e[m' "                        INSTALLER")$(printf '\e[1;34m%-6s\e[m\n' "                                     #")"
printf '\e[1;34m%-6s\e[m\n' "#                                                                      #"
printf '\e[1;34m%-6s\e[m\n' "########################################################################"

programTerminator(){ # This funtcion drop off from program by pressing specific key
read -r -t 0.5 -n 1 -s holder && keystroke="$holder"
############################################################################################
## If you want to change exiting key change it in the line below. $keystroke = YOUR BUTTON #
############################################################################################
    if [[ $keystroke = q ]] ; then
            printf "\e[1;34m%s\n" "Quitting from the program"
            printf "\e[1;34m%s\n" "Thank You for using program!"
            #break
            exit 0
    fi
}
programList(){
    printf "Choose Program"
    
}

switcher=true



while true; do
if [[ $switcher = false ]] ; then
   programList
   switcher=true
   echo
fi

case $keystroke in
1)
echo "text" && keystroke=0 && export switcher=false;;
esac

programTerminator
done



