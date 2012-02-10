EAPI=4

inherit qt4-r2 git-2
EGIT_REPO_URI="git://github.com/kekekeks/skypetab-ng.git"

DESCRIPTION="Tabssss"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="
	amd64? ( app-emulation/emul-linux-x86-qtlibs )
	x86? ( x11-libs/qt-gui )
"
RDEPEND="
	net-im/skype
	${DEPEND}
"

pkg_setup() {
	use amd64 && multilib_toolchain_setup x86
}
