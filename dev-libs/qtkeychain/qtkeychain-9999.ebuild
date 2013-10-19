# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="Qt API for storing passwords securely"
HOMEPAGE="https://github.com/frankosterfeld/qtkeychain"
EGIT_REPO_URI="git://github.com/frankosterfeld/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="qt5"

DEPEND="
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
	)
	!qt5? (
		dev-qt/qtcore:4
		dev-qt/qtdbus:4
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build !qt5 WITH_QT4)
	)

	cmake-utils_src_configure
}
