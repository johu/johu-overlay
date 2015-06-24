# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 bash-completion-r1

EGIT_REPO_URI="git://github.com/johu/genlop.git"
EGIT_BRANCH="emerge-log-dir"
DESCRIPTION="A nice emerge.log parser"
HOMEPAGE="http://www.gentoo.org/proj/en/perl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-lang/perl
	 dev-perl/DateManip
	 dev-perl/libwww-perl"
RDEPEND="${DEPEND}"

src_install() {
	dobin genlop
	dodoc README Changelog
	doman genlop.1
	newbashcomp genlop.bash-completion genlop
}
