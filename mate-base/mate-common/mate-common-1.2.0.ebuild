# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base unpacker gnome.org autotools

DESCRIPTION="Common files for development of MATE packages"
HOMEPAGE="http://mate-desktop.org/"
SRC_URI="http://pub.mate-desktop.org/releases/1.2/${PN}-${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	base_src_install
	mv doc-build/README README.doc-build || die "renaming doc-build/README failed"
	dodoc ChangeLog README* doc/usage.txt || die "dodoc failed"
}
