EAPI=7

inherit git-r3

DESCRIPTION="Inefficient CVS repository grabber"
HOMEPAGE="http://web.archive.org/web/20090103045536/http://cvs.m17n.org/~akr/cvssuck/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/nathanclayton/cvssuck.git"
EGIT_BRANCH="master"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
PROPERTIES="live"
IUSE=""
REQUIRED_USE=""


BDEPEND="
"

RDEPEND="
  >=dev-lang/ruby-1.6.1
  >=dev-vcs/cvs-1.11
  >=dev-vcs/rcs-5.7
"

DEPEND="
  ${RDEPEND}
"


src_install() {
  dobin cvssuck
  dodoc README
}
