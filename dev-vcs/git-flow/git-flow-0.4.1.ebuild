# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PN="${PN/-/}"
COMP_PV="0.4.2.2"
inherit eutils bash-completion-r1

DESCRIPTION="Git extensions to provide high-level repository operations for Vincent Driessen's branching model"
HOMEPAGE="https://github.com/nvie/gitflow"
SRC_URI="https://github.com/nvie/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
https://github.com/bobthecow/${PN}-completion/archive/${COMP_PV}.tar.gz -> ${PN}-completion-${COMP_PV}.tar.gz"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-util/shflags
	dev-vcs/git
"

DOCS=( AUTHORS Changes.mdown README.mdown )

PATCHES=( "${FILESDIR}/${P}-unbundle-shflags.patch" )

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	[[ ${PATCHES[@]} ]] && epatch "${PATCHES[@]}"
	debug-print "$FUNCNAME: applying user patches"
	epatch_user
}

src_compile() {
	true
}

src_install() {
	emake prefix="${D}/usr" install

	[[ ${DOCS[@]} ]] && dodoc "${DOCS[@]}"

	newbashcomp "${WORKDIR}/${PN}-completion-${COMP_PV}/${PN}-completion.bash" ${PN}
}
