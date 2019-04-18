EAPI=7

inherit autotools

SLOT=0
KEYWORDS="-* amd64"
IUSE=""

DEPEND="
  ( || ( >=sys-devel/gcc-8[cxx] sys-devel/clang ) )"

RESTRICT="fetch"
SRC_URI="waitpid-0.19.2019.04.10.tar.gz"
