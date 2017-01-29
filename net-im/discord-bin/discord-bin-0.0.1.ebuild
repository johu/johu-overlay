# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MY_PN=${PN/-bin/}
inherit unpacker

DESCRIPTION="All-in-one voice and text chat for gamers"
HOMEPAGE="https://discordapp.com"
SRC_URI="https://dl.discordapp.net/apps/linux/${PV}/${MY_PN}-${PV}.deb"

LICENSE="no-source-code"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

RESTRICT="mirror"

QA_PREBUILT="
	usr/share/discord/Discord
	usr/share/discord/libnode.so
	usr/share/discord/libffmpeg.so
"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -ar ./* "${ED}" || die "copy files failed"
}
