# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit

RESTRICT="mirror"
DESCRIPTION="dual functions key plugin for interception tools"
HOMEPAGE="https://gitlab.com/interception/linux/plugins/dual-function-keys"
SRC_URI="https://gitlab.com/interception/linux/plugins/${PN}/-/archive/${PV}/${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="MIT"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	app-misc/interception-tools
"

src_prepare() {
	default
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
}
