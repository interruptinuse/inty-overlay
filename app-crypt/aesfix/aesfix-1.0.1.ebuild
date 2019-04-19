EAPI=7

SLOT=0
HOMEPAGE="https://citp.princeton.edu/research/memory/code/"
KEYWORDS="~x86 amd64"
IUSE=""

RESTRICT="primaryuri"
SRC_URI="http://citpsite.s3-website-us-east-1.amazonaws.com/oldsite-htdocs/memory-content/src/aesfix-1.0.1.tar.gz"

S="${WORKDIR}/aesfix"

src_install() {
  dobin "${S}"/aesfix

  dodir /usr/share/"${P}"
  cp -r "${S}"/samples "${D}"/usr/share/"${P}"
}
