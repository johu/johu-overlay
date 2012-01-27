# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $ 

# TODO enable testing through FEATURES

JAVA_PKG_IUSE="doc source"

EAPI="1"

inherit eutils java-pkg-2 java-ant-2 flag-o-matic

DESCRIPTION="Themeable and easy to use TV Guide - written in Java"
HOMEPAGE="http://www.tvbrowser.org/"

MY_P=${PN}_${PV}

SRC_URI="mirror://sourceforge/${PN}/${MY_P}_src.zip

themes? (
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/BeOSthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/amarachthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/aquathemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/architectBluethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/architectOlivethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/b0sumiErgothempack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/b0sumithemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/bbjthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/beigeazulthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/beosthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/blueMetalthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/blueTurquesathemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/cellshadedthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/chaNinja-Bluethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/coronaHthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/cougarthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/crystal2themepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/fatalEthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/gfxOasisthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/gorillathemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/hmmXPBluethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/hmmXPMonoBluethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/iBarthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/macosthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/midnightthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/mmMagra-Xthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/modernthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/oliveGreenLunaXPthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/opusLunaSilverthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/opusOSBluethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/opusOSDeepthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/opusOSOlivethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/quickSilverRthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/roueBluethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/roueBrownthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/roueGreenthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/royalInspiratthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/silverLunaXPthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/solunaRthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/tigerGraphitethemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/tigerthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/toxicthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/underlingthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/whistlerthemepack.zip
http://javootoo.l2fprod.com/plaf/skinlf/themepacks/xplunathemepack.zip

http://tvbrowser.org/downloads/noia.zip
http://tvbrowser.org/downloads/nuvola.zip
http://tvbrowser.org/downloads/tulliana.zip
http://tvbrowser.org/downloads/tango_without_heart.zip
)"

SLOT="0"
KEYWORDS="~x86 ~amd64"
LICENSE="GPL-3"

IUSE="themes"

# - upstream uses stax-api-1.0.1/stax-1.2.0 .. using dev-java/stax-1.2.0
#   here (has stax-api/stax-dev) but seems ok
# - upstream uses dev-java/commons-lang-2.5 .. only 2.4 available here but
#   looks OK so far
# - upstream uses dev-java/commons-net-2.2 .. only 1.4.1 available here but
#   looks OK so far
# - upstream uses jgoodies-forms-1.4.0 .. only jgoodies-forms-1.3.0 here,  but
#   looks OK so far
# - upstrean uses jgoodies-looks-2.4.0 .. only jgoodies-looks-2.3.1 here, but 
#   looks OK so far
COMMON_DEP="x11-libs/libXt
	x11-libs/libSM
	x11-libs/libICE
	x11-libs/libXext
	x11-libs/libXtst
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	dev-java/bsh
	>=dev-java/commons-codec-1.4
	>=dev-java/commons-lang-2.4
	>=dev-java/commons-net-1.4.1
	>=dev-java/jakarta-oro-2.0.8
	dev-java/l2fprod-common
	dev-java/log4j
	>=dev-java/jgoodies-forms-1.3.0
	>=dev-java/jgoodies-looks-2.3.1
	dev-java/skinlf
	>=dev-java/stax-1.2.0"
# TODO enable testing
#	test? ( dev-java/junit )
DEPEND=">=virtual/jdk-1.6
	app-arch/unzip
	${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"

S="${WORKDIR}/${MY_P/_/-}"
src_unpack() {
	unpack ${MY_P}_src.zip
	cd "${S}" || die

	# now that's a rather nasty trick that removes exactly the lines that unjar
	# dependencies and include them to tvbrowser's jars
	# when bumping, check that it doesn't affect lines it shouldn't!
	sed "/unpacked.dir/d" -i build.xml || die

	cd "${S}"/lib || die
	# TODO maybe also remove jgoodies-common, someone just need to test it
	rm -v bsh-*.jar commons-codec-*.jar commons-lang-*.jar commons-net*.jar \
		l2fprod-common-tasks-7.3.jar skinlf-6.7.jar stax*.jar \
		jgoodies-form*.jar jgoodies-looks*.jar || die

	# TODO update this comment, it's not up to date
	# missing dependencies htmlparser jRegistryKey opencsv texhyphj
	# use local jar files for these, and also those in deployment
	# some are win32/mac only, so we will let tvbrowser build against them (no need to patch stuff out of sources)
	# but won't install the bundled jars, because their codepath won't be executed on linux anyway
	java-pkg_jar-from bsh,commons-codec,commons-lang-2.1,commons-net,jgoodies-forms,l2fprod-common,log4j,jgoodies-looks-2.0,skinlf,stax

	# Fails to create javadocs without this
	mkdir "${S}/public" || die
}

src_compile() {
	${ANT_OPTS} eant runtime-linux $(use_doc public-doc)
}

#src_test() {
#	eant test
#}

src_install() {
	use source && java-pkg_dosrc src
	use doc && java-pkg_dojavadoc doc

	cd runtime/${PN}_linux || die

	java-pkg_dojar ${PN}.jar
	java-pkg_dojar "${S}"/lib/{guava-r09.jar,htmlparser-1.6.jar,jRegistryKey-1.4.5.jar,jgoodies-common-1.2.1.jar,opencsv-2.3.jar,substance-6.1.jar,texhyphj-1.1.jar,trident-1.3.jar}

	local todir="${JAVA_PKG_SHAREPATH}"

	cp -a imgs "${D}/${todir}" || die
	cp -a icons "${D}/${todir}" || die
	cp -a plugins "${D}/${todir}" || die
	cp linux.properties "${D}/${todir}" || die

	insinto "${todir}/themepacks"
	doins themepacks/themepack.zip || die

	if use themes; then
		cd "${DISTDIR}"
		doins BeOSthemepack.zip\
			amarachthemepack.zip\
			aquathemepack.zip\
			architectBluethemepack.zip\
			architectOlivethemepack.zip\
			b0sumiErgothempack.zip\
			b0sumithemepack.zip\
			bbjthemepack.zip\
			beigeazulthemepack.zip\
			beosthemepack.zip\
			blueMetalthemepack.zip\
			blueTurquesathemepack.zip\
			cellshadedthemepack.zip\
			chaNinja-Bluethemepack.zip\
			coronaHthemepack.zip\
			cougarthemepack.zip\
			crystal2themepack.zip\
			fatalEthemepack.zip\
			gfxOasisthemepack.zip\
			gorillathemepack.zip\
			hmmXPBluethemepack.zip\
			hmmXPMonoBluethemepack.zip\
			iBarthemepack.zip\
			macosthemepack.zip\
			midnightthemepack.zip\
			mmMagra-Xthemepack.zip\
			modernthemepack.zip\
			oliveGreenLunaXPthemepack.zip\
			opusLunaSilverthemepack.zip\
			opusOSBluethemepack.zip\
			opusOSDeepthemepack.zip\
			opusOSOlivethemepack.zip\
			quickSilverRthemepack.zip\
			roueBluethemepack.zip\
			roueBrownthemepack.zip\
			roueGreenthemepack.zip\
			royalInspiratthemepack.zip\
			silverLunaXPthemepack.zip\
			solunaRthemepack.zip\
			tigerGraphitethemepack.zip\
			tigerthemepack.zip\
			toxicthemepack.zip\
			underlingthemepack.zip\
			whistlerthemepack.zip\
			xplunathemepack.zip || die
		insinto "${todir}/icons"
		doins noia.zip nuvola.zip tulliana.zip tango_without_heart.zip || die
	fi

	java-pkg_dolauncher "tvbrowser" \
		--main tvbrowser.TVBrowser \
		--pwd ${todir} \
		--java_args " -Dpropertiesfile=${todir}/linux.properties"

	make_desktop_entry ${PN} "TV-Browser" /usr/share/tvbrowser/imgs/tvbrowser128.png
}
