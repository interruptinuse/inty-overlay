EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
PYTHON_REQ_USE="ssl,ipv6"

inherit python-r1

SLOT=0
KEYWORDS="x86 amd64"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="
  dev-python/tqdm[$PYTHON_USEDEP]
  dev-python/parsel[$PYTHON_USEDEP]
  dev-python/esprima[$PYTHON_USEDEP]
  dev-python/termcolor[$PYTHON_USEDEP]
  ${PYTHON_DEPS}"
BDEPEND="${RDEPEND}"


S="${FILESDIR}"


src_unpack() {
  true
}

src_install() {
  newbin "${P}" imgur-dl
}
