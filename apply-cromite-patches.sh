#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

file='Statusbar-force-light-icon-color-in-incognito.patch'

cd chromium/src

echo -e ${RED} " -> Apply $file" ${NC}

REPL="0,/^---/s//FILE:"$(basename $file)"\n---/"
cat ../../cromite/build/patches/$file | sed $REPL | git am

if [ $? -ne 0 ]
then
            echo -e "Error on ../../cromite/build/patches/${file}"
            exit 1
fi
