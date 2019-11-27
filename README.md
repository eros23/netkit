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
* VirtualBox (Tutto Pronto)
Se stai seguendo il corso "Reti di Calcolatori" del CdL di Ingegneria Informaica/Scienze Informatiche dell'Università di Messina, puoi scaricare questa immagine ed importarla sul tuo [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Il sistema è già pronto per il laboratorio.

[Netkit Unime](https://drive.google.com/drive/)

Note: Assicurati di avere l'opzione di virtualizzazione attivata nel tuo BIOS come VT-x.

#### Created by

   * Gabriele Laganà (eros23)
