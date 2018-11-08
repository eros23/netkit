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

#### Created by

   * Gabriele Laganà (eros23)