# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source"
#WANT_ANT_TASKS="ant-junit"

EAPI=4

inherit eutils java-pkg-2 java-ant-2 flag-o-matic subversion

DESCRIPTION="Themeable and easy to use TV Guide - written in Java"
HOMEPAGE="http://www.tvbrowser.org/"
SRC_URI="themes? (
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

ESVN_REPO_URI="https://tvbrowser.svn.sourceforge.net/svnroot/tvbrowser/trunk/tvbrowser"

SLOT="0"
KEYWORDS=""
LICENSE="GPL-3"

IUSE="themes"

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

LICENSE="GPL-2"

IUSE="themes"

src_prepare() {
	# now that's a rather nasty trick that removes exactly the lines that unjar
	# dependencies and include them to tvbrowser's jars
	# when bumping, check that it doesn't affect lines it shouldn't!
	sed "/unpacked.dir/d" -i build.xml || die

	# disable running of junit tests, because tvbrowserdataservice.file.ChannelListTest fails always
	sed -i "${S}"/build.xml -e"s:, test: :"

	cd "${S}"/lib || die
	rm -v commons-net*.jar commons-lang-*.jar \
		bsh*.jar commons-codec*.jar stax-*.jar || die
	# missing dependencies commons-compress, TVAnytimeAPI, jRegistryKey, gdata-calendar,
	# gdata-client, jcom, xtvd-lib, opencsv and stax-api
	# use local jar files for these, and also those in deployment
	# some are win32/mac only, so we will let tvbrowser build against them (no need to patch stuff out of sources)
	# but won't install the bundled jars, because their codepath won't be executed on linux anyway
	java-pkg_jar-from commons-lang-2.1,commons-net,commons-codec,lucene-3.0,jgoodies-looks-2.0,bsh,l2fprod-common,skinlf,stax

	# Fails to create javadocs without this
	mkdir "${S}/public" || die
}

src_compile() {
	eant runtime-linux $(use_doc public-doc)
}

src_install() {
	use source && java-pkg_dosrc src/*
	use doc && java-pkg_dojavadoc doc
	cd runtime/${PN}_linux || die

	java-pkg_dojar ${PN}.jar
	find "${S}"/lib -type l -exec rm {} \;
	java-pkg_dojar "${S}"/lib/*.jar || die #why complicate stuff
#	{gdata-calendar-*.jar,gdata-client-*.jar,gdata-core-*.jar,xtvd-lib-*.jar,opencsv-*.jar,aclibico-*.jar,htmlparser-*.jar,jcom-*.jar,jRegistryKey-*.jar,libgrowl-*.jar,log4j-*.jar,texhyphj-*.jar, guava-*.jar} || die

	local todir="${JAVA_PKG_SHAREPATH}"

	cp -a imgs "${D}/${todir}" || die
	cp -a icons "${D}/${todir}" || die
	cp -a plugins "${D}/${todir}" || die
	cp linux.properties "${D}/${todir}" || die

	insinto "${todir}/themepacks"
	doins themepacks/themepack.zip

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
			xplunathemepack.zip
		insinto "${todir}/icons"
		doins noia.zip nuvola.zip tulliana.zip tango_without_heart.zip
	fi

	java-pkg_dolauncher "tvbrowser" \
		--main tvbrowser.TVBrowser \
		--pwd ${todir} \
		--java_args " -Dpropertiesfile=${todir}/linux.properties"

	make_desktop_entry ${PN} "TV-Browser" /usr/share/tvbrowser/imgs/tvbrowser128.png
}
