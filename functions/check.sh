#---------------------------------------------------------------------
# Function: VerificaDistro
# Description: Verifica l'installazione di linux
#---------------------------------------------------------------------


function hide_output {
	OUTPUT=$(mktemp)

	"$@" &> "$OUTPUT"

	E=$?
	if [[ ${E} -ne 0 ]]; then
		echo -e "\nError: The following command failed: $*\n"
		echo "-----------------------------------------"
		cat "$OUTPUT"
		echo "-----------------------------------------"
		echo
		rm -f "$OUTPUT"
		exit ${E}
	fi

	rm -f "$OUTPUT"
}


function apt_install {
	hide_output apt-get -y install "$@"
}

function apt_remove {
	hide_output apt-get -y remove "$@"
}

function yum_install {
	hide_output yum -y install "$@"
}

function yum_remove {
	hide_output yum -y erase "$@"
}

function zypper_install {
	hide_output zypper in -y "$@"
}

function zypper_remove {
	hide_output zypper rm -y "$@"
}

function dnf_install {
	hide_output dnf -y install "$@"
}

function dnf_remove {
	hide_output dnf -y erase "$@"
}

VerificaDistro() {
    # Imposta le variabili su NULL
	ID=''
	VERSION_ID=''
	DISTRO=''

	#Estrai informazioni di sistema
	. /etc/os-release

	if echo "$ID" | grep -iq "debian"; then

		#---------------------------------------------------------------------
		#	Debian 7 Wheezy
		#---------------------------------------------------------------------

		if echo "$VERSION_ID" | grep -iq "7"; then
			DISTRO=debian7

		#---------------------------------------------------------------------
		#	Debian 8 Jessie
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "8"; then
			DISTRO=debian8

		#---------------------------------------------------------------------
		#	Debian 9 Stretch
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "9"; then
			DISTRO=debian9
		fi

	elif echo "$ID" | grep -iq "raspbian"; then

		#---------------------------------------------------------------------
		#	Raspbian 7 Wheezy
		#---------------------------------------------------------------------

		if echo "$VERSION_ID" | grep -iq "7"; then
			DISTRO=debian7

		#---------------------------------------------------------------------
		#	Raspbian 8 Jessie
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "8"; then
			DISTRO=debian8

		#---------------------------------------------------------------------
		#	Raspbian 9 Stretch
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "9"; then
			DISTRO=debian9
		fi

	elif echo "$ID" | grep -iq "ubuntu"; then

		#---------------------------------------------------------------------
		#	Ubuntu 14.04
		#---------------------------------------------------------------------

		if echo "$VERSION_ID" | grep -iq "14.04"; then
			DISTRO=ubuntu-14.04

		#---------------------------------------------------------------------
		#	Ubuntu 15.10
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "15.10"; then
			DISTRO=ubuntu-15.10

		#---------------------------------------------------------------------
		#	Ubuntu 16.04
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "16.04"; then
			DISTRO=ubuntu-16.04

		#---------------------------------------------------------------------
		#	Ubuntu 16.10
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "16.10"; then
			DISTRO=ubuntu-16.10

		#---------------------------------------------------------------------
		#	Ubuntu 17.10
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "17.10"; then
			DISTRO=ubuntu-17.10 #ubuntu-17.10

		#---------------------------------------------------------------------
		#	Ubuntu 18.04
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "18.04"; then
			DISTRO=ubuntu-18.04

		#---------------------------------------------------------------------
		#	Ubuntu 18.10
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "18.10"; then
			DISTRO=ubuntu-18.10

		#---------------------------------------------------------------------
		#	Ubuntu 19.10
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "19.10"; then
			DISTRO=ubuntu-19.10
		fi

	elif echo "$ID" | grep -iq "centos"; then

		#---------------------------------------------------------------------
		#	CentOS
		#---------------------------------------------------------------------

		if echo "$VERSION_ID" | grep -iq "7"; then
			DISTRO=centos7
		fi

	elif echo "$ID" | grep -iq "opensuse"; then

		#---------------------------------------------------------------------
		#	openSUSE Leap 42.1
		#---------------------------------------------------------------------

		if echo "$VERSION_ID" | grep -iq "42.1"; then
			DISTRO='Non supportato' #opensuse-42.1

		#---------------------------------------------------------------------
		#	openSUSE Leap 42.2
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "42.2"; then
			DISTRO='Non supportato' #opensuse-42.2

		#---------------------------------------------------------------------
		#	openSUSE Leap 42.3
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "42.3"; then
			DISTRO='Non supportato' #opensuse-42.3

		#---------------------------------------------------------------------
		#	openSUSE Leap 15.0
		#---------------------------------------------------------------------

		elif echo "$VERSION_ID" | grep -iq "15.0"; then
			DISTRO='Non supportato' #opensuse-15.0
		fi

	elif echo "$ID" | grep -iq "fedora"; then

		#---------------------------------------------------------------------
		#	Fedora 22 - 28
		#---------------------------------------------------------------------

		RE='^[0-9]+$'
		if [[ "$VERSION_ID" =~ $RE && "$VERSION_ID" -ge 22 && "$VERSION_ID" -le 28 ]]; then
			DISTRO='Non supportato' #fedora
		fi
	fi

}
