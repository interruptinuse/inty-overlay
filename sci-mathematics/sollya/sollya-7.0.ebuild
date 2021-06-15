EAPI=7

SLOT="0"
HOMEPAGE="http://sollya.gforge.inria.fr/"
DESCRIPTION="A library for floating-point software development"
KEYWORDS="amd64"
IUSE=""

DEPEND="( || ( sys-devel/gcc[cxx] sys-devel/clang ) )
  sys-devel/bison sys-devel/flex
  dev-libs/gmp dev-libs/mpfr sci-libs/mpfi sci-libs/fplll dev-libs/libxml2"

RESTRICT="primaryuri"
SRC_URI="https://gforge.inria.fr/frs/download.php/file/37748/${P}.tar.bz2"
