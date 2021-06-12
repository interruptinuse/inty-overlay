EAPI=7

SLOT=0
HOMEPAGE="https://citp.princeton.edu/our-work/memory/code/"
KEYWORDS="~x86 amd64"
IUSE=""

DEPEND="sys-devel/gcc[cxx]"

RESTRICT="primaryuri"
SRC_URI="https://citpsite.s3.amazonaws.com/memory-content/src/${P}.tar.gz"

S="${WORKDIR}/${PN}"

PATCHES=(
  "${FILESDIR}/${PV}-01-fix-c-headers.patch"
)

src_install() {
  dobin "${S}/${PN}"
}
