#!/bin/sh

if [ "x$(id -u)" != x0 ]; then
    echo "You might have to run it as root user."
    echo "Please run it again with 'sudo'."
    echo
    exit
fi

OPT="${@}"

distro=$(grep "^ID=" /etc/os-release | cut -d\= -f2 | sed -e 's/"//g')

case $distro in
    "ubuntu")
	ubuntu;;
    #centos")
    #   centos;;
    *) # we can add more install command for each distros.
        echo "\"$distro\" is not supported distro, so please install packages manually." ;;
esac


ubuntu() {
		#Download Latest Go
		GOURLREGEX='https://dl.google.com/go/go[0-9\.]+\.linux-amd64.tar.gz'
		echo "Finding latest version of Go for AMD64..."
		url="$(wget -qO- https://golang.org/dl/ | grep -oP 'https:\/\/dl\.google\.com\/go\/go([0-9\.]+)\.linux-amd64\.tar\.gz' | head -n 1 )"
		latest="$(echo $url | grep -oP 'go[0-9\.]+' | grep -oP '[0-9\.]+' | head -c -2 )"
		wget "${url}"
}
