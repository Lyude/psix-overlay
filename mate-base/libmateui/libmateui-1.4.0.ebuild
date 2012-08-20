# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
WANT_AUTOMAKE="1.9"
GCONF_DEBUG="yes"

inherit mate

DESCRIPTION="User Interface routines for MATE"
HOMEPAGE="http://mate-desktop.org"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc gtk3"

# gtk+-2.14 dep instead of 2.12 ensures system doesn't loose VFS capabilities in GtkFilechooser
RDEPEND=">=dev-libs/libxml2-2.4.20:2
	>=mate-base/libmate-1.4.0
	>=mate-base/libmatecanvas-1.4.0
	>=mate-base/libmatecomponentui-1.4.0
	>=mate-base/mate-conf-1.4.0
	>=x11-libs/pango-1.1.2
	>=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.14:2
	>=mate-base/mate-vfs-1.4.0
	>=gnome-base/libglade-2:2.0
	>=mate-base/mate-keyring-1.4.0
	>=dev-libs/popt-1.5"
DEPEND="${RDEPEND}
	sys-devel/gettext
	virtual/pkgconfig
	>=dev-util/intltool-0.40
	doc? ( >=dev-util/gtk-doc-1 )"

PDEPEND=">=x11-themes/mate-icon-theme-1.4.0"

DOCS="AUTHORS ChangeLog NEWS README"
