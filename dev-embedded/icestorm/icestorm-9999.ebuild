EAPI=7

PYTHON_COMPAT=( python3_{8..11} )

inherit git-r3 python-r1

DESCRIPTION="Lattice iCE40 bitstream toolkit"
HOMEPAGE="http://bygone.clairexen.net/icestorm/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/YosysHQ/icestorm.git"
EGIT_BRANCH="master"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
PROPERTIES="live"
IUSE="+ftdi"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="
  sys-apps/sed
  sys-devel/gcc[cxx]
  virtual/pkgconfig
"

RDEPEND="
  ftdi? ( dev-embedded/libftdi:1 )
"

DEPEND="
  $PYTHON_DEPS
  $RDEPEND
"

PATCHES=(
  "${FILESDIR}/${P}-flags.patch"
  "${FILESDIR}/${P}-ftdi-fix.patch"
)


src_prepare() {
  default

  # https://gitlab.com/concavegit/concaveoverlay/-/blob/c0847b4/dev-embedded/icestorm/files/icestorm-9999-prefix.patch
  sed -i \
    -e "s,/usr/local/share,$EPREFIX/usr/share,g" \
    icebox/icebox_vlog.py
}


src_compile() {
  emake DESTDIR="$D" PREFIX="$EPREFIX"/usr ICEPROG=$(usex ftdi "1" "0")
}


src_install() {
  emake DESTDIR="$D" PREFIX="$EPREFIX"/usr ICEPROG=$(usex ftdi "1" "0") install
}
