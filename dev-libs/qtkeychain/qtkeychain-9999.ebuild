# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="Qt API for storing passwords securely"
HOMEPAGE="https://github.com/frankosterfeld/qtkeychain"
EGIT_REPO_URI="git://github.com/frankosterfeld/${PN}"

LICENSE="BSD"
SLOT="0/1"
KEYWORDS="~amd64 ~x86"
IUSE="gnome-keyring"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
	gnome-keyring? ( gnome-base/libgnome-keyring )
"

DOCS=( ChangeLog ReadMe.txt )

src_configure() {
	local mycmakeargs=(
		-DBUILD_WITH_QT4=OFF
		-DQTKEYCHAIN_STATIC=OFF
		-DBUILD_TRANSLATIONS=ON
		-DLIBSECRET_SUPPORT=$(usex gnome-keyring)
	)

	cmake-utils_src_configure
}
