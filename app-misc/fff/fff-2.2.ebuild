EAPI=7

SLOT=0
HOMEPAGE="https://github.com/dylanaraps/fff"
DESCRIPTION="A simple terminal file manager written in Bash"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="app-shells/bash sys-apps/coreutils x11-misc/xdg-utils
  www-client/w3m[X,imlib] x11-misc/xdotool sys-apps/fbset"

RESTRICT="primaryuri"
SRC_URI="https://github.com/dylanaraps/fff/archive/${PV}.tar.gz -> ${P}.tar.gz"
