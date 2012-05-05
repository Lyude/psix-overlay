# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

DESCRIPTION="Sublime Text is a sophisticated text editor for code, html and prose"
HOMEPAGE="http://www.apachefriends.org"
SRC_URI="( http://downloads.sourceforge.net/${PN}/${PN}-linux-${PV}.tar.gz )"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/glibc[multilib]"

S=${WORKDIR}/lampp

src_install() {
	insinto /opt/lampp
	into /opt/lampp
	exeinto /opt/lampp		
       	rm ./bin/phar
	dosym ./bin/phar.phar ./bin/phar
	fperms 755 bin/*
	doins -r *	
}
