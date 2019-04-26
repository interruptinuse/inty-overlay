EAPI=7

inherit autotools

SLOT=0
KEYWORDS="-* amd64"
HOMEPAGE="https://github.com/interruptinuse/waitpid"
DESCRIPTION="Wait for arbitrary PIDs and optionally return their exit status codes"
IUSE=""

DEPEND="
  ( || ( >=sys-devel/gcc-8[cxx] sys-devel/clang ) )"

RESTRICT="primaryuri"
SRC_URI="https://github.com/interruptinuse/waitpid/releases/download/v0.19/waitpid-0.19.tar.gz"
