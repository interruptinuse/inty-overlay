EAPI=7

SLOT=0
HOMEPAGE="https://citp.princeton.edu/our-work/memory/code/"
KEYWORDS="~x86 amd64"
IUSE=""

RESTRICT="primaryuri"
SRC_URI="https://citpsite.s3.amazonaws.com/memory-content/src/${P}.tar.gz"

S="${WORKDIR}/${PN}"

src_install() {
  dobin "${S}/${PN}"
}
