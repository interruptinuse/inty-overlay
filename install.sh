#!/usr/bin/env bash

set -ex

REPOXML_URL="https://raw.github.com/interruptinuse/inty-overlay/master/repositories.xml"

command -v layman || sudo emerge -v app-portage/layman
yes | sudo layman -o "${REPOXML_URL}" -f -a inty-overlay
command -v eix-update && sudo eix-update
