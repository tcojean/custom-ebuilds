# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{10..13} )

inherit git-r3

DESCRIPTION="rofi-connman is a rofi-based graphical frontend for connman"
HOMEPAGE="https://github.com/sourcemage/rofi-connman"
EGIT_REPO_URI="${HOMEPAGE}"

SLOT="0"
LICENSE="GPL-3+"

RDEPEND="app-misc/empty"
DEPEND="${RDEPEND}"

src_compile() {
	echo "Nothing to compile"
}

src_install() {
	dobin rofi-connman
}
