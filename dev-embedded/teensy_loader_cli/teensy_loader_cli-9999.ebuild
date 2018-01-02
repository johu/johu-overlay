# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Teensy loader command line interface"
HOMEPAGE="http://www.pjrc.com/teensy/loader_cli.html"
EGIT_REPO_URI="https://github.com/PaulStoffregen/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="virtual/libusb:1"
RDEPEND="${DEPEND}"

src_install() {
	dobin teensy_loader_cli
}
