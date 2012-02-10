# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit qt4-r2 git-2 multilib
EGIT_REPO_URI="git://github.com/kekekeks/skypetab-ng.git"

DESCRIPTION="A LD_PRELOAD wrapper that adds tabs to Skype for Linux"
HOMEPAGE="http://github.com/kekekeks/skypetab-ng"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="
	x11-libs/qt-gui
	amd64? ( app-emulation/emul-linux-x86-qtlibs )
"
RDEPEND="
	net-im/skype
	${DEPEND}
"

pkg_setup() {
	use amd64 && multilib_toolchain_setup x86
}
