EAPI=7

DESCRIPTION=""
HOMEPAGE=""
MY_COMMIT="e4940fae0d28c4dd07d9d2c591f8e056545fee3f"
SRC_URI="
  https://github.com/KoffeinFlummi/armake/archive/${MY_COMMIT}.zip
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror test"
PROPERTIES=""
IUSE=""
REQUIRED_USE=""


BDEPEND="
"

RDEPEND="
  dev-libs/openssl
"

DEPEND="
  ${RDEPEND}
"


S="${WORKDIR}/armake-${MY_COMMIT}"


PATCHES=(
  "${FILESDIR}/static-definitions.patch"
)


src_prepare() {
  default
  # bruh
  sed -i 's,    ,\t,g' Makefile
}


src_install() {
  dobin bin/armake
}
