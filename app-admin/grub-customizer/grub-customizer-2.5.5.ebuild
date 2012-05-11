# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $
EAPI=4
inherit cmake-utils

DESCRIPTION="Grub Customizer - a graphical grub2 settings manager"
HOMEPAGE="https://launchpad.net/grub-customizer"
SRC_URI="https://launchpad.net/grub-customizer/2.5/2.5.5/+download/${PN}_${PV}.tar.gz"

LICENSE="GPL"
SLOT="0"

KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

RDEPEND=">=dev-cpp/gtkmm-2.24.2:2.4
	sys-devel/gettext
	dev-libs/openssl"

DEPEND="$RDEPEND dev-util/cmake"

S=${WORKDIR}
