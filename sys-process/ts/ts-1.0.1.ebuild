EAPI=7

inherit toolchain-funcs

SLOT=0
HOMEPAGE="http://vicerveza.homeunix.net/~viric/soft/ts/"
DESCRIPTION="A Unix queue task spooler"
KEYWORDS="x86 amd64"
IUSE=""

SRC_URI="http://vicerveza.homeunix.net/~viric/soft/ts/${P}.tar.gz"


src_unpack() {
  unpack ${A}
  cd "${S}"

  sed -i \
    -e 's|CFLAGS?=|CFLAGS+=|' \
    -e 's|-g -O0||' \
    Makefile || die "sed failed"
}


src_compile() {
  emake CC=$(tc-getCC) || die "emake failed"

  sed -i \
    -e 's,^\.BI \"ts,.BI "task-spooler,' \
    -e 's,^\.B ts,.B task-spooler,' \
    ts.1 || die "sed failed"
}


src_install() {
  exeinto /usr/bin
  newexe ts task-spooler
  newman ts.1 task-spooler.1
  dodoc Changelog OBJECTIVES PORTABILITY PROTOCOL README TRICKS
}


src_test() {
  PATH="${D}/usr/bin:${PATH}" ./testbench.sh || die "tests failed"
}
