EAPI=7

inherit autotools

SLOT=0
HOMEPAGE="https://github.com/samhocevar/lolremez"
LICENSE="WTFPL-2"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-vcs/git
  sys-devel/automake sys-devel/autoconf
  sys-devel/libtool dev-util/pkgconf"

SRC_URI="https://github.com/samhocevar/lolremez/releases/download/v${PV}/${P}.tar.xz"
