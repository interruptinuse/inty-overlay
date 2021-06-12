EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit python-r1

SLOT=0
KEYWORDS="-* amd64 x86"
HOMEPAGE="https://github.com/interruptinuse/fixwinsz"
DESCRIPTION="Restrict terminal size assumed by programs."
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="${PYTHON_DEPS}"

RESTRICT="fetch"
SRC_URI="${P}.tar.gz"


src_install() {
  dobin fixwinsz
  doman fixwinsz.1
}
