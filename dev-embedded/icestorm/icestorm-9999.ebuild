EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit git-r3 python-r1

DESCRIPTION="Lattice iCE40 bitstream toolkit"
HOMEPAGE="http://bygone.clairexen.net/icestorm/"
EGIT_REPO_URI="https://github.com/YosysHQ/icestorm.git"
EGIT_BRANCH="master"

LICENSE="ISC"
SLOT="0"
KEYWORDS="x86 amd64 aarch64"
IUSE=""

BDEPEND="
  sys-apps/sed
  virtual/pkgconfig
"

RDEPEND="
  dev-embedded/libftdi:1
"

DEPEND="
  sys-devel/gcc[cxx]
  $RDEPEND
"


src_prepare() {
  default

  sed -i \
    -e "s,/usr/local/lib,'$EPREFIX'/usr/$(get_libdir),g" \
    iceprog/Makefile
}


src_compile() {
  emake DESTDIR="$D" PREFIX="$EPREFIX"/usr ICEPROG=1
}


src_install() {
  emake DESTDIR="$D" PREFIX="$EPREFIX"/usr ICEPROG=1 install
}
