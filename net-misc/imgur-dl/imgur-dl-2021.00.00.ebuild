EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
PYTHON_REQ_USE="ssl,ipv6"

inherit git-r3 python-r1

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


src_unpack() {
  mkdir "${S}"
  cp "${FILESDIR}/${P}" "${S}/imgur-dl"
}


src_install() {
  dobin "${PN}"
}
