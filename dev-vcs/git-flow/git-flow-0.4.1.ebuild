# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils bash-completion-r1

DESCRIPTION="Git extensions to provide high-level repository operations for Vincent Driessen's branching model."
HOMEPAGE="https://github.com/nvie/gitflow"
SRC_URI="https://github.com/nvie/gitflow/tarball/0.4.1 -> ${P}.tar.gz
https://github.com/bobthecow/git-flow-completion/tarball/0.4.1.0 -> ${P}-completion.tar.gz"

LICENSE="BSD"
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

S="${WORKDIR}/nvie-gitflow-5b26edc"

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

	newbashcomp "${WORKDIR}/bobthecow-git-flow-completion-b399150/git-flow-completion.bash" git-flow
}
