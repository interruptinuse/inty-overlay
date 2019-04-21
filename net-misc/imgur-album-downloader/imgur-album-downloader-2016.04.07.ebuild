EAPI=7

inherit git-r3

SLOT="0"
HOMEPAGE="https://github.com/alexgisby/imgur-album-downloader"
DESCRIPTION="Python script to download an Imgur album into a folder"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-lang/python-3.4"

PATCHES=(
  "${FILESDIR}/${PV}/00-force-https.patch"
  "${FILESDIR}/${PV}/01-fix-formatting.patch"
  "${FILESDIR}/${PV}/02-deduplicate-pics.patch"
)

EGIT_REPO_URI="https://github.com/alexgisby/imgur-album-downloader"
EGIT_COMMIT="dbaee1e342c1b46c022fccd26c294e251ac04015"

src_install() {
  newbin imguralbum.py imgur-album-downloader
}
