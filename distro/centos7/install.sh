#---------------------------------------------------------------------
# Function: Install netkit
#---------------------------------------------------------------------
Install() {
    echo -n "Installazione dei pacchetti necessari per il funzionamento di netkit... "
    yum_install lib32ncurses5 lib32z1 xterm konsole gnome-terminal
    echo -e "[${green}FATTO${NC}]\n"

    echo -n "Download dei files di NETKIT... (Attendere) "
    cd /tmp
    wget --show-progress --progress=bar:force 2>&1 -q ${DOWNLOADNETKIT} -O netkit.tar.bz2
    wget --show-progress --progress=bar:force 2>&1 -q ${DOWNLOADNETKITSYS} -O netkitsys.tar.bz2
    wget --show-progress --progress=bar:force 2>&1 -q ${DOWNLOADNETKITKNL} -O netkitknl.tar.bz2

    echo -e "[${green}FATTO${NC}]\n"

    echo -n "Scompatto i File... "
    tar xfj netkit.tar.bz2
    tar xfj netkitsys.tar.bz2
    tar xfj netkitknl.tar.bz2
    echo -e "[${green}FATTO${NC}]\n"

    echo -n "Creo il percorso di (${PERCORSO}) per NetKit... "
    if [ -d "$PERCORSO" ]; then
      rm -rf ${PERCORSO}
    fi

    #Crea cartella
    mkdir -p ${PERCORSO}
    echo -e "[${green}FATTO${NC}]\n"

    echo -n "Sposto i file nella cartella ${PERCORSO} ... "
    mv netkit ${PERCORSO}
    echo -e "[${green}FATTO${NC}]\n"

    echo -n "Imposto le variabili in ${HOME}/.bashrc ... "
    #RESET variabili ambiente
    sed -i "/^# START Netkit/d" ${HOME}/.bashrc
    sed -i "/^export NETKIT_HOME/d" ${HOME}/.bashrc
    sed -i "/^export MANPATH=:\$NETKIT_HOME/d" ${HOME}/.bashrc
    sed -i "/^export PATH=\$NETKIT_HOME/d" ${HOME}/.bashrc
    sed -i "/^# END Netkit/d" ${HOME}/.bashrc

    echo "# START Netkit" >> ${HOME}/.bashrc
    echo "export NETKIT_HOME=${PERCORSO}netkit" >> ${HOME}/.bashrc
    echo "export MANPATH=:\$NETKIT_HOME/man" >> ${HOME}/.bashrc
    echo "export PATH=\$NETKIT_HOME/bin:\$PATH" >> ${HOME}/.bashrc
    echo "# END Netkit" >> ${HOME}/.bashrc

    source ${HOME}/.bashrc

    echo -e "[${green}FATTO${NC}]\n"

}