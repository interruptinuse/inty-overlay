EAPI=7
PYTHON_COMPAT=( python3_{7..9} )

inherit git-r3 python-r1 distutils-r1

DESCRIPTION="Python wrapper for the Sollya library"
HOMEPAGE="https://gitlab.com/metalibm-dev/pythonsollya/"
SRC_URI=""
EGIT_REPO_URI="https://gitlab.com/metalibm-dev/pythonsollya.git"
EGIT_BRANCH="master"


LICENSE="CeCILL-2.1"
SLOT=0
KEYWORDS=""
PROPERTIES="live"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"


BDEPEND="
  sci-mathematics/sollya
"

RDEPEND="
  sci-mathematics/sollya
  dev-python/bigfloat
"

DEPEND="
  ${PYTHON_DEPS}
  ${RDEPEND}
"
