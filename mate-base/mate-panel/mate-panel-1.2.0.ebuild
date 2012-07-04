# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
GCONF_DEBUG="no"
PYTHON_DEPEND="2:2.5"

inherit gnome2 python unpacker eutils autotools

DESCRIPTION="The MATE panel"
HOMEPAGE="http://mate-desktop.org"
SRC_URI="http://pub.mate-desktop.org/releases/1.2/${PN}-${PV}.tar.xz"

LICENSE="GPL-2 FDL-1.1 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bonobo doc eds +introspection networkmanager"

RDEPEND=">=gnome-base/gnome-desktop-2.26:2
	>=x11-libs/pango-1.15.4[introspection?]
	>=dev-libs/glib-2.25.12:2
	>=x11-libs/gtk+-2.22:2[introspection?]
	>=dev-libs/libgweather-2.27.90:2
	<dev-libs/libgweather-2.90.1:2
	dev-libs/libxml2:2
	>=gnome-base/gconf-2.6.1:2[introspection?]
	>=media-libs/libcanberra-0.23[gtk]
	>=gnome-base/gnome-menus-2.27.92:0
	gnome-base/librsvg:2
	>=dev-libs/dbus-glib-0.80
	>=sys-apps/dbus-1.1.2
	>=x11-libs/cairo-1
	x11-libs/libXau
	>=x11-libs/libXrandr-1.2
	bonobo? (
		>=gnome-base/libbonobo-2.20.4
		>=gnome-base/libbonoboui-2.1.1
		>=gnome-base/orbit-2.4
		>=x11-libs/libwnck-2.19.5:1 )
	eds? ( >=gnome-extra/evolution-data-server-1.6 )
	introspection? ( >=dev-libs/gobject-introspection-0.6.7 )
	networkmanager? ( >=net-misc/networkmanager-0.6.7 )"
DEPEND="${RDEPEND}
	>=dev-lang/perl-5
	>=app-text/gnome-doc-utils-0.3.2
	virtual/pkgconfig
	>=dev-util/intltool-0.40
	~app-text/docbook-xml-dtd-4.1.2
	doc? ( >=dev-util/gtk-doc-1 )
	gnome-base/gnome-common
	dev-util/gtk-doc-am"
# eautoreconf needs
#	gnome-base/gnome-common
#	dev-util/gtk-doc-am

pkg_setup() {
	G2CONF="${G2CONF}
		--disable-deprecation-flags
		--disable-static
		--disable-scrollkeeper
		--disable-schemas-install
		$(use_enable bonobo)
		$(use_enable networkmanager network-manager)
		$(use_enable introspection)
		$(use_enable eds)"
	DOCS="AUTHORS ChangeLog HACKING NEWS README"
	python_set_active_version 2
}

src_prepare() {
	intltoolize --force --copy --automake || die "intltoolize failed"
	AT_M4DIR=${WORKDIR} eautoreconf
	gnome2_src_prepare
}

src_install() {
	gnome2_src_install
	find "${ED}" -name '*.la' -exec rm -f {} +
}

pkg_postinst() {
	local entries="${EROOT}etc/gconf/schemas/panel-default-setup.entries"
	local gconftool="${EROOT}usr/bin/gconftool-2"

	if [ -e "$entries" ]; then
		einfo "Setting panel gconf defaults..."

		GCONF_CONFIG_SOURCE="$("${gconftool}" --get-default-source | sed "s;:/;:${ROOT};")"

		"${gconftool}" --direct --config-source \
			"${GCONF_CONFIG_SOURCE}" --load="${entries}"
	fi

	# Calling this late so it doesn't process the GConf schemas file we already
	# took care of.
	gnome2_pkg_postinst
}
