EAPI=7

SLOT="0"
HOMEPAGE="https://github.com/trizen/clyrics"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="dev-lang/perl dev-perl/WWW-Mechanize dev-perl/LWP-Protocol-https"

SRC_URI="https://github.com/trizen/clyrics/archive/${PV}.tar.gz -> ${P}.tar.gz"

src_install() {
  dobin clyrics

  insinto /usr/share/clyrics
  doins plugins/*
}
