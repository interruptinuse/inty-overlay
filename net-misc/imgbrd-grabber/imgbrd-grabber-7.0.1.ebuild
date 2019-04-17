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
)

CMAKE_IN_SOURCE_BUILD=1
SRC_URI="https://github.com/Bionus/imgbrd-grabber/archive/v${PV}.tar.gz -> ${P}.tar.gz"

src_compile() {
  ewarn "If you have a build error like this:"
  ewarn "  npm ERR! cb() never called!"
  ewarn
  ewarn "... then open a root shell, cd to the following directory:"
  ewarn "  /var/tmp/portage/net-misc/imgbrd-grabber-7.0.1/work/imgbrd-grabber-7.0.1/release/sites"
  ewarn
  ewarn "... then run 'npm install', exit the shell and run 'sudo FEATURES=keepwork emerge -v imgbrd-grabber'."
  ewarn
  ewarn "This seems to happen reliably, and I don't know how to fix it."
  ewarn "NPM bug tracker suggests open files ulimit might be relevant, but it didn't help for me."

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
