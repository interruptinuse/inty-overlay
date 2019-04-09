EAPI=7

SLOT=0
HOMEPAGE="http://www.brendangregg.com/Specials/baud"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="dev-lang/perl"

src_unpack() {
  mkdir "${S}"
}

src_install() {
  newbin "${FILESDIR}"/baud baud.pl
}
