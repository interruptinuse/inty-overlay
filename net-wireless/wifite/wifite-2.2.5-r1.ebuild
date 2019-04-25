EAPI=7
PYTHON_COMPAT=( python{2_7,3_6} )

inherit git-r3 distutils-r1

SLOT="2"
HOMEPAGE="https://github.com/derv82/wifite2"
KEYWORDS="x86 amd64"
DEPEND="dev-lang/python net-wireless/wireless-tools sys-apps/net-tools net-wireless/aircrack-ng"

EGIT_REPO_URI="https://github.com/derv82/wifite2"
EGIT_COMMIT="5e204686fa250342ffce6bc1ca3d67d9f095a5da"

src_install() {
  esetup.py install
}
