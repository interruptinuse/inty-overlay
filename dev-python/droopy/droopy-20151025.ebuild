EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
PYTHON_REQ_USE="ssl,ipv6"

inherit git-r3 python-r1

SLOT=0
HOMEPAGE="http://stackp.online.fr/droopy"
KEYWORDS="x86 amd64"
IUSE="+dropzonejs"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="${PYTHON_DEPS}"
BDEPEND="${RDEPEND}"

EGIT_REPO_URI="https://github.com/stackp/Droopy"
EGIT_COMMIT="7a9c7bc46c4ff8b743755be86a9b29bd1a8ba1d9"

PATCHES=(
  "${FILESDIR}/20151025-01-shebang.patch"
  "${FILESDIR}/20151025-02-remove-macpath.patch"
  "${FILESDIR}/20151025-03-fix-basic-auth-3ac476f.patch"
  "${FILESDIR}/20151025-04-support-python39-272b3ce.patch"
)


src_prepare() {
  default

  use dropzonejs && eapply "${FILESDIR}/20151025-99-pr14-add-dropzonejs.patch"

  sed -i \
    -e "s,20131121,${PV},g" \
    man/droopy.1
  mv Readme.md README.md
}


src_install() {
  doman man/droopy.1

  dodir "/usr/share/${P}"
  use dropzonejs && cp -r "${S}/static" "${ED%/}/usr/share/${P}"
  cp "${S}/droopy" "${ED%/}/usr/share/${P}"
  dosym "${ED%/}/usr/share/${P}/droopy" /usr/bin/droopy
}
