EAPI=7

SLOT=0
HOMEPAGE="http://www.nongnu.org/txr/"
DESCRIPTION="A data munging Lisp dialect."
KEYWORDS="x86 amd64"
IUSE=""

RESTRICT="primaryuri"
SRC_URI="http://www.kylheku.com/cgit/txr/snapshot/${P}.tar.bz2"

RDEPEND="virtual/libcrypt:="

src_configure() {
  ./configure --prefix=/usr
}


src_test() {
  emake tests
}
