EAPI=7

PYTHON_COMPAT=( python3_{8..11} )

inherit python-r1 distutils-r1

DESCRIPTION="Arbitrary precision floating point arithmetic via MPFR"
HOMEPAGE="https://github.com/mdickinson/bigfloat"
SRC_URI="https://files.pythonhosted.org/packages/e0/6c/34784aecbd34d8eaad938106a8b0e5af57dc7282baf613cb8414ef949c20/${P}.tar.gz"


LICENSE="LGPL-3"
SLOT=0
KEYWORDS="x86 amd64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"


BDEPEND="
  dev-libs/mpfr
  dev-python/unittest-or-fail
"

RDEPEND="
  dev-libs/mpfr
"

DEPEND="
  ${PYTHON_DEPS}
  ${RDEPEND}
"


S="${WORKDIR}/bigfloat-${PV}"


distutils_enable_tests unittest
