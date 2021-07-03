EAPI=7

inherit git-r3 cmake

DESCRIPTION="Lattice ECP5 bitstream toolkit"
HOMEPAGE="https://github.com/YosysHQ/prjtrellis"
SRC_URI=""
EGIT_REPO_URI="https://github.com/YosysHQ/prjtrellis.git"
EGIT_BRANCH="master"
EGIT_SUBMODULES=(database)

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="+python"


BDEPEND="
  sys-devel/gcc[cxx]
"

RDEPEND="
  dev-embedded/openocd
"

DEPEND="
  dev-libs/boost
  $RDEPEND
"


CMAKE_USE_DIR="${WORKDIR}/${P}/libtrellis"
CMAKE_IN_SOURCE_BUILD=1


src_configure() {
  local mycmakeargs=(
    -DBUILD_SHARED=ON
    $(usex python -DBUILD_PYTHON={ON,OFF})
  )
  cmake_src_configure
}


src_install() {
  cmake_src_install
  install -D "${WORKDIR}/${P}/tools/bit_to_svf.py" "${D}"/usr/share/trellis/tools/bit_to_svf.py
}
