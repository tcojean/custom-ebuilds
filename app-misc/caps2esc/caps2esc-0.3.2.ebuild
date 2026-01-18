# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_P="${PN}-v${PV}"
RESTRICT="mirror"
DESCRIPTION="Interception plugin to turn your capslock key into the escape key"
HOMEPAGE="https://gitlab.com/interception/linux/plugins/caps2esc"
SRC_URI="https://gitlab.com/interception/linux/plugins/${PN}/-/archive/v${PV}/${MY_P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="MIT"
IUSE=""

S="${WORKDIR}/${MY_P}"

DEPEND=""
RDEPEND="
	${DEPEND}
	app-misc/interception-tools
"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
