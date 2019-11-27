### Netkit Autoinstall ###

Netkit is a self-contained environment that makes it easy and costless to
emulate complex network configurations on a single host machine. The idea
underlying Netkit is that each network device is implemented by a virtual
machine running the appropriate software. Virtual machines can then be
interconnected as desired by configuring virtual collision domains.

http://wiki.netkit.org

### How do I get set up? ###

Follow one of the above guides to install a fresh copy of a supported Linux distribution.

Run the following command as root:

* Debian/Raspbian 7, 8 and 9 and Ubuntu 14.04, 15.10, 16.04, 16.10 and 18.04

```shell
cd /tmp; wget -O installer.tgz "https://github.com/eros23/netkit/tarball/master"; tar zxvf installer.tgz; cd *netkit*; sudo bash netkit.sh
```
* CentOS 7

```shell
cd /tmp; sudo yum install wget unzip net-tools; wget -O installer.tgz "https://github.com/eros23/netkit/tarball/master"; tar zxvf installer.tgz; cd *netkit*; sudo bash netkit.sh
```

### Sei uno studente? ###

* VirtualBox (Tutto Pronto)

Se stai seguendo il corso "Reti di Calcolatori" del CdL di Ingegneria Informaica/Scienze Informatiche dell'Università di Messina, puoi scaricare questa immagine ed importarla sul tuo [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Il sistema è già pronto per il laboratorio.

- Scarica l'immagine .ova di [Netkit Unime](https://drive.google.com/open?id=1soEuZOILM2i1d0DQ-D6g_lupdaoYo9SA) - ver. Lubuntu 16.04.
- Eseguila sul tuo [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
- Lab pronto per l'uso!

Una volta eseguita, puoi caricare una rete di esempio:
- Apri il Terminale e digita il seguente comando:
```shell
 cd /home/user/Desktop/homeworks/esempio1
```
- Dall'interno della directory, avvia la rete:
```shell
 lstart
```
- Attendi il caricamento...(pc1, pc2, router...etc).
- Per chiudere tutto, digita:
```shell
 lcrash -F
```

Nota: Assicurati di avere l'opzione di virtualizzazione attivata nel tuo BIOS come VT-x.

#### Created by

   * Gabriele Laganà (eros23)
