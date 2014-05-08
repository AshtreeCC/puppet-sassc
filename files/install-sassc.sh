#!/bin/sh

#
# install upstream sassc
#
cd /home/vagrant
git clone git://github.com/hcatlin/sassc.git
git clone git://github.com/hcatlin/libsass.git
export SASS_LIBSASS_PATH=/home/vagrant/libsass
cd sassc/
git submodule init
git submodule update
make