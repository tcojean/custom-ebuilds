# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="Sphinx-Fortran extensions"
HOMEPAGE="https://github.com/VACUMM/sphinx-fortran"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="CeCILL-B"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/numpy
	dev-python/sphinx
"
DEPEND="${RDEPEND}"
