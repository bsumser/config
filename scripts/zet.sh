#!/usr/bin/env bash

set -e

ZROOT=${ZET_ROOT:=~/org/} #get root folder for zettelkasten

name="$ZROOT/$(date +"%d-%m-%Y")"
content=""

for word in $@; do
  name+="-$word"
  content+="${word^}"
done

if [ ! -e "$name.org" ]; then
  echo -e "#+TITLE: $content\n\n#+ROAM_TAG:" > $name.org
fi

emacs $name.org & disown $!
