#!/usr/bin/env bash

#############################
# THIS IS STOLEN FROM https://github.com/browsh-org/browsh/blob/master/interfacer/contrib/setup_firefox.sh
# Check it out :)
# (this is slightly modified so that it doesn't rely on travis.yml)
#############################
set -ex

line='  firefox: "67.0.1"'
version=$(echo $line | grep -o '".*"' | cut -d " " -f 1 | sed 's/"//g')

FIREFOX_VERSION=$version

# had to put this here :/ 1984
mkdir -p $HOME/bin
pushd $HOME/bin
curl -L -o firefox.tar.bz2 https://ftp.mozilla.org/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2
bzip2 -d firefox.tar.bz2
tar xf firefox.tar
chmod +x firefox
popd

firefox --version
