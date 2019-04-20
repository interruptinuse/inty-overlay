EAPI=7

inherit cmake-utils

SLOT=0
HOMEPAGE="https://bionus.github.io/imgbrd-grabber/"
KEYWORDS="~x86 ~amd64" # masked because this ebuild is shoddy
IUSE=""

RDEPEND=">=dev-qt/qtcore-5.7.0
  >=dev-qt/qtdeclarative-5.7.0
  >=dev-qt/qtscript-5.7.0
  >=dev-qt/qtmultimedia-5.7.0
  net-libs/nodejs[npm]
  media-sound/pulseaudio
  x11-libs/qscintilla"
DEPEND=">=dev-util/cmake-2.8.12 sys-devel/gcc[cxx] ${RDEPEND}"

PATCHES=(
  "${FILESDIR}/${P}-00-desktop-ico-absolute.patch"
  "${FILESDIR}/imgbrd-grabber-7.0.1-01-cmakelists-dont-npm.patch"
  "${FILESDIR}/${P}-02-sites-packagelock.patch"
)

RESTRICT="primaryuri"
CMAKE_IN_SOURCE_BUILD=1
SRC_URI="https://github.com/Bionus/imgbrd-grabber/archive/v${PV}.tar.gz -> ${P}.tar.gz
  https://github.com/interruptinuse/imgbrd-grabber-sites/releases/download/v7.1.0/imgbrd-grabber-7.1.0-sites.tar.gz"

src_compile() {
  cmake-utils_src_compile
}

src_install() {
  cp    "${S}"/languages/*.qm "${S}"/release/languages/
  cp -L "${S}"/gui/Grabber "${S}"/release/Grabber || die
  cp    "${S}"/gui/resources/images/icon.ico "${S}"/release/Grabber.ico || die

  dodir /usr/share/"${P}"
  cp -r "${S}"/release/* "${D}"/usr/share/"${P}" || die

  dobin "${FILESDIR}"/Grabber

  dodir /usr/share/applications
  cp "${S}"/release/Grabber.desktop "${D}"/usr/share/applications/Grabber.desktop
}
