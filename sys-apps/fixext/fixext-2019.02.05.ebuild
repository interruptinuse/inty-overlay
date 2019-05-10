EAPI=7

SLOT=0
HOMEPAGE="https://github.com/interruptinuse/fixext"
DESCRIPTION="A ruby-filemagic/mime.types script to rectify file extensions"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-lang/ruby-2.4 dev-ruby/ruby-filemagic sys-apps/file"

SRC_URI="https://github.com/interruptinuse/fixext/releases/download/v${PV}/fixext   -> ${P}
         https://github.com/interruptinuse/fixext/releases/download/v${PV}/fixext.1 -> ${P}.1"

S="${WORKDIR}"

src_unpack() {
  cp "${DISTDIR}/${P}" "${DISTDIR}/${P}.1" "${S}"
}

src_install() {
  newbin ${P}   fixext
  newman ${P}.1 fixext.1
}
