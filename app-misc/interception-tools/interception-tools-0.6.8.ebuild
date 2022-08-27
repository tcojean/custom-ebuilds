# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake systemd

MY_P="tools-v${PV}"
RESTRICT="mirror"
DESCRIPTION="A minimal composable infrastructure on top of libudev and libevdev"
HOMEPAGE="https://gitlab.com/interception/linux/tools"
SRC_URI="https://gitlab.com/interception/linux/tools/-/archive/v${PV}/${MY_P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
IUSE="systemd"

S="${WORKDIR}/${MY_P}"

DEPEND="
	dev-libs/boost
"
RDEPEND="
	${DEPEND}
	systemd? ( sys-apps/systemd )
	dev-libs/libevdev
	dev-cpp/yaml-cpp
	sys-libs/glibc
	virtual/libudev
"

CMAKE_IN_SOURCE_BUILD=true

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	systemd_dounit "${FILESDIR}"/udevmon.service
	newinitd "${FILESDIR}/udevmon.initd" udevmon
	newbin intercept uintercept
	dobin mux uinput udevmon
}
