# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 git-r3

DESCRIPTION="Backend for the Grasp browser extension. Grasp adds a button/keybinding to capture current page title and url, possibly selected text, additional comments or tags and adds it into your Org Mode file"
HOMEPAGE="
	https://github.com/karlicoss/grasp/
	https://pypi.org/project/grasp-backend/
"
EGIT_REPO_URI="https://github.com/karlicoss/grasp.git"
EGIT_COMMIT="6dee6b64d66ef319b5d8b6d0cf514ddabae84674"

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
		>=dev-python/pytest-9.0.1[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-util/ruff
	)
"
