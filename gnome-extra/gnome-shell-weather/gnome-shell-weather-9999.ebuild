# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2
EGIT_REPO_URI="git://github.com/simon04/gnome-shell-extension-weather.git"

DESCRIPTION="A LD_PRELOAD wrapper that adds tabs to Skype for Linux"
HOMEPAGE="http://github.com/kekekeks/skypetab-ng"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

S=$WORK"weather"

pkg_setup()
{
	use amd64
}
