EAPI=7

inherit git-r3

DESCRIPTION="FTDI programmer for the Lattice ECP5 series"
HOMEPAGE="https://github.com/gregdavill/ecpprog"
SRC_URI=""
EGIT_REPO_URI="https://github.com/gregdavill/ecpprog.git"
EGIT_BRANCH="master"


LICENSE="ISC"
SLOT="0"
KEYWORDS=""
PROPERTIES="live"
IUSE="debug"
REQUIRED_USE=""


BDEPEND="
  virtual/pkgconfig
  sys-devel/clang
"

RDEPEND="
  dev-embedded/libftdi
"

DEPEND="${RDEPEND}"


S="${WORKDIR}/${P}/ecpprog"


src_compile() {
  emake DEBUG=$(usex debug 1 0)
}


src_install() {
  dodoc "${WORKDIR}/${P}"/*README*
  dobin ecpprog
}
