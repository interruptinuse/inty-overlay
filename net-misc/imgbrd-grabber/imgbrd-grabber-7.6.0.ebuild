EAPI=7

inherit cmake

SLOT=0
HOMEPAGE="https://bionus.github.io/imgbrd-grabber/"
DESCRIPTION="Customizable imageboard/booru downloader"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND=">=dev-qt/qtcore-5.7.0
  >=dev-qt/qtdeclarative-5.7.0
  >=dev-qt/qtscript-5.7.0
  >=dev-qt/qtmultimedia-5.7.0
  >=dev-qt/qtsql-5.7.0
  media-sound/pulseaudio
  x11-libs/qscintilla"
DEPEND=">=dev-util/cmake-2.8.12 sys-devel/gcc[cxx] net-misc/rsync ${RDEPEND}"

PATCHES=(
  "${FILESDIR}/disable-targets.patch"
)

RESTRICT="primaryuri"
SRC_URI="https://github.com/Bionus/imgbrd-grabber/archive/v${PV}.tar.gz -> ${P}.tar.gz
  https://github.com/interruptinuse/imgbrd-grabber-sites/releases/download/v${PV}/${P}-sites.tar.gz
"

CMAKE_USE_DIR=${WORKDIR}/${P}/src
BUILD_DIR=${WORKDIR}/${P}/build

src_prepare() {
  mkdir build

  sed -i \
    -e "s,Exec=Grabber,Exec=/usr/bin/Grabber,g" \
    -e "s,Icon=grabber,Icon=/usr/share/${P}/Grabber.ico,g" \
    src/dist/linux/grabber.desktop

  cmake_src_prepare
}

src_configure() {
  cmake_src_configure
}

src_compile() {
  rm -rf "${S}"/src/sites/package-lock.json "${S}"/src/sites/node_modules
  cmake_src_compile
}

src_install() {
  cp    "${S}"/src/gui/resources/images/icon.ico "${S}"/release/Grabber.ico
  cp    "${S}"/build/gui/Grabber "${S}"/release
  cp    "${S}"/build/cli/Grabber-cli "${S}"/release
  cp    "${S}"/build/languages/*.qm "${S}"/release/languages/

  rsync -ar --exclude-from="${S}"/src/sites/exclude.txt "${S}"/src/sites "${S}"/release
  cp -r "${S}"/src/dist/common/* "${S}"/release
  cp -r "${S}"/src/dist/linux/* "${S}"/release
  touch "${S}"/release/settings.ini

  dodir /usr/share/"${P}"
  cp -r "${S}"/release/* "${D}"/usr/share/"${P}" || die

  dobin "${FILESDIR}"/Grabber

  dodir /usr/share/applications
  cp "${S}"/release/grabber.desktop "${D}"/usr/share/applications/Grabber.desktop
}
