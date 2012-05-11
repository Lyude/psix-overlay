# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $
EAPI=4
inherit versionator

MY_PV=$(replace_version_separator 2 '-')

DESCRIPTION="Utorrent server"
HOMEPAGE="http://www.utorrent.com/linux"
SRC_URI="http://download.utorrent.com/linux/${PN}-${MY_PV}.tar.gz"

LICENSE="EULA"
SLOT="0"

KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

RDEPEND="amd64? (
		app-emulation/emul-linux-x86-compat
		app-emulation/emul-linux-x86-baselibs )"

S="${WORKDIR}/${PN}-v$(get_major_version)_$(get_version_component_range 2)"

src_install() {
	insinto "/opt/${PN}/share/"

	doins "webui.zip"

	exeinto "/opt/${PN}/bin/"
	doexe utserver

	insinto "/opt/${PN}/doc"
	doins -r docs/*

	ewarn "This is alpha-version of uTorrent 3.0. It may fail to run on amd64 systems!"
	einfo "To start utorrent-server type: /opt/${PN}/bin/utserver"
	einfo "uTorrent currently stores it's config in pwd, so be careful! It's recomended to create ~/.utorrent and start it from here"
	einfo "uTorrent uses webui from current directory, by default, so be careful! Config it first! You can find webui.zip in /opt/${PN}/share/"
}
