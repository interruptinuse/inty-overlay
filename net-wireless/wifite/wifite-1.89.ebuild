EAPI=7
PYTHON_COMPAT=( python3_{8..11} )

inherit git-r3

SLOT="1"
HOMEPAGE="https://github.com/derv82/wifite"
KEYWORDS="x86 amd64"
DEPEND="dev-lang/python net-wireless/wireless-tools sys-apps/net-tools net-wireless/aircrack-ng"

PATCHES=(
  "${FILESDIR}/${PV}/00-fix-python-shebang.patch"
  "${FILESDIR}/${PV}/01-force-v1.patch"
)

EGIT_REPO_URI="https://github.com/derv82/wifite"
EGIT_COMMIT="876289c3a4846461bca9978cc0880d09d5d1e469"

src_install() {
  newbin wifite.py wifite1
}
