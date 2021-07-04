# This is a slightly modified ebuild originall from
#   https://gitlab.com/concavegit/concaveoverlay/-/blob/db29e44/dev-embedded/yosys/yosys-0.8.ebuild


EAPI=7
PYTHON_COMPAT=(  python3_{7..9} )

inherit git-r3 python-r1 multilib

DESCRIPTION="RTL synthesis toolkit"
HOMEPAGE="https://yosyshq.net/yosys/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/YosysHQ/yosys.git"
EGIT_BRANCH="master"


LICENSE="ISC"
SLOT="0"
KEYWORDS=""
PROPERTIES="live"
IUSE="+tcl +readline +protobuf +zlib +abc"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"


BDEPEND="
  sys-devel/gcc[cxx]
  sys-devel/bison
  sys-devel/flex
  sys-apps/gawk
  virtual/pkgconfig
  protobuf? ( dev-libs/protobuf:=[zlib?] )
"

RDEPEND="
  dev-libs/libffi
  media-gfx/xdot
  media-gfx/graphviz
  dev-libs/boost[python]
  tcl? ( dev-lang/tcl:= )
  readline? ( sys-libs/readline:= )
  zlib? ( sys-libs/zlib )
  abc? ( sci-mathematics/abc[static-libs] )
"

DEPEND="
  ${PYTHON_DEPS}
  ${RDEPEND}
"


src_configure() {
  emake config-gcc

  echo "ENABLE_TCL := $(usex tcl 1 0)" >> "${S}"/Makefile.conf
  echo "ENABLE_READLINE := $(usex readline 1 0)" >> "${S}"/Makefile.conf
  echo "ENABLE_PROTOBUF := $(usex protobuf 1 0)" >> "${S}"/Makefile.conf
  echo "ENABLE_ZLIB := $(usex zlib 1 0)" >> "${S}"/Makefile.conf
  echo "ENABLE_ABC := $(usex abc 1 0)" >> "${S}"/Makefile.conf
  use abc && echo "ABCEXTERNAL := ${EPREFIX}/usr/bin/abc" >> "${S}"/Makefile.conf
}


src_compile() {
  if use protobuf ; then
    pushd misc || die "'pushd misc' failed"
    protoc --cpp_out ../backends/protobuf yosys.proto || die "protoc failed"
    popd
  fi
  emake PREFIX="${EPREFIX}/usr"
}


src_install() {
  emake PREFIX="${ED}/usr" install
}
