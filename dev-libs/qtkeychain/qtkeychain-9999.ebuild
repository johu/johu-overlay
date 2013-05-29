# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Qt API for storing passwords securely"
HOMEPAGE="https://github.com/frankosterfeld/qtkeychain"
EGIT_REPO_URI="git://github.com/frankosterfeld/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}-0.1.0-qt5.patch" )

src_configure() {
	local mycmakeargs=( -DQT5_BUILD=OFF )

	cmake-utils_src_configure
}
