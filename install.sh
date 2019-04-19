#!/usr/bin/env bash

set -ex

command -v layman || sudo emerge -v app-portage/layman
yes | sudo layman -o https://raw.github.com/interruptinuse/inty-overlay/master/repositories.xml -f -a inty-overlay
