EAPI=7

inherit git-r3 autotools

SLOT=0
HOMEPAGE="https://github.com/mariusae/trickle"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="net-libs/libtirpc"
DEPEND="$RDEPEND
  dev-vcs/git
  ( || ( dev-util/pkgconf dev-util/pkgconfig ) )
  sys-devel/automake sys-devel/autoconf
  sys-devel/libtool"

PATCHES=(
  "${FILESDIR}/${P}-00-use-libtirpc.patch"
  "${FILESDIR}/${P}-01-fix-libtrickle.so-not-found.patch"
)

EGIT_REPO_URI="https://github.com/mariusae/trickle"
EGIT_COMMIT="596bb13f2bc323fc8e7783b8dcba627de4969e07"

src_configure() {
  eautoreconf
  "${S}"/configure --prefix="${EPREFIX}"/usr
}
