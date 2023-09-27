EAPI=7
PYTHON_COMPAT=( python3_{8..11} )

inherit git-r3

SLOT="1"
HOMEPAGE="https://github.com/derv82/wifite"
KEYWORDS="x86 amd64"
DEPEND="dev-lang/python net-wireless/wireless-tools sys-apps/net-tools net-wireless/aircrack-ng"

PATCHES=(
  "${FILESDIR}/${PV}/00-fix-python-shebang.patch"
)

EGIT_REPO_URI="https://github.com/derv82/wifite"
EGIT_COMMIT="46abcbe4db8e38e4bfd75cbd4aa5e708e6412750"

src_install() {
  newbin wifite.py wifite1
}
