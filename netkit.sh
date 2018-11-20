#!/usr/bin/env bash
#---------------------------------------------------------------------
# netkit.sh
#
# Installazione di Netkit per sistemi Linux
#
# Script: netkit.sh
# Version: 1.0.0
# Author: Gabriele Lagana' <gabriele.lagana@gmail.com>
# Description: Questo script esegue l'installazione base di netkit
# Date: 2018-10-29
#
#
#---------------------------------------------------------------------

# Download File

DOWNLOADNETKIT="http://wiki.netkit.org/download/netkit/netkit-2.8.tar.bz2"
DOWNLOADNETKITSYS="http://wiki.netkit.org/download/netkit-filesystem/netkit-filesystem-i386-F5.2.tar.bz2"
DOWNLOADNETKITKNL="http://wiki.netkit.org/download/netkit-kernel/netkit-kernel-i386-K2.8.tar.bz2"

#Directory di installazione
PERCORSO="$HOME/opt/"


# Colori Bash
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
bold='\e[1m'
underlined='\e[4m'
NC='\e[0m' # No Color
COLUMNS=$(tput cols)


# Check e' utente o root
if [[ $(id -u) -ne 0 ]]; then # $EUID
	echo -e "${red}Errore: Questo script deve essere eseguito come root, eseguire di nuovo questo script con l'utente root o sudo.${NC}" >&2
	exit 1
fi


# Check se sei su Linux
echo -n "Checking OS... "

if ! echo "$OSTYPE" | grep -iq "linux"; then
	echo -e "${red}Errore: Questo script puo' essere eseguito solo su macchine Linux.${NC}" >&2
	exit 1
fi

echo -e "[${green}FATTO${NC}]\n"


# Check connessione
echo -n "Checking internet connection... "

if ! ping -q -c 1 www.google.it > /dev/null 2>&1; then
	echo -e "${red}Errore: Impossibile raggiungere www.google.it, verificare la connessione Internet ed eseguire nuovamente questo script.${NC}" >&2
	exit 1;
fi

echo -e "[${green}FATTO${NC}]\n"


# Check per controllare se netkit è gia' presente
if [ -d "$PERCORSO" ]; then
	echo -e "${red}Errore: Netkit e' gia' installato in $PERCORSO. Per una nuova installazione, rimuovi la cartella.${NC}" >&2
	exit 1
fi

#Log di sistema
exec > >(tee -i ./netkit_setup.log)
exec 2>&1


#Salva directory corrente
APWD=$(pwd);


#---------------------------------------------------------------------
# Carica le funzioni necessarie
#---------------------------------------------------------------------

source ${APWD}/functions/check.sh

echo -n "Verifica del tuo sistema in corso, attendere... "
VerificaDistro
echo -e "${DISTRO} [${green}FATTO${NC}]\n"



#---------------------------------------------------------------------
# Carica file in base alla distro
#---------------------------------------------------------------------
if [ ! -f ${APWD}/distro/${DISTRO}/install.sh ]; then
    echo -e "${red}Errore: Sembra che la tua distro ${DISTRO} non abbia un file di installazione. Aiutaci ad implementarlo!.${NC}" >&2
	exit 1
fi

source ${APWD}/distro/${DISTRO}/install.sh

clear


echo "Benvenuti su NetKit AutoInstall"
echo "Questo script e' stato sviluppato da Gabriele Lagana"
echo "Email: gabriele.lagana@gmail.com"
echo "========================================="
echo "NetKit System installer"
echo "========================================="
echo -e "\nQuesto script eseguira' l'installazione automatica di"
echo "tutti i componenti necessari per far avviare Netkit."
echo -e "Quando viene eseguito lo script, assicurati di avere una checklist [${green}Positiva${NC}]\n"
echo -e "The detected Linux Distribution is:\t${PRETTY_NAME:-$ID-$VERSION_ID}"
if [ -n "$ID_LIKE" ]; then
	echo -e "Related Linux Distributions:\t\t$ID_LIKE"
fi

echo "\nPremi INVIO se capisci di cosa sto parlando ..."

#Pausa
read DUMMY


if [ -f /etc/debian_version ]; then
    Install
elif [ -f /etc/redhat-release ]; then # /etc/centos-release
    echo -e "${red}Distribuzione Linux non supportata.${NC}" >&2
elif [ -f /etc/SuSE-release ]; then
	echo -e "${red}Distribuzione Linux non supportata.${NC}" >&2
else
	echo -e "${red}Distribuzione Linux non supportata.${NC}" >&2
fi

echo -e "\nVisita il nostro repository su GitHub: https://github.com/eros23/netkit"
echo "Errori? Domande sullo script auto installante? visita: https://github.com/eros23/netkit/issues"
exit 0