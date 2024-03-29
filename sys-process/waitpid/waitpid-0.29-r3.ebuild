EAPI=7

SLOT=0
KEYWORDS="-* amd64 x86 arm"
HOMEPAGE="https://github.com/interruptinuse/waitpid"
DESCRIPTION="Wait for arbitrary PIDs and optionally return their exit status codes"
IUSE=""

DEPEND="
  ( || ( >=sys-devel/gcc-8[cxx] sys-devel/clang ) )"

RESTRICT="primaryuri"
SRC_URI="https://github.com/interruptinuse/waitpid/releases/download/v${PV}/${P}.tar.gz"
