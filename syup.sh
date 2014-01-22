#!/bin/bash
function opensyb {
  source /opt/sybase/SYBASE.sh
  /opt/sybase/shared/sybcentral600/scjview.sh
}

function starts {
  source /opt/sybase/SYBASE.sh
  /opt/sybase/ASE-15_0/install/startserver -f /opt/sybase/ASE-15_0/install/RUN_VALHALLA
  /opt/sybase/ASE-15_0/install/startserver -f /opt/sybase/ASE-15_0/install/RUN_VALHALLA_BS
}

function shows {
  /opt/sybase/ASE-15_0/install/showserver
}

echo ''
echo '#-------------------------------------------#'
echo '#          Sybase Control Script            #'
echo '#-------------------------------------------#'

OPTIONS=("Start Servers" "Show Servers" "Open Sybase Central" "Quit")
select opt in "${OPTIONS[@]}"
do
  case $opt in
    "Open Sybase Central")
        opensyb
        ;;
    "Start Servers")
        starts
        ;;
    "Show Servers")
        shows
        ;;
    "Quit")
        break
        ;;
    *) echo invalid option;;
  esac
done
