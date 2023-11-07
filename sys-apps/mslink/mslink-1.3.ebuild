EAPI=7

SLOT=0

KEYWORDS="amd64"
HOMEPAGE="http://www.mamachine.org/mslink/index.en.html"
DESCRIPTION="Create Windows LNK (shortcut) files"
IUSE=""

RESTRICT="primaryuri"

_SRC_TOPDIR="${PN}_v${PV}"
SRC_URI="http://www.mamachine.org/mslink/${_SRC_TOPDIR}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${_SRC_TOPDIR}"

src_prepare() {
  rm "${S}/${PN}"
  default
}

src_install() {
  dobin "${PN}"
}
