# Copyright 1999-2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

BRAVE_PN="${PN/-bin/}"

CHROMIUM_LANGS="
	af am ar bg bn ca cs da de el en-GB en-US es es-419 et fa fi fil fr gu he
	hi hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr
	sv sw ta te th tr uk ur vi zh-CN zh-TW
"

inherit chromium-2 xdg-utils desktop

DESCRIPTION="Brave Web Browser"
HOMEPAGE="https://brave.com"
SRC_URI="https://github.com/brave/brave-browser/releases/download/v${PV}/brave-browser-${PV}-linux-amd64.zip -> ${P}.zip"
S=${WORKDIR}

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="keyring qt5 qt6"
# dev-libs/libpthread-stubs

# gconf is deprecated.
DEPEND="app-arch/unzip"
RDEPEND="
	${DEPEND}
	app-accessibility/at-spi2-atk
	app-accessibility/at-spi2-core
	app-arch/bzip2
	dev-libs/atk
	dev-libs/expat
	dev-libs/fribidi
	dev-libs/glib
	dev-libs/gmp
	dev-libs/gobject-introspection
	dev-libs/libbsd
	dev-libs/libffi
	dev-libs/libpcre
	dev-libs/libtasn1
	dev-libs/libunistring
	dev-libs/nettle
	dev-libs/nspr
	dev-libs/nss
	media-gfx/graphite2
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	media-libs/harfbuzz
	media-libs/libepoxy
	media-libs/libpng
	net-dns/libidn2
	net-libs/gnutls
	net-print/cups
	sys-apps/dbus
	sys-libs/zlib
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/libXScrnSaver
	x11-libs/libXau
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libXxf86vm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libxshmfence
	x11-libs/pango
	x11-libs/pixman
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5[X]
		dev-qt/qtwidgets:5
	)
	qt6? ( dev-qt/qtbase:6[gui,widgets] )
"

QA_PREBUILT="*"

src_prepare() {
	pushd "${S}/locales" >/dev/null || die
	chromium_remove_language_paks
	popd >/dev/null || die

	default
}

src_install() (
	shopt -s extglob

	declare BRAVE_HOME=/opt/${BRAVE_PN}

	dodir ${BRAVE_HOME%/*}

	insinto ${BRAVE_HOME}
	doins -r *
	# Brave has a bug in 1.27.105 where it needs crashpad_handler chmodded
	# Delete crashpad_handler when https://github.com/brave/brave-browser/issues/16985 is resolved.
	exeinto ${BRAVE_HOME}
	doexe brave chrome_crashpad_handler

	dosym ${BRAVE_HOME}/brave /usr/bin/${PN} || die

	# Install Icons for Brave.
	newicon "${FILESDIR}/braveAbout.png" "${PN}.png" || die
	newicon -s 128 "${FILESDIR}/braveAbout.png" "${PN}.png" || die

	# install-xattr doesnt approve using domenu or doins from FILESDIR
	cp "${FILESDIR}"/${PN}.desktop "${S}"
	domenu "${S}"/${PN}.desktop

	if ! use qt5; then
		rm "${ED}/${BRAVE_HOME}/libqt5_shim.so" || die
	fi

	if ! use qt6; then
		rm "${ED}/${BRAVE_HOME}/libqt6_shim.so" || die
	fi
)

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
