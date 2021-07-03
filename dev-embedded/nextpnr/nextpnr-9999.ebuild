# This is a slightly modified ebuild originally from
#   https://gitlab.com/concavegit/concaveoverlay/-/blob/c7a022b/dev-embedded/nextpnr/nextpnr-9999.ebuild

EAPI=7
PYTHON_COMPAT=( python3_{7..9} )

inherit git-r3 python-r1 multilib cmake

DESCRIPTION="Portable FPGA place and route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
SRC_URI=""
EGIT_REPO_URI="https://github.com/YosysHQ/nextpnr.git"
EGIT_BRANCH="master"


LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="+ice40 +ecp5 +python +qt5 heap openmp"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"


BDEPEND="
  sys-apps/sed
  sys-devel/gcc[cxx,openmp?]
"

RDEPEND="ice40? ( dev-embedded/icestorm
                  >=dev-embedded/yosys-0.8 )
  ecp5? ( dev-embedded/trellis[python?]
          >dev-embedded/yosys-0.8 )
  qt5? ( dev-qt/qtcore:5 )
  dev-libs/boost[python?]"

DEPEND="
  ${PYTHON_DEPS}
  ${RDEPEND}
"


src_prepare() {
  # https://github.com/YosysHQ/nextpnr/issues/476#issuecomment-850470316
  sed -i \
    -e "s,/lib,/$(get_libdir),s" \
    ecp5/CMakeLists.txt

  cmake_src_prepare
}


src_configure() {
  local mycmakeargs=(
    $(usex ice40 $(usex ecp5 "-DARCH=all" "-DARCH=ice40") $(usex ecp5 "-DARCH=ecp5" "-DARCH=generic"))
    $(usex ice40 -DICESTORM_INSTALL_PREFIX="${EPREFIX}"/usr "")
	$(usex ecp5 -DTRELLIS_INSTALL_PREFIX="${EPREFIX}"/usr "")
	$(usex python -DBUILD_PYTHON={ON,OFF})
	$(usex qt5 -DBUILD_GUI={ON,OFF})
	$(usex heap -DBUILD_HEAP={ON,OFF})
	$(usex openmp -DUSE_OPENMP={ON,OFF})
  )
  cmake_src_configure
}
