EAPI=7

inherit multilib

SLOT=0
KEYWORDS="-* amd64 x86"
HOMEPAGE="https://github.com/interruptinuse/fixwinsz"
DESCRIPTION="Restrict terminal size assumed by programs."
IUSE=""

DEPEND="
  ( || ( sys-devel/gcc sys-devel/clang ) )"

RESTRICT="primaryuri"
SRC_URI="https://github.com/interruptinuse/fixwinsz/releases/download/v${PV}/${P}.tar.gz"

src_compile() {
  emake
}

src_install() {
  emake install PREFIX="${D}"/usr LIBDIR="${D}"/usr/$(get_libdir)
}