# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="Backend for the Grasp browser extension. Grasp adds a button/keybinding to capture current page title and url, possibly selected text, additional comments or tags and adds it into your Org Mode file"
HOMEPAGE="
	https://github.com/karlicoss/grasp/
	https://pypi.org/project/grasp-backend/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RESTRICT="!test? ( test )"
RDEPEND="
"
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/selenium[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
	)
"
