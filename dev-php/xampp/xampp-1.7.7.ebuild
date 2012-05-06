# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

DESCRIPTION="XAMPP is a free and open source cross-platform web server package."
HOMEPAGE="http://www.apachefriends.org"
SRC_URI="( http://downloads.sourceforge.net/${PN}/${PN}-linux-${PV}.tar.gz )"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/glibc[multilib]"

S=${WORKDIR}/lampp

src_install() {
	local dest="${ED}"/opt/lampp
	mkdir -p "${dest}" || die
	mv "${S}"/* "${dest}"/
}
