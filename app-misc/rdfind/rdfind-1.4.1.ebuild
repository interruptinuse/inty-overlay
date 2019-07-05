EAPI=7

SLOT=0
KEYWORDS="-* amd64 x86"
HOMEPAGE="https://rdfind.pauldreik.se/"
DESCRIPTION="Find duplicate files"
DEPEND="
  dev-libs/nettle
  ( || ( >=sys-devel/gcc-8[cxx] sys-devel/clang ) )"

RESTRICT="primaryuri"
SRC_URI="https://rdfind.pauldreik.se/rdfind-1.4.1.tar.gz"
