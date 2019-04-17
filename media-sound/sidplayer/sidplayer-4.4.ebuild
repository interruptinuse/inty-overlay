EAPI=7

SLOT=0
HOMEPAGE="https://sidplayer.cebix.net/"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND=">=media-libs/libsdl-1.1.4[sound]"
# I honestly don't know of a better way to say "give me a C++ compiler"
DEPEND="( || ( sys-devel/gcc[cxx] sys-devel/clang ) ) ${RDEPEND}"

PATCHES=(
  "${FILESDIR}/${P}-00-int16-narrowing.patch"
)

SRC_URI="https://sidplayer.cebix.net/downloads/SIDPlayer-${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/SIDPlayer-${PV}"

src_install() {
  dodir /usr/share/"${P}"
  emake DESTDIR="${D}" install
  cp -r "${S}/PSID Demo" "${D}/usr/share/${P}"
}
