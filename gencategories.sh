#!/usr/bin/env zsh
setopt extendedglob
printf "%s\n" *~licenses~metadata~profiles~.git(/) | sort > profiles/categories
