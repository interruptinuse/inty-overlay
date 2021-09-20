EAPI=7

inherit autotools

SLOT=0
HOMEPAGE="https://github.com/resurrecting-open-source-projects/outguess"
DESCRIPTION="Universal steganographic tool"
KEYWORDS="x86 amd64"
IUSE=""

RESTRICT="primaryuri"
SRC_URI="https://github.com/resurrecting-open-source-projects/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"


src_prepare() {
   default
   eautoreconf
}


src_configure() {
  econf --with-generic-jconfig
}


src_install() {
  dobin src/outguess
  newbin src/histogram outguess-histogram
  newbin src/seek_script outguess-seek_script

  doman man/outguess.1
  newman man/seek_script.1 outguess-seek_script.1
}
