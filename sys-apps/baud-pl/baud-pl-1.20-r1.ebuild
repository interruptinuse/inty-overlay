EAPI=7

SLOT=0
HOMEPAGE="http://www.brendangregg.com/Specials/baud"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="dev-lang/perl"

S="$FILESDIR"

src_install() {
  dobin baud
}
