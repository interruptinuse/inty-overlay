#!/usr/bin/env bash

set -ex

command -v layman || sudo emerge -av app-portage/layman
sudo layman -o https://raw.github.com/interruptinuse/inty-overlay/master/repository.xml -f -a inty-overlay
