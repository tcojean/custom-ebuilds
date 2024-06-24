# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{10..13} )

inherit git-r3 distutils-r1

DESCRIPTION="Minimalistic WiFi network chooser for iwd with a rofi frontend."
HOMEPAGE="https://github.com/defname/rofi-iwd-wifi-menu"
EGIT_REPO_URI="${HOMEPAGE}"

SLOT="0"
LICENSE="GPL-3+"

RDEPEND=">=dev-python/pexpect-4.8.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user

	sed -i '/ln -s $(INSTALL_DIR)/d' Makefile || die
	sed -i 's:"rfkill":"/usr/sbin/rfkill":' settings.py
}

src_compile() {
	echo "Nothing to compile"
}

src_install() {
	emake DESTDIR="${D}" install
	dosym -r /usr/share/iwdrofimenu/iwdrofimenu.py /usr/bin/iwdrofimenu
}
