#!/bin/bash

############################## COLORS ######################################################
titlecol="\e[36m"
titlecol2="\e[91m"
titlecol3="\e[93m"
############################################################################################

############################################################################################
## If you want to change exiting key change it in the line below. buttonKey = YOUR BUTTON  #
############################################################################################
buttonKey="q"

## Picture that looking good =)
printf "%b#######################################################################\n" "$titlecol"
printf "%b#                                                                     #\n" "$titlecol"
printf "%b#""$titlecol"
printf "%b                             INSTALLER                               %b#\n" "$titlecol2" "$titlecol"
printf "%b#                                                                     #\n" "$titlecol"
printf "%b#######################################################################\n\n" "$titlecol"

programTerminator(){ # This funtcion drop off from program by pressing specific key
read -r -t 0.5 -n 1 -s holder && keystroke="$holder"
    if [[ $keystroke = "$buttonKey" ]] ; then
            printf "%bQuitting from the program\n" "$titlecol3"
            printf "%bThank You for using program!\n" "$titlecol3"
            #break
            exit 0
    fi
}
## Program Structure
pName1="zoom"
pLink1="Link to go"

pName2="telega"

pName3="opera"

PROGLIST=($pName1 $pName2 $pName3)


programList(){
    printf "Choose Program\n\n"
    printf "Programs List:\n" 
for index in ${!PROGLIST[*]}
do
    printf "%4d: %s\n" $index ${PROGLIST[$index]}
done
    printf "or press %s button to exit\n" $buttonKey
}


switcher=false



while true; do
if [[ $switcher = false ]] ; then
   programList
   switcher=true
   echo
fi

case $keystroke in
1)
echo $pName1 && keystroke=0 && export switcher=false;
esac

programTerminator

done