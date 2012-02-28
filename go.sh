#! /bin/sh

set -e
make remove
make clean
make
make install 
adb shell 
