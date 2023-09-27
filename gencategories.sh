#!/usr/bin/env zsh
setopt extendedglob
printf "%s\n" *~licenses~metadata~profiles~.git(/F) | sort > profiles/categories
