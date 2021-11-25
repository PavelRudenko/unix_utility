#!/bin/bash

############################## COLORS ######################################################
titlecol="\e[93m" #Frame Color
titlecol2="\e[91m" # Installer Name Color
titlecol3="\e[93m" #Exit Text Color
titlecol4="\e[95m" #Mian Text Color 
############################################################################################

## Picture that looking good =)
printf "%b#######################################################################\n" "$titlecol"
printf "%b#                                                                     #\n" "$titlecol"
printf "%b#""$titlecol"
printf "%b                             INSTALLER                               %b#\n" "$titlecol2" "$titlecol"
printf "%b#                                                                     #\n" "$titlecol"
printf "%b#######################################################################\n\n" "$titlecol"
printf "%b" "$titlecol4"

############################################################################################
## If you want to change exiting key change it in the line below. exitKey = YOUR BUTTON    #
############################################################################################
exitKey="q"

############ Program Structure #############################################################
#if you want to add your program in list you need 2 variables for ex. pName4="Name of your program" 
#and pLink4="Link to download DEB file from repo" and after that add pName4 to array PROGLISTNAMES
#and pLink4 to PROGLISTLINKS and that is it.
pName1="Viber" #print program Name
pLink1='https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb' #Link to download program 1
pName2="Zoom"
pLink2='https://zoom.us/client/latest/zoom_amd64.deb'
pName3="Skype"
pLink3='https://go.skype.com/skypeforlinux-64.deb'
pName4="Binance"
pLink4='https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb'

PROGLISTNAMES=($pName1 $pName2 $pName3 $pName4)
PROGLISTLINKS=($pLink1 $pLink2 $pLink3 $pLink4)
progsCount=$(( ${#PROGLISTNAMES[@]}-1 ))
###################################################################################################

programTerminator(){ # This funtcion drop off from program by pressing specific key
read -r keystroke
    if [[ $keystroke = "$exitKey" ]] ; then
            printf "%bQuitting from the program\n" "$titlecol3"
            printf "%bThank You for using program!\n" "$titlecol3"
            exit 0
    fi
}

programList(){
    printf "Choose Program number and press ENTER\n\n"
    printf "Programs List:\n" 
for index in ${!PROGLISTNAMES[*]}
do
    printf "%4d: %s\n" $index ${PROGLISTNAMES[$index]}
done
    printf "or press %s button and hit ENTER to exit\n" $exitKey
}

switcher=false

installer(){
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" "$1" && 
#echo $1  #for Testing
sudo dpkg -i "$TEMP_DEB" 
rm -f "$TEMP_DEB" 
sudo apt install -f -y
}

while true; do
if [[ $switcher = false ]] ; then
   programList
   switcher=true
   echo
fi


case $keystroke in
[0-$progsCount])
echo
printf "${PROGLISTNAMES[$keystroke]} is installing...\n\n" 
installer ${PROGLISTLINKS[$keystroke]} 
export switcher=false  
echo 
printf "Please, restart %s! and/or press ENTER to view programs list\n\n" "${PROGLISTNAMES[$keystroke]}" 
echo 
keystroke="";;
esac

programTerminator
done